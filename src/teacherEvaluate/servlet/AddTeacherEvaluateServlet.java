package teacherEvaluate.servlet;

import entity.Operator;
import entity.TeacherEvaluate;
import impl.StudentImpl;
import impl.TeacherEvaluateImpl;
import impl.TeacherImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddTeacherEvaluateServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		TeacherEvaluate evaluate = new TeacherEvaluate();
		TeacherEvaluateImpl teacherEvaluateImpl = new TeacherEvaluateImpl();
		TeacherImpl teacherImpl = new TeacherImpl();
		StudentImpl studentImpl = new StudentImpl();

		evaluate.setEvaluate(request.getParameter("evaluate"));
		evaluate.setScore1(Integer.parseInt(request.getParameter("score1")));
		evaluate.setScore2(Integer.parseInt(request.getParameter("score2")));
		evaluate.setScore3(Integer.parseInt(request.getParameter("score3")));
		evaluate.setTeacher(teacherImpl.query("tec_id",
				request.getParameter("tec_id")).get(0));
//		evaluate.setStudent(studentImpl.query("ope_id",
//				log_operator.getId().toString()).get(0));
		evaluate.setStudent(studentImpl.query("ope_id",
				"8").get(0));
		int i = teacherEvaluateImpl.add(evaluate);
		if (i == 1) {
			request.getSession().setAttribute("message", "添加教评成功！");
		} else {
			request.getSession().setAttribute("message", "添加教评失败！");
		}
		response.sendRedirect("pages/add_teacher_evaluate.jsp");
	}
}
