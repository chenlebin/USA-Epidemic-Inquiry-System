package hf.dao;

import hf.bean.XxBean;
import hf.bean.YhBean;
import hf.bean.YhxxBean;

import java.util.List;


public class YhDAO {
	//用户增加的方法（函数）
		public static int addyh( XxBean yhs)
		  {
		  	//将用户的账号密码信息存入t_yhuser
			String sql="insert into t_yhuser(\"UID\",UNAME,ULX,UPWD)\n" +
					"values(?,?,?,?)";
			Object[] params= {yhs.getUid(),yhs.getUname(),yhs.getUlx(),yhs.getUpwd()};

			//将用户的个人信息存入t_yhxinxi。数据样式：1008604	陈乐斌	男	20010422	1585696186@qq.com
			String sql2="insert into T_YHXINXI\n" +
					"values(?,?,?,?,?)";
			Object[] params2= {yhs.getUid(),yhs.getUname(),yhs.getUxb(),yhs.getUsf(),yhs.getUyx()};

			//只有当两个数据均插入成功时才会返回1代表插入成功
			return DBUtil.update(sql, params)*DBUtil.update(sql2,params2);
			
		  }
		
	//用户信息更新(修改)的方法（函数）
	    public static void gengxin( XxBean yhs)
		{
	    	//更新t_yhuser中的信息
	    	String sql1="update T_YHUSER set uname=?,UPWD=? where \"UID\"=?";
			Object[] params1= {yhs.getUname(),yhs.getUpwd(),yhs.getUid()};
			DBUtil.update(sql1, params1);

	    	//更新t_yhxinxi中的信息
	    	String sql2="update T_YHXINXI set uname=?,UXB=?,USF=?,UYX=? where \"UID\"=?";
			Object[] params2= {yhs.getUname(),yhs.getUxb(), yhs.getUsf(), yhs.getUyx(),yhs.getUid()};
			DBUtil.update(sql2, params2);
		}

    //登录的方法
		public static List<YhBean> denglu(YhBean yhs)
		{
			String sql="select * from t_yhuser where uname=? and upwd=? and ulx=?";
			Object[] params= {yhs.getUname(),yhs.getUpwd(),yhs.getUlx()};
			List<YhBean> ublist= DBUtil.getList(sql, YhBean.class, params);
			return ublist;
		}


	//删除用户信息的方法
		public static void delyh(int bd_id)
		{
			//将两个表中的数据均删除
			String sql="delete from t_yhuser where \"UID\"=?";
			Object[] params= {bd_id};
			DBUtil.update(sql, params);

			String sql2="delete from t_yhxinxi where \"UID\"=?";
			Object[] params2= {bd_id};
			DBUtil.update(sql2, params2);
			
		}
		

		//用户信息查询函数 todo 多表连接
		public static List<XxBean> queryyhxx(int id)
		{
			String sql="SELECT u.\"UID\",u.UNAME,u.ULX,u.UPWD,x.UXB,x.USF,x.UYX FROM T_YHUSER u INNER JOIN T_YHXINXI x on u.\"UID\"=x.\"UID\"\n" +
					"WHERE u.\"UID\"=?";
			Object[] params= {id};
			List<XxBean> ublist= DBUtil.getList(sql, XxBean.class, params);
			return ublist;
		}
		

		//查询实时疫情查询系统用户总人数
				public static List<YhxxBean> yhzrs()
				{
					//实时更新银行信息表的内容
					String sql1="UPDATE T_YHUSA set UIDSUM=(select count(\"UID\") from t_yhuser)";
					DBUtil.update(sql1,null);
					//将更新过后的银行账户总人数信息查询之后返回给ublist
					String sql2="select uidsum from T_YHUSA";
					List<YhxxBean> ublist= DBUtil.getList(sql2, YhxxBean.class,null);
					return ublist;
				}

				
		//查询实时美国USA总体数据
				public static List<YhxxBean> yhzye()
				{
					//实时更新T_YHUSA的内容
					String sql1="update T_YHUSA set casessum=(\n" +
							"select SUM(cases) as casessum FROM USA_ZONG \n" +
							"WHERE \"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-05-16')";
					DBUtil.update(sql1,null);
					//实时更新T_YHUSA的内容
					String sql2="update T_YHUSA set DEATHSSUM=(\n" +
							"select SUM(deaths) as deathssum FROM USA_ZONG \n" +
							"WHERE \"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-05-16')";
					DBUtil.update(sql2,null);

					//将更新过后的银行总余额信息查询之后返回给ublist
					String sql3="select * from T_YHUSA";
					List<YhxxBean> ublist= DBUtil.getList(sql3,YhxxBean.class,null);
					return ublist;
				}
				
				
				
		

		


}
