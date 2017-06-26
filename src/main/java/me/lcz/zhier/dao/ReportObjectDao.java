package me.lcz.zhier.dao;

import me.lcz.zhier.entity.QuestionAndaAnswer;
import me.lcz.zhier.entity.ReportObject;
import me.lcz.zhier.entity.ZhierAnswer;
import me.lcz.zhier.entity.ZhierQuestion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lcz on 2017/6/14.
 */
public interface ReportObjectDao {

    int insertReportInfo(@Param("reportId") long reportId,@Param("reportType")int reportType,@Param("reportUserId")long reportUserId);

    int deleteReportInfo(@Param("reportId") long reportId,@Param("reportType")int reportType);

    List<ZhierQuestion> getReportQuestion();

    List<QuestionAndaAnswer> getReportAnswer();

    ReportObject getReportInfo(@Param("reportId") long reportId,@Param("reportType")int reportType);
}
