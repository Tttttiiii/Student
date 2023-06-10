package teacherEvaluate.servlet;

import entity.Teacher;
import impl.TeacherImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class PlanAddTeacherEvaluateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 准备添加班级
		TeacherImpl teacherImpl = new TeacherImpl();
		List<Teacher> list_teacher;
		HttpSession session = request.getSession();
		list_teacher = teacherImpl.query("all", "all");
		session.setAttribute("list_teacher", list_teacher);
		response.sendRedirect("pages/add_teacher_evaluate.jsp");
	}
}
