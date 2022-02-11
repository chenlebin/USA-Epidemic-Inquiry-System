package hf.dao;

import hf.bean.usabean;

import java.util.List;

public class querydao {

	//todo ��ѯĳ���ݵĵ�����ȷ������������������������������
	public static List<usabean> queryusa(String date,String state) {
		String sql="select SUM(cases) as cases,SUM(deaths) as deaths,CONCAT(ROUND(((sum(deaths)/sum(cases))*100),2),'%') as dr FROM USA_ZONG\n" +
				"WHERE \"TO_CHAR\"(U_DATE,'yyyy-MM-dd')=? and STATE=?";
		Object[] params= {date,state};
		List<usabean> us=DBUtil.getList(sql, usabean.class, params);
		return us;
	}

	//todo ��ѯȫ��������ȷ�����������������������������������
	public static List<usabean> queryusa_USA(String date) {
		String sql="select SUM(cases) as cases,SUM(deaths) as deaths,CONCAT(ROUND(((sum(deaths)/sum(cases))*100),2),'%') as dr FROM USA_ZONG\n" +
				"WHERE \"TO_CHAR\"(U_DATE,'yyyy-MM-dd')=?";
		Object[] params= {date};
		List<usabean> us=DBUtil.getList(sql, usabean.class, params);
		return us;
	}

	//todo ��ѯĳ�յ�������ȫ����������ȷ����������USA�����ͼ������
	public static List<usabean> queryMap(String date) {
		String sql="select \"TO_CHAR\"(U_DATE,'MM-dd') as U_DATE ,STATE,sum(cases) as cases,sum(deaths) as deaths FROM USA_ZONG \n" +
				"where \n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-05-16' \n" +
				"and state in \n" +
				"(select state from usa_zong \n" +
				"where \"TO_CHAR\"(U_DATE,'yyyy-MM-dd')=?)\n" +
				"GROUP BY U_DATE,state ORDER BY STATE";
		Object[] params= {date};
		List<usabean> us=DBUtil.getList(sql, usabean.class, params);
		return us;
	}

	//todo ��ѯ������������ȷ����������ǰ20������-------��ҳ����  ������ѡ��ֻ��ʾ��һҳ��һҳ��20��
	public static List<usabean> query(String date) {
		String sql="select p.* from\n" +
				"     (select rownum r,t.*from\n" +
				"         (\n" +
				"\t\t\t\t\t\tselect state,sum(cases) AS cases,sum(deaths) as deaths,CONCAT(ROUND(((sum(deaths)/sum(cases))*100),2),'%') as dr from usa_zong \n" +
				"\t\t\t\t\t\twhere \"TO_CHAR\"(U_DATE,'yyyy-MM-dd')=? GROUP BY state ORDER BY cases desc) t ) p\n" +
				"\t\t\t\t\t\t\t\twhere r<=20 and r>0";
		Object[] params= {date};
		List<usabean> us=DBUtil.getList(sql, usabean.class, params);
		return us;
	}

	//todo ��ѯĳ��ȷ����������������1��25��5��16���ڼ�ı仯��������
	public static List<usabean> queryQuShi(String state) {
		String sql="select \"TO_CHAR\"(U_DATE,'MM-dd') as U_DATE ,sum(cases) as cases,sum(deaths) as deaths FROM USA_ZONG \n" +
				"where (\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-01-25' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-01-30' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-02-05' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-02-10' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-02-15' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-02-20' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-02-25' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-03-01' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-03-05' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-03-10' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-03-15' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-03-20' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-03-25' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-03-30' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-04-05' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-04-10' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-04-15' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-04-20' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-04-25' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-05-01' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-05-05' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-05-10' or\n" +
				"\"TO_CHAR\"(U_DATE,'yyyy-MM-dd')='2020-05-16' \n" +
				") \n" +
				"and state=? GROUP BY U_DATE ORDER BY U_DATE";
		Object[] params= {state};
		List<usabean> us=DBUtil.getList(sql, usabean.class, params);
		return us;
	}

}
