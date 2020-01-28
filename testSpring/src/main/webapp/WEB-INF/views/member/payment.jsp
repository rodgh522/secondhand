<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <script src="https://kit.fontawesome.com/47a97bc968.js" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

    .content-payment {
        background-color: white;
        padding: 1em 0;
    }

    .payment-header {
        text-align: left;
        padding: 20px;
    }

    .payment-detail {
        margin-left: 30px;
        width: 50%;
    }

    .payment-detail2 {
        margin-top: 30px;
        margin-left: 30px;
        width: 90%;
    }

    .myPoint {
        text-align: center;
        width: 50%;
        height: 50px;
        display: inline-block;
    }

    .myPoint1 {
        background-color: #064166;
        color: white;
    }

    .myPoint2 {}

    .content-header2 {
        margin-top: 30px;
    }

    .content-payment2 {
        background-color: white;
        height: auto;
        padding: 20px;
    }

    .buyPoint {
        padding: 20px;
    }

    .payment_infoDiv {
        margin-top: 20px;
        display: none;

    }

    .point-warp {

        text-align: center;
        display: flex;
        flex-direction: row;

    }



    .point-5000 {
        width: 20%;
        float: left;

    }

    .point-10000 {
        width: 20%;
        float: left;
    }

    .point-15000 {
        width: 20%;
        float: left;
    }

    .point-30000 {
        width: 20%;
        float: left;
    }

    .point-select {
        width: 20%;
        float: left;
    }

    #p-title {
        width: 100%;
        height: 30%;
        padding: 12px;
        background-color: #00a2cd;
        color: white;
        border-left: 1px solid white;
        font-weight: bold;

    }

    #p-title:hover {
        background-color: #0083a6;
        color: white;
        font-weight: bold;
    }

    .p-content {
        width: 100%;
        height: 70%;
        padding: 30px;
        background-color: #0083a6;
        border-left: 1px solid white;


    }

    .ps-content {
        width: 100%;
        height: 70%;
        padding: 10px;
        background-color: #0083a6;
        border-left: 1px solid white;

    }


    .point-bottom {

        background-color: #1ea7cc;
        padding: 20px;
        border-top: 1px solid white;
        width: 100%;


    }

    #k-title {
        width: 100%;
        height: 30%;
        padding: 12px;
        background-color: #ffcd42;
        color: black;
        border-left: 1px solid white;
        font-weight: bold;
    }

    #k-title:hover {
        background-color: #ffbc00;
        color: white;
        font-weight: bold;
    }

    #c-title {
        width: 100%;
        height: 30%;
        padding: 12px;
        background-color: #ff6372;
        color: white;
        border-left: 1px solid white;
        font-weight: bold;

    }

    #c-title:hover {
        background-color: #dc5662;
        color: white;
        font-weight: bold;
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
                    <h3>My Point</h3>
                </div>
                <div class="content-payment shadow">
                    <form action="/updateMember.do" method="post">
                        <div class="payment-header">
                            <h5 style="color: #6f81f2">나의 현재 Point</h5>
                            <hr>
                        </div>
                        <div class="payment-detail">
                            <div class="myPoint shadow">
                                <div class="myPoint1">MyPoint</div>
                                <div class="myPoint2">
                                    <p id="resultPoint" style="color: #6f81f2">${sessionScope.member.mileage }
                                        Point</p>
                                </div>
                            </div>
                        </div>

                        <div class="payment-detail2">
                            <h5 style="color: #6f81f2">point란?</h5>
                            <hr>
                            <p>Gumtree에서 서비스하는 유료 컨텐츠만을 이용하기 위해 회원이 구매하는 인터넷상의 결제수단입니다.</p>
                        </div>
                    </form>
                </div>
                <div class="content-header2">
                    <h3>Buy Point</h3>
                </div>

                <!-- 휴대폰 소액결제 -->
                <div class="content-payment2">
                    <h5 style="color: #6f81f2">point 충전하기</h5>
                    <hr>
                    <h6 style="color: #6f81f2">충전하실 point의 결제방법을 선택하세요.</h6>
                    <div class="buyPoint">
                        <button class="btn btn-info shadow" class="btn" id="btn_phone" value="phoneDiv" onclick="fn_showDiv(this);">휴대폰</button>
                        <button class="btn btn-warning shadow" class="btn" id="btn_kakaoPay" value="kakaoDiv" onclick="fn_showDiv(this);">kakao
                            pay</button>
                        <button class="btn btn-danger shadow" class="btn" id="btn_card" value="credit" onclick="fn_showDiv(this);">신용카드</button>

                        <div class="payment_infoDiv rounded" id="phoneDiv">
                            <div class="point-warp shadow">
                                <div class="point-5000 rounded">
                                    <div class="p-title rounded-top" id="p-title">5000 Point</div>
                                    <div class="p-content rounded-bottom">
                                        <button type="button" class="btn btn-info shadow" id="btn_p" value="5000" onclick="fn_btn_p(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-10000 rounded">
                                    <div class="p-title rounded-top" id="p-title">10000 Point</div>
                                    <div class="p-content rounded-bottom">
                                        <button type="button" class="btn btn-info shadow" id="btn_p" value="10000" onclick="fn_btn_p(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-15000 rounded">
                                    <div class="p-title rounded-top" id="p-title">15000 Point</div>
                                    <div class="p-content rounded-bottom">
                                        <button type="button" class="btn btn-info shadow" id="btn_p" value="15000" onclick="fn_btn_p(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-30000 rounded ">
                                    <div class="p-title rounded-top" id="p-title">30000 Point</div>
                                    <div class="p-content rounded-bottom">
                                        <button type="button" class="btn btn-info shadow" id="btn_p" value="30000" onclick="fn_btn_p(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-select rounded">
                                    <div class="p-title rounded-top" id="p-title">select Point</div>
                                    <div class="ps-content rounded-bottom">
                                        <input type="text" class="form-control" style="height: 20px; background-color: #d3ffff;" id="input-money" placeholder="금액 입력" size="15"> <span id="help_ps"></span><br>
                                        <button type="button" class="btn btn-info shadow" id="btn_p" onclick="fn_btn_ps()">충전하기</button>
                                    </div>

                                </div>


                            </div>
                            <div class="point-bottom shadow" id="phoneDiv">
                                <h5 style="color: white">휴대폰 소액결제</h5>
                                <hr>
                                <pre style="color:white">
