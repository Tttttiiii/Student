package impl;

import dao.ITeacherEvaluate;
import entity.TeacherEvaluate;
import util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class TeacherEvaluateImpl implements ITeacherEvaluate {
	private SimpleDateFormat sdf;
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	public int add(TeacherEvaluate evaluate) {
		int i = 0;
		try {
			conn = DB.getConn();
			pst = conn
					.prepareStatement("INSERT INTO teacher_evaluate (tec_id,stu_id,evaluate,score1,score2,score3) VALUES (?,?,?,?,?,?)");
			pst.setInt(1, evaluate.getTeacher().getId());
			pst.setInt(2, evaluate.getStudent().getId());
			pst.setString(3, evaluate.getEvaluate());
			pst.setInt(4, evaluate.getScore1());
			pst.setInt(5, evaluate.getScore2());
			pst.setInt(6, evaluate.getScore3());
			i = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
		return i;
	}

	public void delete(TeacherEvaluate evaluate) {
		try {
			conn = DB.getConn();
			pst = conn.prepareStatement("DELETE FROM teacher_evaluate WHERE id = ?");
			pst.setInt(1, evaluate.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
	}

	public void update(TeacherEvaluate evaluate) {
		try {
			conn = DB.getConn();
			pst = conn
					.prepareStatement("UPDATE teacher_evaluate SET tec_id = ?,stu_id = ?,evaluate= ?,score1= ?,score2= ?,score3= ? WHERE id = ?");
			pst.setInt(1, evaluate.getStudent().getId());
			pst.setInt(2, evaluate.getTeacher().getId());
			pst.setString(3, evaluate.getEvaluate());
			pst.setInt(4, evaluate.getScore1());
			pst.setInt(5, evaluate.getScore2());
			pst.setInt(6, evaluate.getScore3());
			pst.setInt(7, evaluate.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
	}

	public List<TeacherEvaluate> query(String type, String value) {
		ArrayList<TeacherEvaluate> list = new ArrayList<TeacherEvaluate>();
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			conn = DB.getConn();
			if (type.equals("id")) {
				pst = conn
						.prepareStatement("SELECT * FROM teacher_evaluate WHERE id = ? order by id");
				pst.setString(1, value);
			}else if (type.equals("tec_id")) {
				pst = conn
						.prepareStatement("SELECT * FROM teacher_evaluate WHERE tec_id = ? order by id");
				pst.setString(1, value);
			} else {
				pst = conn
						.prepareStatement("SELECT * FROM teacher_evaluate order by id");
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				TeacherEvaluate evaluate = new TeacherEvaluate();
				evaluate.setId(rs.getInt(1));
				evaluate.setTeacher(new TeacherImpl().query("tec_id",
						rs.getString(2)).get(0));
				evaluate.setStudent(new StudentImpl().query("stu_id",
						rs.getString(3)).get(0));
				evaluate.setEvaluate(rs.getString(4));
				evaluate.setScore1(rs.getInt(5));
				evaluate.setScore2(rs.getInt(6));
				evaluate.setScore3(rs.getInt(7));
				list.add(evaluate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
		return list;
	}

	public List<TeacherEvaluate> query(String type, String value, int currentPage) {
		currentPage = (currentPage - 1) * 10;
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<TeacherEvaluate> list = new ArrayList<TeacherEvaluate>();
		try {
			conn = DB.getConn();
			if (type.equals("tec_id")) {
				pst = conn
						.prepareStatement("SELECT * FROM teacher_evaluate WHERE tec_id = ? order by id limit ?,10");
				pst.setString(1, value);
				pst.setInt(2, currentPage);
		   }else if (type.equals("tec_name")) {
				pst = conn
						.prepareStatement("SELECT * FROM teacher_evaluate WHERE tec_id IN(SELECT tec_id FROM teacher WHERE tec_name Like ?) order by id limit ?,10");
				pst.setString(1, "%" + value + "%");
				pst.setInt(2, currentPage);
			} else {
				pst = conn
						.prepareStatement("SELECT * FROM teacher_evaluate order by id limit ?,10");
				pst.setInt(1, currentPage);
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				TeacherEvaluate evaluate = new TeacherEvaluate();
				evaluate.setId(rs.getInt(1));
				evaluate.setTeacher(new TeacherImpl().query("tec_id",
						rs.getString(2)).get(0));
				evaluate.setStudent(new StudentImpl().query("stu_id",
						rs.getString(3)).get(0));
				evaluate.setEvaluate(rs.getString(4));
				evaluate.setScore1(rs.getInt(5));
				evaluate.setScore2(rs.getInt(6));
				evaluate.setScore3(rs.getInt(7));
				list.add(evaluate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
		return list;
	}

	public int getCountPage(String type, String value) {
		int countPages = 0;
		try {
			conn = DB.getConn();
			if (type.equals("tec_id")) {
				pst = conn
						.prepareStatement("SELECT * FROM teacher_evaluate WHERE tec_id = ?");
				pst.setString(1, value);
			}else if (type.equals("tec_name")) {
				pst = conn
						.prepareStatement("SELECT COUNT(*) FROM teacher_evaluate WHERE tec_id IN(SELECT tec_id FROM teacher WHERE tec_name Like ?)");
				pst.setString(1, "%" + value + "%");
			} else {
				pst = conn.prepareStatement("SELECT COUNT(*) FROM teacher_evaluate");
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				countPages = rs.getInt(1);
				countPages = countPages % 10 == 0 ? countPages / 10
						: countPages / 10 + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(conn, pst, rs);
		}
		return countPages;
	}

}
