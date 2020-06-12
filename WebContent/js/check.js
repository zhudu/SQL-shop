/*
 * 手机号编码检验
 */
function checkphone(){
	if(document.getElementById("phone").value.length!=11){
		document.getElementById("checkphone").innerHTML = "手机号码为11位";
		document.getElementById("phone").focus();
		 return false;
	}
	else{
		document.getElementById("checkphone").innerHTML ="";	
	}
}

//function checkphone1(){
//
//	window.alert(document.getElementById("phone1").value);
//	if(document.getElementById("phone1").value.length!=11){
//		document.getElementById("checkphone").innerHTML = "手机号码为11位";
//		document.getElementById("phone1").focus();
//		 return false;
//	}
//	else{
//		document.getElementById("checkphone").innerHTML ="";	
//	}
//}
//
//function checkemp(){
//	if(document.getElementById("Emp_pwd").value.length < 6 ||document.getElementById("Emp_pwd").value.length > 18 ){
//		document.getElementById("checkpwd").innerHTML= "密码长度为6-18";
//		document.getElementById("Emp_pwd").focus();
//		return false; 
//	}else{
//		document.getElementById("checkpwd").innerHTML ="";
//	}
//}
//
//function checkclipwd(){
//	if(document.getElementById("password1").value.length < 6 ||document.getElementById("password1").value.length > 18 ){
//		document.getElementById("checkclipwd").innerHTML= "密码长度为6-18";
//		document.getElementById("password1").focus();
//		return false; 
//	}else{
//		document.getElementById("checkclipwd").innerHTML ="";
//	}
//}
//
//function checkpwd2(){
//	if(document.getElementById("password2").value.equals(document.getElementById("password").value)){
//		document.getElementById("checkpwd2").innerHTML= "两次密码不一致";
//		document.getElementById("password2").focus();
//		return false; 
//	}else{
//		document.getElementById("checkpwd2").innerHTML ="";
//	}
//}
//
//function checkID(){
//	if(document.getElementById("Emp_ID").value.length != 18 ){
//		document.getElementById("checkID").innerHTML= "身份证长度为18位";
//		document.getElementById("Emp_ID").focus();
//		return false; 
//	}else{
//		document.getElementById("checkID").innerHTML ="";
//	}	
//}
//
//function checkcliid(){
//	if(document.getElementById("Cli_id").value.length != 18 ){
//		document.getElementById("checkcliid").innerHTML= "身份证长度为18位";
//		document.getElementById("Cli_id").focus();
//		return false; 
//	}else{
//		document.getElementById("checkcliid").innerHTML ="";
//	}	
//}
//
//function checkdepno(){
//	if(document.getElementById("Dep_no").value.equals("1101") ||document.getElementById("Dep_no").value.equals("1102")
//			||document.getElementById("Dep_no").value.equals("1111")){
//		document.getElementById("checkdepno").innerHTML= "该部门不存在";
//		document.getElementById("Dep_no").focus();
//		return false; 
//	}else{
//		document.getElementById("checkdepno").innerHTML ="";
//	}	
//}
//
//function checkempno(){
//	if(document.getElementById("Emp_no").value.length != 6 ){
//		document.getElementById("checkempno").innerHTML= "员工工号统一需为6位";
//		document.getElementById("Emp_no").focus();
//		return false; 
//	}else{
//		document.getElementById("checkempno").innerHTML ="";
//	}	
//}
//
//function checkgoono(){
//	if(document.getElementById("Goo_no").value.length != 8 ){
//		document.getElementById("checkgoono").innerHTML= "商品编号为8位";
//		document.getElementById("Goo_no").focus();
//		return false; 
//	}else{
//		document.getElementById("checkgoono").innerHTML ="";
//	}
//}
//
//function checkstore(){
//	if(document.getElementById("Store").value.length != 8 ){
//		document.getElementById("checkstore").innerHTML= "仓库号为6位编码";
//		document.getElementById("Store").focus();
//		return false; 
//	}else{
//		document.getElementById("checkstore").innerHTML ="";
//	}
//}
//
//function checkmerno(){
//	if(document.getElementById("Mer_no").value.length != 8 ){
//		document.getElementById("checkmerno").innerHTML= "商家号为6位编码";
//		document.getElementById("Mer_no").focus();
//		return false; 
//	}else{
//		document.getElementById("checkmerno").innerHTML ="";
//	}
//}
//
//function checkmeremail(){
//	var pattern = /^[a-zA-Z0-9#_\^\$\.\*\+\-\?\=\!\:\|\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
//	if(!pattern.test(document.getElementById("Mer_email").value)) 
//	  {
//		document.getElementById("checkmeremail").innerHTML = "Email不合法";
//		document.getElementById("Mer_email").focus();
//		return false;
//	  }
//	  else 
//	  {
//		document.getElementById("checkmeremail").innerHTML = "";
//	  }
//}
//
//function checkprivacy(){
//	window.alert(document.getElementById("privacy").value);
//	if(document.getElementById("privacy").value==null ){
//		document.getElementById("checkprivacy").innerHTML= "请阅读隐私政策并勾选";
//		document.getElementById("privacy").focus();
//		return false; 
//	}else{
//		document.getElementById("checkprivacy").innerHTML ="";
//	}
//}
/*
 * authorization check
 */
