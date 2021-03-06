package me.lcz.zhier.web;

import me.lcz.zhier.dao.ReportObjectDao;
import me.lcz.zhier.dto.ActionResult;
import me.lcz.zhier.entity.*;
import me.lcz.zhier.enums.TableEnum;
import me.lcz.zhier.service.ZhierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lcz on 2017/4/10.
 */
@Controller
@RequestMapping("/zhier")
public class ZhierController {
    @Autowired
    private ZhierService zhierService;
    @Autowired
    private ReportObjectDao reportObjectDao;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String zhier(Model model, HttpSession httpSession) {
        //转到zhier.jsp
        if (httpSession.getAttribute("zhieruser") != null) {
            List<QuestionAndaAnswer> questionAndaAnswers = zhierService.getAllQuestion();
            model.addAttribute("qandanswers", questionAndaAnswers);
            return "homePage";
        } else
            return "zhier";
    }

    //注册
    @RequestMapping(value = "/register",
            method = RequestMethod.POST)
    public String register(@RequestParam(value = "userName") String userName,
                           @RequestParam(value = "password") String password,
                           @RequestParam(value = "userEmail") String userEmail,
                           @RequestParam(value = "sex") int sex,
                           HttpSession httpSession, Model model) {
        boolean ifSuccess = zhierService.registUser(userName, password, userEmail, sex);
        if (ifSuccess) {
            ZhierUser zhierUser = zhierService.findUser(userName);
            httpSession.setAttribute("zhieruser", zhierUser);

        }
        return "redirect:/zhier";
    }

