
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


<div class="modal fade" id="updateQuestion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title " id="myModalLabel1">修改问题</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" >
                    <br/>
                    <br/>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="newQuestionText">问题内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control " rows="8" id="newQuestionText" name="newQuestionText"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">
                            <button id="btnUpdateQ" class="btn btn-primary" type="button">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>



<div class="modal fade" id="answerQuestion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title " id="myModalLabel2">回答问题</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" >
                    <br/>
                    <br/>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="newQuestionText">请写出你的回答</label>
                        <div class="col-sm-10">
                            <textarea class="form-control " rows="8" id="answerText" name="answerText"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">
                            <button id="btnAnswerQ" class="btn btn-primary" type="button">提交</button>
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
                <button id="concernqBtn" class="btn pull-right" ></button>
                <br/>
                <br/>
                <span class="label label-primary" ><a style="color:white" href="/zhier/${zhierquestion.questionTag}/questionsByTag">${zhierquestion.questionTag}</a> </span>
                <h1 style="color: blueviolet">
                    ${zhierquestion.questionText}
                </h1>
                <br/>
                <br/>
                <h5 >发布人：<a  href="/zhier/${zhierquestion.createUserId}/user">${zhierquestion.createUserName}</a> </h5>
                <h5 >发布于：<fmt:formatDate value="${zhierquestion.createTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h5>
                <h5 >最近更新时间：<fmt:formatDate value="${zhierquestion.latestUpdateTime}" pattern="yyyy年MM月dd日 HH:mm"/> </h5>
                <a class="btn btn-primary btn-large "data-toggle="modal" href="#answerQuestion" id="answerQuestionBtn">回答问题</a>
                <a class="btn btn-primary btn-large" data-toggle="modal" href="#updateQuestion" id="updateQuestionBtn">修改问题</a>
                <a class="btn pull-right" id="report" style="color: grey" >举报</a>

            </div>
        </div>
    </div>
<span>共${answerNumber}条回答</span>
    <hr/>
<c:forEach var="answer" items="${answers}" varStatus="a">
    <h2>
        <a style="color:black" href="/zhier/${answer.userId}/user">${answer.userName}</a>
    </h2>
    <h4>
        <c:if test="${fn:length(answer.answerText) > 60}">
           ${fn:substring(answer.answerText,0,60)}...
        </c:if>
        <c:if test="${fn:length(answer.answerText) <= 60}">
            ${answer.answerText}
        </c:if>
            <a  style="color:blueviolet" class="btn" href="/zhier/${zhierquestion.questionId}/question/${answer.answerId}/answer">查看全部 »</a>
    </h4>
    <br/>
    <h5 style="color:blueviolet">回答于：<fmt:formatDate value="${answer.createTime}" pattern="yyyy年MM月dd日 HH:mm"/></h5>
    <h5 style="color:blueviolet">最近更新时间：<fmt:formatDate value="${answer.latestUpdateTime}" pattern="yyyy年MM月dd日 HH:mm"/></h5>
    <ul class="nav nav-pills" >
        <li >
            <a class="disabled"  > <span   class="badge pull-right">${likenums[a.index]}</span> 赞</a>
        </li>
        <li >
            <a class="disabled"  > <span   class="badge pull-right">${dislikenums[a.index]}</span> 反对</a>
        </li>

        <li >
            <a href="/zhier/${zhierquestion.questionId}/question/${answer.answerId}/answer/comment">评论(${commentNumbers[a.index]})</a>
        </li>

        <a class="btn pull-right reportAnswer" style="color: grey" value="${answer.answerId}">举报</a>
    </ul>
    <hr />
</c:forEach>
    <h1>Zhier</h1>
    <h6>Designed by <a href="https://github.com/happyLeecz">CZ</a></h6>



