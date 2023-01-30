function logout(){
	    let form = document.createElement('form');//여기서 폼태그 만듬
	    form.setAttribute('method', 'post'); //메서드는 포스트로
	    form.setAttribute('action', 'memberlogout');//PostMapping 괄호안 값을 넣으면됨
	    document.body.appendChild(form);
	    form.submit();
	}
	
	function bootcampDelete(bnum){
		location.href='/bootcampmoa/requestDelete?bnum='+bnum;
		alert("삭제되었습니다.");
		location.reload();
	}
	
	function newWindow(bnum){
		alert(1);
		abc = window.open('/bootcampmoa/insertManager?bnum='+bnum, '', 'width=400, height=430');
	}
	var abc;
	
	 function insertManager(){
	    	
	    	alert("ㅋㅋ");
	   
	  
	    	var dom = document.getElementById("insertManager");
	    	dom.submit();
	    	alert(100);
	    	abc.close();
	    	
	    
	    	
	    }
	    