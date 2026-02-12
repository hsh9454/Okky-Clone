<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<div class="container mt-4"> 
    <h2>게시글 상세보기</h2>
    <hr>

    <div class="form-group">
        <label><b>번호</b></label> 
        <input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
    </div>
    <div class="form-group">
        <label><b>제목</b></label> 
        <input class="form-control" name="title" value="${board.title}" readonly="readonly">
    </div>
    <div class="form-group">
        <label><b>내용</b></label> 
        <div class="form-control" style="min-height: 200px; height: auto;">${board.content}</div>
    </div>
    <div class="form-group">
        <label><b>작성자</b></label> 
        <input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
    </div>

    <div class="mt-4">
        <button class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/list'">목록으로</button>
        <c:if test="${user.userid == board.writer}">
            <button class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/board/modify?bno=${board.bno}'">수정하기</button>
        </c:if>
    </div>

    <hr>

<div class="card mt-4 shadow-sm">
    <div class="card-body">
        <c:choose>
            <c:when test="${not empty user}">
                <div class="form-group">
                    <input class="form-control mb-2" id="replyerName" 
                           value="${user.userid}" readonly style="width:200px; font-weight:bold;">
                    <textarea class="form-control" id="replyText" rows="3" placeholder="댓글 내용을 입력하세요"></textarea>
                </div>
                <div class="text-right mt-2">
                    <button id="addReplyBtn" class="btn btn-primary px-4">댓글 등록</button>
                </div>
            </c:when>

            <c:otherwise>
                <div class="form-group p-3" style="border: 1px solid #ddd; border-radius: 5px; background-color: #f9f9f9; cursor: pointer;" 
                     onclick="location.href='${pageContext.request.contextPath}/login'">
                    <p class="text-muted mb-0">
                        <i class="fa fa-question-circle"></i> 댓글을 쓰려면 <strong class="text-primary">로그인</strong>이 필요합니다.
                    </p>
                </div>
                <div class="text-right mt-2">
                    <button class="btn btn-secondary px-4" disabled style="opacity: 0.5;">댓글 쓰기</button>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

    <div class="mt-5 mb-5">
        <h4><i class="fa fa-list"></i> 댓글 목록</h4>
        <ul class="list-group mt-3" id="replyList">
            </ul>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply.js"></script>

<script>
$(document).ready(function() {
    
    var bnoValue = $("input[name='bno']").val(); 
    var replyUL = $("#replyList");

    console.log("현재 게시물 번호(BNO): " + bnoValue);

    showList();

    function showList() {
        console.log("목록 불러오기 시도 중... BNO: " + bnoValue);
        
        replyService.getList({bno: bnoValue, page: 1}, function(list) {
            
            console.log("DB에서 가져온 데이터: ", list); 

            var str = "";
            
            if(list == null || list.length == 0) {
                replyUL.html("<li class='list-group-item text-center'>등록된 댓글이 없습니다.</li>");
                return;                
            }

            for (var i = 0, len = list.length || 0; i < len; i++) {
            	var isChild = list[i].parentRno && list[i].parentRno > 0;
            	var style = isChild ? "style='margin-left: 60px !important; background-color: #f9f9f9 !important; border-left: 4px solid #007bff !important;'" : "";
                var icon = list[i].parentRno ? "<i class='fa fa-share fa-flip-vertical'></i> " : "";
                
                
                str += "<li class='list-group-item' data-rno='" + list[i].rno + "' " + style + ">"; 
                str += "  <div>";
                str += "    <div class='header'>";
                str += "      " + icon + "<strong class='text-primary'>" + list[i].replyer + "</strong>";
                str += "      <small class='float-right text-muted'>" + list[i].replyDate + "</small>";
                str += "    </div>";
                str += "    <p class='mt-2 mb-0'>" + list[i].reply + "</p>";
                
                str += "    <button class='btn btn-xs btn-link replyAddBtn' style='color:gray; font-size:12px;'>답글달기</button>";
                
                var loginUser = "${user.userid}"; 
                                             
                if(loginUser && loginUser === list[i].replyer) {
                    str += "    <div class='text-right'>";
                    str += "      <button class='btn btn-sm btn-outline-primary replyModifyBtn' data-rno='" + list[i].rno + "'>수정</button>";
                    str += "      <button class='btn btn-sm btn-outline-danger replyDeleteBtn' data-rno='" + list[i].rno + "'>삭제</button>";
                    str += "    </div>";
                }
                
                str += "  </div>";
                str += "</li>"; 
            }
            replyUL.html(str); 
        });
    }

    function displayTime(timeValue) {
        var dateObj = new Date(timeValue);
        var yy = dateObj.getFullYear();
        var mm = dateObj.getMonth() + 1;
        var dd = dateObj.getDate();
        return [yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
    }

    $("#addReplyBtn").on("click", function(e) {
        
        var reply = {
            reply: $("#replyText").val(),
            replyer: $("#replyerName").val(),
            bno: bnoValue
        };

        if(!reply.reply || !reply.replyer) {
            alert("내용과 작성자를 모두 입력해주세요!");
            return;
        }

        console.log("등록 버튼 클릭! 보낼 데이터: ", reply);

        replyService.add(reply, function(result) {
            alert("알림: " + result); 
                   
            $("#replyText").val("");
                
            showList();
        });
    });
    
    $("#replyList").on("click", ".replyDeleteBtn", function(e) {
        
        var rno = $(this).data("rno"); 
        
        console.log("삭제 버튼 클릭됨! RNO: " + rno);

        if(!confirm("댓글을 삭제하시겠습니까?")) return;

        replyService.remove(rno, function(result) {
            
            alert("삭제 결과: " + result);
            showList(); 
            
        }, function(err) {
            alert("삭제 실패! 본인 댓글만 삭제 가능합니다.");
        });
    });
    
    $("#replyList").on("click", ".replyAddBtn", function(e) {
    	var parentRno = $(this).closest("li").data("rno");
    	
    	var loginUser = "${user.userid}"; 
        
        if(!loginUser) {
            alert("로그인 후 이용 가능합니다.");
            return;
        }

        var replyContent = prompt("답글을 입력하세요:");

        if(!replyContent) return;

        var reply = {
            reply: replyContent,
            replyer: loginUser, 
            bno: bnoValue,      
            parentRno: parentRno 
        };
        
        replyService.add(reply, function(result) {
            alert("답글이 등록되었습니다.");
            showList();
        });
    });
    
    $("#replyList").on("click", ".replyModifyBtn", function(e) {
        var rno = $(this).closest("li").data("rno");
        var originalReply = $(this).closest("li").find("p").text();
        var modifyContent = prompt("댓글을 수정하세요:", originalReply);
        
        if(!modifyContent || modifyContent === originalReply) return;
        
        var reply = { rno: rno, reply: modifyContent };
        
        replyService.update(reply, function(result) {
            alert("수정 결과: " + result);
            showList();
        });
    });
});
</script>