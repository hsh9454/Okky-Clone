<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.article-header { padding: 20px 0; margin-bottom: 20px; }
.category-tag { font-size: 13px; color: #adb5bd; margin-bottom: 8px; display: block; }
.article-title { font-size: 28px; font-weight: 700; color: #212529; margin-bottom: 15px; line-height: 1.3; }
.article-meta { display: flex; align-items: center; font-size: 14px; color: #495057; }
.author-img { width: 32px; height: 32px; border-radius: 50%; margin-right: 10px; background-color: #eee; }
.meta-item { margin-right: 15px; display: flex; align-items: center; }
.meta-divider { color: #dee2e6; margin-right: 15px; }
.article-content { font-size: 16px; line-height: 1.8; color: #333; padding: 30px 0; min-height: 300px; }

.reply-write-container { border: 1px solid #e1e4e8; border-radius: 10px; overflow: hidden; background-color: #fff; }
#replyText { border: none; resize: none; padding: 15px; font-size: 15px; border-bottom: 1px solid #f1f3f5; width: 100%; }
#replyText:focus { outline: none; }
.reply-toolbar { display: flex; justify-content: space-between; align-items: center; padding: 10px 15px; background-color: #fff; }
.toolbar-icons { color: #adb5bd; }
.toolbar-icons i { margin-right: 15px; cursor: pointer; }
#addReplyBtn { background-color: #007bff; border: none; border-radius: 8px; padding: 6px 20px; color: white; font-weight: bold; font-size: 14px; }
</style>

<div class="container mt-4"> 
    <div class="article-header border-bottom">
    <span class="category-tag">커뮤니티 | 자유게시판</span>
    <h1 class="article-title">${board.title}</h1>
    
    <div class="article-meta d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <img src="https://via.placeholder.com/32" class="author-img" alt="profile">
            <div class="meta-item"><strong>${board.writer}</strong></div>
            <span class="meta-divider">•</span>
            <div class="meta-item text-muted" id="articleDate"></div>
            <span class="meta-divider">•</span>
            <div class="meta-item text-muted"><i class="fa fa-eye mr-1"></i> 조회수 0</div>
        </div>
        
        <div class="d-flex align-items-center">
            <button class="btn btn-sm btn-light text-muted mr-2"><i class="fa fa-share-alt"></i> 공유</button>
            <button class="btn btn-sm btn-light text-muted mr-2"><i class="fa fa-bookmark-o"></i> 스크랩</button>
            
            <div class="dropdown ml-1">
                <button class="btn btn-light btn-sm border" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding: 4px 10px;">
                    <i class="fa fa-ellipsis-h"></i>
                </button>
                
                <div class="dropdown-menu dropdown-menu-right shadow-sm border" aria-labelledby="dropdownMenuButton">
                    <c:choose>
                 
                        <c:when test="${not empty user && user.userid == board.writer}">
                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/board/modify?bno=${board.bno}" style="font-size: 14px;">
                                <i class="fa fa-pencil-square-o mr-2 text-muted"></i>수정하기
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item py-2 text-danger" href="#" onclick="deleteBoard()" style="font-size: 14px;">
                                <i class="fa fa-trash-o mr-2"></i>삭제하기
                            </a>
                        </c:when>
                    
                        <c:otherwise>
                            <a class="dropdown-item py-2" href="#" onclick="alert('신고 접수 기능은 준비 중입니다.')" style="font-size: 14px;">
                                <i class="fa fa-flag-o mr-2 text-muted"></i>신고하기
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div> 
    </div>
</div>

    <div class="article-content">
        ${board.content}
    </div>

    <div class="text-center mt-5 mb-5">
        <button class="btn btn-outline-secondary btn-lg mr-2" style="border-radius: 50px; padding: 10px 25px;">
            <i class="fa fa-thumbs-up text-primary"></i> 0
        </button>
        <button class="btn btn-outline-secondary btn-lg" style="border-radius: 50px; padding: 10px 25px;">
            <i class="fa fa-thumbs-down text-danger"></i> 0
        </button>
    </div>

    <div class="mb-4">
        <button class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/board/list'">목록으로</button>
    </div>

    <input type="hidden" name="bno" value="${board.bno}">
    <hr>
            
    <div class="mt-4 mb-3">
        <c:choose>
            <c:when test="${not empty user}">
                <div class="reply-write-container">
                    <textarea id="replyText" rows="3" placeholder="여러분의 창의적인 아이디어로 댓글을 남겨주세요."></textarea>
                    <div class="reply-toolbar">
                        <div class="toolbar-icons">
                            <i class="fa fa-bold"></i> <i class="fa fa-italic"></i>
                            <i class="fa fa-quote-right"></i> <i class="fa fa-code"></i>
                            <i class="fa fa-image"></i>
                        </div>
                        <div class="toolbar-right">
                            <input type="hidden" id="replyerName" value="${user.userid}">
                            <button id="addReplyBtn">작성</button>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="reply-write-container p-4 text-center" 
                     style="background-color: #f8f9fa; border: 1px solid #e1e4e8; border-radius: 10px; cursor: pointer;"
                     onclick="location.href='${pageContext.request.contextPath}/login'">
                    <p class="text-muted mb-0">댓글을 작성하려면 <strong>로그인</strong>이 필요합니다.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="mt-5 mb-5">
        <h4><i class="fa fa-list"></i> 댓글 목록</h4>
        <ul class="list-group mt-3" id="replyList"></ul>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply.js"></script>

<script>
function timeForToday(value) {
    if (!value) return "";
    const today = new Date();
    const timeValue = new Date(value);
    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
    
    if (betweenTime < 1) return '방금 전';
    if (betweenTime < 60) return `${betweenTime}분 전`;
    const betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) return `${betweenTimeHour}시간 전`;
    const betweenTimeDay = Math.floor(betweenTimeHour / 24);
    if (betweenTimeDay < 365) return `${betweenTimeDay}일 전`;
    return `${Math.floor(betweenTimeDay / 365)}년 전`;
}

$(document).ready(function() {
    $("#articleDate").text(timeForToday('${board.regdate}'));
    
    window.deleteBoard = function() {
        if(confirm("이 게시글을 삭제하시겠습니까?")) {
            location.href = "${pageContext.request.contextPath}/board/remove?bno=${board.bno}";
        }
    };

    var bnoValue = $("input[name='bno']").val(); 
    var replyUL = $("#replyList");
    var loginUser = "${user.userid}";

    showList();

    function showList() {
        replyService.getList({bno: bnoValue, page: 1}, function(list) {
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
                str += "      <small class='float-right text-muted'>" + timeForToday(list[i].replyDate) + "</small>";
                str += "    </div>";
                if (list[i].delYn === 'Y' || list[i].delYn === 'y') {
                    str += "    <p class='mt-2 mb-0' style='color: gray; font-style: italic;'>삭제된 댓글입니다.</p>";
                } else {
                    str += "    <p class='mt-2 mb-0'>" + list[i].reply + "</p>";
                    str += "    <button class='btn btn-xs btn-link replyAddBtn' style='color:gray; font-size:12px;'>답글달기</button>";
                    if(loginUser && loginUser === list[i].replyer) {
                        str += "    <div class='text-right'>";
                        str += "      <button class='btn btn-sm btn-outline-primary replyModifyBtn' data-rno='" + list[i].rno + "'>수정</button>";
                        str += "      <button class='btn btn-sm btn-outline-danger replyDeleteBtn' data-rno='" + list[i].rno + "'>삭제</button>";
                        str += "    </div>";
                    }
                }
                str += "  </div></li>"; 
            }
            replyUL.html(str); 
        });
    }

    $("#addReplyBtn").on("click", function(e) {
        var replyText = $("#replyText").val();
        if(!replyText) { alert("댓글 내용을 입력해주세요!"); return; }
        if(!loginUser) { alert("로그인 후 이용 가능합니다."); return; }
        replyService.add({reply: replyText, replyer: loginUser, bno: bnoValue}, function(result) {
            alert("댓글이 등록되었습니다.");
            $("#replyText").val(""); 
            showList();
        });
    });

    $("#replyList").on("click", ".replyDeleteBtn", function(e) {
        var rno = $(this).data("rno"); 
        if(!confirm("정말 삭제하시겠습니까?")) return;
        replyService.remove(rno, function(result) {
            alert("삭제되었습니다.");
            showList();
        });
    });

    $("#replyList").on("click", ".replyAddBtn", function(e) {
        var parentRno = $(this).closest("li").data("rno");
        if(!loginUser) { alert("로그인 후 이용 가능합니다."); return; }
        var replyContent = prompt("답글을 입력하세요:");
        if(!replyContent) return;
        replyService.add({reply: replyContent, replyer: loginUser, bno: bnoValue, parentRno: parentRno}, function(result) {
            alert("답글이 등록되었습니다.");
            showList();
        });
    });

    $("#replyList").on("click", ".replyModifyBtn", function(e) {
        var rno = $(this).closest("li").data("rno");
        var originalReply = $(this).closest("li").find("p").text();
        var modifyContent = prompt("수정할 내용을 입력하세요:", originalReply);
        if(!modifyContent || modifyContent === originalReply) return;
        replyService.update({ rno: rno, reply: modifyContent }, function(result) {
            alert("수정되었습니다.");
            showList();
        });
    });
});
</script>