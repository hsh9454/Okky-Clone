<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

<style>
body {
	background-color: #ffffff !important;
	margin: 0;
	padding: 0;
	font-family: -apple-system, sans-serif;
}

div[class*="ad-column"], div[class*="AD-COLUMN"], div[class*="right-ad"],
	div[class*="left-ad"], aside, .right-ad-section, .left-ad-section,
	#right-sidebar {
	display: none !important;
	width: 0 !important;
	height: 0 !important;
	margin: 0 !important;
	padding: 0 !important;
	opacity: 0 !important;
	pointer-events: none !important;
}

.mypage-wrapper #right-sidebar, .mypage-wrapper .right-ad-section,
	.mypage-wrapper aside, .mypage-wrapper .ad-column, .mypage-wrapper [class*="AD"],
	.mypage-wrapper [class*="ad-"], .left-ad-column, .right-ad-column {
	display: none !important;
	visibility: hidden !important;
	width: 0 !important;
	height: 0 !important;
	margin: 0 !important;
	padding: 0 !important;
	position: absolute !important;
}

.mypage-wrapper.okky-full-container {
	display: flex;
	width: 100% !important;
	justify-content: flex-start !important;
	padding-left: 20px;
}

.okky-sidebar {
	width: 280px;
	background-color: #f9fafb;
	s padding-top: 30px;
	flex-shrink: 0;
}

.mypage-wrapper .okky-main-content {
	flex: 1;
	max-width: 1200px;
	margin: 0 40px !important;
}

.main-title {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 40px;
	color: #111827;
}

.form-container-flex {
	display: flex;
	position: relative;
	width: 100%;
	align-items: flex-start;
}

.form-fields {
	flex: 1;
	max-width: 600px;
	margin-right: 180px;
}

.profile-img-wrapper {
	position: relative;
	float: right;
	margin-top: 20px;
	z-index: 10;
}

.name-input-group {
	clear: both;
	width: 70%;
}

.profile-box {
	position: absolute;
	right: 0;
	top: 0;
	text-align: center;
}

.profile-img-circle {
	width: 130px;
	height: 130px;
	border-radius: 50%;
	background-color: #f3f4f6;
	border: 1px solid #e5e7eb;
	overflow: hidden;
	cursor: pointer;
	transition: 0.2s;
}

.profile-img-circle:hover {
	filter: brightness(0.95);
}

.side-section-title {
	font-size: 12px;
	font-weight: 700;
	color: #9ca3af;
	margin: 25px 0 10px 30px;
	text-transform: uppercase;
}

.side-nav-item {
	display: flex;
	align-items: center;
	padding: 12px 30px;
	font-size: 14px;
	color: #4b5563;
	text-decoration: none;
	border-right: 3px solid transparent;
}

.side-nav-item.active {
	background-color: #f3f4f6;
	color: #111827;
	font-weight: 700;
	border-right: 3px solid #111827;
}

.side-nav-item i {
	margin-right: 15px;
	font-size: 18px;
}

.form-group {
	margin-bottom: 30px;
}

.okky-label {
	display: block;
	font-size: 14px;
	font-weight: 700;
	color: #374151;
	margin-bottom: 10px;
}

.okky-input {
	width: 100%;
	padding: 12px 16px;
	border: 1px solid #d1d5db;
	border-radius: 8px;
	font-size: 15px;
	box-sizing: border-box;
}

.help-text {
	font-size: 13px;
	color: #6b7280;
	margin-bottom: 10px;
}

.link-group {
	position: relative;
	margin-bottom: 12px;
}

.link-group i {
	position: absolute;
	left: 14px;
	top: 14px;
	color: #9ca3af;
}

.link-input {
	width: 100%;
	padding: 12px 12px 12px 42px;
	border: 1px solid #d1d5db;
	border-radius: 8px;
	font-size: 14px;
	background: #f9fafb;
	box-sizing: border-box;
}

.profile-upload-popup {
	display: none;
	position: absolute;
	top: 140px;
	right: 0;
	width: 160px;
	background: white;
	border: 1px solid #d1d5db;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	z-index: 100;
	padding: 10px;
}

.profile-upload-popup.active {
	display: block;
}

.gravatar-info {
	display: flex;
	align-items: center;
	gap: 8px;
	padding: 8px;
	border-bottom: 1px solid #f3f4f6;
	font-size: 13px;
	font-weight: 600;
}

.upload-blue-btn {
	background-color: #00b0ff;
	color: white;
	border: none;
	border-radius: 6px;
	width: 100%;
	padding: 10px 5px;
	margin-top: 8px;
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
}

.consent-box {
	border-top: 1px solid #e5e7eb;
	margin-top: 40px;
	padding-top: 30px;
}

.toggle-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 25px;
}

.toggle-info h4 {
	font-size: 16px;
	font-weight: 700;
	margin: 0 0 5px 0;
}

.toggle-info p {
	font-size: 13px;
	color: #6b7280;
	margin: 0;
	line-height: 1.5;
}