    //登陆
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(value = "userName") String userName, @RequestParam(value = "password") String password, Model model, HttpSession httpSession) {
        if (zhierService.userIsRight(userName, password)) {
            ZhierUser zhierUser = zhierService.findUser(userName);
            //将后台登陆用户的信息传到前台
//          model.addAttribute("zhieruser",zhierUser);
            //为什么用forward，因为有个zhierUser,如果用redirect
            //虽然url会变但是数据过不去
            httpSession.setAttribute("zhieruser", zhierUser);
//          List<QuestionAndaAnswer> questionAndaAnswers = zhierService.getAllQuestion();
//          model.addAttribute("qandanswers",questionAndaAnswers);

            return "redirect:/zhier";
        } else
            return "redirect:/zhier";
    }

    @RequestMapping(value = "/{userId}/user", method = RequestMethod.GET)
    public String toUserPage(@PathVariable("userId") long userId,HttpSession httpSession, Model model) {
        ZhierUser loginUser = (ZhierUser) httpSession.getAttribute("zhieruser");
        ZhierUser zhierUser = zhierService.findUser(userId);
        model.addAttribute("toseeuser", zhierUser);
        List<QuestionAndaAnswer> questionAndaAnswers = zhierService.getAnswerByUser(userId);
        model.addAttribute("toseeUserAnswers", questionAndaAnswers);
        List<ZhierQuestion> zhierQuestions = zhierService.getQuestionByUser(userId);
        model.addAttribute("toseeUserQuestions", zhierQuestions);
        List<ZhierUser> follower = zhierService.getFollower(userId);
        model.addAttribute("follower",follower);
        List<ZhierUser> following = zhierService.getFollowing(userId);
        model.addAttribute("following",following);
        List<ZhierQuestion> concernedQuestion = zhierService.getConcernedQuestion(userId);
        model.addAttribute("concernedQ",concernedQuestion);
        if(loginUser.getUserAuthority() == 1) {
            return "userDetail";
        }else if(loginUser.getUserId() == userId){
            List<ZhierQuestion> reportQuestion = reportObjectDao.getReportQuestion();
            List<QuestionAndaAnswer> reportAnswer = reportObjectDao.getReportAnswer();
            model.addAttribute("reportquestion",reportQuestion);
            model.addAttribute("reportanswer",reportAnswer);
            return "adminDetail";
        }else return "userDetail";
    }


    @RequestMapping(value = "/{questionId}/question", method = RequestMethod.GET)
    public String toQuestionPage(@PathVariable("questionId") long questionId, Model model) {
        ZhierQuestion zhierQuestion = zhierService.getQuestionById(questionId);
        List<ZhierAnswer> zhierAnswerList = zhierService.getAnswerByQuestion(questionId);
        List<Integer> likes = new ArrayList<Integer>();
        List<Integer> dislikes = new ArrayList<Integer>();
        List<Integer> commentNumbers = new ArrayList<Integer>();
        int likenum,dislikenum,commentnum;
        for(ZhierAnswer a : zhierAnswerList){
           likenum = zhierService.getLikesNum(a.getAnswerId(),1);
            dislikenum = zhierService.getLikesNum(a.getAnswerId(),0);
            likes.add(likenum);
            dislikes.add(dislikenum);
            commentnum = zhierService.getAnswerComment(a.getAnswerId()).size();
            commentNumbers.add(commentnum);
        }
        model.addAttribute("zhierquestion", zhierQuestion);
        model.addAttribute("answers", zhierAnswerList);
        model.addAttribute("likenums",likes);
        model.addAttribute("dislikenums",dislikes);

        int answerNumber = zhierAnswerList.size();
        model.addAttribute("answerNumber",answerNumber);
        model.addAttribute("commentNumbers",commentNumbers);
        return "questionDetail";
    }


    @RequestMapping(value = "/raiseQuestion",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult raiseQuestion(@RequestParam(value = "createUserId") long createUserId,
                                      @RequestParam(value = "createUserName") String createUserName,
                                      @RequestParam(value = "questionTag") String questionTag,
                                      @RequestParam(value = "questionText") String questionText
    ) {
        String finalText = questionText.replaceAll("\\n","<br/>");
        boolean isSuccess = zhierService.raiseQuestion(createUserId, createUserName, questionTag, finalText);
        return new ActionResult(TableEnum.QUESTIONS.getWhichTable(), isSuccess);
    }


    @RequestMapping(value = "/{questionId}/updateQ",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult updateQuestion(@PathVariable(value = "questionId") long questionId,
                                       @RequestParam(value = "newQuestionText") String newQuestionText) {
        String finalText = newQuestionText.replaceAll("\\n","<br/>");
        boolean isSuccess = zhierService.updateQuestion(questionId, finalText);
        return new ActionResult(TableEnum.QUESTIONS.getWhichTable(), isSuccess);
    }


    @RequestMapping(value = "/{questionId}/answerQ",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult answer(@PathVariable(value = "questionId") long questionId,
                               @RequestParam(value = "userId") Long userId,
                               @RequestParam(value = "userName") String userName,
                               @RequestParam(value = "answerText") String answerText) {
        if (userId == null) {
            return new ActionResult(null, false);
        } else {
            String finalText = answerText.replaceAll("\\n","<br/>");
            boolean isSuccess = zhierService.answer(questionId, userId, userName, finalText);
            return new ActionResult(TableEnum.ANSWERS.getWhichTable(), isSuccess);
        }
    }

    @RequestMapping(value = "/{questionId}/question/{answerId}/answer",
            method = RequestMethod.GET)
    public String toAnswerPage(@PathVariable(value = "answerId") long answerId,
                               @PathVariable(value = "questionId") long questionId,
                               Model model) {
        ZhierAnswer zhierAnswer = zhierService.getAnswerById(answerId);
        ZhierQuestion zhierQuestion = zhierService.getQuestionById(questionId);
        int likenum = zhierService.getLikesNum(answerId,1);
        int dislikenum = zhierService.getLikesNum(answerId,0);
        model.addAttribute("zhieranswer", zhierAnswer);
        model.addAttribute("zhierquestion", zhierQuestion);
        model.addAttribute("likenum",likenum);
        model.addAttribute("dislikenum",dislikenum);

        int commentnum = zhierService.getAnswerComment(answerId).size();
        model.addAttribute("commentnum",commentnum);

        return "answerPage";
    }

    @RequestMapping(value = "{questionId}/question/{answerId}/updateA",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult updateAnswer(@PathVariable(value = "answerId") long answerId,
                                     @RequestParam(value = "newAnswerText") String newAnswerText) {
        String finalText = newAnswerText.replaceAll("\\n","<br/>");
        boolean isSuccess = zhierService.updateAnswer(answerId, finalText);
        return new ActionResult(TableEnum.ANSWERS.getWhichTable(), isSuccess);
    }

    @RequestMapping(value = "/quit",
            method = RequestMethod.GET)
    public String quit(HttpSession httpSession) {
        httpSession.removeAttribute("zhieruser");
        return "redirect:/zhier";
    }

    @RequestMapping(value = "/search",
            method = RequestMethod.POST)
    public String search(@RequestParam(value = "searchText") String searchText,Model model) {
        List<String> tags = zhierService.findTagByKeyword(searchText);
        List<ZhierUser> users = zhierService.findUserByKeyword(searchText);
        List<ZhierQuestion> questions =zhierService.searchQuestion(searchText);
        model.addAttribute("tags",tags);
        model.addAttribute("users",users);
        model.addAttribute("questions",questions);
        return "searchResult";
    }



    @RequestMapping(value = "/ifHaveAnswered",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult ifHaveAnswered(@RequestParam(value = "userId") long userId,
                                       @RequestParam(value = "questionId") long questionId) {
        if (zhierService.ifHaveAnswered(userId, questionId))
            return new ActionResult(TableEnum.ANSWERS.getWhichTable(), true);
        else
            return new ActionResult(TableEnum.ANSWERS.getWhichTable(), false);
    }

    @RequestMapping(value="/{tagName}/questionsByTag",
                          method = RequestMethod.GET)
    public String getQuestionByTag(@PathVariable("tagName") String tagName,Model model){
        List<ZhierQuestion> questions = zhierService.getQuestionByTag(tagName);
        model.addAttribute("questions",questions);
        return "questionsByTag";
    }
    @RequestMapping(value = "/ifshowlike",
              method = RequestMethod.POST,
          produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult findLikes(@RequestParam(value = "answerId") long answerId,
                                  @RequestParam(value = "userId") long userId){

        AnswerLikeAbout likeAbout = zhierService.findUserLikes(answerId, userId);
        if(likeAbout == null || likeAbout.getTypes() == -1)
            return new ActionResult(TableEnum.LIKES.getWhichTable(),-1);
        else
            return new ActionResult(TableEnum.LIKES.getWhichTable(),likeAbout.getTypes());

    }

    @RequestMapping(value = "/likeorother",
                    method = RequestMethod.POST,
                produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult likeOrOther(@RequestParam(value = "answerId") long answerId,
                            @RequestParam(value = "userId") long userId,
                            @RequestParam(value = "type") int type){
        AnswerLikeAbout about = zhierService.findUserLikes(answerId, userId);
        if(about == null)
            zhierService.addLikes(answerId, userId, type);
        else
            zhierService.updateLikes(answerId, userId, type);

        return new ActionResult(TableEnum.LIKES.getWhichTable(),true);
    }


    @RequestMapping(value = "/iffollow",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult findIfFollow(@RequestParam(value = "userId") long userId,
                                  @RequestParam(value = "followingId") long followingId){

        FollowAbout followAbout = zhierService.findFollowInfo(userId, followingId);
        if(followAbout == null)
            return new ActionResult(TableEnum.FOLLOWS.getWhichTable(),false);
        else
            return new ActionResult(TableEnum.FOLLOWS.getWhichTable(),true);
    }

    @RequestMapping(value = "/followordelete",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult deleteFollowInfo(@RequestParam(value = "userId") long userId,
                                     @RequestParam(value = "followingId") long followingId,
                                         @RequestParam(value = "type") int type){
        if(type==1) {
    boolean ifSuccess = zhierService.follow(userId, followingId);
    return new ActionResult(TableEnum.FOLLOWS.getWhichTable(), ifSuccess);
        }
        else{
            boolean ifSuccess = zhierService.deleteFollowInfo(userId, followingId);
            return new ActionResult(TableEnum.FOLLOWS.getWhichTable(), ifSuccess);
        }
    }




    @RequestMapping(value = "/ifconcern",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult findIfConcern(@RequestParam(value = "userId") long userId,
                                      @RequestParam(value = "questionId") long questionId){

      ConcernQuestion concernQuestion = zhierService.getConcernInfo(userId, questionId);
        if(concernQuestion == null)
            return new ActionResult(TableEnum.CONCERN.getWhichTable(),false);
        else
            return new ActionResult(TableEnum.CONCERN.getWhichTable(),true);
    }


    @RequestMapping(value = "/concernordelete",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult concernordelete(@RequestParam(value = "userId") long userId,
                                         @RequestParam(value = "questionId") long questionId,
                                         @RequestParam(value = "type") int type){
        if(type==1) {
            boolean ifSuccess = zhierService.addConcernInfo(userId, questionId);
            return new ActionResult(TableEnum.CONCERN.getWhichTable(), ifSuccess);
        }
        else{
            boolean ifSuccess = zhierService.deleteConcernInfo(userId, questionId);
            return new ActionResult(TableEnum.CONCERN.getWhichTable(), ifSuccess);
        }
    }
    @RequestMapping(value = "/{questionId}/question/{answerId}/answer/comment",
    method = RequestMethod.GET)
    public String getComments(@PathVariable(value = "answerId") long answerId,Model model){
        List<AnswerComment> comments = zhierService.getAnswerComment(answerId);
        model.addAttribute("num",comments.size());
        model.addAttribute("comments",comments);
        model.addAttribute("answerId",answerId);
        return "comment";
    }

    @RequestMapping(value = "/comment",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"}
    )
    @ResponseBody
    public  ActionResult comment(@RequestParam(value = "answerId") long answerId,
                                 @RequestParam(value = "commentUserId") long commentUserId,
                                 @RequestParam(value = "commentText") String commentText,
                                 @RequestParam(value = "commenttoUserId") long commenttoUserId,
                                 @RequestParam(value = "type") int type){
        if(type == 0){
          boolean isSuccess =  zhierService.addCommentOnAnswer(answerId,commentUserId,commentText);
            return new ActionResult(TableEnum.COMMENT.getWhichTable(),isSuccess);
        }else{
            boolean isSuccess2 = zhierService.addCommentOnComment(answerId, commentUserId, commenttoUserId, commentText);
            return new ActionResult(TableEnum.COMMENT.getWhichTable(),isSuccess2);
        }
    }
    @RequestMapping(value = "/report",
                    method = RequestMethod.POST,
                    produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult report(@RequestParam(value = "reportId") long reportId,
                               @RequestParam(value = "reportType") int reportType,
                               @RequestParam(value = "reportUserId") long reportUserId){
          if(reportObjectDao.getReportInfo(reportId,reportType)==null) {
              reportObjectDao.insertReportInfo(reportId, reportType, reportUserId);
              return new ActionResult(TableEnum.REPORT.getWhichTable(), true);
          }
        else
            return new ActionResult(TableEnum.REPORT.getWhichTable(),false);
    }

    @RequestMapping(value = "/deleteBadInfo",
                    method = RequestMethod.POST,
                   produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult delete(@RequestParam(value = "reportId") int reportId,
                               @RequestParam(value = "reportType") int reportType){
        reportObjectDao.deleteReportInfo(reportId,reportType);
    if(reportType == 0){
         zhierService.deleteQuestion(reportId);
        List<ZhierAnswer> answers = zhierService.getAnswerByQuestion(reportId);
        for(ZhierAnswer answer : answers){
            zhierService.deleteAnswer(answer.getAnswerId());
        }
        return new ActionResult(TableEnum.QUESTIONS.getWhichTable(),true);
    }else{

         zhierService.updateAnswer(reportId,"该回答涉嫌违规，已被屏蔽");
            return new ActionResult(TableEnum.ANSWERS.getWhichTable(),true);
        }
    }

    @RequestMapping(value = "/cancle",
    method = RequestMethod.POST,
    produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult cancle(long reportId,int reportType){
        if(reportObjectDao.deleteReportInfo(reportId, reportType)==1){
            return new ActionResult(TableEnum.REPORT.getWhichTable(),true);
        }else return new ActionResult(TableEnum.REPORT.getWhichTable(),false);
    }
}
