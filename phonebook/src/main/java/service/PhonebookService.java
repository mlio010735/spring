package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PhonebookDAO;
import vo.PhonebookVO;

@Service
public class PhonebookService {
	@Autowired
	PhonebookDAO dao;

	public int insert(PhonebookVO pb) {
		return dao.insert(pb);
	}

	public List<PhonebookVO> findAll() {
		return dao.findAll();
	}

	public PhonebookVO findOneById(int idx) {
		return dao.findOneById(idx);
	}

	public List<PhonebookVO> searchFind(String search) {
		return dao.searchFind(search);
	}

	public int update(int idx, PhonebookVO pb) {
		return dao.update(idx, pb);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}
}
