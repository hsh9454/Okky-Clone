<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.left-ad, .right-ad, aside, .ad-section {
	display: none !important;
	width: 0 !important;
}

.center-content>.content-card {
	padding: 0 !important;
	border: none !important;
	background: transparent !important;
	box-shadow: none !important;
}

.activity-inner-content {
	max-width: 1000px;
	margin: 0 auto;
	background: transparent;
}

.profile-section {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 0 40px 0;
}

.profile-img {
	width: 140px;
	height: 140px;
	border-radius: 50%;
	object-fit: cover;
	border: 1px solid #dee2e6;
	background: #fff;
}

.custom-tabs {
	border-bottom: 1px solid #dee2e6;
	display: flex;
	gap: 25px;
	margin-bottom: 0;
}

.custom-tabs a {
	text-decoration: none;
	color: #6c757d;
	font-weight: 700;
	padding-bottom: 12px;
	font-size: 1.05rem;
	cursor: pointer;
	border-bottom: 2px solid transparent;
}

.custom-tabs a.active {
	color: #0d6efd;
	border-bottom: 2px solid #0d6efd;
}

.activity-item {
	padding: 20px;
	border-bottom: 1px solid #f1f3f5;
	transition: background 0.2s;
	text-decoration: none;
	display: block;
	color: inherit;
}

.activity-item:hover {
	background: #f8f9fa;
}

.activity-item:last-child {
	border-bottom: none;
}

.item-meta {
	display: inline-block;
	padding: 2px 8px;
	border-radius: 4px;
	background-color: #e9ecef;
	color: #495057;
	font-size: 0.75rem;
	font-weight: 600;
	margin-bottom: 8px;
}

.item-title {
	font-size: 1.1rem;
	font-weight: 600;
	color: #343a40;
	margin-bottom: 8px;
}

.item-info {
	display: flex;
	gap: 15px;
	font-size: 0.85rem;
	color: #6c757d;
}

.month-labels {
	display: flex;
	font-size: 11px;
	color: #888;
	margin-left: 30px;
	margin-bottom: 5px;
	height: 15px;
}

.month-label {
	flex: 1;
	text-align: left;
}

.graph-wrapper {
	display: flex;
	align-items: flex-start;
}

.day-labels {
	display: grid;
	grid-template-rows: repeat(7, 12px);
	gap: 3px;
	margin-right: 10px;
	font-size: 10px;
	color: #ccc;
}

.day-label {
	height: 12px;
	line-height: 12px;
}

.contribution-box {
	display: grid;
	grid-template-rows: repeat(7, 12px);
	grid-auto-flow: column;
	grid-auto-columns: 12px;
	gap: 3px;
	overflow-x: auto;
}

.grid-cell {
	width: 12px;
	height: 12px;
	background: #ebedf0;
	border-radius: 2px;
}

.grid-cell.level-1 {
	background: #9be9a8;
}

.grid-cell.level-2 {
	background: #40c463;
}

.grid-cell.level-3 {
	background: #30a14e;
}

.grid-cell.level-4 {
	background: #216e39;
}
</style>

