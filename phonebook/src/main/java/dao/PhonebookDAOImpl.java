package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import vo.PhonebookVO;

@Repository
public class PhonebookDAOImpl implements PhonebookDAO {
	Connection conn;
	PreparedStatement ps;

	public PhonebookDAOImpl() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insert(PhonebookVO pb) {
	    try {
	        String sql = "insert into phonebook values(phonebook_idx_seq.nextval,?,?,?)";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, pb.getName());
	        ps.setString(2, pb.getHp());
	        ps.setString(3, pb.getMemo());
	        return ps.executeUpdate(); 
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return 0;
	}



	@Override
	public List<PhonebookVO> findAll() {
	    String sql = "select * from phonebook order by idx desc";
	    try {
	        ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        List<PhonebookVO> list = new ArrayList<PhonebookVO>();
	        while (rs.next()) {
	            list.add(new PhonebookVO(
	                    rs.getInt("idx"),
	                    rs.getString("name"),
	                    rs.getString("hp"),
	                    rs.getString("memo")
	            ));
	        }
	        rs.close();
	        ps.close();
	        return list;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}


	@Override
	public List<PhonebookVO> searchFind(String search) {
	    String sql = "SELECT * FROM phonebook WHERE name LIKE ?";
	    try {
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, "%" + search + "%");
	        ResultSet rs = ps.executeQuery();
	        List<PhonebookVO> list = new ArrayList<PhonebookVO>();
	        while (rs.next()) {
	            list.add(new PhonebookVO(
	                    rs.getInt("idx"),
	                    rs.getString("name"),
	                    rs.getString("hp"),
	                    rs.getString("memo")
	            ));
	        }
	        rs.close();
	        ps.close();
	        return list;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	
	@Override
	public PhonebookVO findOneById(int idx) {
		String sql = "select * from phonebook where name=?";
		try {
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				PhonebookVO pb = new PhonebookVO(rs.getString("name"), rs.getString("hp"), rs.getString("memo"));
				return pb;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public int update(int idx, PhonebookVO pb) {
	    String sql = "UPDATE phonebook SET name=?, hp=?, memo=? WHERE idx=?";
	    try {
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, pb.getName());
	        ps.setString(2, pb.getHp());
	        ps.setString(3, pb.getMemo());
	        ps.setInt(4, idx);
	        return ps.executeUpdate(); // 데이터 수정을 실행하고 결과를 반환합니다.
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) {
	                ps.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return 0;
	}



	@Override
	public int delete(int idx) {
	    try {
	        String sql = "delete from phonebook where idx=?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, idx);
	        return ps.executeUpdate(); // 데이터 삭제를 실행하고 결과를 반환합니다.
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) {
	                ps.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return 0;
	}


}