</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        $('#answerQuestionBtn').hide();
        $('#updateQuestionBtn').hide();

        $.post('/zhier/ifHaveAnswered',{userId:${zhieruser.userId},questionId:${zhierquestion.questionId}},function (result) {
            if(result && !result['result']){
                $('#answerQuestionBtn').show();
            }

        });

        $.post('/zhier/ifconcern',{userId:${zhieruser.userId},questionId:${zhierquestion.questionId}},function (result) {
            if(result && result['result'] == true){
                $('#concernqBtn').removeClass('btn-primary');
                $('#concernqBtn').addClass('btn-default');
                $('#concernqBtn').text('正在关注');
            }else{
                $('#concernqBtn').removeClass('btn-default');
                $('#concernqBtn').addClass('btn-primary');
                $('#concernqBtn').text('关注该问题');
            }
        });

        $('#concernqBtn').click(function () {
           $.post('/zhier/ifconcern',{userId:${zhieruser.userId},questionId:${zhierquestion.questionId}},function (result) {
              if(result && result['result'] == true){
                  $.post('/zhier/concernordelete',{userId:${zhieruser.userId},questionId:${zhierquestion.questionId},type:0},function (result2) {
                     if(result2 && result2['result'] == true){
                         $('#concernqBtn').removeClass('btn-default').addClass('btn-primary').text('关注该问题');
                     }
                  });
              }else{
                  $.post('/zhier/concernordelete',{userId:${zhieruser.userId},questionId:${zhierquestion.questionId},type:1},function (result3) {
                      if(result3 && result3['result'] == true){
                          $('#concernqBtn').removeClass('btn-primary').addClass('btn-default').text('正在关注');
                      }
                  });
              }

           });
        });


        $(function () {
            var userId = ${zhieruser.userId},createUserId=${zhierquestion.createUserId},
                    userAuthority = ${zhieruser.userAuthority};
            if(userId == createUserId ){
                $('#updateQuestionBtn').show();
            }

        });



//为提问的提交按钮提供点击事件
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


        $('#btnUpdateQ').click(function(){
            if($('#newQuestionText').val() == '' )
                    return false;
            else{
           var url='/zhier/'+ ${zhierquestion.questionId} + '/updateQ';
                $.post(url,{newQuestionText:$('#newQuestionText').val()},function (result) {
                            if(result && result['result']){
                                $('#updateQuestion').modal('hide');
                                window.location.reload();
                            }else {
                                console.log('not ok');
                                alert("抱歉，提交未成功");
                            }
                        }
                );
            }
        });

        $('#updateQuestionBtn').click(function () {
            $('#newQuestionText').val('${zhierquestion.questionText}');
        });

 //点击回答问题的提交按钮就可以提交问题回答
        $('#btnAnswerQ').click(function(){
            if($('#answerText').val()!=''){
            var url='/zhier/'+ ${zhierquestion.questionId} +'/answerQ';
            var userId =${zhieruser.userId} , userName = '${zhieruser.userName}';
            $.post(url,{questionId:${zhierquestion.questionId}, userId:userId , userName:userName , answerText:$('#answerText').val()},function (result) {
                        if(result && result['result']){
                            $('#answerQuestion').modal('hide');
                            $('#answerText').val('');
                            window.location.reload();
                        }else {
                            console.log('not ok');
                            alert("抱歉，提交未成功");
                        }
                    }
            );}else return false;
        });

        $('#report').click(function () {
            $.post('/zhier/report',{reportId:${zhierquestion.questionId},reportType:0,reportUserId:${zhieruser.userId}},function (result) {
                if(result && result['result'])
                    alert("举报成功，感谢您的举报让Zhier变得更好");
                else
                    alert("此内容已被举报，感谢您的支持");
            });
        });

        $('.reportAnswer').click(function () {
            $.post('/zhier/report',{reportId:$(this).attr('value'),reportType:1,reportUserId:${zhieruser.userId}},function (result) {
                if(result && result['result'])
                    alert("举报成功，感谢您的举报让Zhier变得更好");
                else
                    alert("此内容已被举报，感谢您的支持");
            });
        })
    });



//检查输入的内容是否为空
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

</body>

</html>
