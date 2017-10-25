package my.login;

import java.sql.*;

import my.db.ConnectionPoolBean;

public class LoginCheck {
	public static final int OK = 1;
	public static final int NOT_ID = 2;
	public static final int NOT_PWD  = 3;
	public static final int ERROR = -1;
	
	private String id;
	private String passwd;
	private ConnectionPoolBean pool;

	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int loginCheck() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select passwd from jsp_member where id = ?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString(1);
				if (dbPass.equals(passwd)) {
					return OK;
				}else {
					return NOT_PWD;
				}
			}else {
				return NOT_ID;
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) pool.returnConnection(con);;
			}catch(SQLException e) {}
		}
	}

}













