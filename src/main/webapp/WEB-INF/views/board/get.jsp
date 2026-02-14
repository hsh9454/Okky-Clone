<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>

<style>
    .reply-editor-container { border: 1px solid #e1e4e8; border-radius: 12px; background: #fff; overflow: hidden; }
    #replyEditor { height: 120px; border: none !important; font-size: 15px; }
    .ql-toolbar.ql-snow { border: none !important; border-top: 1px solid #f1f3f5 !important; background-color: #fcfcfc; display: flex; justify-content: flex-start; padding: 8px 15px; }
    .reply-footer { display: flex; justify-content: space-between; align-items: center; background-color: #fcfcfc; padding: 0 15px 10px 0; }
    #addReplyBtn { background-color: #007bff; border: none; border-radius: 8px; padding: 6px 20px; color: white; font-weight: bold; font-size: 14px; }
    .article-header { padding: 20px 0; margin-bottom: 20px; }
    .category-tag { font-size: 13px; color: #adb5bd; margin-bottom: 8px; display: block; }
    .article-title { font-size: 28px; font-weight: 700; color: #212529; margin-bottom: 15px; line-height: 1.3; }
    .article-meta { display: flex; align-items: center; font-size: 14px; color: #495057; }
    .meta-divider { color: #dee2e6; margin-right: 15px; }
    .article-content { font-size: 16px; line-height: 1.8; color: #333; padding: 30px 0; min-height: 300px; }
</style>

<div class="container mt-4">
    <div class="article-header border-bottom">
        <span class="category-tag">커뮤니티 | 자유게시판</span>
        <h1 class="article-title">${board.title}</h1>
        <div class="article-meta d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center mr-3">
                    <img src="${board.user_img != null ? board.user_img : '/resources/img/default_profile.jpg'}"
                         class="rounded-circle me-2" style="width: 32px; height: 32px; object-fit: cover; border: 1px solid #eee;">
                    <strong>${board.writer}</strong>
                </div>
                <span class="meta-divider text-muted">•</span>
                <div class="meta-item text-muted mx-2">
                    <i class="far fa-clock"></i> <span id="articleDate"></span>
                </div>
                <span class="meta-divider text-muted">•</span>
                <div class="meta-item text-muted ml-2">
                    <i class="fa fa-eye mr-1"></i> 조회수 ${board.viewcnt}
                </div>
            </div>
            <div class="d-flex align-items-center">
                <button class="btn btn-sm btn-light text-muted mr-2"><i class="fa fa-share-alt"></i> 공유</button>
                <div class="dropdown ml-1">
                    <button class="btn btn-light btn-sm border" type="button" data-toggle="dropdown">
                        <i class="fa fa-ellipsis-h"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right shadow-sm border">
                        <c:if test="${not empty user && user.userid == board.writer}">
                            <a class="dropdown-item py-2" href="${pageContext.request.contextPath}/board/modify?bno=${board.bno}">수정하기</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item py-2 text-danger" href="#" onclick="deleteBoard()">삭제하기</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div> 
    </div> 

    <div class="article-content">${board.content}</div>

    <div style="display: flex; justify-content: flex-end; gap: 20px; margin: 30px 0;">
        <div id="likeBtn" style="cursor: pointer; display: flex; align-items: center; gap: 8px;">
            <i class="far fa-thumbs-up" style="font-size: 22px;"></i> <span id="likeCount">${board.likecnt}</span>
        </div>
        <div id="dislikeBtn" style="cursor: pointer; display: flex; align-items: center; gap: 8px;">
            <i class="far fa-thumbs-down" style="font-size: 22px;"></i> <span id="dislikeCount">${board.dislikecnt}</span>
        </div>
    </div>

    <hr>

    <div class="mt-4 mb-3">
        <c:choose>
            <c:when test="${not empty user}">
                <div class="reply-editor-container">
                    <div id="replyEditor"></div> 
                    <div class="reply-footer">
                        <div id="toolbar-container"></div>
                        <div class="pr-3">
                            <input type="hidden" id="replyerName" value="${user.userid}">
                            <button id="addReplyBtn">작성</button>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="reply-write-container p-4 text-center" style="background-color: #f8f9fa; border: 1px solid #e1e4e8; border-radius: 10px; cursor: pointer;"
                     onclick="location.href='${pageContext.request.contextPath}/member/login'">
                    <p class="text-muted mb-0">로그인이 필요합니다.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="mt-5 mb-5">
        <h4>댓글 목록</h4>
        <ul class="list-group mt-3" id="replyList"></ul>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script>
    function timeForToday(value) {
        if (!value) return '';
        var timeValue = new Date(value);
        if (isNaN(timeValue.getTime())) {
            var cleanedValue = value.toString().replace("KST ", "");
            timeValue = new Date(cleanedValue);
        }
        if (isNaN(timeValue.getTime())) return value;
        var today = new Date();
        var diff = Math.floor((today.getTime() - timeValue.getTime()) / 1000);
        var betweenTime = Math.floor(diff / 60);
        if (betweenTime < 1) return '방금 전';
        if (betweenTime < 60) return betweenTime + '분 전';
        var betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) return betweenTimeHour + '시간 전';
        var betweenTimeDay = Math.floor(betweenTimeHour / 24);
        if (betweenTimeDay < 365) return betweenTimeDay + '일 전';
        return Math.floor(betweenTimeDay / 365) + '년 전';
    }

    $(document).ready(function() {
        var bnoValue = "${board.bno}";
        var loginUser = "${user.userid}";

        var quill = new Quill('#replyEditor', {
            theme: 'snow',
            placeholder: '댓글을 남겨주세요...',
            modules: { toolbar: [['bold', 'italic', 'underline'], ['link', 'image']] }
        });
        $("#toolbar-container").append($(".ql-toolbar"));

        $("#articleDate").text(timeForToday('${board.regdate}'));
        
        function showList() {
            replyService.getList({ bno: bnoValue, page: 1 }, function(list) {
                var str = "";
                if (!list || list.length == 0) {
                    $("#replyList").html("<li class='list-group-item text-center'>등록된 댓글이 없습니다.</li>");
                    return;
                }
                for (var i = 0, len = list.length || 0; i < len; i++) {
                    var isChild = list[i].parentRno && list[i].parentRno > 0;
                    var style = isChild ? "style='margin-left: 60px !important; background-color: #f9f9f9 !important; border-left: 4px solid #007bff !important;'" : "";
                    str += "<li class='list-group-item' data-rno='" + list[i].rno + "' " + style + ">";
                    str += "<div><div class='header'><strong class='text-primary'>" + list[i].replyer + "</strong>";
                    str += "<small class='float-right text-muted'>" + timeForToday(list[i].replyDate) + "</small></div>";
                    if (list[i].delYn === 'Y' || list[i].delYn === 'y') {
                        str += "<p class='mt-2 mb-0' style='color: gray;'>삭제된 댓글입니다.</p>";
                    } else {
                        str += "<p class='mt-2 mb-0'>" + list[i].reply + "</p>";
                        str += "<button class='btn btn-xs btn-link replyAddBtn' style='color:gray; font-size:12px;'>답글달기</button>";
                        if (loginUser && loginUser === list[i].replyer) {
                            str += "<div class='text-right'><button class='btn btn-sm btn-outline-primary replyModifyBtn'>수정</button>";
                            str += "<button class='btn btn-sm btn-outline-danger replyDeleteBtn ml-1'>삭제</button></div>";
                        }
                    }
                    str += "</div></li>";
                }
                $("#replyList").html(str);
            });
        }
        showList();

        function sendLikeRequest(url, typeName) {
            var currentCount = (typeName === "추천") ? parseInt($("#likeCount").text()) : parseInt($("#dislikeCount").text());
            $.ajax({
                type: 'post',
                url: url,
                data: JSON.stringify({ bno: bnoValue, userid: loginUser }),
                contentType: "application/json; charset=utf-8",
                success: function(result) {
                    if (result === true || result === "true") {
                        Swal.fire({ toast: true, position: 'center', showConfirmButton: false, timer: 800, title: typeName + ' 완료' }).then(() => { location.reload(); });
                    } else {
                        if (currentCount > 0) { location.reload(); } 
                        else {
                            Swal.fire({ title: typeName + ' 실패', text: '기존 리액션 취소 후 다시 시도하세요.', icon: 'error' });
                        }
                    }
                }
            });
        }

        $("#likeBtn").on("click", function() { if(loginUser) sendLikeRequest('${pageContext.request.contextPath}/like/update', "추천"); else alert("로그인 필요"); });
        $("#dislikeBtn").on("click", function() { if(loginUser) sendLikeRequest('${pageContext.request.contextPath}/like/disupdate', "비추천"); else alert("로그인 필요"); });
        $("#addReplyBtn").on("click", function() {
            var content = quill.root.innerHTML;
            if(quill.getText().trim().length === 0) return;
            replyService.add({reply: content, replyer: loginUser, bno: bnoValue}, function() { quill.setContents([]); showList(); });
        });
        $(document).on("click", ".replyDeleteBtn", function() {
            var rno = $(this).closest("li").data("rno");
            if(confirm("삭제하시겠습니까?")) replyService.remove(rno, function() { showList(); });
        });
        $(document).on("click", ".replyModifyBtn", function() {
            var rno = $(this).closest("li").data("rno");
            var mod = prompt("수정할 내용", $(this).closest("li").find("p").text());
            if(mod) replyService.update({rno: rno, reply: mod}, function() { showList(); });
        });
        $(document).on("click", ".replyAddBtn", function() {
            var parent = $(this).closest("li").data("rno");
            var reply = prompt("답글 입력");
            if(reply) replyService.add({reply: reply, replyer: loginUser, bno: bnoValue, parentRno: parent}, function() { showList(); });
        });
        window.deleteBoard = function() { if (confirm("삭제하시겠습니까?")) location.href = "${pageContext.request.contextPath}/board/remove?bno=" + bnoValue; };
    });
</script>