package dao;

import entity.TeacherEvaluate;

import java.util.List;

public interface ITeacherEvaluate
{
	// 添加
	public int add(TeacherEvaluate evaluate);

	// 删除
	public void delete(TeacherEvaluate evaluate);

	// 更新
	public void update(TeacherEvaluate evaluate);

	// 查询
	public List<TeacherEvaluate> query(String type, String value);

	// 分页查询
	public List<TeacherEvaluate> query(String type, String value, int currentPage);

	// 获取总页数
	public int getCountPage(String type, String value);

}