.switch {
	position: relative;
	width: 44px;
	height: 24px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	transition: .4s;
	border-radius: 34px;
}

.slider:before {
	position: absolute;
	content: "";
	height: 18px;
	width: 18px;
	left: 3px;
	bottom: 3px;
	background-color: white;
	transition: .4s;
	border-radius: 50%;
}

input:checked+.slider {
	background-color: #00b0ff;
}

input:checked+.slider:before {
	transform: translateX(20px);
}

.btn-submit {
	background-color: #1f2937;
	color: #fff;
	padding: 12px 35px;
	border-radius: 8px;
	font-weight: 700;
	border: none;
	float: right;
	cursor: pointer;
}

.tag-input-wrapper {
	display: flex;
	flex-wrap: wrap;
	gap: 8px;
	padding: 8px 12px;
	border: 1px solid #d1d5db;
	border-radius: 8px;
	background: #fff;
	min-height: 48px;
	align-items: center;
}

.tag-item {
	display: inline-flex;
	align-items: center;
	background: #e3f2fd;
	color: #0d6efd;
	padding: 4px 10px;
	border-radius: 4px;
	font-size: 14px;
	font-weight: 600;
}

.tag-item .tag-close {
	margin-left: 6px;
	cursor: pointer;
	font-size: 12px;
}

.tag-hidden-input {
	border: none;
	outline: none;
	flex: 1;
	min-width: 100px;
	font-size: 14px;
}
</style>

<div class="okky-full-container mypage-wrapper">
	<div class="okky-sidebar">
		<p class="side-section-title">내 계정</p>
		<a href="#" class="side-nav-item active"><i class="bi bi-person"></i> 프로필</a> <a href="#" class="side-nav-item"><i class="bi bi-gear"></i> 계정 관리</a>
		<p class="side-section-title">Jobs</p>
		<a href="#" class="side-nav-item"><i class="bi bi-file-earmark-person"></i> 이력서 관리</a> <a href="#" class="side-nav-item"><i class="bi bi-briefcase"></i> 구직 내역 관리</a> <a href="#"
			class="side-nav-item"><i class="bi bi-bookmark-star"></i> 관심 포지션</a> <a href="#" class="side-nav-item"><i class="bi bi-send-check"></i> 포지션 지원 이력</a>
	</div>

	<div class="okky-main-content">
		<h1 class="main-title">회원정보</h1>

		<form action="${pageContext.request.contextPath}/member/modify" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" name="userId" value="${loginMember.userId}" />

			<div class="form-container-flex">
				<div class="form-fields">
					<div class="form-group">
						<label class="okky-label">이름</label> <input type="text" name="userName" class="okky-input" value="${loginMember.userName}" placeholder="이름을 입력하세요">
					</div>

					<div class="form-group">
						<label class="okky-label">닉네임</label> <input type="text" name="nickname" class="okky-input" value="${loginMember.nickname}" placeholder="닉네임을 입력하세요">
					</div>

					<div class="form-group">
						<label class="okky-label">대표 직무</label> <select name="job" class="okky-input">
							<option value="">직무를 선택해 주세요.</option>
							<option value="백엔드" ${loginMember.job == '백엔드' ? 'selected' : ''}>백엔드 개발자</option>
							<option value="프론트엔드" ${loginMember.job == '프론트엔드' ? 'selected' : ''}>프론트엔드 개발자</option>
						</select>
					</div>

					<div class="form-group">
						<label class="okky-label">관심 있는 기술 태그 입력</label>
						<p class="help-text">사용 중인 기술이나 관심있는 기술 태그를 선택해주세요.</p>
						<input type="hidden" name="techTags" id="techTagsHidden" value="${loginMember.techTags}">
						<div class="tag-input-wrapper" id="tagContainer">
							<input type="text" class="tag-hidden-input" id="tagInput" placeholder="기술 태그를 입력하고 엔터를 누르세요">
						</div>
					</div>

					<div class="form-group">
						<label class="okky-label">한 줄 소개 <span id="bioCount" style="float: right; font-weight: 400;">0/150</span></label>
						<textarea name="bio" id="bioTextarea" class="okky-input" rows="4" maxlength="150" placeholder="나를 소개해 주세요.">${loginMember.bio}</textarea>
					</div>

					<div class="form-group">
						<label class="okky-label">링크</label>
						<div class="link-group">
							<i class="bi bi-link-45deg"></i> <input type="text" name="link1" class="link-input" placeholder="Link to social profile" value="${loginMember.link1}">
						</div>
						<div class="link-group">
							<i class="bi bi-link-45deg"></i> <input type="text" name="link2" class="link-input" placeholder="Link to social profile" value="${loginMember.link2}">
						</div>
						<div class="link-group">
							<i class="bi bi-link-45deg"></i> <input type="text" name="link3" class="link-input" placeholder="Link to social profile" value="${loginMember.link3}">
						</div>
					</div>
				</div>

				<div class="profile-box">
					<div class="profile-img-circle" onclick="toggleProfilePopup(event)">
						<c:choose>

							<c:when test="${not empty loginMember.userImg}">
								<img src="${pageContext.request.contextPath}/member/display?fileName=${loginMember.userImg}" id="profilePreview" style="width: 100%; height: 100%; object-fit: cover;">
							</c:when>


							<c:otherwise>
								<img src="${pageContext.request.contextPath}/resources/img/default_profile.jpg" id="profilePreview" style="width: 100%; height: 100%; object-fit: cover;">
							</c:otherwise>
						</c:choose>
					</div>

					<div class="profile-upload-popup" id="profilePopup">
						<div class="gravatar-info">
							<img src="https://www.gravatar.com/avatar?d=mp" style="width: 24px; border-radius: 4px;"> Gravatar
						</div>
						<button type="button" class="upload-blue-btn" onclick="document.getElementById('fileInput').click();">
							이미지 업로드 <span>권장 사이즈 150px<br>최대 250KB
							</span>
						</button>
					</div>
					<input type="file" id="fileInput" name="uploadFile" accept="image/*" style="display: none;">
				</div>
			</div>

			<div class="consent-box">
				<div class="toggle-row">
					<div class="toggle-info">
						<h4>광고 정보 수신 동의</h4>
						<p>OKKY에서 발행하는 뉴스레터 및 이벤트/프로모션 혜택 정보를 이메일로 보내드립니다.</p>
					</div>
					<label class="switch"> <input type="checkbox" name="adAgree" value="Y" ${loginMember.adAgree == 'Y' ? 'checked' : ''}> <span class="slider"></span></label>
				</div>

				<div class="toggle-row">
					<div class="toggle-info">
						<h4>푸시 알림 동의</h4>
						<p>OKKY 콘텐츠, 커뮤니티 리액션, 유저 활동 내역 등을 푸시 알림으로 보내드립니다.</p>
					</div>
					<label class="switch"> <input type="checkbox" name="pushAgree" ${loginMember.pushAgree == 'Y' ? 'checked' : ''}> <span class="slider"></span></label>
				</div>
				<button type="submit" class="btn-submit">저장</button>
			</div>
		</form>
	</div>
