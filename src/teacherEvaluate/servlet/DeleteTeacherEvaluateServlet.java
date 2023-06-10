package teacherEvaluate.servlet;

import impl.TeacherEvaluateImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteTeacherEvaluateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 删除教师，检测是否带班，有的话也连删，数据库触发器无法实现，只能这里多一步
		TeacherEvaluateImpl teacherEvaluateImpl = new TeacherEvaluateImpl();
		teacherEvaluateImpl.delete(teacherEvaluateImpl.query("id",
				request.getParameter("id")).get(0));
		response.sendRedirect("pages/search_teacher_evaluate.jsp");

	}
}
