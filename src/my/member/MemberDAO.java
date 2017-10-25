package my.member;

import java.sql.*;
import java.util.ArrayList;

import my.db.ConnectionPoolBean;

public class MemberDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}

	private String search;
	private String searchString;
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public MemberDAO() {
	}
	
	public boolean checkMember(String name, String ssn1, String ssn2)
																						throws SQLException{
		String sql = "select * from jsp_member where ssn1=? and ssn2=?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,  ssn1);
			ps.setString(2,  ssn2);
			rs = ps.executeQuery();
			if (rs.next()) return true;
			else return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int insertMember(MemberDTO dto) throws SQLException{
		String sql = "insert into jsp_member values"
						+ "(member_seq.nextval, ?,?,?,?,?,?,?,?,?,sysdate)";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPasswd());
			ps.setString(4, dto.getSsn1());
			ps.setString(5, dto.getSsn2());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getHp1());
			ps.setString(8, dto.getHp2());
			ps.setString(9, dto.getHp3());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public ArrayList<MemberDTO> listMember() throws SQLException{
		String sql = "select * from jsp_member";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> list = makeArrayList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int deleteMember(int no) throws SQLException{
		String sql = "delete from jsp_member where no = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public MemberDTO getMember(int no) throws SQLException{
		String sql = "select * from jsp_member where no = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> list = makeArrayList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public ArrayList<MemberDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setSsn1(rs.getString("ssn1"));
			dto.setSsn2(rs.getString("ssn2"));
			dto.setEmail(rs.getString("email"));
			dto.setHp1(rs.getString("hp1"));
			dto.setHp2(rs.getString("hp2"));
			dto.setHp3(rs.getString("hp3"));
			dto.setJoindate(rs.getString("joindate"));
			list.add(dto);
		}
		return list;	
	}
	
	public int updateMember(MemberDTO dto) throws SQLException{
		String sql = "update jsp_member set "
				+ "passwd=?, email=?, hp1=?, hp2=?, hp3=? where no =?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPasswd());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getHp1());
			ps.setString(4, dto.getHp2());
			ps.setString(5, dto.getHp3());
			ps.setInt(6, dto.getNo());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public ArrayList<MemberDTO> findMember() throws SQLException{
		String sql = "select * from jsp_member where "+search+" = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> list = makeArrayList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public String searchId(String name, String ssn1, String ssn2) throws SQLException{
		String sql = "select id from jsp_member where name=? and ssn1=? and ssn2=?";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, ssn1);
			ps.setString(3, ssn2);
			rs = ps.executeQuery();
			if (rs.next()){
				String msg = rs.getString(1);
				return msg;
			}
			return null;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	public String searchPw(String name, String ssn1, String ssn2, String id) throws SQLException{
		String sql = "select passwd from jsp_member where name=? and ssn1=? and ssn2=? and id=?";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, ssn1);
			ps.setString(3, ssn2);
			ps.setString(4, id);
			rs = ps.executeQuery();
			if (rs.next()){
				String msg = rs.getString(1);
				return msg;
			}
			return null;
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
}