<b>휴대폰을 통해 소정의 인증절차를 거친 뒤에 point 충전이 가능합니다.</b>

충전요금은 다음달 휴대폰 요금고지서의 정보이용료 항목으로 통합 청구됩니다.
휴대폰번호 명의자의 주민등록번호와 입력한 주민등록번호가 일치해야 하며
미성년자, 법인휴대폰은 이용할 수 없습니다.
								</pre>
                            </div>
                        </div>



                        <!-- kakaopay -->

                        <div class="payment_infoDiv rounded shadow" id="kakaoDiv">
                            <div class="point-warp shadow">
                                <div class="point-5000 rounded">
                                    <div class="p-title rounded-top" id="k-title">5000 Point</div>
                                    <div class="p-content rounded-bottom" style="background-color:#d8a200; color:black">
                                        <button type="button" class="btn btn-warning shadow" id="btn_p" value="5000" onclick="fn_btn_k(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-10000 rounded">
                                    <div class="p-title rounded-top" id="k-title">10000 Point</div>
                                    <div class="p-content rounded-bottom" style="background-color:#d8a200; color:black">
                                        <button type="button" class="btn btn-warning shadow" id="btn_p" value="10000" onclick="fn_btn_k(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-15000 rounded">
                                    <div class="p-title rounded-top" id="k-title">15000 Point</div>
                                    <div class="p-content rounded-bottom" style="background-color:#d8a200; color:black">
                                        <button type="button" class="btn btn-warning shadow" id="btn_p" value="15000" onclick="fn_btn_k(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-30000 rounded ">
                                    <div class="p-title rounded-top" id="k-title">30000 Point</div>
                                    <div class="p-content rounded-bottom" style="background-color:#d8a200; color:black">
                                        <button type="button" class="btn btn-warning shadow" id="btn_p" value="30000" onclick="fn_btn_k(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-select rounded">
                                    <div class="p-title rounded-top" id="k-title">select Point</div>
                                    <div class="ps-content rounded-bottom" style="background-color:#d8a200; color:black">
                                        <input type="text" class="form-control" class="input-money" style="height: 20px; background-color: #ffd86a;" id="input-money-ks" placeholder="금액 입력" size="15"> <span id="help_ks"></span><br>
                                        <button type="button" class="btn btn-warning shadow" id="btn_p" onclick="fn_btn_ks()">충전하기</button>
                                    </div>

                                </div>


                            </div>
                            <div class="point-bottom shadow" id="phoneDiv" style="background-color:#ffce44; color:black">
                                <h5>kakao pay</h5>
                                <hr>
                                <pre>