function AuthorizationRegister(){
	//检测authorization下注册功能的手机号位数
	if(document.getElementById("phone1").value.length!=11){
		document.getElementById("checkphone").innerHTML = "手机号码为11位";
		document.getElementById("phone1").focus();
		 return false;
	}
	else{
		document.getElementById("checkphone").innerHTML ="";	
	}
	//检测authorization下注册功能的身份证位数
	if(document.getElementById("Cli_id").value.length != 18 ){
		document.getElementById("checkcliid").innerHTML= "身份证长度为18位";
		document.getElementById("Cli_id").focus();
		return false; 
	}else{
		document.getElementById("checkcliid").innerHTML ="";
	}	
	//检测authorization下注册功能的密码是否符合要求
	if(document.getElementById("password1").value.length < 6 ||document.getElementById("password1").value.length > 18 ){
		document.getElementById("checkclipwd").innerHTML= "密码长度为6-18";
		document.getElementById("password1").focus();
		return false; 
	}else{
		document.getElementById("checkclipwd").innerHTML ="";
	}
	//检测authorization下注册功能的两次密码是否一致
	if(document.getElementById("password2").value!=document.getElementById("password1").value){
		document.getElementById("checkpwd2").innerHTML= "两次密码不一致";
		document.getElementById("password2").focus();
		return false; 
	}else{
		document.getElementById("checkpwd2").innerHTML ="";
	}
	//检测authorization下注册功能的隐私政策是否勾选
	if(document.getElementById("privacy").checked==false ){
		document.getElementById("checkprivacy").innerHTML= "请阅读隐私政策并勾选";
		document.getElementById("privacy").focus();
		return false; 
	}else{
		document.getElementById("checkprivacy").innerHTML ="";
	}
}
function AuthorizationForget(){
	//检测authorization下忘记密码功能的手机号位数
	if(document.getElementById("phone2").value.length!=11){
		document.getElementById("checkphone1").innerHTML = "手机号码为11位";
		document.getElementById("phone2").focus();
		 return false;
	}
	else{
		document.getElementById("checkphone1").innerHTML ="";	
	}
	//检测authorization下忘记密码功能的身份证位数
	if(document.getElementById("id").value.length != 18 ){
		document.getElementById("checkcliid1").innerHTML= "身份证长度为18位";
		document.getElementById("id").focus();
		return false; 
	}else{
		document.getElementById("checkcliid1").innerHTML ="";
	}	
	//检测authorization下忘记密码功能的密码是否符合要求
	if(document.getElementById("password3").value.length < 6 ||document.getElementById("password1").value.length > 18 ){
		document.getElementById("checkclipwd1").innerHTML= "密码长度为6-18";
		document.getElementById("password3").focus();
		return false; 
	}else{
		document.getElementById("checkclipwd1").innerHTML ="";
	}
	//检测authorization下忘记密码功能的两次密码是否一致
	if(document.getElementById("password4").value.equals(document.getElementById("password3").value)){
		document.getElementById("checkpwd4").innerHTML= "两次密码不一致";
		document.getElementById("password4").focus();
		return false; 
	}else{
		document.getElementById("checkpwd4").innerHTML ="";
	}
}

/*
 * account check
 */
function AccountUpdateDetail(){
	//检测authorization下注册功能的手机号位数
	if(document.getElementById("phone").value.length!=11){
		document.getElementById("checkphone").innerHTML = "手机号码为11位";
		document.getElementById("phone").focus();
		 return false;
	}
	else{
		document.getElementById("checkphone").innerHTML ="";	
	}
	var pattern = /^[a-zA-Z0-9#_\^\$\.\*\+\-\?\=\!\:\|\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	if(!pattern.test(document.getElementById("email").value)) 
	  {
		document.getElementById("checkemail").innerHTML = "Email不合法";
		document.getElementById("email").focus();
		return false;
	  }
	  else 
	  {
		document.getElementById("checkemail").innerHTML = "";
	  }
}
function AccountUpdatepwd(){
	//检测authorization下忘记密码功能的密码是否符合要求
	if(document.getElementById("newpassword").value.length < 6 ||document.getElementById("newpassword").value.length > 18 ){
		document.getElementById("checkpwd").innerHTML= "密码长度为6-18";
		document.getElementById("newpassword").focus();
		return false; 
	}else{
		document.getElementById("checkpwd").innerHTML ="";
	}
	//检测authorization下忘记密码功能的两次密码是否一致
	if(document.getElementById("confirmpassword").value.equals(document.getElementById("newpassword").value)){
		document.getElementById("checkpwd2").innerHTML= "两次密码不一致";
		document.getElementById("confirmpassword").focus();
		return false; 
	}else{
		document.getElementById("checkpwd2").innerHTML ="";
	}
}
