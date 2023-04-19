package msm.msmsend.master.service;

import msm.msmsend.dto.smsDto;

import java.util.List;

public interface SmsService {
    public List<smsDto> getTable (String one);

    public int deleteExisting(String number);

    public List<smsDto> getTableOtherNot();

    public List<smsDto> getTableNm(String groupnm);

    public List<smsDto> otherGroup(String groupnm);

    public int userCheck(String user);
    public int getGroupnm(String groupname);

    public List<smsDto> basicGroup();

    public int updateBasic(String number);

    public int delete(String no1);
    public int update(String number,String name,String no1,String groupname,String groupnm,String othergroup);

    public int smshistory(String number,String text,String result,String reason);

    public int insert(String number,String name,String groupnm,String groupname);
    public List<smsDto> getDISTINCT();

    public int updateOtherGroup(String number,String othergroup);

    public List<smsDto> getDISTINCTOthergroup();
    public String getText();

    public List<smsDto> getUser (String no1,String number);

    public String getGroupname(int groupnm);

    public int groupMax();

}