<div class="activity-inner-content">
	<div class="profile-section">
		<div class="user-info">
			<h1 class="fw-bolder mb-2" style="font-size: 2.5rem; color: #212529;">
				<c:choose>
					<c:when test="${not empty sessionScope.loginMember.nickname}">${sessionScope.loginMember.nickname}</c:when>
					<c:when test="${not empty sessionScope.member.nickname}">${sessionScope.member.nickname}</c:when>
					<c:when test="${not empty loginMember.nickname}">${loginMember.nickname}</c:when>
					<c:otherwise>잔심남</c:otherwise>
				</c:choose>
			</h1>
			<p class="text-muted fs-5">
				<c:out value="${sessionScope.loginMember.bio}" default="안녕하세요! 반갑습니다." />
			</p>
		</div>

		<div class="user-image" style="position: relative;">
			<div class="profile-img-container"
				style="width: 140px; height: 140px; border-radius: 50%; overflow: hidden; border: 1px solid #dee2e6; background: #f8f9fa; display: flex; align-items: center; justify-content: center;">
				<c:set var="myImg" value="${sessionScope.loginMember.userImg}" />

				<c:choose>
					<c:when test="${not empty myImg}">
						<img src="${pageContext.request.contextPath}/member/display?fileName=${myImg}&t=<%=System.currentTimeMillis()%>" class="profile-img" style="width: 100%; height: 100%; object-fit: cover;"
							onerror="this.src='https://cdn-icons-png.flaticon.com/512/149/149071.png';">
					</c:when>
					<c:otherwise>
						<i class="bi bi-person-circle text-secondary" style="font-size: 140px;"></i>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="card border shadow-sm mb-5" style="border-radius: 12px;">
		<div class="card-body p-4">
			<div class="d-flex justify-content-between align-items-center mb-3 px-2">
				<h6 class="fw-bold m-0">활동 기록 (최근 1년)</h6>
				<small class="text-muted">총 활동 ${not empty totalActivityCount ? totalActivityCount : 0}회</small>
			</div>

			<div class="bg-white p-3 rounded border shadow-inner">
				<div class="month-labels" id="monthLabels"></div>
				<div class="graph-wrapper">
					<div class="day-labels">
						<div class="day-label"></div>
						<div class="day-label">월</div>
						<div class="day-label"></div>
						<div class="day-label">수</div>
						<div class="day-label"></div>
						<div class="day-label">금</div>
						<div class="day-label"></div>
					</div>
					<div class="contribution-box" id="contributionGrid"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="custom-tabs mt-4" id="activityTabs">
		<a class="tab-link active" data-type="post">게시물</a> 
		<a class="tab-link" data-type="qna">Q&A</a> 
		<a class="tab-link" data-type="reply">최근활동</a> 
		<a class="tab-link" data-type="scrap">스크랩</a>
	</div>

	<div class="card border shadow-sm mt-0" style="border-radius: 0 0 12px 12px; border-top: none !important;">
		<div id="list-content">
			<div class="text-center py-5">
				<div class="spinner-border text-primary" role="status"></div>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
    function renderContribution() {
        const activityData = ${not empty activityJsonData ? activityJsonData : '{}'};

        const $grid = $('#contributionGrid');
        const $months = $('#monthLabels');
        const today = new Date();
        const start = new Date();
        
        start.setFullYear(today.getFullYear() - 1);
        start.setDate(start.getDate() - start.getDay());

        let html = '';
        let monthHtml = '';
        let lastMonth = -1;

        for (let d = new Date(start); d <= today; d.setDate(d.getDate() + 1)) {
            const year = d.getFullYear();
            const month = ('0' + (d.getMonth() + 1)).slice(-2);
            const day = ('0' + d.getDate()).slice(-2);
            const dateStr = year + '-' + month + '-' + day;                
            const count = activityData[dateStr] || 0;
            
            if (d.getDay() === 0) {
                const currentMonth = d.getMonth();
                if (currentMonth !== lastMonth) {
                    monthHtml += `<div class="month-label">` + (currentMonth + 1) + `월</div>`;
                    lastMonth = currentMonth;
                }
            }

            let level = '';
            if (count > 0) {
                if (count <= 2) level = 'level-1';
                else if (count <= 5) level = 'level-2';
                else if (count <= 10) level = 'level-3';
                else level = 'level-4';
            }
            html += `<div class="grid-cell ` + level + `" title="` + dateStr + `: ` + count + `회"></div>`;
        }
        $grid.html(html);
        $months.html(monthHtml);
    }
    
    renderContribution();

    $('.tab-link').click(function(e) {
        e.preventDefault();
        
        $('.tab-link').removeClass('active');
        $(this).addClass('active');
        
        const type = $(this).data('type');
        loadActivity(type);
    });

    function loadActivity(type) {
        $('#list-content').html('<div class="text-center py-5"><div class="spinner-border text-primary"></div></div>');

        $.ajax({
            url: '${pageContext.request.contextPath}/member/getActivityList',
            type: 'GET',
            data: { type: type },
            success: function(data) {
                let html = '';
                
                if (data && data.length > 0) {
                    data.forEach(item => {
                        if (!item) return; 

                        let bno = item.bno || item.BNO || item.activityNo;
                        
                        if (bno === undefined || bno === null || bno === 0) {
                            return; 
                        }

                        let rawDate = item.activityDate || item.regdate || item.REGDATE;
                        if (!rawDate) return; 

                        let date = new Date(rawDate);
                        let dateStr = date.getFullYear() + '.' + 
                                     ('0' + (date.getMonth() + 1)).slice(-2) + '.' + 
                                     ('0' + date.getDate()).slice(-2);

                        let category = item.categoryName || item.CATEGORYNAME || '활동';
                        let title = item.title || item.TITLE || '제목 없음';
                        let viewCnt = item.viewCnt || item.VIEWCNT || 0;
                        let replyCnt = item.replyCnt || item.REPLYCNT || 0;

                        html += `
                            <a href="${pageContext.request.contextPath}/board/get?bno=` + bno + `" class="activity-item">
                                <div class="item-meta">` + category + `</div>
                                <div class="item-title">` + title + `</div>
                                <div class="item-info">
                                    <span><i class="bi bi-eye"></i> ` + viewCnt + `</span>
                                    <span><i class="bi bi-chat-dots"></i> ` + replyCnt + `</span>
                                    <span>` + dateStr + `</span>
                                </div>
                            </a>`;
                    });
                }
                
                if (html === '') {
                    html = '<div class="text-center py-5"><p class="text-muted">활동 내역이 없습니다.</p></div>';
                }
                $('#list-content').html(html);
            },
            error: function(err) {
                $('#list-content').html('<div class="text-center py-5 text-danger">데이터를 불러오는 중 오류가 발생했습니다.</div>');
            }
        });
    }
    loadActivity('post');
});
</script>