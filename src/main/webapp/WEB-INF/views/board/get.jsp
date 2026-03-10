<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
    background-color: #f1f5f9 !important;
}

.container {
    max-width: 1440px !important;
    width: 100% !important;
    margin: 0 auto !important;
    padding: 0 15px !important;
}

.article-box, .reply-section, .list-under-article {
    background-color: #ffffff !important;
    border: 1px solid #e2e8f0 !important;
    border-radius: 8px !important;
    padding: 30px !important;
    margin-bottom: 20px !important;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05) !important;
    display: block;
    box-sizing: border-box;
}

.article-title {
    font-size: 28px;
    font-weight: 700;
    color: #1e293b;
    margin-bottom: 15px;
}

.article-meta {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 18px !important;
    margin-bottom: 25px !important;
    border-bottom: 1.5px solid #e2e8f0 !important;
}

.category-tag {
    background-color: #f1f5f9;
    color: #64748b;
    padding: 3px 10px;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 600;
}

.reaction-wrapper {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 20px;
    margin-top: 30px;
    padding: 15px 0;
}

.reaction-item {
    cursor: pointer;
    color: #64748b;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: all 0.2s ease;
    text-decoration: none;
}

.reaction-item i {
    font-size: 20px;
}

.reaction-item span {
    font-size: 16px;
    font-weight: 600;
}

.reaction-item:hover {
    color: #3b82f6;
    transform: translateY(-2px);
}

@keyframes jelly {
    0%   { transform: scale(1, 1); }
    30%  { transform: scale(1.25, 0.75); }
    40%  { transform: scale(0.75, 1.25); }
    50%  { transform: scale(1.15, 0.85); }
    100% { transform: scale(1, 1); }
}

.reaction-active i, .jelly-interaction:hover {
    animation: jelly 0.5s;
}

.reaction-active {
    color: #3b82f6 !important;
}

.reply-box-wrapper {
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    background: #fff;
    overflow: hidden;
    margin-bottom: 20px;
}

#replyEditor {
    height: 140px;
    border: none !important;
}

.editor-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-top: 1px solid #f1f5f9;
    background-color: #fcfcfc;
    padding: 0 15px;
    height: 52px;
}

.swal2-popup.my-okky-popup {
    border-radius: 12px !important;
    padding: 2rem 1.5rem !important;
}

.swal2-title.my-okky-title {
    font-size: 20px !important;
    font-weight: 700 !important;
    color: #334155 !important;
}

.swal2-confirm.my-okky-confirm {
    background-color: #3b82f6 !important;
    padding: 10px 28px !important;
    font-size: 14px !important;
    font-weight: 600 !important;
    border-radius: 6px !important;
}

.btn-group.shadow-sm .btn {
    border: 1px solid #e2e8f0 !important;
    background-color: #fff !important;
    color: #64748b !important;
    font-size: 13px !important;
    font-weight: 500 !important;
    padding: 7px 14px !important;
}

.btn-group.shadow-sm .btn:hover {
    background-color: #f1f5f9 !important;
    color: #1e293b !important;
}
</style>

<input type="hidden" id="loginUserId" value="<sec:authorize access='isAuthenticated()'><sec:authentication property='principal.username'/></sec:authorize>">

<div class="ad-wrapper-top mt-3 mb-2" style="max-width: 1100px; margin: 0 auto;">
	<div class="article-header" style="padding: 20px !important; margin-bottom: 10px !important;">
		<div class="ad-content" style="background-color: #f8fafc; border: 1px dashed #e2e8f0; height: 100px; display: flex; align-items: center; justify-content: center; border-radius: 8px;">
			<span class="text-muted" style="font-size: 13px;">광고 영역 (상단)</span>
		</div>
	</div>
</div>

