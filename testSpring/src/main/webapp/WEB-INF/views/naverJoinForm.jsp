<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>

</head>
<body>
<center>
<form action="/signIn.do" method="post" onsubmit="return value();">
		<input type="text" name="memberId" value="${email }" readonly required><br>
		<input type="password" name="memberPw" placeholder="password" value="${id }" readonly><br>
		<input type="text" name="memberName" value="${name }" readonly required><br>
		<input type="text" name="memberAddr" placeholder="Address"><br>
		<input type="text" name="phone" placeholder="phone"><br>
		<button type="submit" class="btn btn-success"value="회원가입">회원가입</button>
	</form>
</center>
</body>
<script>
/* phone */
var num = phone.val();
var result = phone.val();
if (num.indexOf('-') == -1) {
    if (num.indexOf(' ') == -1) {} else {
        result = num.substr(0, num.indexOf(' '));
        result += num.substring(num.indexOf(' ') + 1, num.lastIndexOf(' '));
        result += num.substring(num.lastIndexOf(' ') + 1, num.length);
    }
} else {
    result = num.substr(0, num.indexOf('-'));
    result += num.substring(num.indexOf('-') + 1, num.lastIndexOf('-'));
    result += num.substring(num.lastIndexOf('-') + 1, num.length);
}

}

function rexCheck(rex, what) {
if (rex.test(what.val())) {
    return false;
} else {
    action(what);
    return true;
}
}

function action(what) {
what.focus();
what.css('color', '#f00');
}
</script>
</html>