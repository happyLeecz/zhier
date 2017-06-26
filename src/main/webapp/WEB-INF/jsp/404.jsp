<%@ page  contentType="text/html;charset=UTF-8" language="java" %>
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
                <h1 style="text-align:center">WE GOT LOST</h1>
                <h3 style="text-align:center">HOW ABOUT HAVE A SONG</h3>
                <div align="center">
                    <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=1821593&auto=1&height=66"></iframe></div>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <a HREF="/zhier"><h3 style="text-align:center">I HAVE FOUND MY HEART</h3>></a>
  </div>












        </div>

    </div>
</div>

</body>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
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
            if ($('#searchText').val() == '')
                return false;
            else
                return true;
        }
    }

</script>

</html>
