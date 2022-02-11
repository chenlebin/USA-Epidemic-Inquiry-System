package hf.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hf.bean.XxBean;
import hf.bean.YhBean;
import hf.bean.YhxxBean;
import hf.dao.YhDAO;

/**
 * Servlet implementation class YhServlet
 */
@WebServlet("/YhServlet")
public class YhServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public YhServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收标志位
				String s_flag=request.getParameter("flag");
				
//增加用户信息的实现：addyh(request,response)
				if(s_flag.equals("addyh"))
				{
					//增加用户
					this.addyh(request, response);
					//页面跳转
					 request.getRequestDispatcher("/主页.jsp").forward(request, response);
				}
				
//修改用户信息的实现：gengxin(request,response)
                if(s_flag.equals("xgyh"))
					
				{
		            //修改用户信息
					
					this.gengxin(request, response);
					//页面跳转
					request.getRequestDispatcher("/主页.jsp").forward(request, response);
					
				}
				
//用户登录的实现：denglu(request,response)
				if(s_flag.equals("denglu"))
				{
				    //数据查询
					this.denglu(request,response);
				}
				
//用户注册的实现：addyh(request,response)+页面跳转：根据注册的不同身份跳转到用户界面或管理员界面
				if(s_flag.equals("zhuce"))
				{
					//用户注册
					this.addyh(request, response);
					String u_lx=request.getParameter("ulx1");
					String u_lx1=new String( u_lx.getBytes("iso-8859-1"),"utf-8");
					System.out.println(u_lx1);
					
					//页面的跳转
				    if(u_lx1.equals("用户"))
				    {
			           request.getRequestDispatcher("/用户界面.jsp").forward(request, response);
				    }
				    if(u_lx1.equals("管理员"))
				    {
			           request.getRequestDispatcher("/主页.jsp").forward(request, response);
				    }
				    
				}
				
//查询用户信息的实现：queryyhxx(request,response)				
				if(s_flag.equals("queryyhxx"))
				{
				    //数据查询
					this.queryyhxx(request,response);
				}


//查询实时银行账户总人数的实现：yhzrs(request,response)				
				if(s_flag.equals("yhzrs"))
				{
				    //数据查询
					this.yhzrs(request,response);
				}
				
//查询实时银行总余额的实现：yhzye(request,response)				
				if(s_flag.equals("yhzye"))
				{
				    //数据查询
					this.yhzye(request,response);
				}
				
//删除用户信息的实现：delyh(request,response)				
				if(s_flag.equals("delyh"))
					
				{
		            //删除用户信息
					this.delyh(request, response);
					
				}
				

                
                
				
	}

	
//增加用户信息的实现：addyh(request,response)
		public static void addyh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
//			System.out.println("add....");
			
			
			
			String u_id=request.getParameter("uid1");
			String u_name=request.getParameter("uname1");
			String u_lx=request.getParameter("ulx1");
			String u_pwd=request.getParameter("upwd1");
			String u_sf=request.getParameter("sfzh1");
			String u_xb=request.getParameter("xb1");
			String u_yx=request.getParameter("yx1");
			
			//中文乱码的处理方法：！！！！
			String u_name1=new String( u_name.getBytes("iso-8859-1"),"utf-8");
			String u_lx1=new String( u_lx.getBytes("iso-8859-1"),"utf-8");
			String u_pwd1=new String( u_pwd.getBytes("iso-8859-1"),"utf-8");
			String u_xb1=new String( u_xb.getBytes("iso-8859-1"),"utf-8");
			String u_yx1=new String( u_yx.getBytes("iso-8859-1"),"utf-8");

			//dopost方法  request.setCharacterEncoding("utf-8");
			
		    
		    XxBean yhs=new XxBean();
		    yhs.setUid(u_id);
		    yhs.setUname(u_name1);
		    yhs.setUlx(u_lx1);
		    yhs.setUpwd(u_pwd1);
		    yhs.setUxb(u_xb1);
		    yhs.setUsf(u_sf);
		    yhs.setUyx(u_yx1);
		    int i=YhDAO.addyh(yhs);
//		    如果i=1则插入成功否则失败。
		    if(i==1)
		    {
		    	request.setAttribute("mag","恭喜,增加用户成功！");
		    }
		    else
		    {
		    	request.setAttribute("mag","很遗憾,增加用户失败！");
		    	
		    }
		    ServletRequest arg0;
		    
		    
		}
		