<b>카카오페이</b>

카카오페이 서비스 가입 후 결제가 가능합니다.
카카오페이에 등록한 카드와 카카오머니로 간편하게 결제할 수 있습니다.
								</pre>
                            </div>
                        </div>




                        <!-- 신용카드 -->

                        <div class="payment_infoDiv rounded shadow" id="credit">
                            <div class="point-warp shadow">
                                <div class="point-5000 rounded">
                                    <div class="p-title rounded-top" id="c-title">5000 Point</div>
                                    <div class="p-content rounded-bottom" style="background-color:#dc5662; color:black">
                                        <button type="button" class="btn btn-danger shadow" id="btn_c" value="5000" onclick="fn_btn_c(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-10000 rounded">
                                    <div class="p-title rounded-top" id="c-title">10000 Point</div>
                                    <div class="p-content rounded-bottom" style="background-color:#dc5662; color:black">
                                        <button type="button" class="btn btn-danger shadow" id="btn_c" value="10000" onclick="fn_btn_c(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-15000 rounded">
                                    <div class="p-title rounded-top" id="c-title">15000 Point</div>
                                    <div class="p-content rounded-bottom" style="background-color:#dc5662; color:black">
                                        <button type="button" class="btn btn-danger shadow" id="btn_c" value="15000" onclick="fn_btn_c(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-30000 rounded ">
                                    <div class="p-title rounded-top" id="c-title">30000 Point</div>
                                    <div class="p-content rounded-bottom" style="background-color:#dc5662; color:black">
                                        <button type="button" class="btn btn-danger shadow" id="btn_c" value="30000" onclick="fn_btn_c(this)">충전하기</button>
                                    </div>
                                </div>
                                <div class="point-select rounded">
                                    <div class="p-title rounded-top" id="c-title">select Point</div>
                                    <div class="ps-content rounded-bottom" style="background-color:#dc5662; color:white">
                                        <input type="text" class="form-control" class="input-money-c" style="height: 20px; background-color: #ff8994;" id="input-money-cs" placeholder="금액 입력" size="15"> <span id="help_cs"></span><br>
                                        <button type="button" class="btn btn-danger shadow" id="btn_cs" onclick="fn_btn_cs()">충전하기</button>
                                    </div>

                                </div>


                            </div>
                            <div class="point-bottom shadow" id="phoneDiv" style="background-color:#ff6372; color:white">
                                <h5 style="color:white">신용카드/계좌이체/가상계좌</h5>
                                <hr>
                                <pre style="color:white">
<b>신용카드로 point 충전이 가능합니다.</b>

