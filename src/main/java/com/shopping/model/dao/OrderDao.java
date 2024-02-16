package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Order;

public class OrderDao extends SuperDao {

	public int insertData(String MBRID, String PROCD, int ORDQTY, int ORDSZ, int TOTPR) throws Exception {
		String sql = " INSERT INTO TORD (ORDCD, MBRID, ORDDT, PROCD, ORDQTY, ORDSZ, TOTPR)";
		sql += " SELECT TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(FLOOR(DBMS_RANDOM.VALUE * 10000), 4, '0') AS generated_number, ? , SYSDATE, ? ,? ,? ,?";
		sql += " FROM DUAL WHERE TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(FLOOR(DBMS_RANDOM.VALUE * 10000), 4, '0') NOT IN (SELECT ORDCD FROM TORD)";

		int cnt = -1;

		PreparedStatement pstmt = null;
		Order bean = new Order();

		bean.setORDCD(sql);
		conn = super.getConnection();
		conn.setAutoCommit(false);

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, MBRID);
		pstmt.setString(2, PROCD);
		pstmt.setInt(3, ORDQTY);
		pstmt.setInt(4, ORDSZ);
		pstmt.setInt(5, TOTPR);

		cnt = pstmt.executeUpdate();
		conn.commit();

		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}
	
	public Order getDataByORDCD(String ORDCD) {
		
		String sql = " select * from TORD ";
		sql += " where ORDCD = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ORDCD);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = this.resultSetBean(rs);
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
				super.closeConnection();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return bean;
	}
		
	

	public Order getLastORDCD(String MBRID) {
		String sql = " SELECT * FROM (";
		sql +=" SELECT * FROM TORD";
		sql +=" WHERE MBRID = ?";
		sql +=" ORDER BY ORDDT DESC";
		sql +=") WHERE ROWNUM = 1";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MBRID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = this.resultSetBean(rs);
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
				super.closeConnection();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return bean;
	}

	private Order resultSetBean(ResultSet rs) {
		try {
			Order bean = new Order();

			bean.setORDCD(rs.getString("ORDCD"));
			bean.setORDDT(rs.getString("ORDDT"));
			bean.setMBRID(rs.getString("MBRID"));
			bean.setPROCD(rs.getString("PROCD"));
			bean.setORDQTY(Integer.parseInt(rs.getString("ORDQTY")));
			bean.setORDSZ(Integer.parseInt(rs.getString("ORDSZ")));
			bean.setTOTPR(Integer.parseInt(rs.getString("TOTPR")));

			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
