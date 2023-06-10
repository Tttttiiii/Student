package teacherEvaluate.servlet;

import entity.TeacherEvaluate;
import impl.TeacherEvaluateImpl;
import net.sf.json.JSONSerializer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SearchTeacherEvaluateServlet extends HttpServlet {

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
		// AJAX查询教师
		TeacherEvaluateImpl teacherEvaluateImpl = new TeacherEvaluateImpl();
		List<TeacherEvaluate> list_evaluate = new ArrayList<TeacherEvaluate>();
		String search_type = request.getParameter("search_type");
		String search_value = java.net.URLDecoder.decode(request
				.getParameter("value"), "UTF-8");
		int page = Integer.parseInt(request.getParameter("page"));
		list_evaluate = teacherEvaluateImpl.query(search_type, search_value, page);
		response.getWriter().write(
				JSONSerializer.toJSON(list_evaluate).toString());

	}
}
