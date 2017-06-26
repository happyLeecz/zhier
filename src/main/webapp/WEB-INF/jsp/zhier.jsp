
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎来到Zhier</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h1 class="text-center">
                Zhier
            </h1>

            <div class="tabbable" > <!-- Only required for left/right tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab1" data-toggle="tab">登录</a></li>
                    <li><a href="#tab2" data-toggle="tab">注册</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab1">
                        <br/>
                        <br/>
                        <form id="from1"  class="form-horizontal" role="form" action="/zhier/login" method="post" onsubmit="return checkIfRight2()">

                           <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputName4">用户名</label>
                                <div class="col-sm-3">
                                    <input class="form-control" id="inputName4" type="text" name="userName"/>

                                </div>
                               <label class="control-label" id="label1"></label>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputPassword5">密码</label>
                                <div class="col-sm-3">
                                    <input class="form-control" id="inputPassword5" type="password" name="password"/>
                                </div>
                                <label class="control-label" id="label2"></label>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-3">
                                    <button class="btn btn-primary" type="submit" >登录</button>
                                </div>
                            </div>
                        </form>
                    </div>


                    <div class="tab-pane" id="tab2">
                        <form id = "form2" class="form-horizontal" role="form" method="post" action="/zhier/register" onsubmit="return checkIfRight()">
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputName3">用户名</label>
                                <div class="col-sm-3">
                                    <input class="form-control" id="inputName3" type="text" name="userName"/>
                                </div>
                                <label class="control-label" id="label3"></label>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputPassword3">密码</label>
                                <div class="col-sm-3">
                                    <input class="form-control" id="inputPassword3" type="password" name="password"/>
                                </div>
                                <label class="control-label" id="label4"></label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputPassword4">确认密码</label>
                                <div class="col-sm-3">
                                    <input class="form-control" id="inputPassword4" type="password" />
                                </div>
                                <label class="control-label" id="label5"></label>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="inputEmail3">邮箱</label>
                                <div class="col-sm-3">
                                    <input class="form-control" id="inputEmail3" type="email" name="userEmail"/>
                                </div>
                                <label class="control-label" id="label6"></label>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-3">
                                    <label class="checkbox-inline">
                                        <input type="radio" name="sex" id="optionsRadios1" value="1" checked>
                                        男
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="sex" id="optionsRadios2" value="0">
                                        女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-3">
                                    <button id = "btn1" class="btn btn-primary" type="submit">注册</button>
                                </div>
                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

    function checkIfRight() {
        var result = true;
        if ($('#inputName3').val() == '') {
            $('#label3').text('用户名不能为空');
            result = false;
        } else {
            $('#label3').text('用户名格式通过');
        }
        if ($('#inputPassword3').val() == '') {
            $('#label4').text('密码不能为空');
            result = false;
        } else {
            $('#label4').text('密码格式通过');
        }
        if ($('#inputPassword4').val() == '') {
            $('#label5').text('确认密码不能为空');
            result = false;
        } else {
            if ($('#inputPassword4').val() !== $('#inputPassword3').val()) {
                result = false;
                $('#label5').text('确认密码错误');
            }else{
                $('#label5').text('密码验证正确');
            }

        }
        return result;
    }

    function checkIfRight2() {
        var result =true;
        if($('#inputName4').val()==''){
            $('#label1').text('用户名不能为空');
            result =false;
        }else{
            $('#label1').text('');
        }

        if($('#inputPassword5').val()==''){
            $('#label2').text('密码不能为空');
            result= false;
        }else{
            $('#label2').text('');
        }
        return result;
    }



    </script>
</html>
