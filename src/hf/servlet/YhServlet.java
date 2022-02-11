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
		//���ձ�־λ
				String s_flag=request.getParameter("flag");
				
//�����û���Ϣ��ʵ�֣�addyh(request,response)
				if(s_flag.equals("addyh"))
				{
					//�����û�
					this.addyh(request, response);
					//ҳ����ת
					 request.getRequestDispatcher("/��ҳ.jsp").forward(request, response);
				}
				
//�޸��û���Ϣ��ʵ�֣�gengxin(request,response)
                if(s_flag.equals("xgyh"))
					
				{
		            //�޸��û���Ϣ
					
					this.gengxin(request, response);
					//ҳ����ת
					request.getRequestDispatcher("/��ҳ.jsp").forward(request, response);
					
				}
				
//�û���¼��ʵ�֣�denglu(request,response)
				if(s_flag.equals("denglu"))
				{
				    //���ݲ�ѯ
					this.denglu(request,response);
				}
				
//�û�ע���ʵ�֣�addyh(request,response)+ҳ����ת������ע��Ĳ�ͬ������ת���û���������Ա����
				if(s_flag.equals("zhuce"))
				{
					//�û�ע��
					this.addyh(request, response);
					String u_lx=request.getParameter("ulx1");
					String u_lx1=new String( u_lx.getBytes("iso-8859-1"),"utf-8");
					System.out.println(u_lx1);
					
					//ҳ�����ת
				    if(u_lx1.equals("�û�"))
				    {
			           request.getRequestDispatcher("/�û�����.jsp").forward(request, response);
				    }
				    if(u_lx1.equals("����Ա"))
				    {
			           request.getRequestDispatcher("/��ҳ.jsp").forward(request, response);
				    }
				    
				}
				
//��ѯ�û���Ϣ��ʵ�֣�queryyhxx(request,response)				
				if(s_flag.equals("queryyhxx"))
				{
				    //���ݲ�ѯ
					this.queryyhxx(request,response);
				}


//��ѯʵʱ�����˻���������ʵ�֣�yhzrs(request,response)				
				if(s_flag.equals("yhzrs"))
				{
				    //���ݲ�ѯ
					this.yhzrs(request,response);
				}
				
//��ѯʵʱ����������ʵ�֣�yhzye(request,response)				
				if(s_flag.equals("yhzye"))
				{
				    //���ݲ�ѯ
					this.yhzye(request,response);
				}
				
//ɾ���û���Ϣ��ʵ�֣�delyh(request,response)				
				if(s_flag.equals("delyh"))
					
				{
		            //ɾ���û���Ϣ
					this.delyh(request, response);
					
				}
				

                
                
				
	}

	
//�����û���Ϣ��ʵ�֣�addyh(request,response)
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
			
			//��������Ĵ�����������������
			String u_name1=new String( u_name.getBytes("iso-8859-1"),"utf-8");
			String u_lx1=new String( u_lx.getBytes("iso-8859-1"),"utf-8");
			String u_pwd1=new String( u_pwd.getBytes("iso-8859-1"),"utf-8");
			String u_xb1=new String( u_xb.getBytes("iso-8859-1"),"utf-8");
			String u_yx1=new String( u_yx.getBytes("iso-8859-1"),"utf-8");

			//dopost����  request.setCharacterEncoding("utf-8");
			
		    
		    XxBean yhs=new XxBean();
		    yhs.setUid(u_id);
		    yhs.setUname(u_name1);
		    yhs.setUlx(u_lx1);
		    yhs.setUpwd(u_pwd1);
		    yhs.setUxb(u_xb1);
		    yhs.setUsf(u_sf);
		    yhs.setUyx(u_yx1);
		    int i=YhDAO.addyh(yhs);
//		    ���i=1�����ɹ�����ʧ�ܡ�
		    if(i==1)
		    {
		    	request.setAttribute("mag","��ϲ,�����û��ɹ���");
		    }
		    else
		    {
		    	request.setAttribute("mag","���ź�,�����û�ʧ�ܣ�");
		    	
		    }
		    ServletRequest arg0;
		    
		    
		}
		