카드 종류에 따라 신용카드 정보(ISP, 안심클릭) 혹은 공인인증서가 필요합니다.
본인의 신용카드로만 결제해야 하며 타인 카드정보를 도용하는 경우 범죄행위에 해당하므로
형사처벌 대상이 될 수 있습니다.
								</pre>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <form method="POST" id="formData">
        <input type="hidden" name="memberId" value="${sessionScope.member.memberId }">
        <input type="hidden" name="mileage" value="${sessionScope.member.mileage }">
        <input type="hidden" id="mData" name="mData" value="">
    </form>

    <script>
        function fn_showDiv(result) {
            var val = result.value;
            if ($("#" + val + "").css('display') == "none") {
                $(".payment_infoDiv").css('display', 'none');
                $("#" + val + "").css('display', 'block');
            } else {
                $(".payment_infoDiv").css('display', 'none');
            }
        };

        $('#input-money').focusin(function() {
            $('#help_ps').html("1,000원 이상 충전가능");
            $('#help_ps').css("color", "white");
        });

    </script>

    <!-- 휴대폰 소액결제 -->
    <script>
        function fn_btn_p(option) {
            var money = option.value;
            var IMP = window.IMP; // 생략가능
            IMP.init('imp45735715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

            IMP.request_pay({
                pg: 'danal', //아임포트 관리자에서 danal_tpay를 기본PG로 설정하신 경우는 생략 가능
                pay_method: 'phone', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
                merchant_uid: 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
                name: money + 'Point 주문명:결제테스트',
                amount: money,
                buyer_email: 'iamport@siot.do',
                buyer_name: '구매자이름',
                buyer_tel: '010-2345-1342', //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요
                buyer_addr: '서울특별시 강남구 삼성동',
                buyer_postcode: '123-456'
            }, function(rsp) {
                if (rsp.success) {
                    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                    jQuery.ajax({
                        url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            imp_uid: rsp.imp_uid
                            //기타 필요한 데이터가 있으면 추가 전달
                        }

                    }).done(function(data) {
                        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                        if (everythings_fine) {
                            var msg = '결제가 완료되었습니다.';
                            msg += '\n고유ID : ' + rsp.imp_uid;
                            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                            msg += '\결제 금액 : ' + rsp.paid_amount;
                            msg += '카드 승인번호 : ' + rsp.apply_num;

                            alert(msg);
                        } else {
                            //[3] 아직 제대로 결제가 되지 않았습니다.
                            //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                        }
                    });
                    alert('결제가 완료되었습니다.');
                    $('#mData').attr("value", money);


                    $.ajax({
                        url: "/buyPoint.do",
                        type: "POST",
                        data: $("#formData").serialize(),
                        dataType: "text",
                        success: function(data) {
                            $('#resultPoint').text(data);

                        },
                        error: function() {
                            alert("으엉 실패");
                        }
                    });

                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;

                    alert(msg);
                }
            });
        };

        /* 금액 선택 */
        function fn_btn_ps() {
            var money = $("#input-money").val();

            if (money >= 1000) {
                var IMP = window.IMP; // 생략가능
                IMP.init('imp45735715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

                IMP.request_pay({
                    pg: 'danal', //아임포트 관리자에서 danal_tpay를 기본PG로 설정하신 경우는 생략 가능
                    pay_method: 'phone', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
                    merchant_uid: 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
                    name: money + 'Point 주문명:결제테스트',
                    amount: money,
                    buyer_email: 'iamport@siot.do',
                    buyer_name: '구매자이름',
                    buyer_tel: '010-2345-1342', //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요
                    buyer_addr: '서울특별시 강남구 삼성동',
                    buyer_postcode: '123-456'
                }, function(rsp) {
                    if (rsp.success) {
                        //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                        jQuery.ajax({
                            url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                            type: 'POST',
                            dataType: 'json',
                            data: {
                                imp_uid: rsp.imp_uid
                                //기타 필요한 데이터가 있으면 추가 전달
                            }

                        }).done(function(data) {
                            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                            if (everythings_fine) {
                                var msg = '결제가 완료되었습니다.';
                                msg += '\n고유ID : ' + rsp.imp_uid;
                                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                                msg += '\결제 금액 : ' + rsp.paid_amount;
                                msg += '카드 승인번호 : ' + rsp.apply_num;

                                alert(msg);
                            } else {
                                //[3] 아직 제대로 결제가 되지 않았습니다.
                                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                            }
                        });
                        alert('결제가 완료되었습니다.');
                        $('#mData').attr("value", money);


                        $.ajax({
                            url: "/buyPoint.do",
                            type: "POST",
                            data: $("#formData").serialize(),
                            dataType: "text",
                            success: function(data) {
                                $('#resultPoint').text(data);

                            },
                            error: function() {
                                alert("으엉 실패");
                            }
                        });
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;

                        alert(msg);
                    }
                });
            } else {
                alert("최소금액 1000원 이상 부터 충전 가능합니다.");
            }
        };

    </script>





    <!-- kakaopay -->
    <script>
        $('#input-money-ks').focusin(function() {
            $('#help_ks').html("1,000원 이상 충전가능");
            $('#help_ks').css("color", "white");
        });

    </script>

    <script>
        function fn_btn_k(option) {
            var money = option.value;

            var IMP = window.IMP; // 생략가능
            IMP.init('imp45735715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

            IMP.request_pay({
                pg: 'kakaopay', // version 1.1.0부터 지원.
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: money + 'point 주문명:결제테스트',
                amount: money,
                buyer_email: '${sessionScope.member.memberId}',
                buyer_name: '${sessionScope.member.memberName}',
                buyer_tel: '${sessionScope.member.phone}',
                buyer_addr: '${sessionScope.member.memberAddr}',
                buyer_postcode: '123-456',
                m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            }, function(rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;

                    alert('결제가 완료되었습니다.');
                    $('#mData').attr("value", money);

                    $.ajax({
                        url: "/buyPoint.do",
                        type: "POST",
                        data: $("#formData").serialize(),
                        dataType: "text",
                        success: function(data) {
                            $('#resultPoint').text(data);

                        },
                        error: function() {
                            alert("으엉 실패");
                        }
                    });

                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
        }




        function fn_btn_ks() {
            var money = $('#input-money-ks').val();
            if (money >= 1000) {

                var IMP = window.IMP; // 생략가능
                IMP.init('imp45735715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

                IMP.request_pay({
                    pg: 'kakaopay', // version 1.1.0부터 지원.
                    pay_method: 'card',
                    merchant_uid: 'merchant_' + new Date().getTime(),
                    name: money + 'point 주문명:결제테스트',
                    amount: money,
                    buyer_email: '${sessionScope.member.memberId}',
                    buyer_name: '${sessionScope.member.memberName}',
                    buyer_tel: '${sessionScope.member.phone}',
                    buyer_addr: '${sessionScope.member.memberAddr}',
                    buyer_postcode: '123-456',
                    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
                }, function(rsp) {
                    if (rsp.success) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : ' + rsp.imp_uid;
                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;

                        alert('결제가 완료되었습니다.');
                        $('#mData').attr("value", money);

                        $.ajax({
                            url: "/buyPoint.do",
                            type: "POST",
                            data: $("#formData").serialize(),
                            dataType: "text",
                            success: function(data) {
                                $('#resultPoint').text(data);

                            },
                            error: function() {
                                alert("으엉 실패");
                            }
                        });

                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                    }
                    alert(msg);
                });
            } else {
                alert("최소금액 1000원 이상 부터 충전 가능합니다.");
            }
        }

    </script>


    <!-- 신용카드/계좌이체/가상계좌 -->
    <script>
        $('#input-money-cs').focusin(function() {
            $('#help_cs').html("1,000원 이상 충전가능");
            $('#help_cs').css("color", "white");
        });

    </script>

    <script>
        function fn_btn_c(option) {
            var money = option.value;

            var IMP = window.IMP; // 생략가능
            IMP.init('imp45735715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

            IMP.request_pay({
                pg: 'danal_tpay', // version 1.1.0부터 지원.
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: money + 'point 주문명:결제테스트',
                amount: money,
                buyer_email: '${sessionScope.member.memberId}',
                buyer_name: '${sessionScope.member.memberName}',
                buyer_tel: '${sessionScope.member.phone}',
                buyer_addr: '${sessionScope.member.memberAddr}',
                buyer_postcode: '123-456',
                m_redirect_url: 'https://www.yourdomain.com/payments/complete'
            }, function(rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;

                    alert('결제가 완료되었습니다.');
                    $('#mData').attr("value", money);

                    $.ajax({
                        url: "/buyPoint.do",
                        type: "POST",
                        data: $("#formData").serialize(),
                        dataType: "text",
                        success: function(data) {
                            $('#resultPoint').text(data);

                        },
                        error: function() {
                            alert("으엉 실패");
                        }
                    });

                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
        }




        function fn_btn_cs() {
            var money = $('#input-money-cs').val();
            if (money >= 1000) {

                var IMP = window.IMP; // 생략가능
                IMP.init('imp45735715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

                IMP.request_pay({
                    pg: 'danal_tpay', // version 1.1.0부터 지원.
                    pay_method: 'card',
                    merchant_uid: 'merchant_' + new Date().getTime(),
                    name: money + 'point 주문명:결제테스트',
                    amount: money,
                    buyer_email: '${sessionScope.member.memberId}',
                    buyer_name: '${sessionScope.member.memberName}',
                    buyer_tel: '${sessionScope.member.phone}',
                    buyer_addr: '${sessionScope.member.memberAddr}',
                    buyer_postcode: '123-456',
                    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
                }, function(rsp) {
                    if (rsp.success) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : ' + rsp.imp_uid;
                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;

                        alert('결제가 완료되었습니다.');
                        $('#mData').attr("value", money);

                        $.ajax({
                            url: "/buyPoint.do",
                            type: "POST",
                            data: $("#formData").serialize(),
                            dataType: "text",
                            success: function(data) {
                                $('#resultPoint').text(data);

                            },
                            error: function() {
                                alert("으엉 실패");
                            }
                        });

                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                    }
                    alert(msg);
                });
            } else {
                alert("최소금액 1000원 이상 부터 충전 가능합니다.");
            }
        }

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
