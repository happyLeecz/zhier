
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp"%>
<html>
<head>
    <title>欢迎来到Zhier</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="modal fade" id="updateAnswer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title " id="myModalLabel">修改问题</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="/zhier/${zhierquestion.questionId}/question/${zhieranswer.answerId}/updateA" method="post" onsubmit="return checkIfRight();">
                    <br/>
                    <br/>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="newAnswerText">问题内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control " rows="8" id="newAnswerText" name="newAnswerText">${zhieranswer.answerText}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">
                            <button class="btn btn-primary" type="submit">提交</button>
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
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input class="form-control" type="text" />
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
                <span class="label label-default" >${zhierquestion.questionTag}</span>
                <h1>
                    <a href="/zhier/${zhierquestion.questionId}/question">${zhierquestion.questionText}</a>
                </h1>
                <br/>
                <br/>
                <h6>发布人：<a href="/zhier/${zhierquestion.createUserId}/user">${zhierquestion.createUserName}</a> </h6>
                <h6>发布于：<fmt:formatDate value="${zhierquestion.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </h6>
                <h6>最近更新时间：<fmt:formatDate value="${zhierquestion.latestUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </h6>
            </div>
        </div>
    </div>

    <h2>
        <a href="/zhier/${zhieranswer.userId}/user">${zhieranswer.userName}</a>
    </h2>
    <p>
        ${zhieranswer.answerText}
       </p>
    <br/>

    <h6>回答于：<fmt:formatDate value="${zhieranswer.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </h6>
    <h6>最近更新时间：<fmt:formatDate value="${zhieranswer.latestUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </h6>
    <a class="btn btn-primary btn-large" data-toggle="modal" href="#updateAnswer" id="updateAnswerBtn">修改回答</a>
    <hr />




</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">


    $(function () {
    var userId=${zhieruser.userId},answerUserId=${zhieranswer.userId};
    if(userId!=answerUserId)
            $('#updateAnswerBtn').hide();

});
    function checkIfRight() {
        var result = true;
        if($('#newAnswerText').val()==''){
            result = false;
        }
        return result;
    }
</script>
</html>
