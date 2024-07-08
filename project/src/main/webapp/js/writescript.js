function writeSave(){
	if(document.writeForm.bWriter.value==""){
		alert("작성자를 입력해 주세요");
		document.writeForm.bWriter.focus();
		return false;
	}
		
		if(document.writeForm.bTitle.value==""){
		alert("제목을 입력해 주세요");
		document.writeForm.bTitle.focus();
		return false;
	}
		

		if(document.writeForm.bContents.value==""){
		alert("내용을 입력해 주세요");
		document.writeForm.bContents.focus();
		return false;
	}
		
		if(document.writeForm.bPass.value==""){
		alert("비밀번호를 입력해 주세요");
		document.writeForm.bPass.focus();
		return false;
	}

}