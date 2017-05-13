
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp"%>
<html>
<head>
    <title>欢迎来到Zhier</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="modal fade" id="raiseQuestion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title " id="myModalLabel">提问</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" >
                    <br/>
                    <br/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="questionTag">问题标签</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="questionTag" type="text" name="questionTag"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="questionText">问题内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control " rows="8" id="questionText" name="questionText"></textarea>
                        </div>
                    </div>

                    <div class="form-group hidden" >
                        <label class="col-sm-2 control-label" for="createUserId">创建问题用户id</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="createUserId" type="number" name="createUserId" value="${zhieruser.userId}"/>
                        </div>
                    </div>

                    <div class="form-group hidden" >
                        <label class="col-sm-2 control-label" for="createUserName">创建问题用户名</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="createUserName" type="text" name="createUserName" value="${zhieruser.userName}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">
                            <button id="btnRaiseQ" class="btn btn-primary" type="button">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<div class="modal fade" id="updateAnswer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title " id="myModalLabel1">修改回答</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <br/>
                    <br/>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="newAnswerText">问题内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control " rows="8" id="newAnswerText" name="newAnswerText"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">
                            <button id="btnUpdateA" class="btn btn-primary" type="button">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="/zhier">Zhier</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="#raiseQuestion" data-toggle="modal" >提问</a>
                        </li>
                        <li>
                            <a href="#">标签</a>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search" method="post" action="/zhier/search" onsubmit="return check()">
                        <div class="form-group">
                            <input class="form-control" type="text" name="searchText" id="searchText"/>
                        </div> <button class="btn btn-primary" type="submit">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" data-toggle="dropdown">${zhieruser.userName}<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="/zhier/${zhieruser.userId}/user">个人中心</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="/zhier/quit">退出</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>

            </nav>
            <br/>
            <br/>
            <br/>
            <br/>
            <div class="jumbotron">
                <span class="label label-primary" ><a style="color:white" href="/zhier/${zhierquestion.questionTag}/questionsByTag">${zhierquestion.questionTag}</a></span>
                <h1>
                    <a style="color:blueviolet" href="/zhier/${zhierquestion.questionId}/question">${zhierquestion.questionText}</a>
                </h1>
                <br/>
                <br/>
                <h6>发布人：<a style="color:blueviolet" href="/zhier/${zhierquestion.createUserId}/user">${zhierquestion.createUserName}</a> </h6>
                <h6>发布于：<fmt:formatDate value="${zhierquestion.createTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h6>
                <h6>最近更新时间：<fmt:formatDate value="${zhierquestion.latestUpdateTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h6>
            </div>
        </div>
    </div>

    <h2>
        <a style="color:black" href="/zhier/${zhieranswer.userId}/user">${zhieranswer.userName}</a>
    </h2>
    <h3>
        ${zhieranswer.answerText}
       </h3>
    <br/>

    <h6 style="color:blueviolet">回答于：<fmt:formatDate value="${zhieranswer.createTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h6>
    <h6 style="color:blueviolet">最近更新时间：<fmt:formatDate value="${zhieranswer.latestUpdateTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h6>
    <a class="btn btn-primary btn-large" data-toggle="modal" href="#updateAnswer" id="updateAnswerBtn">修改回答</a>
    <br/>
    <br/>
    <ul class="nav nav-pills" >
        <li id="praiseli">
            <a class="btn" id="praise" > <span  id="praisespan" class="badge pull-right">${likenum}</span> 赞</a>
        </li>
        <li id="opposeli">
            <a class="btn" id="oppose" > <span  id="opposespan" class="badge pull-right">${dislikenum}</span> 反对</a>
        </li>

    </ul>
    <hr />




