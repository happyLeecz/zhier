
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
            <h1>
                ${toseeuser.userName}<button id="followBtn" class="btn" ></button>
            </h1>
            <br/>
            <br/>
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#answers" data-toggle="tab">回答</a></li>
                <li><a href="#Questions" data-toggle="tab">提问</a></li>
                <li><a href="#following" data-toggle="tab">关注的人</a></li>
                <li><a href="#follower" data-toggle="tab">谁关注他</a></li>
                <li><a href="#concernedQuestion" data-toggle="tab">关注的问题</a></li>
            </ul>
             
            <div class="tab-content">
                <div class="tab-pane active" id="answers">
                    <c:forEach var="answer" items="${toseeUserAnswers}">
                    <div class="jumbotron">
                        <h2>
                            <a href="/zhier/${answer.questionId}/question">${answer.questionText}</a>
                        </h2>

                            <c:if test="${fn:length(answer.answerText) > 60}">
                                <h3>${fn:substring(answer.answerText,0,60)}...</h3>
                            </c:if>
                           <c:if test="${fn:length(answer.answerText) <= 60}">
                                <h3>${answer.answerText}</h3>
                           </c:if>

                        <a class="btn btn-primary" href="/zhier/${answer.questionId}/question/${answer.answerId}/answer">查看回答</a>
                    </div>
                    </c:forEach>

                </div>

                <div class="tab-pane" id="Questions">
                 <c:forEach var="question" items="${toseeUserQuestions}">
                    <div class="jumbotron">
                        <h2>
                            <a href="/zhier/${question.questionId}/question">${question.questionText}</a>
                        </h2>
                     <h5>发布于：<fmt:formatDate value="${question.createTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h5>
                     <h5>最近更新时间：<fmt:formatDate value="${question.latestUpdateTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h5>
                    </div>
                     </c:forEach>
                </div>

                <div class="tab-pane" id="following">
                    <c:forEach var="fing" items="${following}">
                        <div class="jumbotron">
                                <a href="/zhier/${fing.userId}/user">${fing.userName}</a>
                        </div>
                    </c:forEach>

                </div>

                <div class="tab-pane" id="follower">
                        <c:forEach var="fer" items="${follower}">
                            <div class="jumbotron">
                                <a href="/zhier/${fer.userId}/user">${fer.userName}</a>
                            </div>
                        </c:forEach>
                </div>

                <div class="tab-pane" id="concernedQuestion">
                    <c:forEach var="que" items="${concernedQ}">
                        <div class="jumbotron">
                            <h2>
                                <a href="/zhier/${que.questionId}/question">${que.questionText}</a>
                            </h2>
                            <h5>发布于：<fmt:formatDate value="${que.createTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h5>
                            <h5>最近更新时间：<fmt:formatDate value="${que.latestUpdateTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h5>
                        </div>
                    </c:forEach>
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
    $(document).ready(function () {

        $('#followBtn').hide();
        if(${zhieruser.userId} == ${toseeuser.userId});
else{
            $('#followBtn').show();
        $.post('/zhier/iffollow',{userId:${zhieruser.userId},followingId:${toseeuser.userId}},function (result) {
            if(result && result['result']==true){
                $('#followBtn').removeClass('btn-primary');
                $('#followBtn').addClass('btn-default');
                $('#followBtn').text('正在关注');
            }else{
                $('#followBtn').removeClass('btn-default');
                $('#followBtn').addClass('btn-primary');
                $('#followBtn').text('关注');
            }
        });

        $('#followBtn').click(function () {
            $.post('/zhier/iffollow',{userId:${zhieruser.userId},followingId:${toseeuser.userId}},function (result) {
                if(result && result['result']==true){
                    $.post('/zhier/followordelete',{userId:${zhieruser.userId},followingId:${toseeuser.userId},type:0},function (result2) {
                        if(result2 && result2['result']==true) {
                            $('#followBtn').removeClass('btn-default');
                            $('#followBtn').addClass('btn-primary');
                            $('#followBtn').text('关注');
                        }
                    });
                }else{
                    $.post('/zhier/followordelete',{userId:${zhieruser.userId},followingId:${toseeuser.userId},type:1},function (result3) {
                        if(result3 && result3['result']==true) {
                            $('#followBtn').removeClass('btn-primary');
                            $('#followBtn').addClass('btn-default');
                            $('#followBtn').text('正在关注');
                        }
                    });
                }
            });
        });
        }



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

    function check() {
        if($('#searchText').val()=='')
            return false;
        else
            return true;
    }



</script>
</html>
