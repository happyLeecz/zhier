<%@ page  contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp"%>

<html>
<head>
    <title>欢迎来到Zhier</title>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <style type="text/css">
        a.answer:hover{
            text-decoration: none;
        }
    </style>

</head>
<body>
<!-- 提问弹出层用来提交提问表格 -->
<div class="modal fade" id="raiseQuestion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title " id="myModalLabel">提问</h4>
            </div>
            <div class="modal-body">
                <form id="formRaiseQ" class="form-horizontal" role="form"  >
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

<div class="modal fade" id="comment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title " id="myModalLabel1">评论</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" >
                    <br/>
                    <br/>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="commentText">评论内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control " rows="8" id="commentText" name="commentText"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">
                            <button id="submitcomment" class="btn btn-primary" type="button">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>




<div class="modal fade" id="commentOnComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title " id="myModalLabel2">评论</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" >
                    <br/>
                    <br/>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="commentText">评论内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control " rows="8" id="commentText2" name="commentText"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">
                            <button id="submitcomment2" class="btn btn-primary" type="button">提交</button>
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
            <a class="btn btn-primary btn-large" data-toggle="modal" href="#comment" id="commentBtn">评论</a>
            共有${num}个评论
            <hr>

               <c:forEach var="comment" items="${comments}" varStatus="num">
                   <div>
                   <c:if test="${comment.commenttoUserId == 0}">
               <h2><a href="/zhier/${comment.commentUserId}/user">${comment.commentUserName}</a></h2>
                   </c:if>

                   <c:if test="${comment.commenttoUserId != 0}">
                       <h2><a href="/zhier/${comment.commentUserId}/user">${comment.commentUserName}</a>回复<a href="/zhier/${comment.commenttoUserId}/user">${comment.commenttoUserName}</a></h2>
                   </c:if>
                   <h4>${comment.commentText}</h4>
                   <h6><fmt:formatDate value="${comment.createTime}" pattern="yyyy年MM月dd日 HH:mm"></fmt:formatDate></h6>

                       <c:if test="${zhieruser.userId != comment.commentUserId}">
                   <h6><a class="recomment" href="#commentOnComment" data-toggle="modal" value="${comment.commentUserId}"> 回复 </a></h6>
                       </c:if>


                       <hr/>
                   </div>
               </c:forEach>


            

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
        var commentUserId;
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



        $('#commentBtn').click(function () {
            $('#commentText').val('');
        });

        $('.recomment').click(function () {
          commentUserId = $(this).attr('value');
            $('#commentText2').val('');
        });
        
        $('#submitcomment').click(function () {
            if($('#commentText').val()==''){
                return false;
            }else{
            $.post('/zhier/comment',{answerId:${answerId},commentUserId:${zhieruser.userId},commenttoUserId:0,commentText:$('#commentText').val(),type:0},function (result) {
                if(result && result['result']){
                    window.location.reload();
                }
            });
            }
        });

        $('#submitcomment2').click(function () {
            if($('#commentText2').val()==''){
                return false;
            }else{
            $.post('/zhier/comment',{answerId:${answerId},commentUserId:${zhieruser.userId},commenttoUserId:commentUserId,commentText:$('#commentText2').val(),type:1},function (result) {
                if(result && result['result']){
                    window.location.reload();
                }
            });
            }
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
