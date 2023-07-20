package dao;

import java.util.List;

import vo.PhonebookVO;

public interface PhonebookDAO {
	//입력, 전체출력, 검색출력, 선택출력, 수정, 삭제
	public int insert(PhonebookVO pb);
	public List<PhonebookVO> findAll();
	public List<PhonebookVO> searchFind(String search);
	public PhonebookVO findOneById(int idx);
	public int update(int idx, PhonebookVO pb);
	public int delete(int idx);
}
