<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body> 
	<!-- callback ó�����Դϴ�. �� ������������ callback�� ó���ϰ� �ٷ� main���� redirect�ϱ⶧���� �� �޽����� ���̸� �ȵ˴ϴ�. -->

	<!-- (2) LoginWithNaverId Javscript ���� ���� �� �ʱ�ȭ -->
	<script>
	
 		var naver_id_login = new naver_id_login("7Uw4MdMci9xWvrvnp_e8", "http://localhost/member/naverCallback");
	  	// ���� ��ū �� ���
	  	/* alert(naver_id_login.oauthParams.access_token); */
	  	var naverToken = naver_id_login.oauthParams.access_token;
	  
	  	// ���̹� ����� ������ ��ȸ
	  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  
	  	// ���̹� ����� ������ ��ȸ ���� ������ ������ ó���� callback function
	  	function naverSignInCallback() {
	    	/* alert(naver_id_login.getProfileData('email'));
	    	alert(naver_id_login.getProfileData('name'));
	    	alert(naver_id_login.getProfileData('birthday')); */
	    	
	    	var email = naver_id_login.getProfileData('email');
	    	var name = naver_id_login.getProfileData('name');
	    	var birth = naver_id_login.getProfileData('birthday');
	    	
	    	$.ajax({
				url : '/member/naverLogin',
				data : {emailAccount : email, memName : name, birth : birth, naverToken : naverToken},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					if(result == 'success') {
						alert("�α��� �Ǿ����ϴ�.");
						window.location.replace("/");
					}else {
						alert("������ ������ϴ�. ��� �� �ٽ� �õ����ּ���.");
					}
				}
			});	// $.ajax
	  	}
	   
	  
		/* var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "7Uw4MdMci9xWvrvnp_e8",
				callbackUrl: "http://localhost/member/naverCallback",
				isPopup: false,
				callbackHandle: true
				// callback �������� �и��Ǿ��� ��쿡 callback ������������ callbackó���� ���ټ� �ֵ��� �����մϴ�.
			}
		); */

		// (3) �׾Ʒ� �α��� ������ �ʱ�ȭ�ϱ� ���Ͽ� init�� ȣ��
		/* naverLogin.init(); */

		// (4) Callback�� ó��. ���������� Callback ó���� �Ϸ�� ��� main page�� redirect(�Ǵ� Popup close)
		/* window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					// (5) �ʼ������� �޾ƾ��ϴ� ������ ������ �ִٸ� callbackó�� ������ üũ
					var email = naverLogin.user.getEmail();
					var name = naverLogin.user.getName();
					
					
					if( email == undefined || email == null) {
						alert("�̸����� �ʼ������Դϴ�. ���������� �������ּ���.");
						// (5-1) ����� ���� �絿�Ǹ� ���Ͽ� �ٽ� �׾Ʒ� ������������ �̵��� 
						naverLogin.reprompt();
						return;
					}else if (name == undefined || name == null) {
						alert("�̸��� �ʼ������Դϴ�. ���������� �������ּ���.");
						naverLogin.reprompt();
						return;
					}
					
					// alert(naverLogin.user.getEmail() + "�̸���");
					// alert(naverLogin.user.getName() + "�̸�");
					// alert(naverLogin.user.getBirthday() + "����");

					var birth = naverLogin.user.getBirthday();


				} else {
					console.log("callback ó���� �����Ͽ����ϴ�.");
				}
			});
		}); */
	</script>
</body>
</html>