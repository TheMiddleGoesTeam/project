

function idCheck(mID){
	if(mID == ""){
		alert("아이디를 입력해 주세요");
		document.common.mID.focus();
	}else{
		url="idCheck.jsp?mID="+mID;
		window.open(url,"post","width=300,height=150");	
	}
}



function inputCheck(){
	
	
	if(document.signup.mID.value==""){
		alert("아이디를  입력해 주세요");
		document.common.mID.focus();
		return;
	}
	
	if(document.signup.mNic.value==""){
		alert("닉네임을  입력해 주세요");
		document.common.mNic.focus();
		return;
	}

	if(document.signup.mPass.value==""){
		alert("비밀번호를 입력해 주세요");
		document.common.mPass.focus();
		return;
	}

	if(document.signup.repass.value==""){
		alert("비밀번호를  확인해 주세요");
		document.signup.repass.focus();
		return;
	}
	
	if(document.signup.mPass.value != document.signup.repass.value){
		alert("비밀번호가 일치하지 않습니다");
		document.signup.repass.focus();
		return;
	}

	if(document.signup.mName.value==""){
		alert("이름을 입력해 주세요");
		document.common.mName.focus();
		return;
	}



	if(document.signup.mtel1.value==""){
		alert("통신사를 확인해 주세요");
		document.signup.mtel1.focus();
		return;
	}
	
	if(document.signup.mtel2.value==""){
		alert("전화번호 앞자리를  확인해 주세요");
		document.signup.mtel2.focus();
		return;
	}
	
	if(document.signup.mtel3.value==""){
		alert("전화번호 뒷자리를  확인해 주세요");
		document.signup.mtel1.focus();
		return;
	}


	if(document.signup.mEmail.value==""){
		alert("이메일을 입력해 주세요");
		document.common.mEmail.focus();
		return;
	}

	document.signup.submit();
	
}





function updateCheck(){
	
		if(document.myInfo.mNic.value==""){
		alert("닉네임을 입력해 주세요");
		document.myInfo.mNic.focus();
		return;
	}
	
	if(document.myInfo.mPass.value==""){
		alert("비밀번호를 입력해 주세요");
		document.myInfo.mPass.focus();
		return;
	}

	if(document.myInfo.repass.value==""){
		alert("비밀번호를 확인해 주세요");
		document.myInfo.repass.focus();
		return;
	}
	
	if(document.myInfo.mPass.value != document.myInfo.repass.value){
		alert("비밀번호가 일치하지 않습니다");
		document.myInfo.repass.focus();
		return;
	}

	if(document.myInfo.mName.value==""){
		alert("이름을 입력해 주세요");
		document.myInfo.mName.focus();
		return;
	}



	if(document.myInfo.mtel1.value==""){
		alert("통신사를 확인해 주세요");
		document.myInfo.mtel1.focus();
		return;
	}
	
	if(document.myInfo.mtel2.value==""){
		alert("전화번호 앞자리를 확인해 주세요");
		document.myInfo.mtel2.focus();
		return;
	}
	
	if(document.myInfo.mtel3.value==""){
		alert("전화번호 뒷자리를 확인해 주세요");
		document.myInfo.mtel1.focus();
		return;
	}


	if(document.myInfo.mEmail.value==""){
		alert("이메일을 입력해 주세요");
		document.myInfo.mEmail.focus();
		return;
	}

	
	

	document.myInfo.submit();
	
}

