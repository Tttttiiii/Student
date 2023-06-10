package score.servlet;

import entity.Operator;
import entity.Teacher;
import impl.ScoreImpl;
import impl.TeacherImpl;
import net.sf.json.JSONSerializer;
import util.PartUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchScorePartDistServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// AJAX异步查询成绩
		TeacherImpl teacherImpl = new TeacherImpl();
		Operator operator;
		Teacher teacher;
		operator = (Operator) request.getSession().getAttribute("log_operator");
		int ope_rol_id = operator.getRole().getId();

		String search_type = request.getParameter("search_type");
		String search_value = java.net.URLDecoder.decode(request
				.getParameter("value"), "UTF-8");
		List<Map<String,Object>> mapList=new ArrayList<Map<String,Object>>();
		if (ope_rol_id == 1) {
			// 管理员的查询
			if (search_type.equals("stu_all")) {
				mapList = getPartDist("all", search_value);
			}else {
				mapList = getPartDist(search_type, search_value);
			}
		} else if (ope_rol_id == 2) {
			// 老师的查询
			teacher = teacherImpl.query("ope_id", operator.getId() + "").get(0);
			if (search_type.equals("stu_all")) {
				mapList = getPartDist("tec_stu_all", teacher.getName()
						+ "");
			} else if (search_type.equals("stu_no")) {
				mapList = getPartDist("tec_stu_no", teacher.getName()
						+ "_" + search_value);
			} else if (search_type.equals("stu_name")) {
				mapList = getPartDist("tec_stu_name", teacher.getName()
						+ "_" + search_value);
			} else if (search_type.equals("sub_name")) {
				mapList = getPartDist("tec_sub_name", teacher.getName()
						+ "_" + search_value);
			} else if (search_type.equals("cla_name")) {
				mapList = getPartDist("tec_cla_name", teacher.getName()
						+ "_" + search_value);
			}
		}
		response.getWriter()
				.write(JSONSerializer.toJSON(mapList).toString());
	}

	private List<Map<String,Object>> getPartDist(String type,String value){
		List<Map<String,Object>> mapList=new ArrayList<Map<String,Object>>();
		List<String> partList= PartUtil.getPartList();
		ScoreImpl scoreImpl = new ScoreImpl();
		for (int i = 0; i < partList.size(); i++) {
			Map<String,Object> objectMap=new HashMap<String,Object>();
			int count=scoreImpl.queryScorePartCount(type,value,i+1);
			objectMap.put("name",partList.get(i));
			objectMap.put("value",count);
			mapList.add(objectMap);
		}
		return mapList;
	}
}