//�û���Ϣ�޸Ĺ��ܵ�ʵ�֣�gengxin(request,response)	
		public static void gengxin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
//			System.out.println("add....");

			String u_id=request.getParameter("uid1");
			String u_name=request.getParameter("uname1");
			String u_pwd=request.getParameter("upwd1");
			String u_sf=request.getParameter("sfzh1");
			String u_xb=request.getParameter("xb1");
			String u_yx=request.getParameter("yx1");

			//��������Ĵ�����������������
			String u_name1=new String( u_name.getBytes("iso-8859-1"),"utf-8");
			String u_pwd1=new String( u_pwd.getBytes("iso-8859-1"),"utf-8");
			String u_xb1=new String( u_xb.getBytes("iso-8859-1"),"utf-8");
			String u_yx1=new String( u_yx.getBytes("iso-8859-1"),"utf-8");

			//dopost����  request.setCharacterEncoding("utf-8");


			XxBean yhs=new XxBean();
			yhs.setUid(u_id);
			yhs.setUname(u_name1);
			yhs.setUpwd(u_pwd1);
			yhs.setUsf(u_sf);
			yhs.setUxb(u_xb1);
			yhs.setUyx(u_yx1);

		    YhDAO.gengxin(yhs);

		}
		
//�û���¼���ܵ�ʵ�֣�denglu(request,response)
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
						if(u_lx1.equals("�û�"))
						{
						//ҳ����ת
					    request.getRequestDispatcher("/�û�����.jsp").forward(request, response);
						}
						
						if(u_lx1.equals("����Ա"))
						{
						//ҳ����ת
						request.getRequestDispatcher("/��ҳ.jsp").forward(request, response);
						}
					 }
					 else
					    {
						//ҳ����ת	    	
						request.getRequestDispatcher("/���µ�¼.jsp").forward(request, response);
						
						
					}
				}
		
		
		
//��ѯ�û���Ϣ��ʵ�֣�queryyhxx(request,response)
		public static void queryyhxx(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
//			System.out.println("query....");
			String s_yh_id=request.getParameter("uid1");
			System.out.println(s_yh_id);
			int id=Integer.parseInt(s_yh_id);
			System.out.println(id);
			List<XxBean> dblist=YhDAO.queryyhxx(id);
			//��װ����
			request.setAttribute("dbdata",dblist);
		    //ҳ����ת
		    request.getRequestDispatcher("/�˻���Ϣ��ѯ���.jsp").forward(request, response);
		}
		


				
//��ѯʵʱ�����˻���������ʵ�֣�yhzrs(request,response)
				public static void yhzrs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
				{
					//����DAO���������ݸ��ºͲ�ѯ
					List<YhxxBean> dblist=YhDAO.yhzrs();	
					//���ݷ�װ
					request.setAttribute("dbdata",dblist);
				    //ҳ����ת
				    request.getRequestDispatcher("/ʵʱ�����ѯϵͳ�û�������.jsp").forward(request, response);
				}
				
				
//��ѯʵʱ����������ʵ�֣�yhz(request,response)
				public static void yhzye(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
				{
					//����DAO���������ݸ��ºͲ�ѯ
					List<YhxxBean> dblist=YhDAO.yhzye();	
					//���ݷ�װ
					request.setAttribute("dbdata",dblist);
				    //ҳ����ת
				    request.getRequestDispatcher("/ʵʱȫ����������ͳ��.jsp").forward(request, response);
				}		

		
		
//ɾ���û���Ϣ��ʵ�֣�delyh(request,response)
		public static void delyh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
			String s_bd_id=request.getParameter("uid1");
			//�����յ���uidֵת��Ϊint��
			int bd_id=Integer.parseInt(s_bd_id);
			YhDAO.delyh(bd_id);
//			 ҳ����ת
		    request.getRequestDispatcher("/��ҳ.jsp").forward(request, response);
			
			
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}