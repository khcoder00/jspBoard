function checkForm() {
	var f = document.upForm;
		if(f.subject.value==null || f.subject.value=="" || f.subject.value.length==0) {
			alert("제목은 필수 입니다.");
			f.subject.focus();
			return false;
		} else if(f.writer.value==null || f.writer.value=="" || f.writer.value.length==0) {
			alert("글쓴이는 필수 입니다.");
			f.writer.focus();
			return false;
		} else if(f.content.value==null || f.content.value=="" || f.content.value.length==0) {
			alert("글내용은 필수 입니다.");
			f.content.focus();
			return false;
		} else if(f.email.value==null || f.email.value=="" || f.email.value.length==0) {
			alert("이메일은 필수 입니다.");
			f.email.focus();
			return false;
		} else if(f.passwd.value==null || f.passwd.value=="" || f.passwd.value.length==0) {
			alert("비밀번호는 필수 입니다.");
			f.passwd.focus();
			return false;
		} else {
			f.submit();
		}
}

function checkPass(p, f){
	var vp = prompt("비밀번호를 입력하세요")
	var form = document.updateForm;
	
	if(p==vp){
		if(f=='U') {
			form.action = "jboard?bctr=update";
		} else if(f=='D') {
			form.action = "jboard?bctr=delAct";
		}
		form.submit();
	} else {
		alert("비밀번호가 틀립니다.");
		return false;
	}
}

function reply(){
	var form = document.updateForm;
		form.action = "jboard?bctr=write";
		form.submit();
}