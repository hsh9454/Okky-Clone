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
    #replyList {
    margin-bottom: 10px !important; 
    padding-bottom: 0 !important;
    }
    .list-under-article {
    clear: both !important;
    margin-top: 20px !important;
    padding-top: 20px;
    border-top: 2px solid #334155; 
    position: relative;
    z-index: 10;
    }
    .list-group-item {
    height: auto !important; 
    overflow: visible !important;
    }
    .re-reply-box-wrapper {
    margin-bottom: 15px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05); 
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
    .ql-editor { 
        padding: 20px !important; 
        line-height: 1.6; 
        font-size: 15px; 
    }
    .ql-container.ql-snow { border: none !important; }

    .ql-editor.ql-blank::before {
        font-style: normal !important;
        color: #cbd5e1 !important;
        left: 20px !important;
        opacity: 1;
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

    #toolbar-container {
        display: flex !important;
        align-items: center !important;
        flex-wrap: nowrap !important;
    }
    .ql-toolbar.ql-snow { 
        border: none !important; 
        padding: 0 !important; 
        background: transparent !important;
    }
    .ql-snow.ql-toolbar button {
        width: 28px !important;
        height: 28px !important;
        padding: 4px !important;
        margin-right: 2px !important;
        color: #64748b !important;
    }
    .ql-snow.ql-toolbar button:hover {
        color: #3b82f6 !important;
        background: #f1f5f9;
        border-radius: 4px;
    }

    .divider {
        width: 1px;
        height: 12px;
        background-color: #e2e8f0;
        margin: 0 10px;
    }
    .meta-text {
        font-size: 13px;
        color: #94a3b8;
    }

    #btnReplySubmit { 
        background-color: #3b82f6; 
        border: none; 
        border-radius: 8px; 
        padding: 7px 18px; 
        color: white; 
        font-weight: 600; 
        font-size: 14px;
        display: flex;
        align-items: center;
        gap: 6px;
        transition: background 0.2s;
    }
    #btnReplySubmit:hover { background-color: #2563eb; }

    .article-header { padding: 20px 0; border-bottom: 1px solid #f1f5f9; }
    .article-title { font-size: 28px; font-weight: 700; color: #1e293b; margin-bottom: 15px; }
    .meta-divider { color: #e2e8f0; margin: 0 10px; }
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
                <div class="d-flex align-items-center">
                    <button class="btn btn-sm btn-light text-muted mr-2">
                    <i class="fa fa-share-alt"></i> 공유
                    </button>
    
                    <button class="btn btn-sm btn-light text-muted mr-2">
                    <i class="far fa-bookmark"></i> 스크랩                   
                    </button>
                    
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
                <div class="reply-box-wrapper" style="border: 1px solid #e2e8f0; border-radius: 12px; background: #fff; overflow: hidden;">
    <div id="replyEditor" style="height: 140px; border: none; font-size: 15px;"></div>

    <div class="d-flex justify-content-between align-items-center px-3" 
     style="border-top: 1px solid #f1f5f9; background: #fcfcfc; min-height: 52px;">
    
    <div id="toolbar-container"></div>

    <div class="d-flex align-items-center">
        <span style="font-size: 13px; color: #94a3b8; cursor: pointer;">도움말</span>
        <div class="divider"></div>
        <span style="font-size: 13px; color: #94a3b8; margin-right: 15px;">
            <span id="char-count">0</span> / 2000
        </span>
        <button id="btnReplySubmit" class="btn" 
                style="background-color: #3b82f6; color: white; border-radius: 8px; padding: 7px 16px; font-weight: 600; font-size: 14px; border: none; display: flex; align-items: center; gap: 6px;">
            <i class="fa fa-paper-plane"></i> 작성
        </button>
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
        <ul id="replyList" class="list-group list-group-flush mt-3">
            </ul>
    </div>
    
    <div id="reReplyEditorTemplate" style="display: none;">
        <div class="re-reply-box-wrapper" style="border: 1px solid #e2e8f0; border-radius: 12px; background: #fff; overflow: hidden; margin-top: 10px;">
            <div class="re-reply-quill" style="height: 100px; border: none;"></div>
            
            <div class="d-flex justify-content-between align-items-center px-3" 
                 style="border-top: 1px solid #f1f5f9; background: #fcfcfc; height: 48px;">
                
                <div class="re-toolbar-container"></div> 
                
                <div class="d-flex align-items-center" style="gap: 10px;">
                    <button class="btn re-reply-cancel" style="font-size: 13px; color: #64748b; background: none; border: none;">취소</button>
                    <button class="btn re-reply-submit" style="background-color: #3b82f6; color: white; border-radius: 6px; padding: 5px 14px; font-weight: 600; font-size: 13px; border: none;">
                        작성
                    </button>
                </div>
            </div>
        </div>
    </div>

    <hr style="border-top: 1px solid #f1f5f9; margin: 50px 0;">

    <div class="list-under-article">
        <div class="list-group list-group-flush border-top" style="border-top: 2px solid #334155 !important;">
            <c:forEach items="${list}" var="boardList">
                <div class="list-group-item d-flex justify-content-between align-items-center py-3" 
                     style="cursor: pointer; border-bottom: 1px solid #f1f5f9; ${boardList.bno == board.bno ? 'background-color: #f8fafc;' : ''}"
                     onclick="location.href='${pageContext.request.contextPath}/board/get?bno=${boardList.bno}'">
                    
                    <div class="text-truncate" style="max-width: 60%; font-size: 15px; font-weight: ${boardList.bno == board.bno ? '700' : '500'}; color: #334155;">
                        ${boardList.title}
                    </div>

                    <div class="d-flex align-items-center text-muted" style="font-size: 13px; gap: 15px;">
                       
                        <div class="d-flex align-items-center" style="width: 100px;">
                            <img src="/resources/img/default_profile.jpg" class="rounded-circle mr-2" style="width: 20px; height: 20px;">
                            <span class="text-truncate">${boardList.writer}</span>
                        </div>
                        
                        <div class="list-item-date" style="width: 80px; text-align: center;" data-date="${boardList.regdate}">
                        </div>
                        
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

        <div class="d-flex justify-content-between align-items-center mt-4">
            <button class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/board/list'">
                <i class="fa fa-list"></i> 목록으로
            </button>
            
            <nav>
                <ul class="pagination pagination-sm mb-0">
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                </ul>
            </nav>
        </div>
    </div>
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
            placeholder: '주제에 대한 생각을 자유롭게 댓글로 표현해 주세요. 여러분의 다양한 의견을 기다립니다.',
            modules: {
                toolbar: [
                    ['bold', 'italic', 'underline', 'strike'],
                    ['blockquote', 'code-block'],
                    ['link', 'image', 'video']
                ]
            }
        });

        $(".ql-toolbar").appendTo("#toolbar-container").css({
            'border': 'none', 
            'padding': '0'
        });

        $("#articleDate").text(timeForToday('${board.regdate}'));
        
        $(".list-item-date").each(function() {
            var rawDate = $(this).data("date");
            if(rawDate) {
                $(this).text(timeForToday(rawDate));
            }
        });
        
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
        $(document).off("click", ".replyAddBtn").on("click", ".replyAddBtn", function(e) {
            e.preventDefault();
            var $li = $(this).closest("li");
            var parentRno = $li.data("rno");
            var replyerName = $li.find("strong").first().text();

            if ($li.find(".re-reply-box-wrapper").length > 0) {
                $li.find(".re-reply-box-wrapper").remove();
                return;
            }
            $(".re-reply-box-wrapper").remove(); 

            var replyForm = `
                <div class="re-reply-box-wrapper" style="border: 1px solid #e2e8f0; border-radius: 12px; background: #fff; overflow: hidden; margin-top: 10px;">
                    <div class="re-editor-actual" style="height: 100px; border: none;"></div>
                    <div class="d-flex justify-content-between align-items-center px-3" style="border-top: 1px solid #f1f5f9; background: #fcfcfc; height: 48px;">
                        <div class="re-toolbar-custom"></div>
                        <div class="d-flex align-items-center" style="gap: 10px;">
                            <button class="btn btn-re-cancel" style="font-size: 13px; color: #64748b; background: none; border: none;">취소</button>
                            <button class="btn btn-re-submit" style="background-color: #3b82f6; color: white; border-radius: 6px; padding: 5px 14px; font-weight: 600; font-size: 13px; border: none;">작성</button>
                        </div>
                    </div>
                </div>`;
            
            $li.append(replyForm);

            var $newBox = $li.find(".re-reply-box-wrapper");
            var editorDom = $newBox.find(".re-editor-actual").get(0);

            if (editorDom) {
                var reQuill = new Quill(editorDom, {
                    theme: 'snow',
                    placeholder: '@' + replyerName + ' 님에게 답글 남기기...',
                    modules: { toolbar: [['bold', 'italic', 'underline']] }
                });

                var $toolbar = $newBox.find(".ql-toolbar");
                $newBox.find(".re-toolbar-custom").append($toolbar);
                $toolbar.css({'border': 'none', 'padding': '0'});

                $newBox.find(".btn-re-submit").on("click", function() {
                    var content = reQuill.root.innerHTML;
                    if(reQuill.getText().trim().length === 0) return;
                    replyService.add({reply: content, replyer: loginUser, bno: bnoValue, parentRno: parentRno}, function() {
                        showList();
                    });
                });

                $newBox.find(".btn-re-cancel").on("click", function() {
                    $newBox.remove();
                });
            }
        });
        
        $("#btnReplySubmit").off("click").on("click", function() {
            var content = quill.root.innerHTML;
            if(quill.getText().trim().length === 0) { alert("내용을 입력해주세요!"); return; }
            replyService.add({reply: content, replyer: loginUser, bno: bnoValue}, function() {
                quill.setContents([]);
                $("#char-count").text("0");
                showList();
            });
        });
        
        $(document).on("click", ".replyDeleteBtn", function() {
            var rno = $(this).closest("li").data("rno");
            if(confirm("삭제하시겠습니까?")) {
                replyService.remove(rno, function() { showList(); });
            }
        });
        
        $(document).on("click", ".replyModifyBtn", function() {
            var rno = $(this).closest("li").data("rno");
            var mod = prompt("수정할 내용", $(this).closest("li").find("p").text());
            if(mod) replyService.update({rno: rno, reply: mod}, function() { showList(); });
        });
        
        function sendLikeRequest(url, typeName) {
            var countId = (typeName === "추천") ? "#likeCount" : "#dislikeCount";
            var currentCount = parseInt($(countId).text()) || 0;
            $.ajax({
                type: 'post',
                url: url,
                data: JSON.stringify({ bno: bnoValue, userid: loginUser }),
                contentType: "application/json; charset=utf-8",
                success: function(result) {
                    if (result === true || result === "true") {
                        Swal.fire({ 
                            toast: true, 
                            position: 'center', 
                            showConfirmButton: false, 
                            timer: 800, 
                            title: typeName + ' 완료' 
                        }).then(() => { 
                            location.reload(); 
                        });
                    } 
                    else {
                        if (currentCount > 0) { 
                            location.reload(); 
                        } else {
                            Swal.fire({ 
                                title: typeName + ' 실패', 
                                text: '이미 리액션을 하였습니다. 리액션을 취소 후 다시 시도하세요.', 
                                icon: 'error' 
                            });
                        }
                    }
                },
                error: function(xhr, status, err) {
                    console.error(err);
                    Swal.fire({ title: '오류 발생', text: '서버와 통신 중 문제가 발생했습니다.', icon: 'error' });
                }
            });
        }
        $("#likeBtn").on("click", function() { if(loginUser) sendLikeRequest('${pageContext.request.contextPath}/like/update', "추천"); else alert("로그인 필요"); });
        $("#dislikeBtn").on("click", function() { if(loginUser) sendLikeRequest('${pageContext.request.contextPath}/like/disupdate', "비추천"); else alert("로그인 필요"); });

        window.deleteBoard = function() { if (confirm("삭제하시겠습니까?")) location.href = "${pageContext.request.contextPath}/board/remove?bno=" + bnoValue; };

        showList();
    });
</script>