//用户信息修改功能的实现：gengxin(request,response)	
		public static void gengxin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
//			System.out.println("add....");

			String u_id=request.getParameter("uid1");
			String u_name=request.getParameter("uname1");
			String u_pwd=request.getParameter("upwd1");
			String u_sf=request.getParameter("sfzh1");
			String u_xb=request.getParameter("xb1");
			String u_yx=request.getParameter("yx1");

			//中文乱码的处理方法：！！！！
			String u_name1=new String( u_name.getBytes("iso-8859-1"),"utf-8");
			String u_pwd1=new String( u_pwd.getBytes("iso-8859-1"),"utf-8");
			String u_xb1=new String( u_xb.getBytes("iso-8859-1"),"utf-8");
			String u_yx1=new String( u_yx.getBytes("iso-8859-1"),"utf-8");

			//dopost方法  request.setCharacterEncoding("utf-8");


			XxBean yhs=new XxBean();
			yhs.setUid(u_id);
			yhs.setUname(u_name1);
			yhs.setUpwd(u_pwd1);
			yhs.setUsf(u_sf);
			yhs.setUxb(u_xb1);
			yhs.setUyx(u_yx1);

		    YhDAO.gengxin(yhs);

		}
		
//用户登录功能的实现：denglu(request,response)
				public static void denglu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
				{
//					System.out.println("query....");
					String u_lx=request.getParameter("ulx1");
					String u_name=request.getParameter("uname1");
					String u_pwd=request.getParameter("upwd1");
					String u_lx1=new String( u_lx.getBytes("iso-8859-1"),"utf-8");
					String u_name1=new String( u_name.getBytes("iso-8859-1"),"utf-8");
					String u_pwd1=new String( u_pwd.getBytes("iso-8859-1"),"utf-8");
					
					
					YhBean yhs=new YhBean();
					yhs.setUname(u_name1);
					yhs.setUpwd(u_pwd1);
					yhs.setUlx(u_lx1);
						

					List<YhBean> dblist=YhDAO.denglu(yhs);

					
					if(dblist.size()>=1)
					{
						System.out.println(u_lx1);
						if(u_lx1.equals("用户"))
						{
						//页面跳转
					    request.getRequestDispatcher("/用户界面.jsp").forward(request, response);
						}
						
						if(u_lx1.equals("管理员"))
						{
						//页面跳转
						request.getRequestDispatcher("/主页.jsp").forward(request, response);
						}
					 }
					 else
					    {
						//页面跳转	    	
						request.getRequestDispatcher("/重新登录.jsp").forward(request, response);
						
						
					}
				}
		
		
		
//查询用户信息的实现：queryyhxx(request,response)
		public static void queryyhxx(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
//			System.out.println("query....");
			String s_yh_id=request.getParameter("uid1");
			System.out.println(s_yh_id);
			int id=Integer.parseInt(s_yh_id);
			System.out.println(id);
			List<XxBean> dblist=YhDAO.queryyhxx(id);
			//封装数据
			request.setAttribute("dbdata",dblist);
		    //页面跳转
		    request.getRequestDispatcher("/账户信息查询结果.jsp").forward(request, response);
		}
		


				
//查询实时银行账户总人数的实现：yhzrs(request,response)
				public static void yhzrs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
				{
					//调用DAO包进行数据更新和查询
					List<YhxxBean> dblist=YhDAO.yhzrs();	
					//数据封装
					request.setAttribute("dbdata",dblist);
				    //页面跳转
				    request.getRequestDispatcher("/实时疫情查询系统用户总人数.jsp").forward(request, response);
				}
				
				
//查询实时银行总余额的实现：yhz(request,response)
				public static void yhzye(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
				{
					//调用DAO包进行数据更新和查询
					List<YhxxBean> dblist=YhDAO.yhzye();	
					//数据封装
					request.setAttribute("dbdata",dblist);
				    //页面跳转
				    request.getRequestDispatcher("/实时全美疫情数据统计.jsp").forward(request, response);
				}		

		
		
//删除用户信息的实现：delyh(request,response)
		public static void delyh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
			String s_bd_id=request.getParameter("uid1");
			//将接收到的uid值转化为int型
			int bd_id=Integer.parseInt(s_bd_id);
			YhDAO.delyh(bd_id);
//			 页面跳转
		    request.getRequestDispatcher("/主页.jsp").forward(request, response);
			
			
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
