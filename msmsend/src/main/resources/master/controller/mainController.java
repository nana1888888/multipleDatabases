package msm.msmsend.master.controller;


import msm.msmsend.dto.smsDto;

import msm.msmsend.master.service.SmsService;
import msm.msmsend.slave.service.KaKaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.ErrorManager;

@CrossOrigin("*")
@Controller
public class mainController {
    @Autowired
    private SmsService SmsService;

    @Autowired
    private KaKaoService kaKaoService;

    @RequestMapping(value = {"/sms", "/",""})
    public ModelAndView sms() {

        String one = "1";
        List<smsDto> listgroupOther = SmsService.getDISTINCTOthergroup();
        List<smsDto> listData = SmsService.getTable(one);
        //추가getDISTINCT
        List<smsDto> listgroup = SmsService.getDISTINCT();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/index");
        Object lisize =  listData.size();
       // String text = SmsService.getText();
        mv.addObject("list", listData);
        mv.addObject("listgroup", listgroup);
        mv.addObject("listgroupOther", listgroupOther);

        mv.addObject("lisize", lisize);
        mv.addObject("text", "text");
        return mv;
    }
//othergroup




    @RequestMapping(value = {"/groupType"})
    public ModelAndView groupType(@RequestParam(value = "type", required = false) String type,
                                    @RequestParam(value = "other", required = false) int other){
        List<smsDto> listData = null;
        if(other==2){
           listData = SmsService.otherGroup(type);
        }else if(other==1){
        listData = SmsService.getTableNm(type);}
        List<smsDto> listgroupOther = SmsService.getDISTINCTOthergroup();
        List<smsDto> listgroup = SmsService.getDISTINCT();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/groupBox");

        Object lisize =  listData.size();
        // String text = SmsService.getText();
        mv.addObject("list", listData);
        mv.addObject("lisize", lisize);
        mv.addObject("listgroupOther", listgroupOther);
        mv.addObject("listgroup", listgroup);
        mv.addObject("type", type);
        mv.addObject("text", "text");
        return mv;
    }
    @RequestMapping(value = {"/contact"})
    public ModelAndView contact() {
        ModelAndView mv = new ModelAndView();

        String one = "1";

        List<smsDto> listData = SmsService.getTable(one);
        List<smsDto> listgroup = SmsService.getDISTINCT();
        List<smsDto> listgroupOther = SmsService.getDISTINCTOthergroup();

        Object lisize =  listData.size();
        mv.setViewName("/contact");
        mv.addObject("list", listData);
        mv.addObject("size", lisize);
        mv.addObject("listgroup", listgroup);
        mv.addObject("listgroupOther", listgroupOther);
        return mv;
    }
    @RequestMapping(value = {"/otherGroup"})
    public ModelAndView otherGroup() {
        ModelAndView mv = new ModelAndView();

        String one = "1";

        List<smsDto> listData = SmsService.getTableOtherNot();
        List<smsDto> listgroup = SmsService.getDISTINCT();
        List<smsDto> listgroupOther = SmsService.getDISTINCTOthergroup();
        List<smsDto> basicGroup = SmsService.basicGroup();
        Object lisize =  listData.size();
        mv.setViewName("/otherGroup");
        mv.addObject("list", listData);
        mv.addObject("size", lisize);
        mv.addObject("basicGroup", basicGroup);
        mv.addObject("listgroup", listgroup);
        mv.addObject("listgroupOther", listgroupOther);
        return mv;
    }
//데이터 INSERT
    @RequestMapping(value = {"/updateOld"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap updateOld(
                   @RequestParam(value = "groupnm", required = false) String groupnm,
                   @RequestParam(value = "number", required = false) String number,
                   @RequestParam(value = "name", required = false) String name,
                   @RequestParam(value = "groupname", required = false) String groupname,
                   HttpServletResponse response) throws IOException {
        HashMap<String, String> result = new HashMap<String, String>();
        int userCheck = SmsService.userCheck(number) ;
        System.out.println(userCheck);
        if(userCheck >=1){
            result.put(null,null);
        }else {
            int insert = SmsService.insert(number, name, groupnm, groupname);
                result.put("success", "Y");
                return result;
        }
        return result;
    }
    @RequestMapping(value = {"/updateNew"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap updateNew(
            @RequestParam(value = "number", required = false) String number,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "groupnameNew", required = false) String groupnameNew,
            HttpServletResponse response) throws IOException {
        HashMap<String, String> result = new HashMap<String, String>();

        int userCheck = SmsService.userCheck(number) ;
            if(userCheck >=1){
                result.put(null,null);
            }else {
                int maxGroup = SmsService.groupMax();
                int insert = SmsService.insert(number, name, String.valueOf(maxGroup + 1), groupnameNew);

                result.put("success", "Y");
            }
        return result;
    }
    @RequestMapping(value = {"/userupdate/{number}"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    ModelAndView userupdate(@PathVariable String number, HttpServletRequest request)
    {
        Map<String, String[]> map = request.getParameterMap();
        List<smsDto> listgroup = SmsService.getDISTINCT();
        ModelAndView mv = new ModelAndView();
        String match = "[^0-9]";
        number = number.replaceAll(match, "");
        List<smsDto> listgroupOther = SmsService.getDISTINCTOthergroup();


        mv.setViewName("/user");
        List<smsDto> listUser = SmsService.getUser(null,number);
        String groupnm =  listUser.get(0).getGroupnm();
        String name =  listUser.get(0).getName();
        //no1(PK)로 어떤회원인지 찾는 SQL

        mv.addObject("list", listUser);
        mv.addObject("listgroupOther", listgroupOther);
        mv.addObject("name", name);
        mv.addObject("groupnm", groupnm);
        mv.addObject("listgroup", listgroup);
        return mv;
    }
    /*삭제*/
    @RequestMapping(value = {"/delete"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap delete(@RequestParam(value = "no1", required = false) String no1) {
        HashMap<String, String> result = new HashMap<String, String>();
        if (no1 == "" && no1 == null) {
            result.put("key", null);
        } else {
            int delete = SmsService.delete(no1);
            result.put("key", "success");
        }
        return result;
    }   @RequestMapping(value = {"/testNice"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap testNice(HttpServletResponse respons) {
        HashMap<String, String> result = new HashMap<String, String>();
        System.out.println( respons.toString());
        return result;
    }

    @RequestMapping(value = {"/updateTm"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap updateTm(@RequestParam(value = "type", required = false) String type,
                     @RequestParam(value = "number", required = false) String number,
                     @RequestParam(value = "name", required = false) String name,
                     @RequestParam(value = "groupname", required = false) String groupname,
                     @RequestParam(value = "othergroup", required = false) String othergroup,
                     @RequestParam(value = "groupnm", required = false) String groupnm,
                     @RequestParam(value = "no1", required = false) String no1) {
        HashMap<String, String> result = new HashMap<String, String>();
        String match = "[^\uAC00-\uD7A30-9a-zA-Z]";
        number = number.replaceAll(match, "");
        /*전화번호 이름 수정할 값 이 둘다 없을때 failure 혹시 몰라 Back 으로 한번 더 막음*/


        int update = SmsService.update(number, name,no1, groupname,groupnm,othergroup);


        /*업데이트를 성공할시 mapper 에서 row 값을 1 을 반환함*/

        if (update == 1) {
            result.put("success", "Y");
        } else {
            result.put("failure", null);
        }

        return result;
    }
    @RequestMapping(value = {"/update_basic"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap update_basic(HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, String> updateBasic = new HashMap<String, String>();
        Map<String, String[]> map = request.getParameterMap();
        String[] phoneNum = map.get("phoneNum[]");
        try {
            for(int i=0;i<phoneNum.length;i++) {
                phoneNum[i].replaceAll("[^0-9]", "");
                int insertKakao = SmsService.updateBasic(phoneNum[i]);

            }
            updateBasic.put("success", "Y");

        }catch (Exception e){
            updateBasic.put(null, null);
        }
        return updateBasic;
    };
    @RequestMapping(value = {"/delete_basic"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap delete_basic( @RequestParam(value = "phoneNum", required = false) String phoneNum,
                          HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, String> deletebasic = new HashMap<String, String>();


        try {
             int delete_basic = SmsService.deleteExisting(phoneNum);
            deletebasic.put("success", "Y");

        }catch (Exception e){
            deletebasic.put(null, null);
        }
        return deletebasic;
    };

    @RequestMapping(value = {"/application_send_a"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap application_send_a (@RequestParam(value = "gmpTime", required = false) String gmpTime,
                          @RequestParam(value = "pusTime", required = false) String pusTime,
                          @RequestParam(value = "cjuTime", required = false) String cjuTime,
                          @RequestParam(value = "teaTime", required = false) String teaTime,
                          @RequestParam(value = "time1", required = false) String time1,
                          @RequestParam(value = "result", required = false) String result,
                          @RequestParam(value = "cjjTime", required = false) String cjjTime,
                          @RequestParam(value = "sendName", required = false) String sendName,
                          HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, String> kakaoResult = new HashMap<String, String>();
        String MMS = "[IT시스템 운영보고]\n정보시스템 및 스마트공항 시스템 정상 운영중입니다."+"\n금일 "+time1+"시 현재 김포,김해,제주,대구,청주 공항 여객수속 "+result
                +"\n- 전일 Last Flight 김포:"+gmpTime+"김해:"+pusTime+"제주:"+cjuTime+"대구:"+teaTime+
                ",청주:"+cjjTime+"\n\n"+"보고자:"+sendName;
        Map<String, String[]> map = request.getParameterMap();
        String[] phoneNum = map.get("phoneNum[]");
        try {
        for(int i=0;i<phoneNum.length;i++) {
            phoneNum[i].replaceAll("[^0-9]", "");
           try {
               int insertKakao = kaKaoService.kakaoInsert1(phoneNum[i],"KAC", MMS);
               //int smshistory = SmsService.smshistory(phoneNum[i], MMS, "Y", "");

           }catch (Exception e){
              // int smshistory =  SmsService.smshistory(phoneNum[i],MMS,"N", e.getMessage());
               kakaoResult.put(null, null);
               return kakaoResult;
           }
        }
            kakaoResult.put("success", "Y");

        }catch (Exception e){
            kakaoResult.put(null, null);
            return kakaoResult;
        }
        return kakaoResult;
    };


    @RequestMapping(value = {"/application_send_b"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap application_send_b(@RequestParam(value = "time10", required = false) String time10,
                               @RequestParam(value = "result2", required = false) String result2,
                               @RequestParam(value = "sendName0", required = false) String sendName0,
                               HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, String> kakaoResult = new HashMap<String, String>();
        String MMS = "[IT시스템 운영보고]\n정보시스템 및 스마트공항 시스템 정상 운영중입니다."+"\n금일 "+time10+"시 현재 김포,김해,제주,대구,청주 공항 여객수속 "+result2+
                "\n\n"+"보고자:"+sendName0;
        Map<String, String[]> map = request.getParameterMap();
        String[] phoneNum = map.get("phoneNum[]");
        for (int i = 0; i < phoneNum.length; i++) {
        try {

                phoneNum[i].replaceAll("[^0-9]", "");
                int insertKakao = kaKaoService.kakaoInsert1(phoneNum[i],"KAC", MMS);
                //int smshistory = SmsService.smshistory(phoneNum[i], MMS, "Y", "");


                kakaoResult.put("success", "Y");

            }catch(Exception e){
               // int smshistory = SmsService.smshistory(phoneNum[i], MMS, "N", e.getMessage());
                kakaoResult.put(null, null);
            }
        }
        return kakaoResult;
    };

    @RequestMapping(value = {"/application_send_c"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap application_send_c(@RequestParam(value = "contents", required = false) String contents,
                            @RequestParam(value = "date", required = false) String date,
                            @RequestParam(value = "resolution", required = false) String resolution,
                            @RequestParam(value = "cause", required = false) String cause,
                            @RequestParam(value = "passengerService", required = false) String passengerService,
                            @RequestParam(value = "sendName", required = false) String sendName,
                               @RequestParam(value = "report", required = false) String report,
            HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, String> kakaoResult = new HashMap<String, String>();
        String MMS = "[장애 발생 보고]\n● 장애내용 : "+contents+"\n● 장애일시 : "+date.replace('-','/')+"\n● 장애원인 : "+cause+"\n● 여객서비스 : "+passengerService+"\n● 조치사항 : "+resolution+"\n\n보고자:"+sendName;

        String KAC = "장애발생보고";

        Map<String, String[]> map = request.getParameterMap();
        String[] phoneNum = map.get("phoneNum[]");
        for(int i=0;i<phoneNum.length;i++) {
        try {
            if(report=="two"){
                KAC = "장애완료보고";
                phoneNum[i].replaceAll("[^0-9]", "");
                int insertKakao = kaKaoService.kakaoInsert1(phoneNum[i],KAC,MMS);
            }
            KAC = "장애발생보고";
            int insertKakao = kaKaoService.kakaoInsert1(phoneNum[i],KAC,MMS);
        //    int smshistory = SmsService.smshistory(phoneNum[i], MMS, "Y", "");
            kakaoResult.put("success", "Y");

        }catch (Exception e){
           // int smshistory =  SmsService.smshistory(phoneNum[i],MMS,"N", e.getMessage());
            kakaoResult.put(null, null);

        }

    };
        return kakaoResult;
    }
    @RequestMapping(value = {"/group_update"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    HashMap group_update(@RequestParam(value = "result", required = false) String result,
                               HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, String> OtherGroupResult = new HashMap<String, String>();
        Map<String, String[]> map = request.getParameterMap();
        String[] phoneNum = map.get("phoneNum[]");
        try {
            for(int i=0;i<phoneNum.length;i++) {
                phoneNum[i].replaceAll("[^0-9]", "");
                int updateOtherGroup = SmsService.updateOtherGroup(result,phoneNum[i]);
            }
            OtherGroupResult.put("success", "Y");

        }catch (Exception e){
            OtherGroupResult.put(null, null);
        }
        return OtherGroupResult;
    };
    };





