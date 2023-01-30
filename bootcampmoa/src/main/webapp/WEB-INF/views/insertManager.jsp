<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.ReviewVO,vo.MemberVO,vo.BootcampVO,java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>부트모아 - 부트캠프 등록 요청</title>
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
    <link href="/bootcampmoa/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/bootcampmoa/resources/css/style.css" rel="stylesheet">
</head>

<body>
   


    <!-- Contact Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="text-center mb-5">
                <h5 class="text-primary text-uppercase mb-3" style="letter-spacing: 5px;">Manager Register</h5>
           
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-form bg-secondary rounded p-5">
                        <div id="success"></div>
                        <form id="insertManager" name="sentMessage" novalidate="novalidate" method="POST" action="/bootcampmoa/insertManager/result" enctype="multipart/form-data" >
                        	<input type="hidden" name="bnum" value="${bvo.bnum }">
                        	<input type="hidden" name="mnum" value=${sessionScope.svo.mnum }>  
                            <div class="control-group">
                                <input type="text" class="form-control border-0 p-4" name="academy" value="${bvo.academy }" id="academy" placeholder="학원 명" required="required" data-validation-required-message="학원 명을 입력해주세요" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control border-0 p-4" name="program" value="${bvo.program }" id="program" placeholder="부트캠프 프로그램 명" required="required" data-validation-required-message="부트캠프 프로그램 이름을 입력해주세요" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control border-0 p-4" name="url" value="${bvo.url }"id="url" placeholder="부트캠프 학원 사이트 주소" required="required" data-validation-required-message="학원 사이트 주소를입력해주세요" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control border-0 p-4" name="address" id="address" placeholder="오프라인 수업 주소" required="required" data-validation-required-message="오프라인 수업 주소를입력해주세요" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                            	<label>학원 로고 이미지 등록</label>
                                <input type="file" class="form-control border-0 p-4" name="logoFile" id="logo" required="required" data-validation-required-message="파일을 업로드 해주세요" />
                                
                            </div>
                            <div class="control-group">
                            	<br>
                            	<label>프로그램 메인 이미지 등록</label>
                            	<br>
                                <input type="file" class="form-control border-0 p-4" name="imgFile" id="img" required="required" data-validation-required-message="파일을 업로드 해주세요" />
                            <br>    
             				<div class="text-center">
                                <button class="btn btn-primary py-3 px-5" type="submit" id="sendMessageButton" onclick="insertManager();return false">등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->


  
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="/bootcampmoa/resources/lib/easing/easing.min.js"></script>
    <script src="/bootcampmoa/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="/bootcampmoa/resources/mail/jqBootstrapValidation.min.js"></script>
    <script src="/bootcampmoa/resources/mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="/bootcampmoa/resources/js/main.js"></script>
    <script src="/bootcampmoa/resources/js/abc.js"></script>
    
</body>

</html>