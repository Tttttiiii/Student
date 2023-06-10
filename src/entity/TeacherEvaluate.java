package entity;

import java.io.Serializable;

public class TeacherEvaluate implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Teacher teacher;// 老师
	private Student student;// 学生
	private String evaluate;// 学生
	private Integer score1;// 备课情况
	private Integer score2;// 专业素质
	private Integer score3;// 技术提升

	public TeacherEvaluate() {
		this.teacher = new Teacher();
		this.student = new Student();
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	public Integer getScore1() {
		return score1;
	}

	public void setScore1(Integer score1) {
		this.score1 = score1;
	}

	public Integer getScore2() {
		return score2;
	}

	public void setScore2(Integer score2) {
		this.score2 = score2;
	}

	public Integer getScore3() {
		return score3;
	}

	public void setScore3(Integer score3) {
		this.score3 = score3;
	}
}