</div>

<script>
const bioTextarea = document.getElementById('bioTextarea');
const bioCount = document.getElementById('bioCount');

function updateBioCount() {
    const length = bioTextarea.value.length;
    bioCount.innerText = length + '/150';
    if (length >= 140) {
        bioCount.style.color = '#ef4444'; 
    } else {
        bioCount.style.color = '#6b7280'; 
    }
}
bioTextarea.addEventListener('input', updateBioCount);
window.addEventListener('load', updateBioCount);

const tagInput = document.getElementById('tagInput');
const tagContainer = document.getElementById('tagContainer');
const techTagsHidden = document.getElementById('techTagsHidden');
let tags = techTagsHidden.value ? techTagsHidden.value.split(',').filter(t => t !== "") : [];

function renderTags() {
    document.querySelectorAll('.tag-item').forEach(el => el.remove());   
    tags.forEach((tag, index) => {
        const span = document.createElement('span');
        span.className = 'tag-item';
        span.innerHTML = tag + ' <i class="bi bi-x tag-close" onclick="removeTag(' + index + ')"></i>';
        tagContainer.insertBefore(span, tagInput);
    });
    const tagValue = tags.join(',');
    document.getElementById('techTagsHidden').value = tagValue; 
    
    console.log("현재 담긴 태그 데이터:", tagValue);
}

tagInput.addEventListener('keydown', function(e) {
    if (e.key === 'Enter') {
        e.preventDefault(); 
        const value = tagInput.value.trim();
        if (value && !tags.includes(value)) {
            tags.push(value);
            renderTags();
            tagInput.value = ''; 
        }
    }
});

window.removeTag = function(index) {
    tags.splice(index, 1);
    renderTags();
};

renderTags();

	function toggleProfilePopup(event) {
		event.stopPropagation();
		document.getElementById('profilePopup').classList.toggle('active');
	}

	window.onclick = function(event) {
		const popup = document.getElementById('profilePopup');
		if (!event.target.matches('.profile-img-circle')
				&& !event.target.closest('.profile-upload-popup')) {
			popup.classList.remove('active');
		}
	}

	document
			.getElementById('fileInput')
			.addEventListener(
					'change',
					function(e) {
						const file = e.target.files[0];
						if (file) {
							const reader = new FileReader();
							reader.onload = function(e) {
								const preview = document
										.getElementById('profilePreview');
								preview.src = e.target.result;
								preview.style.display = 'block';
								if (document.getElementById('defaultIcon'))
									document.getElementById('defaultIcon').style.display = 'none';
								document.getElementById('profilePopup').classList
										.remove('active');
							}
							reader.readAsDataURL(file);
						}
					});
</script>