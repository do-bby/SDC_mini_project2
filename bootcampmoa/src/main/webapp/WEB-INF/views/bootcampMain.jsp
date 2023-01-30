<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.ReviewVO,vo.MemberVO,vo.BootcampVO,java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트모아 메인 페이지</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/style.css?after" rel="stylesheet">
    
    <!-- 한글 폰트 -->
    <style type="text/css">
	
	</style> 
    
<body>
	 <!-- Topbar Start -->
    <div class="container-fluid d-none d-lg-block">
        <div class="row align-items-center py-4 px-xl-5">
            <div class="col-lg-3">
                <a href="/bootcampmoa/bootmoaMain" class="text-decoration-none">
                    <h1 class="m-0"><span class="text-primary">B</span>ootMoA</h1>
                </a>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-map-marker-alt text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Our Office</h6>
                        <small>서울특별시 서초구 효령로 335</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-envelope text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Email Us</h6>
                        <small>bootmoa@gmail.com</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-phone text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Call Us</h6>
                        <small>+012 345 6789</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="d-flex align-items-center justify-content-between bg-secondary w-100 text-decoration-none" data-toggle="collapse" href="#navbar-vertical" style="height: 67px; padding: 0 30px;">
                    <h5 class="text-primary m-0"><i class="fa fa-book-open mr-2"></i>BootMoA</h5>
                    <i class="fa fa-angle-down text-primary"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 9;">
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">백엔드 <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <a href="" class="dropdown-item">HTML</a>
                                <a href="" class="dropdown-item">CSS</a>
                                <a href="" class="dropdown-item">jQuery</a>
                            </div>
                        </div>
                        <a href="" class="nav-item nav-link">프론트엔드</a>
                        <a href="" class="nav-item nav-link">AI</a>
                        <a href="" class="nav-item nav-link">클라우드</a>
                        <a href="" class="nav-item nav-link">빅데이터</a> 
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0"><span class="text-primary">B</span>ootMoA</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav py-0">
                            <a href="/bootcampmoa/bootmoaMain" class="nav-item nav-link active">홈</a>
                            <a href="/bootcampmoa/bootcampListAll" class="nav-item nav-link">부트캠프 리스트 </a>
                            <a href="/bootcampmoa/bootcampSearch" class="nav-item nav-link">부트캠프 검색</a>
                            <a href="/bootcampmoa/bootcampInsertRequest" class="nav-item nav-link">등록요청</a>
                            <c:choose>
                            	<c:when test="${sessionScope.svo != null}">
                            		<div class="nav-item dropdown">
                                		<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">마이페이지</a>
                                		<div class="dropdown-menu rounded-0 m-0">
                                    		<a href="viewMemberInfo" class="dropdown-item">회원정보 수정</a>
                                    		<c:choose>
                                    			<c:when test="${sessionScope.svo.mlevel == 1 }">
                                    				<a href="/bootcampmoa/bootcampInsertResponse" class="dropdown-item">등록 요청 승인 관리</a>
                                    				<a href="/bootcampmoa/bootcampManagement" class="dropdown-item"> 설정 </a>
                                    				
                                    			</c:when> 
                                    		</c:choose> 
                                		</div>
                            		</div>
                            	</c:when>
                            </c:choose>
                        </div>
                        <c:choose>
                        	<c:when test="${sessionScope.svo == null }">
                    			<a class="btn btn-primary py-2 px-4 ml-auto d-none d-lg-block" id="loginButton" href="/bootcampmoa/memberLogin" style="margin-right:20px;">로그인</a>	
                        	</c:when>
                        </c:choose>
                        <c:choose>
                        	<c:when test="${sessionScope.svo != null }">
                        		<a class="btn btn-primary py-2 px-4 ml-auto d-none d-lg-block" id="logoutButton" style="margin-right:20px;" onClick="logout()">로그아웃</a>
                        	</c:when>
                        </c:choose>
                    	<a href="/bootcampmoa/memberSignup" style="border-style:solid; padding:5px;">회원가입</a>
                    	
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Carousel Start -->
    <div class="container-fluid p-0 pb-5 mb-5">
        <div id="header-carousel" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                <li data-target="#header-carousel" data-slide-to="1"></li>
                <li data-target="#header-carousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active" style="min-height: 300px;">
                    <img class="position-relative w-100" src="resources/img/carousel-1.jpg" style="min-height: 300px; object-fit: cover;">
                    <div class="carousel-caption d-flex align-items-center justify-content-center">
                        <div class="p-5" style="width: 100%; max-width: 900px;">
                            <h5 class="text-white text-uppercase mb-md-3">나한테 딱 맞는 부트캠프 찾는 지름길</h5>
                            <h1 class="display-3 text-white mb-md-4">부트캠프 후기 한 눈에 <br>모아보자</h1>
                            <a href="/bootcampmoa/bootcampListAll" class="btn btn-primary py-md-2 px-md-4 font-weight-semi-bold mt-2">전체 수강평 보러가기</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item" style="min-height: 300px;">
                    <img class="position-relative w-100" src="resources/img/carousel-2.jpg" style="min-height: 300px; object-fit: cover;">
                    <div class="carousel-caption d-flex align-items-center justify-content-center">
                        <div class="p-5" style="width: 100%; max-width: 900px;">
                            <h5 class="text-white text-uppercase mb-md-3">나한테 딱 맞는 부트캠프 찾는 지름길</h5>
                            <h1 class="display-3 text-white mb-md-4">찾으시는 부트캠프 <br>수강평 있으신가요?</h1>
                            <a href="/bootcampmoa/bootcampSearch" class="btn btn-primary py-md-2 px-md-4 font-weight-semi-bold mt-2">수강평 검색하러 가기</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item" style="min-height: 300px;">
                    <img class="position-relative w-100" src="resources/img/carousel-3.jpg" style="min-height: 300px; object-fit: cover;">
                    <div class="carousel-caption d-flex align-items-center justify-content-center">
                        <div class="p-5" style="width: 100%; max-width: 900px;">
                            <h5 class="text-white text-uppercase mb-md-3">나한테 딱 맞는 부트캠프 찾는 지름길</h5>
                            <h1 class="display-3 text-white mb-md-4">이 부트캠프도  <br>등록해주세요!</h1>
                            <a href="/bootcampmoa/bootcampInsertRequest" class="btn btn-primary py-md-2 px-md-4 font-weight-semi-bold mt-2">부트캠프 등록 요청 </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- Category Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <div class="text-center mb-5">
                <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">Category</h5>
                <h1>과정 한 눈에 보기</h1>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="cat-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="/bootcampmoa/resources/images/프론트엔드.png" alt="">
                        <a class="cat-overlay text-white text-decoration-none" href="/bootcampmoa/bootcampSearch?keyword=프론트엔드">
                            <h4 class="text-white font-weight-medium">프론트엔드</h4>
                            <span></span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="cat-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="/bootcampmoa/resources/images/백엔드.png" alt="">
                        <a class="cat-overlay text-white text-decoration-none" href="/bootcampmoa/bootcampSearch?keyword=벡엔드">
                            <h4 class="text-white font-weight-medium">백엔드</h4>
                            <span></span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="cat-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="/bootcampmoa/resources/images/풀스택.png"  alt="">
                        <a class="cat-overlay text-white text-decoration-none" href="/bootcampmoa/bootcampSearch?keyword=풀스택">
                            <h4 class="text-white font-weight-medium">풀스텍</h4>
                            <span></span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="cat-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="/bootcampmoa/resources/images/인공지능.png" alt="">
                        <a class="cat-overlay text-white text-decoration-none" href="/bootcampmoa/bootcampSearch?keyword=풀스택">
                            <h4 class="text-white font-weight-medium">인공지능</h4>
                            <span></span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="cat-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="/bootcampmoa/resources/images/빅데이터.png" alt="">
                        <a class="cat-overlay text-white text-decoration-none" href="/bootcampmoa/bootcampSearch?keyword=빅데이터">
                            <h4 class="text-white font-weight-medium">빅데이터</h4>
                            <span>100 Courses</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="cat-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="/bootcampmoa/resources/images/클라우드.png">
                        <a class="cat-overlay text-white text-decoration-none" href="/bootcampmoa/bootcampSearch?keyword=클라우드">
                            <h4 class="text-white font-weight-medium">클라우드</h4>
                            <span>100 Courses</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="cat-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="/bootcampmoa/resources/images/IoT.png" alt="">
                        <a class="cat-overlay text-white text-decoration-none" href="/bootcampmoa/bootcampSearch?keyword=IoT">
                            <h4 class="text-white font-weight-medium">IoT</h4>
                            <span>100 Courses</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="cat-item position-relative overflow-hidden rounded mb-2">
                        <img class="img-fluid" src="/bootcampmoa/resources/images/앱.png" alt="">
                        <a class="cat-overlay text-white text-decoration-none" href="/bootcampmoa/bootcampSearch?keyword=앱">
                            <h4 class="text-white font-weight-medium">안드로이드/iOS</h4>
                            
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Category End -->


    <!-- Courses Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="text-center mb-5">
                <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">reviews</h5>
                <h1>최신 등록 후기</h1>
            </div>
            
            <div class="row">
            
            	<c:choose>
            		<c:when test="${ !empty requestScope.bootcampList}">
            			<c:forEach var = "vo" items = "${requestScope.bootcampList}">
							<c:choose>
								<c:when test="${vo.visible == 1 }">
									<div class="col-lg-4 col-md-6 mb-4" >
								<div class="rounded overflow-hidden mb-2">
									<a href=""><img class="img-fluid" src="resources/images/${vo.img}"></a>
									<div class="bg-secondary p-4">
										<div class="d-flex justify-content-between mb-3">
			                                <small class="m-0"><i class="fa fa-users text-primary mr-2"></i>${vo.academy }</small>
			                                <small class="m-0"></i></small>
                           	 			</div>
                            			<a class="h5" href="/bootcampmoa/bootcamp/${vo.bnum}">${vo.program }</a>
                            			<div class="border-top mt-4 pt-4">
                                			<div class="d-flex justify-content-between">
                                    			<h6 class="m-0"><i class="fa fa-star text-primary mr-2"></i>4.5 <small>(리뷰 개수)</small></h6>
                                    			<h5 class="m-0"></h5>
                                			</div>
                            			</div>
									</div>
								</div>
							</div>
								</c:when>
							</c:choose>
						</c:forEach>
            		</c:when>
            	</c:choose>
            	<div class="col-12">
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-lg justify-content-center mb-0">
                                  <li class="page-item">
                                    <a class="page-link" href="${vo.bnum}?curPage=1" aria-label="Start">
                                      <span aria-hidden="true">&laquo;</span>
                                      <span class="sr-only">Start</span>                                     
                                    </a>                                    
                                  </li>
                                  <li class="page-item">
                                     <a class="page-link" href="${vo.bnum}?curPage=${paging.curPage-1 }" aria-label="prev">
                                      <span aria-hidden="true">&lt;</span>
                                      <span class="sr-only">prev</span>
                                    </a>
                                  </li>
                                  
                                     <c:forEach begin="${paging.firstPage }"  end="${paging.lastPage }" var="i">
                                 <a class="page-link" href="${vo.bnum}?curPage=${i }"  >  
                                    <c:if test="${i eq paging.curPage }">  <span style="color: red">  ${i } </span> </c:if>
                                    <c:if test="${i ne paging.curPage }">  ${i } </c:if> 
                                 </a>
                           </c:forEach>
                                  <li class="page-item">
                                     <a class="page-link" href="${vo.bnum}?curPage=${paging.curPage+1 }" aria-label="Next">
                                      <span aria-hidden="true">&gt;</span>
                                      <span class="sr-only">Next</span>
                                    </a>
                                  </li>
                                  
                                  <li class="page-item">
                                    <a class="page-link" href="${vo.bnum}?curPage=${paging.totalPageCount }" aria-label="End">
                                      <span aria-hidden="true">&raquo;</span>
                                      <span class="sr-only">End</span>
                                    </a>
                                  </li>
                                </ul>
                              </nav>
                   </div>
            	
                
            </div>
        </div>
    </div>
    <!-- Courses End -->

  
        <!-- Testimonial Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="text-center mb-5">
                <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">BootMoA</h5>
                <h1>궁금한 부트캠프 정보 부트모아에서 전부 찾아보세요!</h1>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="owl-carousel testimonial-carousel">
                        <div class="text-center">
                            <i class="fa fa-3x fa-quote-left text-primary mb-4"></i>
                            <h4 class="font-weight-normal mb-4">비전공자인데 부트캠프로 취업할 수 있을까요? <br>취업기간은 대략 얼마나 걸릴까요?</h4>
                            <img class="img-fluid mx-auto mb-3" src="/bootcampmoa/resources/images/appleYebin.png" >
                         
                        </div>
                        <div class="text-center">
                            <i class="fa fa-3x fa-quote-left text-primary mb-4"></i>
                            <h4 class="font-weight-normal mb-4">프론트엔드 백엔드...<br>어떤게 더 저한테 잘 맞는지 모르겠어요</h4>
                            <img class="img-fluid mx-auto mb-3" src="/bootcampmoa/resources/images/test.jpg">
                            
                        </div>
                        <div class="text-center">
                            <i class="fa fa-3x fa-quote-left text-primary mb-4"></i>
                            <h4 class="font-weight-normal mb-4">데이터 사이언스 <br>대학원 말고 부트캠프로도 취업 가능할까요?</h4>
                            <img class="img-fluid mx-auto mb-3" src="/bootcampmoa/resources/images/test2.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->
    
   


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white py-5 px-sm-3 px-lg-5" style="margin-top: 90px;">
        <div class="row pt-5">
            <div class="col-lg-7 col-md-12">
                <div class="row">
                    <div class="col-md-6 mb-5">
                        <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Get In Touch</h5>
                        <p><i class="fa fa-map-marker-alt mr-2"></i>서울특별시 서초구 효령로 335</p>
                        <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope mr-2"></i>bootmoa@gmail.com</p>
                        <div class="d-flex justify-content-start mt-4">
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-github"></i></a>
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-outline-light btn-square" href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6 mb-5">
                        <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Our Courses</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Web Design</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Apps Design</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Marketing</a>
                            <a class="text-white mb-2" href="#"><i class="fa fa-angle-right mr-2"></i>Research</a>
                            <a class="text-white" href="#"><i class="fa fa-angle-right mr-2"></i>SEO</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-md-12 mb-5">
                <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Newsletter</h5>
                <p>Rebum labore lorem dolores kasd est, et ipsum amet et at kasd, ipsum sea tempor magna tempor. Accu kasd sed ea duo ipsum. Dolor duo eirmod sea justo no lorem est diam</p>
                <div class="w-100">
                    <div class="input-group">
                        <input type="text" class="form-control border-light" style="padding: 30px;" placeholder="Your Email Address">
                        <div class="input-group-append">
                            <button class="btn btn-primary px-4">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-dark text-white border-top py-4 px-sm-3 px-md-5" style="border-color: rgba(256, 256, 256, .1) !important;">
        <div class="row">
            <div class="col-lg-6 text-center text-md-left mb-3 mb-md-0">
                <p class="m-0 text-white">&copy; <a href="#">Domain Name</a>. All Rights Reserved. Designed by <a href="https://htmlcodex.com">HTML Codex</a>
                </p>
            </div>
            <div class="col-lg-6 text-center text-md-right">
                <ul class="nav d-inline-flex">
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Privacy</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Terms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">FAQs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white py-0" href="#">Help</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="resources/lib/easing/easing.min.js"></script>
    <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="resources/mail/jqBootstrapValidation.min.js"></script>
    <script src="resources/mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>
    
    <script>
	function logout(){
	    let form = document.createElement('form');//여기서 폼태그 만듬
	    form.setAttribute('method', 'post'); //메서드는 포스트로
	    form.setAttribute('action', 'memberlogout');//PostMapping 괄호안 값을 넣으면됨
	    document.body.appendChild(form);
	    form.submit();
	}
	</script>
</body>
</html>