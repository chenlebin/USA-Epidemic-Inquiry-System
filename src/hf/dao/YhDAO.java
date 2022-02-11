package hf.dao;

import hf.bean.XxBean;
import hf.bean.YhBean;
import hf.bean.YhxxBean;

import java.util.List;


public class YhDAO {
	//�û����ӵķ�����������
		public static int addyh( XxBean yhs)
		  {
		  	//���û����˺�������Ϣ����t_yhuser
			String sql="insert into t_yhuser(\"UID\",UNAME,ULX,UPWD)\n" +
					"values(?,?,?,?)";
			Object[] params= {yhs.getUid(),yhs.getUname(),yhs.getUlx(),yhs.getUpwd()};

			//���û��ĸ�����Ϣ����t_yhxinxi��������ʽ��1008604	���ֱ�	��	20010422	1585696186@qq.com
			String sql2="insert into T_YHXINXI\n" +
					"values(?,?,?,?,?)";
			Object[] params2= {yhs.getUid(),yhs.getUname(),yhs.getUxb(),yhs.getUsf(),yhs.getUyx()};

			//ֻ�е��������ݾ�����ɹ�ʱ�Ż᷵��1�������ɹ�
			return DBUtil.update(sql, params)*DBUtil.update(sql2,params2);
			
		  }
		
	//�û���Ϣ����(�޸�)�ķ�����������
	    public static void gengxin( XxBean yhs)
		{
	    	//����t_yhuser�е���Ϣ
	    	String sql1="update T_YHUSER set uname=?,UPWD=? where \"UID\"=?";
			Object[] params1= {yhs.getUname(),yhs.getUpwd(),yhs.getUid()};
			DBUtil.update(sql1, params1);

	    	//����t_yhxinxi�е���Ϣ
	    	String sql2="update T_YHXINXI set uname=?,UXB=?,USF=?,UYX=? where \"UID\"=?";
			Object[] params2= {yhs.getUname(),yhs.getUxb(), yhs.getUsf(), yhs.getUyx(),yhs.getUid()};
			DBUtil.update(sql2, params2);
		}

    //��¼�ķ���
		public static List<YhBean> denglu(YhBean yhs)
		{
			String sql="select * from t_yhuser where uname=? and upwd=? and ulx=?";
			Object[] params= {yhs.getUname(),yhs.getUpwd(),yhs.getUlx()};
			List<YhBean> ublist= DBUtil.getList(sql, YhBean.class, params);
			return ublist;
		}


	//ɾ���û���Ϣ�ķ���
		public static void delyh(int bd_id)
		{
			//���������е����ݾ�ɾ��
			String sql="delete from t_yhuser where \"UID\"=?";
			Object[] params= {bd_id};
			DBUtil.update(sql, params);

			String sql2="delete from t_yhxinxi where \"UID\"=?";
			Object[] params2= {bd_id};
			DBUtil.update(sql2, params2);
			
		}
		

		//�û���Ϣ��ѯ���� todo �������
		public static List<XxBean> queryyhxx(int id)
		{
			String sql="SELECT u.\"UID\",u.UNAME,u.ULX,u.UPWD,x.UXB,x.USF,x.UYX FROM T_YHUSER u INNER JOIN T_YHXINXI x on u.\"UID\"=x.\"UID\"\n" +
					"WHERE u.\"UID\"=?";
			Object[] params= {id};
			List<XxBean> ublist= DBUtil.getList(sql, XxBean.class, params);
			return ublist;
		}
		

		//��ѯʵʱ�����ѯϵͳ�û�������
				public static List<YhxxBean> yhzrs()
				{
					//ʵʱ����������Ϣ�������
					String sql1="UPDATE T_YHUSA set UIDSUM=(select count(\"UID\") from t_yhuser)";
					DBUtil.update(sql1,null);
					//�����¹���������˻���������Ϣ��ѯ֮�󷵻ظ�ublist
					String sql2="select uidsum from T_YHUSA";
					List<YhxxBean> ublist= DBUtil.getList(sql2, YhxxBean.class,null);
					return ublist;
				}

				
		//��ѯʵʱ����USA��������
				public static List<YhxxBean> yhzye()
				{
					//ʵʱ����T_YHUSA������
					String sql1="update T_YHUSA set casessum=(\n" +
							"select SUM(cases) as casessum FROM USA_ZONG \n" +
							"WHERE \"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-05-16')";
					DBUtil.update(sql1,null);
					//ʵʱ����T_YHUSA������
					String sql2="update T_YHUSA set DEATHSSUM=(\n" +
							"select SUM(deaths) as deathssum FROM USA_ZONG \n" +
							"WHERE \"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-05-16')";
					DBUtil.update(sql2,null);

					//�����¹���������������Ϣ��ѯ֮�󷵻ظ�ublist
					String sql3="select * from T_YHUSA";
					List<YhxxBean> ublist= DBUtil.getList(sql3,YhxxBean.class,null);
					return ublist;
				}
				
				
				
		

		


}
