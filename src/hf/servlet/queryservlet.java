package hf.servlet;

import hf.bean.usabean;
import hf.dao.querydao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * Servlet implementation class queryservlet
 */
@WebServlet("/queryservlet")
public class queryservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public queryservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收标志位
		String s_flag=request.getParameter("flag");

		//查询疫情页面操作(request,response)
		if(s_flag.equals("query"))
		{
			//查询疫情页面操作
			Query(request, response);

		}

	}

	public void Query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String jzrq1=request.getParameter("jzrq1");
		String state=request.getParameter("select");
		System.out.println(jzrq1);
		System.out.println(state);
		List<usabean> zixun;
		if(state.equals("USA"))
		{
			//todo 如果发现接收到选择的州为USA州则进行额外的处理
			zixun = querydao.queryusa_USA(jzrq1);
		}
		else
		{
			//调用queryusa方法查询出相应时间date相应州state的确诊死亡人数和死亡率
			zixun = querydao.queryusa(jzrq1, state);
		}
		//string转化为Date
//	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//yyyy-mm-dd
//
//	    Date utilDate = null;
//		try {
//			utilDate = sdf.parse(jzrq1);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	    System.out.println(utilDate);
//	    Date date = new java.sql.Date(utilDate.getTime());
//	    System.out.println(date);


		//调用queryMap查询相应时间date的全美各州疫情数据用于疫情地图存成字典类型
		List<usabean> map=querydao.queryMap(jzrq1);
		//调用query查询相应时间date的州级别的确诊人数Top20
		List<usabean> top=querydao.query(jzrq1);
		//调用queryQuShi查询对应州从1月25至5月16之间确诊人数和死亡人数的变化情况
		List<usabean> qushi=querydao.queryQuShi(state);

		//todo 将数据输出到控制台方便研究数据，并进行后续的处理
		System.out.println("==============================================================");
		System.out.println("趋势预测数据---qushiyuce"+qushi);
		System.out.println("==============================================================");
		System.out.println("州级Top20排行数据---top20"+top);
		System.out.println("==============================================================");
		System.out.println("疫情资讯数据---yiqiingzixun"+zixun);
		System.out.println("==============================================================");
		System.out.println("疫情地图数据---USAMap"+map);
		System.out.println("==============================================================");

		//todo 对美国疫情地图数据进行处理，处理为字典类型的数据
		//数据字典模拟美国各州的数据字典，实际中可以从redis进行读取加载，如果数据不大也可以使用一个字典来存储
		HashMap<String,Integer> stateMap = new HashMap<>();
		String[] stateString = {"Alabama","Alaska","Arizona"};
		//创建美国55个州的字典
			stateMap.put("Alabama", 0);
			stateMap.put("Alaska", 1);
			stateMap.put("Arizona", 2);
			stateMap.put("Arkansas", 3);
			stateMap.put("California", 4);
			stateMap.put("Colorado", 5);
			stateMap.put("Connecticut", 6);
			stateMap.put("Delaware", 7);
			stateMap.put("District of Columbia", 8);
			stateMap.put("Florida", 9);
			stateMap.put("Georgia", 10);
			stateMap.put("Guam", 11);
			stateMap.put("Hawaii", 12);
			stateMap.put("Idaho", 13);
			stateMap.put("Illinois", 14);
			stateMap.put("Indiana", 15);
			stateMap.put("Iowa", 16);
			stateMap.put("Kansas", 17);
			stateMap.put("Kentucky", 18);
			stateMap.put("Louisiana", 19);
			stateMap.put("Maine", 20);
			stateMap.put("Maryland", 21);
			stateMap.put("Massachusetts", 22);
			stateMap.put("Michigan", 23);
			stateMap.put("Minnesota", 24);
			stateMap.put("Mississippi", 25);
			stateMap.put("Missouri", 26);
			stateMap.put("Montana", 27);
			stateMap.put("Nebraska", 28);
			stateMap.put("Nevada", 29);
			stateMap.put("New Hampshire", 30);
			stateMap.put("New Jersey", 31);
			stateMap.put("New Mexico", 32);
			stateMap.put("New York", 33);
			stateMap.put("North Carolina", 34);
			stateMap.put("North Dakota", 35);
			stateMap.put("Northern Mariana Islands", 36);
			stateMap.put("Ohio", 37);
			stateMap.put("Oklahoma", 38);
			stateMap.put("Oregon", 39);
			stateMap.put("Pennsylvania", 40);
			stateMap.put("Puerto Rico", 41);
			stateMap.put("Rhode Island", 42);
			stateMap.put("South Carolina", 43);
			stateMap.put("South Dakota", 44);
			stateMap.put("Tennessee", 45);
			stateMap.put("Texas", 46);
			stateMap.put("Utah", 47);
			stateMap.put("Vermont", 48);
			stateMap.put("Virgin Islands", 49);
			stateMap.put("Virginia", 50);
			stateMap.put("Washington", 51);
			stateMap.put("West Virginia", 52);
			stateMap.put("Wisconsin", 53);
			stateMap.put("Wyoming", 54);
			stateMap.getOrDefault("错误",55);

		//todo 对字典进行反转方便之后通过value找name
		HashMap<Integer,String> valueMap = new HashMap<>();
		Set<String> keys = stateMap.keySet();

		for(String key : keys){
			Integer value = stateMap.get(key);
			valueMap.put(value,key);
		}
		System.out.println("------------------------------valueMap------------------------------");
		System.out.println(valueMap);


		//对字典中的value值进行更新
		for (hf.bean.usabean usabean : map) {
			int s_value=stateMap.get(usabean.getState());
			if (s_value<55)
			{
				stateMap.put(valueMap.get(s_value), usabean.getCases());
			}
		}

		System.out.println("---------------------------update stateMap---------------------------");
		System.out.println(stateMap);
		System.out.println("=====================================================================");

		//todo 对趋势预测的数据进行处理
		// 数据样式：
		//[usabean{u_uid=0, u_date='03-01', state='null', county='null', cases=1, deaths=0, dr='null'},......]
		List<String> q_date= new ArrayList<>();
		List q_cases=new ArrayList<String>();
		List q_deaths=new ArrayList<String>();
		for (hf.bean.usabean usabean : qushi) {
			System.out.println(usabean + "\n\n");
			//todo 将从ORACLE数据库获取的数据按列分别存入到list中之后传给jsp页面使用
			q_date.add(usabean.getU_date());
			q_cases.add(usabean.getCases());
			q_deaths.add(usabean.getDeaths());
		}
		System.out.println(q_date);
		System.out.println(q_cases);
		System.out.println(q_deaths);


		//todo 将servlet层获取处理完的数据返回给jsp页面进行数据展示
		//将dao包从ORACLE数据库获取的数据封装并返回给jsp页面进行疫情资讯展示
		request.setAttribute("pdata", top);
		request.setAttribute("zixundata", zixun);

		//将处理完的字典数据stateMap返回给jsp页面
		request.setAttribute("stateMap", stateMap);

		//将处理完的趋势预测list返回给jsp页面进行趋势预测展示
		request.setAttribute("q_date",q_date);
		request.setAttribute("q_cases",q_cases);
		request.setAttribute("q_deaths",q_deaths);

		//页面跳转回主页，但是这次主页的信息已经获取更新成功了
		request.getRequestDispatcher("usaselect.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
