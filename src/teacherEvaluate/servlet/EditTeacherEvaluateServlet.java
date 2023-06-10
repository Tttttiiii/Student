package teacherEvaluate.servlet;

import entity.TeacherEvaluate;
import impl.TeacherEvaluateImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditTeacherEvaluateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 准备更新老师的信息
		HttpSession session = request.getSession();
		TeacherEvaluateImpl teacherEvaluateImpl = new TeacherEvaluateImpl();
		TeacherEvaluate evaluate = teacherEvaluateImpl.query("id",
				request.getParameter("id")).get(0);
		session.setAttribute("evaluate", evaluate);
		response.sendRedirect("pages/teacher_evaluate.jsp");

	}
}