<div class="container mt-2">
	<div class="article-box">

		<div class="breadcrumb-wrapper mb-3">
			<div class="breadcrumb-box">
				<a href="${pageContext.request.contextPath}/" class="breadcrumb-item">커뮤니티</a> <span class="breadcrumb-split">|</span> <a href="javascript:void(0);" onclick="goCategory('${board.cat_name}')"
					class="breadcrumb-item"> ${board.cat_name} </a>
			</div>
		</div>
		<h1 class="article-title">${board.title}</h1>

		<div class="article-meta d-flex justify-content-between align-items-center pb-3">
			<div class="d-flex align-items-center">
				<img
					src="${board.user_img != null ? pageContext.request.contextPath.concat('/member/display?fileName=').concat(board.user_img) : pageContext.request.contextPath.concat('/resources/img/default_profile.jpg')}"
					class="rounded-circle mr-2" style="width: 26px; height: 26px; object-fit: cover; border: 1px solid #f1f5f9;"
					onerror="this.src='${pageContext.request.contextPath}/resources/img/default_profile.jpg'"> <strong style="color: #334155; font-size: 14px; font-weight: 600;">${board.writer}</strong> <span
					class="meta-divider">·</span> <span id="articleDate" class="meta-text" style="font-size: 13px; color: #94a3b8;"></span> <span class="meta-divider">·</span> <span class="meta-text"
					style="font-size: 13px; color: #94a3b8;"> <i class="far fa-eye"></i> ${board.viewcnt}
				</span>
			</div>

			<div class="btn-group shadow-sm" style="border: 1px solid #e2e8f0; border-radius: 8px; background: white;">
				<button type="button" class="btn btn-sm text-secondary" style="border: none; background: transparent; font-size: 13px; font-weight: 500; padding: 6px 12px;">
					<i class="fa fa-share-alt mr-1"></i> 공유
				</button>

				<div style="width: 1px; background-color: #e2e8f0; margin: 8px 0;"></div>

				<button type="button" class="btn btn-sm text-secondary" style="border: none; background: transparent; font-size: 13px; font-weight: 500; padding: 6px 12px;">
					<i class="far fa-bookmark mr-1"></i> 스크랩
				</button>

				<div style="width: 1px; background-color: #e2e8f0; margin: 8px 0;"></div>

				<div class="dropdown">
					<button class="btn btn-sm text-secondary" type="button" data-toggle="dropdown">
						<i class="fa fa-ellipsis-h"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right shadow border-0 mt-2">
						<c:if test="${not empty pinfo && pinfo.user.userId == board.writer}">
							<a class="dropdown-item py-2" href="javascript:void(0);" onclick="modifyBoard()"> <i class="fas fa-edit mr-2"></i>수정하기
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item py-2 text-danger" href="javascript:void(0);" onclick="deleteBoard()"> <i class="fas fa-trash-alt mr-2"></i>삭제하기
							</a>
						</c:if>

						<c:if test="${pinfo.user.userId != board.writer}">
							<a class="dropdown-item py-2" href="#"> <i class="fas fa-flag mr-2"></i>신고하기
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<div class="article-content">${board.content}</div>

		<div class="reaction-wrapper">
			<div id="likeBtn" class="reaction-item">
				<i class="far fa-thumbs-up"></i> <span id="likeCount">${board.likecnt}</span>
			</div>
			<div id="dislikeBtn" class="reaction-item">
				<i class="far fa-thumbs-down"></i> <span id="dislikeCount">${board.dislikecnt}</span>
			</div>
		</div>
		<div class="ad-wrapper-middle mt-4"></div>
	</div>
	<hr>

	<div class="mt-4 mb-3">
		<c:choose>
			<c:when test="${not empty pinfo}">

				<div class="ad-wrapper-middle mb-4">
					<div class="ad-content" style="background-color: #f8fafc; border: 1px dashed #e2e8f0; height: 120px; display: flex; align-items: center; justify-content: center; border-radius: 12px;">
						<div class="text-center">
							<span class="d-block text-muted" style="font-size: 12px;">ADVERTISEMENT</span> <span class="text-secondary" style="font-size: 14px; font-weight: 500;">여기에 광고가 들어갑니다</span>
						</div>
					</div>
				</div>

				<div class="reply-section mt-4">
					<div class="reply-count mb-3" style="font-size: 16px; font-weight: 700; color: #334155;">
						총 <span class="text-primary">${replyList.size()}</span>개의 댓글
					</div>

					<div class="reply-form-container" style="border: 1px solid #e2e8f0; border-radius: 12px; background-color: #ffffff; overflow: hidden;">
						<div id="replyEditor" style="height: 120px; border: none; font-size: 15px;"></div>

						<div class="d-flex justify-content-between align-items-center p-2" style="border-top: 1px solid #f1f5f9; background: #fafafa;">
							<div id="toolbar-container"></div>

							<div class="d-flex align-items-center" style="gap: 12px;">
								<span id="char-count" style="font-size: 12px; color: #94a3b8;">0 / 2000</span>
								<button id="addReplyBtn" class="btn btn-primary btn-sm px-3" style="border-radius: 6px; font-weight: 600;">작성</button>
							</div>
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
		<ul id="replyList" class="list-group list-group-flush mt-3">
		</ul>
	</div>

	<div id="reReplyEditorTemplate" style="display: none;">
		<div class="re-reply-box-wrapper" style="border: 1px solid #e2e8f0; border-radius: 12px; background: #fff; overflow: hidden; margin-top: 10px;">
			<div class="re-reply-quill" style="height: 100px; border: none;"></div>

			<div class="d-flex justify-content-between align-items-center px-3" style="border-top: 1px solid #f1f5f9; background: #fcfcfc; height: 48px;">

				<div class="re-toolbar-container"></div>

				<div class="d-flex align-items-center" style="gap: 10px;">
					<button class="btn re-reply-cancel" style="font-size: 13px; color: #64748b; background: none; border: none;">취소</button>
					<button class="btn re-reply-submit" style="background-color: #3b82f6; color: white; border-radius: 6px; padding: 5px 14px; font-weight: 600; font-size: 13px; border: none;">작성</button>
				</div>
			</div>
		</div>
	</div>

	<hr style="border-top: 1px solid #f1f5f9; margin: 50px 0;">

	<div class="list-under-article">
		<div style="margin-bottom: 15px;">
			<span style="cursor: pointer;" onclick=" location.href='${pageContext.request.contextPath}/'"> <i class="fa fa-chevron-left" style="font-size: 12px; margin-right: 5px;"></i> 커뮤니티 목록
			</span>
		</div>
		<c:forEach items="${list}" var="boardList">
			<div class="list-group-item d-flex justify-content-between align-items-center py-3"
				style="cursor: pointer; border-bottom: 1px solid #f1f5f9; ${boardList.bno == board.bno ? 'background-color: #f8fafc;' : ''}"
				onclick="location.href='${pageContext.request.contextPath}/board/get?bno=${boardList.bno}'">

				<div class="text-truncate" style="max-width: 60%; font-size: 15px; font-weight: ${boardList.bno == board.bno ? '700' : '500'}; color: #334155;">${boardList.title}</div>

				<div class="d-flex align-items-center text-muted" style="font-size: 13px; gap: 15px;">

					<div class="d-flex align-items-center" style="width: 100px;">
						<img src="${pageContext.request.contextPath}/resources/img/default_profile.jpg" class="rounded-circle mr-2" style="width: 20px; height: 20px;"> <span class="text-truncate">${boardList.writer}</span>
					</div>

					<div class="list-item-date" style="width: 80px; text-align: center;" data-date="${boardList.regdate}"></div>

					<div style="width: 40px; text-align: center;">
						<i class="far fa-thumbs-up"></i> ${boardList.likecnt}
					</div>

					<div style="width: 40px; text-align: center;">
						<i class="far fa-comment-dots"></i> ${boardList.replycnt}
					</div>

				</div>
			</div>
		</c:forEach>
	</div>

	<div class="d-flex justify-content-end align-items-center mt-4">
		<nav>
			<ul class="pagination pagination-sm mb-0">

			</ul>
		</nav>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script>
