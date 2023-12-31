package score.servlet;

import impl.ScoreImpl;
import impl.StudentImpl;
import impl.TeacherImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONSerializer;
import entity.Operator;
import entity.Score;
import entity.Student;
import entity.Teacher;

public class SearchScoreServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// AJAX异步查询成绩
		StudentImpl studentImpl = new StudentImpl();
		TeacherImpl teacherImpl = new TeacherImpl();
		ScoreImpl scoreImpl = new ScoreImpl();
		Operator operator;
		Student student;
		Teacher teacher;
		List<Score> list_score;
		operator = (Operator) request.getSession().getAttribute("log_operator");
		int ope_rol_id = operator.getRole().getId();

		String search_type = request.getParameter("search_type");
		String search_value = java.net.URLDecoder.decode(request
				.getParameter("value"), "UTF-8");
		int page = Integer.parseInt(request.getParameter("page"));
		list_score = new ArrayList<Score>();
		double avg=0.0;
		if (ope_rol_id == 1) {
			// 管理员的查询
			if (search_type.equals("stu_all")) {
				list_score = scoreImpl.query("all", search_value, page);
				avg = scoreImpl.queryAvg("all", search_value);
			}else {
				list_score = scoreImpl.query(search_type, search_value, page);
				avg = scoreImpl.queryAvg(search_type, search_value);
			}
		} else if (ope_rol_id == 2) {
			// 老师的查询
			teacher = teacherImpl.query("ope_id", operator.getId() + "").get(0);
			if (search_type.equals("stu_all")) {
				list_score = scoreImpl.query("tec_stu_all", teacher.getName()
						+ "", page);
				avg = scoreImpl.queryAvg("tec_stu_all", teacher.getName()
						+ "");
			} else if (search_type.equals("stu_no")) {
				list_score = scoreImpl.query("tec_stu_no", teacher.getName()
						+ "_" + search_value, page);
				avg = scoreImpl.queryAvg("tec_stu_no", teacher.getName()
						+ "_" + search_value);
			} else if (search_type.equals("stu_name")) {
				list_score = scoreImpl.query("tec_stu_name", teacher.getName()
						+ "_" + search_value, page);
				avg = scoreImpl.queryAvg("tec_stu_name", teacher.getName()
						+ "_" + search_value);
			} else if (search_type.equals("sub_name")) {
				list_score = scoreImpl.query("tec_sub_name", teacher.getName()
						+ "_" + search_value, page);
				avg = scoreImpl.queryAvg("tec_sub_name", teacher.getName()
						+ "_" + search_value);
			} else if (search_type.equals("cla_name")) {
				list_score = scoreImpl.query("tec_cla_name", teacher.getName()
						+ "_" + search_value, page);
				avg = scoreImpl.queryAvg("tec_cla_name", teacher.getName()
						+ "_" + search_value);
			}
		} else {
			// 学生查询
			student = studentImpl.query("ope_id", operator.getId() + "").get(0);
			if (search_type.equals("stu_all")) {
				list_score = scoreImpl.query("stu_all", student.getId() + "",
						page);
				avg = scoreImpl.queryAvg("stu_all", student.getId() + "");
			} else if (search_type.equals("sub_name")) {
				list_score = scoreImpl.query("stu_sub_name", student.getId()
						+ "_" + search_value, page);
				avg = scoreImpl.queryAvg("stu_sub_name", student.getId()
						+ "_" + search_value);
			} else {
				list_score = scoreImpl.query("stu_tec_name", student.getId()
						+ "_" + search_value, page);
				avg = scoreImpl.queryAvg("stu_tec_name", student.getId()
						+ "_" + search_value);
			}
		}
		Map<String, Object> map =new HashMap<String,Object>();
		map.put("list_score",list_score);
		map.put("avg",avg);
		response.getWriter()
				.write(JSONSerializer.toJSON(map).toString());
	}
}
