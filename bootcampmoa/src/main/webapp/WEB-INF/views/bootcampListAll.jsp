<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.ReviewVO,vo.MemberVO,vo.BootcampVO,java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>부트모아 - 부트캠프 리뷰 리스트</title>
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
    <link href="resources/css/style.css" rel="stylesheet">
</head>

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
        
                            </div>
                        </div>
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
                    	
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->

    <!-- Header Start -->
    <div class="container-fluid page-header" style="margin-bottom: 90px;">
        <div class="container">
            <div class="d-flex flex-column justify-content-center" style="min-height: 300px">
                <h3 class="display-4 text-white text-uppercase">부트캠프 후기 한 눈에 모아보기</h3>
                <div class="d-inline-flex text-white">
                    <p class="m-0 text-uppercase"><a class="text-white" href="/bootcampmoa/bootmoaMain">홈</a></p>
                    <i class="fa fa-angle-double-right pt-1 px-3"></i>
                    <p class="m-0 text-uppercase">부트캠프 리스트</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->

    <!-- Blog Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row pb-3">
                        
                        
                        <c:choose>
            				<c:when test="${ !empty requestScope.bootcampListAll}">
            					<c:forEach var = "bvo" items = "${requestScope.bootcampListAll}">
            						<c:choose>
            							<c:when test="${bvo.visible == 1}">
            								<div class="col-lg-6 mb-4">
                            					<div class="blog-item position-relative overflow-hidden rounded mb-2">
                                					<img class="img-fluid" src="/bootcampmoa/resources/images/${bvo.logo}">
                                					<a class="blog-overlay text-decoration-none" href="/bootcampmoa/bootcamp/${bvo.bnum}">
                                    				<h5 class="text-white mb-3">${bvo.academy }</h5>
                                    				<p class="text-primary m-0">${bvo.program }</p>
                                					</a>
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
    
                <div class="col-lg-4 mt-5 mt-lg-0">
                    <!-- Author Bio -->
                    <div class="d-flex flex-column text-center bg-dark rounded mb-5 py-5 px-4">
                        <img src="resources/profiles/${svo.profile}" class=" rounded-circle mx-auto mb-3" style="width: 100px;">
                        <h3 class="text-primary mb-3">${sessionScope.svo.nickname }</h3>
                        <h3 class="text-uppercase mb-4" style="letter-spacing: 5px;">Profile</h3>
                        <p class="text-white m-0"></p>
                    </div>
    
                    <!-- Search Form -->
                    <div class="mb-5">
                        <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control form-control-lg" placeholder="부트캠프 명을 검색하세요 ex)인공지능">
                                <div class="input-group-append">
                                    <span class="input-group-text bg-transparent text-primary"><i
                                            class="fa fa-search"></i></span>
                                </div>
                            </div>
                        </form>
                    </div>
    
                    <!-- Category List -->
                    <div class="mb-5">
                        <h3 class="text-uppercase mb-4" style="letter-spacing: 5px;">Categories</h3>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <a href="" class="text-decoration-none h6 m-0">Front-End</a>
                                <span class="badge badge-primary badge-pill"></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <a href="" class="text-decoration-none h6 m-0">Back-End</a>
                                <span class="badge badge-primary badge-pill"></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <a href="" class="text-decoration-none h6 m-0">Full-Stack</a>
                                <span class="badge badge-primary badge-pill"></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <a href="" class="text-decoration-none h6 m-0">Big-Data</a>
                                <span class="badge badge-primary badge-pill"></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <a href="" class="text-decoration-none h6 m-0">IoT</a>
                                <span class="badge badge-primary badge-pill"></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <a href="" class="text-decoration-none h6 m-0">Cloud</a>
                                <span class="badge badge-primary badge-pill"></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <a href="" class="text-decoration-none h6 m-0">AI</a>
                                <span class="badge badge-primary badge-pill"></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <a href="" class="text-decoration-none h6 m-0">App</a>
                                <span class="badge badge-primary badge-pill"></span>
                            </li>
                        </ul>
                    </div>
    
    
                    <!-- Tag Cloud -->
                    <div class="mb-5">
                        <h3 class="text-uppercase mb-4" style="letter-spacing: 5px;">Tag Cloud</h3>
                        <div class="d-flex flex-wrap m-n1">
                            <a href="" class="btn btn-outline-primary m-1">front-End</a>
                            <a href="" class="btn btn-outline-primary m-1">Back-End</a>
                            <a href="" class="btn btn-outline-primary m-1">full Stack</a>
                            <a href="" class="btn btn-outline-primary m-1">Big-Data</a>
                            <a href="" class="btn btn-outline-primary m-1">IoT</a>
                            <a href="" class="btn btn-outline-primary m-1">Cloud</a>
                            <a href="" class="btn btn-outline-primary m-1">AI</a>
                            <a href="" class="btn btn-outline-primary m-1">App</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Blog End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white py-5 px-sm-3 px-lg-5" style="margin-top: 90px;">
        <div class="row pt-5">
            <div class="col-lg-7 col-md-12">
                <div class="row">
                    <div class="col-md-6 mb-5">
                        <h5 class="text-primary text-uppercase mb-4" style="letter-spacing: 5px;">Get In Touch</h5>
                        <p><i class="fa fa-map-marker-alt mr-2"></i>123 Street, New York, USA</p>
                        <p><i class="fa fa-phone-alt mr-2"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope mr-2"></i>info@example.com</p>
                        <div class="d-flex justify-content-start mt-4">
                            <a class="btn btn-outline-light btn-square mr-2" href="#"><i class="fab fa-twitter"></i></a>
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
    <script src="resources/js/abc.js"></script>
</body>

</html>