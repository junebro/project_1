package com.shopping.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// 모든 Dao들이 사용할 공통 변수나 메소드를 정의합니다.
public class SuperDao {
	// 접속 객체 conn은 하위 다오들이 접근할 수 있도록 합니다.
	protected Connection conn = null;

	// 모든 테이블들이 동일한 방식으로 사용하므로 final 메소드로 작성하였습니다.
	public final int getTotalRecordCount(String tableName, String mode, String keyword) {
		System.out.print("검색할 필드 이름 : " + mode);
		System.out.println("검색할 키워드 : " + keyword);

		// 제시한 tableName이라는 테이블의 총 행수를 구해줍니다.
		String sql = " SELECT COUNT(*) AS cnt FROM " + tableName + " ";
		if (mode == null || mode.equals("all") || mode.equals("null") || mode.equals("")) {
		} else {
			// 전체 모드가 아니면
			sql += " WHERE " + mode + " LIKE '%" + keyword + "%'";
		}

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = -1;

		try {
			this.conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				this.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("총갯수: "+ cnt);
		return cnt;
	}
	
	// 모든 테이블들이 동일한 방식으로 사용하므로 final 메소드로 작성하였습니다.
	public final int getTotalReviewsCount(String tableName, String sel_star, String sel_color, String pronm, String mbrid, String isGrid) {

		// 제시한 tableName이라는 테이블의 총 행수를 구해줍니다.

		String sql = " SELECT COUNT(A.RVWNO) AS cnt FROM " + tableName + " A ";
		if(isGrid == "pro") {
			sql += " INNER JOIN TPRO B ON A.PROCD = B.PROCD ";
			sql += " WHERE A.PRONM LIKE NVL(?, '%') ";
			if (sel_star == null || sel_star.equals("all") || sel_star.equals("null") || sel_star.equals("")) {
			} else {
				sql += " AND A.rvwgr LIKE '%" + sel_star + "%'";
			}
			 if (sel_color == null || sel_color.equals("all") || sel_color.equals("null") || sel_color.equals("")) {	
			 } else {
				 sql += " AND B.procr LIKE '%" + sel_color + "%'";
			 }
		}	
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = -1;
		String aa = "";
		try {
			this.conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pronm);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				this.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("총갯수: "+ cnt);
		return cnt;
	}
	


	public Connection getConnection() {
		// 접속 객체를 구해줍니다.
		String url = "jdbc:oracle:thin:@192.168.0.86:1521/XE";
		String id = "oneproject";
		String password = "oracle";

		try {
			conn = DriverManager.getConnection(url, id, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}

	protected void closeConnection() {
		// 작업 종료 후 커넥션 정보를 닫아 줍니다.
		try {
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public SuperDao() { // 생성자에서 드라이브 로딩
		String driver = "oracle.jdbc.driver.OracleDriver";

		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}