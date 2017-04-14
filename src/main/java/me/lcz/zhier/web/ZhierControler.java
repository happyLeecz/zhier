package me.lcz.zhier.web;

import me.lcz.zhier.dto.ActionResult;
import me.lcz.zhier.entity.ZhierAnswer;
import me.lcz.zhier.entity.ZhierQuestion;
import me.lcz.zhier.entity.ZhierUser;
import me.lcz.zhier.enums.TableEnum;
import me.lcz.zhier.service.ZhierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by lcz on 2017/4/10.
 */
@Controller
@RequestMapping("/zhier")
public class ZhierControler {
    @Autowired
    private ZhierService zhierService;

 @RequestMapping(value="",method = RequestMethod.GET)
 public String zhier(Model model){
     //转到zhier.jsp
     return "zhier";
 }
    //注册
    @RequestMapping(value = "/register",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
 public ActionResult register(@RequestParam(value="userName")String userName,
                              @RequestParam(value="password")String password,
                              @RequestParam(value="userEmail")String userEmail,
                              @RequestParam(value="sex")int sex,
                              Model model){
     boolean ifSuccess = zhierService.registUser(userName,password,userEmail,sex);
     ActionResult actionResult = new ActionResult(TableEnum.USERS.getWhichTable(),ifSuccess);
        return actionResult;

    }
    //登陆
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam(value = "userName") String userName,@RequestParam(value = "password") String password,Model model){
      if(zhierService.userIsRight(userName, password)){
          ZhierUser zhierUser = zhierService.findUser(userName);
          //将后台登陆用户的信息传到前台
          model.addAttribute("zhieruser",zhierUser);
          //为什么用forward，因为有个zhierUser,如果用redirect
          //虽然url会变但是数据过不去
          List<ZhierQuestion> questionList = zhierService.getAllQuestion();
          model.addAttribute("questions",questionList);
          return "homePage";
      }else
          return "redirect:/zhier/login";
    }
    @RequestMapping(value = "/{userId}/user",method = RequestMethod.GET)
    public String toUserPage(@PathVariable("userId")long userId,Model model){
        ZhierUser zhierUser = zhierService.findUser(userId);
        model.addAttribute("zhieruser",zhierUser);
        return "userDetail";
    }


    @RequestMapping(value = "/{questionId}/question",method = RequestMethod.GET)
    public String toQuestionPage(@PathVariable("questionId") long questionId,Model model){
        ZhierQuestion zhierQuestion = zhierService.getQuestionById(questionId);
        List<ZhierAnswer> zhierAnswerList = zhierService.getAnswerByQuestion(questionId);
        model.addAttribute("zhierquestion",zhierQuestion);
        model.addAttribute("answers",zhierAnswerList);
        return "questionDetail";
    }


    @RequestMapping(value = "/raiseQuestion",
            method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult raiseQuestion(@RequestParam(value = "createByWho") long createByWho,
                                      @RequestParam(value = "questionTag")String questionTag,
                                      @RequestParam(value = "questionText")String questionText){
        boolean isSuccess = zhierService.raiseQuestion(createByWho,questionTag,questionText);
        return new ActionResult(TableEnum.QUESTIONS.getWhichTable(),isSuccess);
    }


    @RequestMapping(value ="/{questionId}/updateQ",
                    method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    public ActionResult updateQuestion(@PathVariable(value = "questionId") long questionId,
                                       @RequestParam(value = "newQuestionText") String newQuestionText){
        boolean isSuccess = zhierService.updateQuestion(questionId,newQuestionText);
        return new ActionResult(TableEnum.QUESTIONS.getWhichTable(),isSuccess);
    }


    @RequestMapping(value = "/{questionId}/answerQ",
                     method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult answer(@PathVariable(value = "questionId") long questionId,
                               @CookieValue(value = "userId",required = false) Long userId,
                               @RequestParam(value = "answerText") String answerText){
        if(userId==null){
            return new ActionResult(null,false);
        }else{
            boolean isSuccess = zhierService.answer(questionId,userId,answerText);
            return new ActionResult(TableEnum.ANSWERS.getWhichTable(),isSuccess);
        }
    }
    @RequestMapping(value = "/{questionId}/question/{answerId}/answer",
                    method = RequestMethod.GET)
    public String toAnswerPage(@PathVariable(value = "answerId") long answerId,Model model){
        ZhierAnswer zhierAnswer = zhierService.getAnswerById(answerId);
        model.addAttribute("zhieranswer",zhierAnswer);
        return "answerPage";
    }

    @RequestMapping(value = "{questionId}/question/{answerId}/updateA",
                    method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ActionResult updateAnswer(@PathVariable(value = "answerId") long answerId,
                                     @RequestParam(value = "newAnswerText") String newAnswerText ){
        boolean isSuccess = zhierService.updateAnswer(answerId,newAnswerText);
        return new ActionResult(TableEnum.ANSWERS.getWhichTable(),isSuccess);
    }

    @RequestMapping(value = "/{tagName}/questions",
                    method = RequestMethod.GET)
    public String getQuestionBytag(@PathVariable(value = "tagName") String tagName,Model model){
        List<ZhierQuestion> questionList = zhierService.getQuestionByTag(tagName);
        model.addAttribute("questions",questionList);
        return "homePage";
    }
}
