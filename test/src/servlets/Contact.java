package servlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.client;
import dao.DataAccessObject;

/**
 * Servlet implementation class contact
 */
@WebServlet("/contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		client c = new client();
		System.out.println("Name : " + request.getParameter("name"));
		System.out.println("UID : " + request.getParameter("uid"));
		System.out.println("Ph : " + request.getParameter("ph"));
		c.setName(request.getParameter("name"));
		c.setEmail(request.getParameter("uid"));
		c.setPhone(request.getParameter("ph"));
		DataAccessObject dao= new DataAccessObject();
		try {
			if(dao.register(c)) {
				response.sendRedirect("login.jsp");
			}
			else
			{
				System.out.println("Could not register user");
				response.sendRedirect("contact.html");
			}
		}catch(Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Contact Servlet Error --> "+e.getMessage());
		}
	}

}
