<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>일반 회원가입</title>
</head>
<body>
    <form action="" method="post">
        이름 : <input id="name" type="text" /><br />
        이메일 : <input id="email" type="text" /><br />

        비밀번호 : <input id="password" type="password" /><br />
        비밀번호확인 : <input id="repassword" type="password" /><br />

        핸드폰 번호 : <input id="1stnum" type="text" /> - <input id="2ndnum" type="text" /> - <input id="3rdnum" type="text" /><br />

        자전거 종류 : <select id="kind">
            <option id="fixie">픽시</option>
            <option id="road">로드</option>
            <option id="alton">알톤</option>
            <option id="etc">기타</option>
        </select><br />
        <input id="Submit" type="submit" value="제출" />
        <input id="Reset1" type="reset" value="reset" />
    </form>
</body>
</html>