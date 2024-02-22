<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <style>

		.footer {
			background-color: #3c3c3c;
		}
		
		.footer_main {
			display: flex;
			color:#898989; 
			font-family: 'Noto Sans KR', sans-serif;
			font-size:12px;
			justify-content: space-between;
		}
		
		.copyright a{
			text-decoration: none; /* 밑줄 제거 */ 
			color:#898989; 
		}
		
		.isms {
			font-family: 'Noto Sans KR', sans-serif;
			font-size:12px;
			color:#898989; 
			display: flex;
			text-align:left;
			justify-content: space-between;
		}
		.copyright {
			text-align:left;
		}
		
		.foot_menu {
			display: flex;
			justify-content: space-between;
		}
		
		.list {
			text-align: left;
		}
		
		.list a{
			color: inherit; /* 부모 요소의 색을 상속받음 */
		  	text-decoration: none; /* 밑줄 제거 */ 
		}
		
		.list ul {
			text-align: left;
			list-style-type: none; /* 목록 마커 제거 */
			margin-right: 50px; /* 각 항목 사이의 간격 설정 */
		}
		
		section {
			background-color:white;
		}

    </style>
    
			<div class="footer">
				<br><br>
				<div class="footer_main">
					<div></div>
					<div class="foot_menu">
						<div class="list">
							<ul> <strong style="color:white;">NEED HELP</strong>
								<li>&nbsp;</li>
								<li><a href="/support/callCenter.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="고객센터">고객센터</a></li>
								<li><a href="/support/searchFaqList.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="FAQs">FAQs</a></li>
								<li><a href="/support/searchNoticeList.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="공지사항">공지사항</a></li>
								<li><a href="/my/qna/searchQuestionList.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="1:1문의">1:1 문의</a></li>
								<li><a href="/support/searchShopList.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="매장찾기">매장 찾기</a></li>
								<li><a href="/support/appDownload.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="App다운로드">App 다운로드</a></li>
							</ul>
						</div>
						<div class="list">
							<ul> <strong style="color:white;">INFORMATION</strong>
								<li>&nbsp;</li>
								<li><a href="/support/mileage.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="통합 마일리지 안내">통합 마일리지 안내</a></li>
								<li><a href="/support/teamwearOrder.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="팀/단체복 주문안내">팀/단체복 주문안내</a></li>
								<li><a href="/support/dlvy.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="배송 및 반품 안내">배송 및 반품 안내</a></li>
								<li><a href="/support/wash.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="세탁 및 손질 방법 안내">세탁 및 손질 방법 안내</a></li>
								<li><a href="/support/terms.action?tabCode=AT" data-gtag-idx="fo_common_footer_2" data-gtag-label="이용약관">이용약관</a></li>
								<li><a href="/common/SiteMap.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="SITE MAP">SITE MAP</a></li> 
							</ul>
						</div>
						<div class="list">
							
							<ul> <strong style="color:white;">INSIDE NB</strong>
								<li>&nbsp;</li>
								<li><a href="/support/insideNB.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="INSIDE NB">INSIDE NB</a></li>
								<li><a href="/collection/madeusauk.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="MADE IN USA/UK">MADE IN USA ⁄ UK</a></li>
								<li><a href="/collection/nbx.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="NBx GUIDE">NBx GUIDE</a></li>
							</ul>
						</div>
					</div>
					<div class="foot_info">
						<!-- 20200709 수정 :: S -->
						<!-- <div class="sns">
			          		<a href="https://www.instagram.com/newbalance/" target="_blank" class="in"><span class="blind">INSTAGRAM</span></a>
			          		<a href="https://www.instagram.com/nbrc_seoul/" target="_blank" class="nbrc"><span class="blind">NBRC</span></a>
							<a href="https://www.facebook.com/nbkorea.LS" target="_blank" class="fb"><span class="blind">FACEBOOK</span></a>
							<a href="https://www.youtube.com/user/nbkorea" target="_blank" class="yt"><span class="blind">YOUTUBE</span></a>						
							<a href="https://blog.naver.com/nb_lifestyle" target="_blank" class="nb_l">NB LIFE STYLE</a>
							<a href="https://blog.naver.com/nbkids" target="_blank" class="nb_k">NB KIDS</a>
						</div> -->
			          	<!-- 20200709 수정 :: E -->
						<div class="copyright">
							<p>
								<a  style="color:white; font-size:14px;" href="/support/terms.action?tabCode=PP" class="c_link" data-gtag-idx="fo_common_footer_2" data-gtag-label="개인정보 처리방침"><span>개인정보 처리방침</span></a> / <a href="/support/terms.action?tabCode=AT" class="c_link" data-gtag-idx="fo_common_footer_2" data-gtag-label="이용약관">이용약관</a> / ㈜이랜드월드패션사업부 / 서울특별시 금천구 가산디지털1로 159 이랜드월드
								<br>
								온라인 고객센터 : 1566-0086, AS/오프라인 고객센터 : 080-999-0456
								<br>
								대표 이메일 : <a href="mailto:webmaster@nbkorea.com" data-gtag-idx="fo_common_footer_2" data-gtag-label="대표이메일">webmaster@nbkorea.com</a>
								<br>
								호스팅 서비스 제공자 : (주)라드씨엔에스 <!--20210311 추가-->
							</p>
							<p>
								<span>대표이사 : 최운식</span> <span>사업자등록번호 : 113-85-19030</span> <span>통신판매업신고 : 금천구청 제 2005-01053 </span>
								<br><span>개인정보보호책임자 : 최운식&nbsp;&nbsp;</span><a style="color:white; font-size:14px; text-decoration: underline;"  href="#" class="btn_line" onclick="window.open('https://www.ftc.go.kr/bizCommPop.do?wrkr_no=1138519030', 'bizCommPop', 'scrollbars=yes,width=750, height=700;'); return false;">사업자정보조회</a>
								<br>온라인디지털콘텐츠산업발전법에 의한 <a  style="color:white; font-size:14px; text-decoration: underline;" href="javascript:;" onclick="fnLayerPopOpenForContentsPolicy()" class="btn_line">콘텐츠보호안내 자세히보기</a>
							</p>
						</div>
						<div class="isms">
							<div class="isms">
								<div>
									<p class="isms_img">
										<a href="https://isms.kisa.or.kr/main/ispims/intro/" target="_blank">
											<img src="https://image.nbkorea.com/NBRB_PC/common/ISMS-P.png" alt="isms-p">
										</a>
									</p>
								</div>
								<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
								<div>
									<span style="display: block;">[인증범위] 이랜드월드 온라인 서비스 운영</span>
									<span style="display: block;">[유효기간] 2023.05.03~2026.05.02</span>
									<p class="copy">Copyright 2018. New Balance</p>
								</div>
							</div>
							<div></div>
						</div>
					</div>
					<div></div>
				</div>
				<br><br><br>
			</div>

