<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.badge-n {
	display: inline-flex !important;
	align-items: center;
	justify-content: center;
	width: 18px !important;
	height: 18px !important;
	background-color: #f8d7da !important;
	color: #dc3545 !important;
	font-size: 10px !important;
	font-weight: bold !important;
	border-radius: 50% !important;
	margin: 0 4px !important;
	vertical-align: middle !important;
	line-height: 1 !important;
}

.text-truncate-2 {
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.custom-dot-indicators {
	bottom: -45px !important;
}

.custom-dot-indicators button {
	width: 8px !important;
	height: 8px !important;
	border-radius: 50% !important;
	background-color: #dee2e6 !important;
	border: none !important;
	margin: 0 4px !important;
	opacity: 1 !important;
	transition: background-color 0.3s ease;
}

.custom-dot-indicators button.active {
	background-color: #0d6efd !important;
}

.tech-overlap-btn {
	width: 45px !important;
	opacity: 1 !important;
}

.carousel-control-prev.tech-overlap-btn {
	left: -22px;
}

.carousel-control-next.tech-overlap-btn {
	right: -22px;
}

.btn-round {
	width: 40px;
	height: 40px;
	background: white;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 1px solid #eee;
	color: #333;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.text-truncate-2 {
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.no-scrollbar::-webkit-scrollbar {
	display: none;
}

.no-scrollbar {
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.filter-bar-container {
	display: flex;
	align-items: center;
	gap: 10px;
	background-color: #f8f9fa;
	border-radius: 12px;
	padding: 10px 15px;
	border: 1px solid #eee;
}

.filter-tab {
	text-decoration: none;
	color: #666;
	font-size: 14px;
	white-space: nowrap;
	padding: 8px 16px;
	border-radius: 8px;
	transition: all 0.2s ease;
}

.filter-tab.active {
	background-color: #fff !important;
	color: #0d6efd !important;
	font-weight: bold;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
</style>



<div class="container-fluid mt-4">
	<div class="rounded-3 mb-4 overflow-hidden shadow-sm"
		style="height: 160px; background: linear-gradient(90deg, #0d6efd, #000);">
		<div
			class="d-flex flex-column align-items-center justify-content-center h-100 text-white text-center">
			<h3 class="fw-bold mb-1">Find BUIDLer</h3>
			<p class="mb-0 opacity-75">2026 한화투자증권 디지털/글로벌 경력 채용</p>
		</div>
	</div>

	<ul class="nav nav-pills p-1"
		style="background-color: #f1f3f5; border-radius: 12px; display: inline-flex;">
		<li class="nav-item"><a
			class="nav-link ${currentType == 'daily' || currentType == null ? 'active shadow-sm' : 'text-muted'}"
			href="javascript:void(0);" onclick="loadData('daily', this)"
			style="${currentType == 'daily' || currentType == null ? 'background-color: #fff !important; color: #333 !important; font-weight: 600;' : 'font-weight: 500;'} border-radius: 10px; font-size: 14px; padding: 6px 16px;">
				오늘의 인기글 </a></li>
		<li class="nav-item"><a
			class="nav-link ${currentType == 'weekly' ? 'active shadow-sm' : 'text-muted'}"
			href="javascript:void(0);" onclick="loadData('weekly', this)"
			style="${currentType == 'weekly' ? 'background-color: #fff !important; color: #333 !important; font-weight: 600;' : 'font-weight: 500;'} border-radius: 10px; font-size: 14px; padding: 6px 16px;">
				이번주 인기글 </a></li>
		<li class="nav-item"><a
			class="nav-link ${currentType == 'monthly' ? 'active shadow-sm' : 'text-muted'}"
			href="javascript:void(0);" onclick="loadData('monthly', this)"
			style="${currentType == 'monthly' ? 'background-color: #fff !important; color: #333 !important; font-weight: 600;' : 'font-weight: 500;'} border-radius: 10px; font-size: 14px; padding: 6px 16px;">
				이달의 인기글 </a></li>
		<li class="nav-item"><a
			class="nav-link ${currentType == 'notice' ? 'active shadow-sm' : 'text-muted'}"
			href="javascript:void(0);" onclick="loadData('notice', this)"
			style="${currentType == 'notice' ? 'background-color: #fff !important; color: #333 !important; font-weight: 600;' : 'font-weight: 500;'} border-radius: 10px; font-size: 14px; padding: 6px 16px;">
				공지사항 </a></li>
	</ul>
	<a href="/board/list" class="text-muted text-decoration-none"
		style="font-size: 0.75rem; padding-bottom: 8px;">더보기 ></a>


	<div id="popular-list-area" class="row g-4 mb-5">
		<div class="col-md-6">
			<div class="list-group list-group-flush border-top">
				<c:forEach items="${leftList}" var="board">
					<div
						class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">
						<div class="text-truncate" style="max-width: 75%;">
							<a href="/board/get?bno=${board.bno}"
								class="text-decoration-none text-dark fw-bold"
								style="font-size: 0.85rem;"> ${board.title} </a>
							<c:if test="${board.isNew}">
								<span class="badge-n">N</span>
							</c:if>
							<span class="text-primary small ms-1">(${board.replycnt})</span>
						</div>
						<span class="badge bg-light text-secondary border fw-normal"
							style="font-size: 0.7rem;">${board.cat_name}</span>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-md-6">
			<div class="list-group list-group-flush border-top">
				<c:forEach items="${rightList}" var="board">
					<div
						class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">
						<div class="text-truncate" style="max-width: 75%;">
							<a href="/board/get?bno=${board.bno}"
								class="text-decoration-none text-dark fw-bold"
								style="font-size: 0.85rem;"> ${board.title} </a>
							<c:if test="${board.isNew}">
								<span class="badge-n">N</span>
							</c:if>
							<span class="text-primary small ms-1">(${board.replycnt})</span>
						</div>
						<span class="badge bg-light text-secondary border fw-normal"
							style="font-size: 0.7rem;"> ${board.cat_name} </span>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="mt-5 mb-5 px-0">
		<div
			class="d-flex justify-content-between align-items-center mb-3 px-3">
			<h5 class="fw-bold mb-0">테크 지식 / 뉴스</h5>
			<a href="#" class="text-muted text-decoration-none small">더 보기 ></a>
		</div>

		<div id="techSlider" class="carousel slide position-relative"
			data-bs-ride="carousel" data-bs-interval="8000">

			<div class="carousel-indicators custom-dot-indicators">
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="2"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="3"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="4"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="5"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="6"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="7"></button>
			</div>

			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row g-3 mx-0">
						<c:choose>
							<c:when test="${not empty techList1}">
								<c:forEach items="${techList1}" var="tech">
									<div class="col-md-4 px-2">
										<div class="card h-100 border-0 shadow-sm overflow-hidden"
											style="border-radius: 12px;">
											<div class="tech-card-img"
												style="background-image: url('https://via.placeholder.com/180'); height: 180px; background-size: cover; background-position: center;">
												<span class="badge bg-dark opacity-75 m-2 float-end">${tech.cat_name}</span>
											</div>
											<div class="card-body">
												<h6 class="fw-bold text-truncate">${tech.title}</h6>
												<p class="card-text small text-muted text-truncate-2">${tech.title}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="col-md-4 px-2">
									<div class="card h-100 border-0 shadow-sm"
										style="border-radius: 12px; min-height: 280px;">
										<div
											style="height: 180px; background: #f8f9fa; display: flex; flex-direction: column; align-items: center; justify-content: center;">
											<i class="bi bi-image text-muted fs-2"></i> <span
												class="text-muted mt-2 small">이미지 준비중</span>
										</div>
										<div class="card-body">
											<h6 class="fw-bold">테크 뉴스 제목</h6>
											<p class="small text-muted">내용이 표시되는 영역입니다.</p>
										</div>
									</div>
								</div>
								<div class="col-md-4 d-none d-md-block px-2">
									<div class="bg-light rounded-3"
										style="height: 280px; opacity: 0.3;"></div>
								</div>
								<div class="col-md-4 d-none d-md-block px-2">
									<div class="bg-light rounded-3"
										style="height: 280px; opacity: 0.3;"></div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<button class="carousel-control-prev tech-overlap-btn" type="button"
				data-bs-target="#techSlider" data-bs-slide="prev">
				<span class="btn-round shadow-sm"><i
					class="bi bi-chevron-left"></i></span>
			</button>
			<button class="carousel-control-next tech-overlap-btn" type="button"
				data-bs-target="#techSlider" data-bs-slide="next">
				<span class="btn-round shadow-sm"><i
					class="bi bi-chevron-right"></i></span>
			</button>
		</div>
	</div>
	<div class="mt-5 mb-5">
		<div class="d-flex align-items-center mb-4 w-100">

			<div
				class="d-flex align-items-center gap-2 p-2 no-scrollbar shadow-sm w-100"
				style="background-color: #f8f9fa; border-radius: 12px; overflow-x: auto; border: 1px solid #eee;">

				<a href="#" class="filter-tab active"
					onclick="loadCategoryData('전체'); return false;">전체</a> <a href="#"
					class="filter-tab"
					onclick="loadCategoryData('사는얘기'); return false;">사는얘기</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('AI'); return false;">AI</a> <a href="#"
					class="filter-tab"
					onclick="loadCategoryData('연봉·단가'); return false;">연봉·단가</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('취준생'); return false;">취준생</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('스터디'); return false;">스터디</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('프로젝트'); return false;">프로젝트</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('모각코·모각공'); return false;">모각코·모각공</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('멘토링·튜터링'); return false;">멘토링·튜터링</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('모임·네트워킹'); return false;">모임·네트워킹</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('공모전·해커톤'); return false;">공모전·해커톤</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('IT 정책토론'); return false;">IT 정책토론</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('피드백'); return false;">피드백</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('Tech 뉴스'); return false;">Tech 뉴스</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('팀'); return false;">팀</a> <a href="#"
					class="filter-tab" onclick="loadCategoryData('칼럼'); return false;">칼럼</a>
				<a href="#" class="filter-tab"
					onclick="loadCategoryData('리뷰'); return false;">리뷰</a> <a href="#"
					class="filter-tab"
					onclick="loadCategoryData('IT보도자료'); return false;">IT보도자료</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('기술'); return false;">기술</a> <a href="#"
					class="filter-tab" onclick="loadCategoryData('커리어'); return false;">커리어</a>
				<a href="#" class="filter-tab"
					onclick="loadCategoryData('기타'); return false;">기타</a> <a href="#"
					class="filter-tab"
					onclick="loadCategoryData('IT 행사'); return false;">IT 행사</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('홍보·광고'); return false;">홍보·광고</a>
			</div>
			<button class="btn btn-white border ms-2 shadow-sm"
				style="padding: 10px 14px; border-radius: 12px; background: #fff; height: 50px;">
				<i class="bi bi-list-ul text-muted"></i>
			</button>
		</div>

		<div class="post-list-container board-list-area">
			<c:choose>
				<c:when test="${not empty boardList}">
					<c:forEach items="${boardList}" var="board">
						<div class="post-item p-3 mb-2 border-bottom bg-white"
							style="cursor: pointer;"
							onclick="location.href='${pageContext.request.contextPath}/board/get?bno=${board.bno}'">
							<div class="d-flex align-items-center gap-2 mb-1">
								<span class="text-muted"
									style="font-size: 12px; border: 1px solid #eee; padding: 2px 6px; border-radius: 4px;">커뮤니티</span>
								<span class="text-muted" style="font-size: 12px;">${board.writer}
									· <fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" />
								</span>
							</div>
							<h6 class="fw-bold mb-1" style="font-size: 15px;">
								${board.title}
								<c:if test="${board.isNew}">
									<span class="badge-n">N</span>
								</c:if>
								<c:if test="${board.replycnt > 0}">
									<span
										style="color: #0d6efd; font-size: 13px; margin-left: 3px;">(${board.replycnt})</span>
								</c:if>
							</h6>
							<p class="text-muted mb-2 text-truncate-2"
								style="font-size: 13px;">${board.content}</p>
							<div class="d-flex gap-3 text-muted" style="font-size: 12px;">
								<span><i class="bi bi-hand-thumbs-up"></i> 0</span> <span><i
									class="bi bi-chat-dots"></i> ${board.replycnt}</span> <span><i
									class="bi bi-eye"></i> 0</span>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="text-center py-5 border rounded-3 bg-light text-muted">
						등록된 게시물이 없습니다. 첫 글을 남겨보세요!</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script>
	function loadCategoryData(category) {
	    console.log("선택된 카테고리: " + category); 
	    
	    fetch('/board/main/categoryData?category=' + encodeURIComponent(category))
	        .then(res => {
	            if (!res.ok) throw new Error('서버 에러 발생!');
	            return res.json();
	        })
	        .then(data => {
	            console.log("서버에서 받은 데이터: ", data);
	            const listArea = document.querySelector(".board-list-area"); 
	            
	            if(!listArea) return;

	            let html = "";
	            
	            if(data.length === 0) {
	                html = '<div class="text-center py-5 border rounded-3 bg-light text-muted">해당 카테고리에 게시물이 없습니다.</div>';
	            } else {
	                data.forEach(board => {
	                    let date = new Date(board.regdate).toLocaleDateString();
	                    html += `
	                    <div class="post-item p-3 mb-2 border-bottom bg-white" style="cursor: pointer;" 
	                         onclick="location.href='/board/get?bno=\${board.bno}'">
	                        <div class="d-flex align-items-center gap-2 mb-1">
	                            <span class="text-muted" style="font-size: 12px; border: 1px solid #eee; padding: 2px 6px; border-radius: 4px;">\${board.cat_name || '커뮤니티'}</span>
	                            <span class="text-muted" style="font-size: 12px;">\${board.writer} · \${date}</span>
	                        </div>
	                        <h6 class="fw-bold mb-1" style="font-size: 15px;">
	                            \${board.title}
	                            \${board.isNew ? '<span class="badge-n">N</span>' : ''}
	                            <span style="color: #0d6efd; font-size: 13px; margin-left: 3px;">(\${board.replycnt || 0})</span>
	                        </h6>
	                        <p class="text-muted mb-2 text-truncate-2" style="font-size: 13px;">\${board.content || ''}</p>
	                    </div>`;
	                });

	                if (category !== '전체') {
	                    const slugMap = {
	                        "Q&A": "qna",
	                        "기술": "tech",
	                        "커리어": "career",
	                        "기타": "etc",
	                        "지식": "knowledge",
	                        "Tech 뉴스": "news",
	                        "팁": "tips",
	                        "칼럼": "columns",
	                        "리뷰": "reviws",
	                        "IT보도자료": "press",
	                        "커뮤니티": "community",
	                        "사는얘기": "life",
	                        "AI": "ai",
	                        "연봉·단가": "salary",
	                        "취준생": "jobs",
	                        "피드백": "feedback",
	                        "IT 정책토론": "policy",
	                        "이벤트": "event",
	                        "IT 행사": "events",
	                        "홍보·광고": "promotion",
	                        "모임": "group",
	                        "스터디": "studies",
	                        "프로젝트": "projects",
	                        "모각코·모각공": "gathering",
	                        "교육과정": "education",
	                        "공지사항": "notice"
	                    };
	                    
	                    const slug = slugMap[category] || encodeURIComponent(category);
	                    
	                    html += `
	                    	<div class="text-center py-3">
	                    	    <a href="/board/list?category=\${slug}" 
	                    	       onmouseover="this.style.textDecoration='underline'" 
	                    	       onmouseout="this.style.textDecoration='none'"
	                    	       style="color: #888; text-decoration: none; font-size: 14px; display: inline-block; padding: 5px 10px; transition: all 0.2s;">
	                    	        더 보기 
	                    	    </a>
	                    	</div>`;
	                }
	            }
	            listArea.innerHTML = html;
	        })
	        .catch(err => console.error("데이터 로딩 실패:", err));
	}
	
function loadData(type, element) {
    const allLinks = element.closest('.nav').querySelectorAll('.nav-link');
    allLinks.forEach(link => {
        link.classList.remove('active', 'shadow-sm');
        link.classList.add('text-muted');
        link.style.cssText = "font-weight: 500; border-radius: 10px; font-size: 14px; padding: 6px 16px; background-color: transparent !important;";
    });
    element.classList.add('active', 'shadow-sm');
    element.classList.remove('text-muted');
    element.style.cssText = "background-color: #fff !important; color: #333 !important; font-weight: 600; border-radius: 10px; font-size: 14px; padding: 6px 16px;";
    
    fetch('/main/data?type=' + type)
        .then(res => res.json())
        .then(data => {
            console.log(type + " 로드 데이터:", data); 
            
            const container = document.getElementById('popular-list-area');
            if (!container) return;

            if (!data || data.length === 0) {
                container.innerHTML = '<div class="col-12 text-center py-5 text-muted">등록된 게시물이 없습니다.</div>';
                return;
            }

            let leftHtml = '<div class="col-md-6"><div class="list-group list-group-flush border-top">';
            let rightHtml = '<div class="col-md-6"><div class="list-group list-group-flush border-top">';
            
            data.forEach((board, index) => {
                const bno = board.bno || 0;
                const title = board.title || '제목 없음';
                
                const now = new Date().getTime();
                const regDate = board.regdate;
                const isNewArticle = board.isNew === true || (now - regDate < (1000 * 60 * 60 * 24));
                
                const nBadge = isNewArticle ? '<span class="badge-n" style="color: #ff5e11; font-weight: bold; font-size: 0.75rem; margin-left: 3px;">N</span>' : '';

                const itemHtml = `
                    <div class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">
                        <div class="text-truncate" style="max-width: 75%;">
                            <a href="/board/get?bno=\${bno}" class="text-decoration-none text-dark fw-bold" style="font-size: 0.85rem;">
                                \${title}
                            </a>
                            \${nBadge} 
                            <span class="text-primary small ms-1">(\${board.replycnt || 0})</span>
                        </div>
                        <span class="badge bg-light text-secondary border fw-normal" style="font-size: 0.7rem;">\${board.cat_name || '기술'}</span>
                    </div>`;
                
                if (index < data.length / 2) {
                    leftHtml += itemHtml;
                } else {
                    rightHtml += itemHtml;
                }
            });

            leftHtml += '</div></div>';
            rightHtml += '</div></div>';

            container.innerHTML = leftHtml + rightHtml;
        })
        .catch(err => console.error("데이터 로드 실패:", err));
}

document.addEventListener("DOMContentLoaded", function() {
    const tabs = document.querySelectorAll('.filter-tab');
    tabs.forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();            
            tabs.forEach(t => t.classList.remove('active'));           
            this.classList.add('active');            
            this.scrollIntoView({ behavior: 'smooth', inline: 'center', block: 'nearest' });
        });
    });
});
</script>