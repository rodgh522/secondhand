<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <script src="https://kit.fontawesome.com/47a97bc968.js" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js">

    </script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<style>
    .page-container {
        margin-right: auto;
        margin-left: auto;
        max-width: 1280px;
        min-width: 320px;
        min-height: 600px;

        padding: 32px 10px 10px;
    }

    .myPage-container {

        display: flex;
    }

    .myPage-sider {
        min-width: 184px;
        width: 25%;
        margin-right: 16px;
        margin-bottom: 16px;
        display: block;

    }

    .myPage-content {
        width: 75%;

        display: block;
    }

    .content-header {
        margin-bottom: 10px;
        padding: 0;
        margin-top: 10px;
    }

    .content-information {
        background-color: white;
        padding: 1em 0;
    }

    .content-information {
        text-align: center;
    }

    .information-detail {
        text-align: left;
        margin-left: 30px;
        width: 90%;

    }


    /* The Modal (background) */
    .modal {
        display: none;
        /* Hidden by default */
        position: fixed;
        /* Stay in place */
        z-index: 1;
        /* Sit on top */
        left: 0;
        top: 0;
        width: 100%;
        /* Full width */
        height: 100%;
        /* Full height */
        overflow: auto;
        /* Enable scroll if needed */
        background-color: rgb(0, 0, 0);
        /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4);
        /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        height: 600px;
        width: 400px !important;
    }

    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    /* The Modal end */





    #moreMenu {
        display: none;
    }

</style>

<body>
    <jsp:include page="../headerForMember.jsp" />

    <div class="page-container">
        <div class="myPage-container">
            <div class="myPage-sider">
                <jsp:include page="include_memberSider.jsp" />
            </div>

            <div class="myPage-content">
                <div class="content-header">
                    <h3>my message</h3>
                </div>
                <div class="content-information shadow">
                    <!-- 임시공간 -->
                    <div id="toggleDIv"><button type="button" class="btn btn-link" id="toggleButton">${sessionScope.member.memberId }</button></div>
                    <div id="moreMenu"><button type="button" class="btn btn-link" id="sendButtton" value="${sessionScope.member.memberId }" onclick="fn_send(this)">쪽지보내기</button></div>
                    <!-- 요기까지 -->


                </div>


            </div>
        </div>
    </div>




    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span> <br>

            <span class="far fa-comment-alt">&nbsp;</span>
            <h5 style="color: #6f81f2">Message</h5>
            <form action="/sendMessage.do" id="frm_ms" method="POST">
                보내는 사람 : <input type="text" name="sender" class="form-control" value="${sessionScope.member.memberId }" readonly="readonly"><br>
                받는사 람 : <input type="text" name="receiver" class="form-control" id="receiver" value="" readonly="readonly"><br>
                <hr>
                <textarea name="content" cols="48" rows="12" style="resize: none;" placeholder="쪽지 내용을 입력해주세요"></textarea><br><br>
            </form>

            <input type="button" class="btn btn-info" id="send_btn" value="보내기">
            <input type="button" class="btn btn-danger" id="close_btn" value="닫기">
        </div>

    </div>



    <script>
        $(document).ready(function() {
            $('#toggleButton').click(function() {
                var state = $('#moreMenu').css('display');
                if (state == 'none') {
                    $('#moreMenu').show();
                } else {
                    $('#moreMenu').hide();
                }
            });

        });

        function fn_send(option) {
            $('#receiver').val(option.value);

            $('#myModal').css("display", "block");

        };

        $('.close').click(function() {
            $('#myModal').css("display", "none");
        });

        $('#close_btn').click(function() {
            $('#myModal').css("display", "none");
        });


        $('#send_btn').click(function() {
            $.ajax({
                url: "/sendMessage.do",
                type: "POST",
                data: $("#frm_ms").serialize(),
                dataType: "html",
                success: function(data) {
                    if (data > 0) {
                        alert("쪽지를 보냈습니다.")
                        $('#myModal').css("display", "none");
                    } else {
                        alert("쪽지 전송 실패.")
                        $('#myModal').css("display", "none");
                    }

                },
                error: function() {
                    alert("으엉 실패");
                }
            });

        });

    </script>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <jsp:include page="../footer.html"/>
</body>

</html>