</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#updateAnswerBtn').hide();
//        $('#praiseli').removeClass('active');
//        $('#opposeli').removeClass('active');

        $.post('/zhier/ifshowlike',{answerId:${zhieranswer.answerId},userId:${zhieruser.userId}},function (result) {
            if(result && result['data'] == 1){
                $('#praiseli').addClass('active');
                return;
            }else
            if(result && result['data'] == 0){
                $('#opposeli').addClass('active');
                return;
            }
            else return;
        });


        $('#btnRaiseQ').click(function(){
            if(checkIfRight()){
                $.post('/zhier/raiseQuestion',{questionTag:$('#questionTag').val(),
                            questionText:$('#questionText').val(),
                            createUserId:$('#createUserId').val(),
                            createUserName:$('#createUserName').val()},function (result) {
                            if(result && result['result']){
                                console.log('ok');
                                $('#questionTag').val('');
                                $('#questionText').val('');
                                $('#raiseQuestion').modal('hide');
                            }else {
                                console.log('not ok');
                                alert("抱歉，提交未成功");
                            }
                        }
                );}return false;
        });



        $('#btnUpdateA').click(function(){
            if($('#newAnswerText').val()!=''){
            var url='/zhier/'+ ${zhierquestion.questionId} + '/question/' + ${zhieranswer.answerId} +'/updateA';
            $.post(url,{newAnswerText:$('#newAnswerText').val()},function (result) {
                        if(result && result['result']){
                            $('#updateAnswer').modal('hide');
                            window.location.reload();
                        }else {
                            console.log('not ok');
                            alert("抱歉，提交未成功");
                        }
                    }
            );}else return false;
        });

        $('#updateAnswerBtn').click(function () {
            $('#newAnswerText').html('${zhieranswer.answerText}');
        });

        $(function () {
            var userId=${zhieruser.userId},answerUserId=${zhieranswer.userId};
            if(userId == answerUserId)
                $('#updateAnswerBtn').show();

        });


        $('#praise').click(function () {
            var num;
            $.post('/zhier/ifshowlike',{answerId:${zhieranswer.answerId},userId:${zhieruser.userId}},function (result) {
                if(result && result['data'] == 1){
                    $.post('/zhier/likeorother',{answerId:${zhieranswer.answerId},userId:${zhieruser.userId},type:-1},function (result) {
                        if(result && result['result'] == true){
                            $('#praiseli').removeClass('active');
                            num = $('#praisespan').html()-1;
                            $('#praisespan').html(num);

                        }
                    });
                    return;

                }
                if(result && result['data'] == 0){
                    $.post('/zhier/likeorother',{answerId:${zhieranswer.answerId},userId:${zhieruser.userId},type:1},function (result) {
                        if(result && result['result'] == true){
                            $('#praiseli').addClass('active');
                            $('#opposeli').removeClass('active');
                            num = $('#opposespan').html()-1;
                            $('#opposespan').html(num);
                            num =$('#praisespan').html()-1+2;
                            $('#praisespan').html(num);
                        }
                    });
                    return;

                }
                if(result && result['data'] == -1){
                    $.post('/zhier/likeorother',{answerId:${zhieranswer.answerId},userId:${zhieruser.userId},type:1},function (result) {
                        if(result && result['result'] == true){
                            $('#praiseli').addClass('active');
                            num =$('#praisespan').html()-1+2;
                            $('#praisespan').html(num);
                        }
                    });
                    return;

                }
            });
        });

        $('#oppose').click(function () {
            var num;
            $.post('/zhier/ifshowlike',{answerId:${zhieranswer.answerId},userId:${zhieruser.userId}},function (result) {
                if(result && result['data'] == 0){
                    $.post('/zhier/likeorother',{answerId:${zhieranswer.answerId},userId:${zhieruser.userId},type:-1},function (result) {
                        if(result && result['result'] == true){
                            $('#opposeli').removeClass('active');
                            num = $('#opposespan').html()-1;
                            $('#opposespan').html(num);
                        }
                    });
                    return;
                }
                if(result && result['data'] == 1){
                    $.post('/zhier/likeorother',{answerId:${zhieranswer.answerId},userId:${zhieruser.userId},type:0},function (result) {
                        if(result && result['result']== true){
                            $('#opposeli').addClass('active');
                            $('#praiseli').removeClass('active');
                            num = $('#praisespan').html()-1;
                            $('#praisespan').html(num);
                            num =$('#opposespan').html()-1+2;
                            $('#opposespan').html(num);
                        }
                    });
                    return;
                }

                if(result && result['data'] == -1){
                    $.post('/zhier/likeorother',{answerId:${zhieranswer.answerId},userId:${zhieruser.userId},type:0},function (result) {
                        if(result && result['result']==true){
                            $('#opposeli').addClass('active');
                            num = $('#opposespan').html()-1+2;
                            $('#opposespan').html(num);
                        }
                    });
                    return;
                }

            });
        });
    });

    function checkIfRight() {
        var result =true;
        if($('#questionTag').val() == ''){
            result=false;
        }
        if($('#questionText').val()==''){
            result=false;
        }
        return result;
    }



    function checkIfRight2() {
        var result = true;
        if($('#newAnswerText').val()==''){
            result = false;
        }
        return result;
    }

    function check() {
        if($('#searchText').val()=='')
            return false;
        else
            return true;
    }
</script>
</html>