function goCategory(catName) {
    if (!catName) return;
    var trimmedName = catName.trim();
    const categoryMapping = {
        "Q&A": "qna", "기술": "tech", "커리어": "career", "기타": "etc",
        "지식": "knowledge", "Tech 뉴스": "news", "팁": "tips", "칼럼": "column",
        "리뷰": "review", "IT보도자료": "press", "커뮤니티": "community",
        "사는얘기": "life", "AI": "ai", "연봉·단가": "salary", "취준생": "jobs",
        "IT 정책토론": "policy", "피드백": "feedback", "이벤트": "event",
        "IT 행사": "it-event", "홍보·광고": "promo", "모임": "meetup",
        "스터디": "study", "프로젝트": "project", "모각코·모각공": "coding-study",
        "멘토링·튜터링": "mentoring", "모임·네트워킹": "networking",
        "공모전·해커톤": "contest", "부트캠프": "bootcamp", "교육과정": "course",
        "JOBS": "jobs-board", "계약직": "contract", "정규직": "full-time",
        "Talent": "talent", "좋은회사/나쁜회사": "company-review",
        "CONTACT": "contact", "공지사항": "notice", "Releases": "releases",
        "버그 및 제안": "bug-report", "게시판 생성 요청": "request", "OKKY 행사": "okky-event"
    };
    var slug = categoryMapping[trimmedName];
    location.href = '${pageContext.request.contextPath}/board/list' + (slug ? '?category=' + slug : '');
}
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
    if (diff < 60) return '방금 전'; 
    var betweenTime = Math.floor(diff / 60);
    if (betweenTime < 60) return betweenTime + '분 전';
    var betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) return '약 ' + betweenTimeHour + '시간 전';
    var betweenTimeDay = Math.floor(betweenTimeHour / 24);
    if (betweenTimeDay < 365) return betweenTimeDay + '일 전';
    return Math.floor(betweenTimeDay / 365) + '년 전';
}

$(document).ready(function() {
    var bnoValue = "${board.bno}";
    var loginUser = ($("#loginUserId").val() || "").trim();
    var replyUL = $("#replyList");

    $("#articleDate").text(timeForToday('${board.regdate}'));

    var quill;
    if (document.getElementById('replyEditor')) {
        quill = new Quill('#replyEditor', {
            theme: 'snow',
            placeholder: '주제에 대한 생각을 자유롭게 댓글로 표현해 주세요.',
            modules: { toolbar: [['bold', 'italic', 'underline', 'strike'], ['blockquote', 'code-block'], ['link', 'image']] }
        });
        $(".ql-toolbar").appendTo("#toolbar-container").css({'border': 'none', 'background': 'transparent'});
    }

    function showList(page) {
        replyService.getList({ bno: bnoValue, page: page || 1 }, function(list) {
            var str = "";
            if (!list || list.length == 0) {
                if(loginUser) replyUL.html("<li class='text-center py-5 text-muted'>첫 번째 댓글을 남겨보세요!</li>");
                else replyUL.html("<li class='text-center py-5 text-muted'>로그인 후 댓글을 확인하실 수 있습니다.</li>");
                return;
            }
            for (var i = 0, len = list.length; i < len; i++) {
                var isChild = (list[i].parentRno > 0);
                var replyStyle = isChild ? "style='margin-left: 50px !important; background-color: #f8fafc !important; border-left: 3px solid #cbd5e1 !important;'" : "";
                var likeCount = list[i].likecnt || 0;
                var dislikeCount = list[i].dislikecnt || 0;
                str += "<li class='list-group-item py-4' data-rno='" + list[i].rno + "' " + replyStyle + ">";
                str += "  <div class='d-flex align-items-start'>"; 
                str += "    <img src='${pageContext.request.contextPath}/resources/img/default_profile.jpg' class='rounded-circle mr-3' style='width:36px; height:36px; object-fit:cover;'>";
                str += "    <div class='flex-grow-1'>";
                str += "      <div class='d-flex justify-content-between align-items-center mb-2'>";
                str += "        <div><strong style='font-size:14px; color:#334155;'>" + list[i].replyer + "</strong>";
                str += "        <span class='text-muted ml-2' style='font-size:12px;'>" + timeForToday(list[i].replyDate) + "</span></div>";
                str += "        <div style='color:#94a3b8; font-size:14px; display:flex; gap:12px; align-items:center;'>";
                str += "          <span class='reply-like' style='cursor:pointer;' data-rno='"+list[i].rno+"'><i class='far fa-thumbs-up'></i> <span class='count'>" + likeCount + "</span></span>";
                str += "          <span class='reply-dislike' style='cursor:pointer;' data-rno='" + list[i].rno + "'><i class='far fa-thumbs-down'></i> <span class='count'>" + dislikeCount + "</span></span>";
                if (loginUser === list[i].replyer) {
                    str += "      <div class='dropdown'><span style='cursor:pointer;' data-toggle='dropdown'><i class='fas fa-ellipsis-h'></i></span>";
                    str += "        <div class='dropdown-menu dropdown-menu-right shadow-sm border-0'>";
                    str += "          <a class='dropdown-item replyModifyBtn' href='javascript:void(0);'>수정하기</a>";
                    str += "          <a class='dropdown-item replyDeleteBtn' href='javascript:void(0);' style='color:#ef4444;'>삭제하기</a>";
                    str += "        </div></div>";
                } else {
                    str += "      <span style='cursor:pointer;' title='신고'><i class='far fa-flag'></i></span>";
                }
                str += "      </div></div>";
                if (list[i].delYn === 'Y' || list[i].delYn === 'y') {
                    str += "      <div style='color:#94a3b8; font-style:italic; font-size:14px;'>삭제된 댓글입니다.</div>";
                } else {
                    str += "      <div class='reply-content' style='font-size:15px; color:#1e293b; line-height:1.5;'>" + list[i].reply + "</div>";
                    str += "      <div class='mt-2'><span class='replyAddBtn' style='cursor:pointer; font-weight:600; color:#3b82f6; font-size:12px;'>답글쓰기</span></div>";
                }
                str += "    </div></div></li>";
            }
            replyUL.html(str);
        });
    }

    showList(1);

    function updateReactionUI($btn, result, typeName) {
        var $countSpan = $btn.find(".count").length ? $btn.find(".count") : $btn.find("span");
        var currentCount = parseInt($countSpan.text() || 0);
        if (result === true) {
            $countSpan.text(currentCount + 1);
            $btn.addClass("reaction-active").find("i").removeClass("far").addClass("fas");
        }
        else if (result === false) {
            $countSpan.text(Math.max(0, currentCount - 1));
            $btn.removeClass("reaction-active").find("i").removeClass("fas").addClass("far");
        }
        else if (result === "success" || result === "inserted") {
            $countSpan.text(currentCount + 1);
            $btn.addClass("reaction-active").find("i").removeClass("far").addClass("fas");
        }
        else if (result === "canceled" || result === "deleted") {
            $countSpan.text(Math.max(0, currentCount - 1));
            $btn.removeClass("reaction-active").find("i").removeClass("fas").addClass("far");
        }
    }

    function showAlreadyPopup(typeName) {
        Swal.fire({ title: typeName + ' 실패', text: '이미 리액션을 하였습니다. 취소 후 다시 시도하세요.', icon: 'error', confirmButtonText: '확인' });
    }

    $("#addReplyBtn").on("click", function() {
        var content = quill.root.innerHTML;
        if (quill.getText().trim().length === 0) return Swal.fire('알림', '내용을 입력해주세요.', 'warning');
        replyService.add({reply: content, replyer: loginUser, bno: bnoValue}, function() {
            quill.setContents([]);
            showList(1);
        });
    });

    $(document).on("click", ".replyAddBtn", function() {
        var $li = $(this).closest("li");
        var parentRno = $li.data("rno");
        var replyerName = $li.find("strong").first().text();
        if ($li.find(".re-reply-box-wrapper").length > 0) return $li.find(".re-reply-box-wrapper").remove();
        $(".re-reply-box-wrapper, .modify-box-wrapper").remove();
        var replyForm = '<div class="re-reply-box-wrapper mt-3" style="border: 1px solid #e2e8f0; border-radius: 12px; overflow: hidden;"><div class="re-editor-actual" style="height: 100px;"></div><div class="d-flex justify-content-end px-3 py-2 bg-light" style="gap:8px;"><button class="btn btn-sm btn-re-cancel" style="border:none; background:none; color:#64748b;">취소</button><button class="btn btn-sm btn-primary btn-re-submit" style="background:#3b82f6; border:none; font-weight:600;">작성</button></div></div>';
        $li.append(replyForm);
        var reQuill = new Quill($li.find(".re-editor-actual")[0], {
            theme: 'snow',
            placeholder: '@' + replyerName + ' 님에게 답글 남기기...',
            modules: { toolbar: [['bold', 'italic', 'underline', 'code-block']] }
        });
        $li.find(".btn-re-submit").on("click", function() {
            if(reQuill.getText().trim().length === 0) return;
            replyService.add({reply: reQuill.root.innerHTML, replyer: loginUser, bno: bnoValue, parentRno: parentRno}, function() {
                showList(1);
            });
        });
        $li.find(".btn-re-cancel").on("click", function() { $li.find(".re-reply-box-wrapper").remove(); });
    });

    $(document).on("click", ".replyModifyBtn", function() {
        var $li = $(this).closest("li");
        var rno = $li.data("rno");
        var originalContent = $li.find(".reply-content").html();
        $(".re-reply-box-wrapper, .modify-box-wrapper").remove();
        $li.find(".reply-content").hide();
        var modifyForm = '<div class="modify-box-wrapper mt-2" style="border: 1px solid #3b82f6; border-radius: 8px; background:#fff; overflow:hidden;"><div class="modify-editor" style="height: 100px;">' + originalContent + '</div><div class="d-flex justify-content-end p-2 bg-light" style="gap:8px;"><button class="btn btn-sm btn-secondary btn-modify-cancel">취소</button><button class="btn btn-sm btn-primary btn-modify-submit">수정완료</button></div></div>';
        $li.append(modifyForm);
        var mQuill = new Quill($li.find(".modify-editor")[0], { theme: 'snow', modules: { toolbar: [['bold', 'italic', 'underline', 'code-block']] } });
        $li.find(".btn-modify-submit").on("click", function() {
            replyService.update({ rno: rno, reply: mQuill.root.innerHTML }, function() { showList(1); });
        });
        $li.find(".btn-modify-cancel").on("click", function() { showList(1); });
    });

    $(document).on("click", ".replyDeleteBtn", function() {
        var rno = $(this).closest("li").data("rno");
        Swal.fire({ title: '삭제하시겠습니까?', icon: 'warning', showCancelButton: true, confirmButtonText: '삭제' }).then((result) => {
            if (result.isConfirmed) replyService.remove(rno, function() { showList(1); });
        });
    });

    $(document).on("click", "#likeBtn, #dislikeBtn", function(e) {
        e.preventDefault();
        if(!loginUser) return Swal.fire('알림', '로그인 후 이용 가능합니다', 'warning');
        var $btn = $(this);
        var isLike = $btn.attr("id") === "likeBtn";
        var url = isLike ? '${pageContext.request.contextPath}/like/update' : '${pageContext.request.contextPath}/like/disupdate';
        $.ajax({
            type: 'post',
            url: url,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ 
                bno: parseInt(bnoValue), 
                userid: loginUser 
            }),
            success: function(result) {
                updateReactionUI($btn, result, isLike ? "추천" : "비추천");
            },
            error: function(xhr) {
                var errorMsg = xhr.responseText || "처리 중 오류가 발생했습니다.";
                Swal.fire({
                    title: '리액션 오류',
                    text: errorMsg,
                    icon: 'warning',
                    confirmButtonText: '확인',
                    customClass: {
                        popup: 'my-rounded-popup',
                        confirmButton: 'my-confirm-btn'
                    }
                });
            }
        });
    });

    $(document).on("click", ".reply-like, .reply-dislike", function(e) {
        e.preventDefault();
        if(!loginUser) return Swal.fire('알림', '로그인 후 이용 가능합니다', 'warning');
        var $btn = $(this);
        var isLike = $btn.hasClass("reply-like");
        var rno = $btn.data("rno");
        replyService.updateLike({ rno: rno, userid: loginUser, like_type: isLike ? "L" : "D" }, function(result) {
            updateReactionUI($btn, result, isLike ? "추천" : "비추천");
        }, function(xhr) {
            if(xhr.status === 400) showAlreadyPopup(isLike ? "추천" : "비추천");
        });
    });

    window.modifyBoard = function() {
        if (!bnoValue) {
            Swal.fire('오류', '게시글 번호를 찾을 수 없습니다.', 'error');
            return;
        }
        location.href = "${pageContext.request.contextPath}/board/modify?bno=" + bnoValue;
    };
    
    window.deleteBoard = function() { 
        if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
            location.href = "${pageContext.request.contextPath}/board/remove?bno=" + bnoValue; 
        }
    };
});
</script>

<aside class="side-banner d-none d-lg-block">
	<div class="banner-sticky">
		<div class="text-center" style="height: 600px; overflow: hidden;">
			<a href="https://okky.kr" target="_blank"> <img src="${pageContext.request.contextPath}/resources/img/right.png" alt="오른쪽 광고" style="width: 100%; height: 100%; object-fit: contain;"
				onerror="this.onerror=null; this.style.display='none';">
			</a>
		</div>
	</div>
</aside>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>