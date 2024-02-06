package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Order;

public class OrderDao extends SuperDao {

	public int insertData(String sessionid) throws Exception {
		String sql = " INSERT INTO TORD (ORDCD, MBRID, ORDDT)";
		sql += " SELECT TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(FLOOR(DBMS_RANDOM.VALUE * 10000), 4, '0') AS generated_number, ? , SYSDATE";
		sql += " FROM DUAL WHERE TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(FLOOR(DBMS_RANDOM.VALUE * 10000), 4, '0') NOT IN (SELECT ORDCD FROM TORD)";

		int cnt = -1;

		PreparedStatement pstmt = null;
		Member bean = new Member();
		

		conn = super.getConnection();
		conn.setAutoCommit(false);

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getMBRID());

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

	private Order resultSetBeanO(ResultSet rs) {
		try {
			Order bean = new Order();

			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int updateDate(Order bean) {

		String sql = " ";
		sql += " ";
		sql += " ";

		PreparedStatement pstmt = null;
		int cnt = 10;

		try {

			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			cnt = pstmt.executeUpdate();
			conn.commit();

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}

		}

		return cnt;
	}

	public List<Order> getDataList() {
		String sql = " select * from TORD";
		sql += " where mbrcd = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Order> dataList = new ArrayList<Order>();

		super.conn = super.getConnection();
		try {

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Order bean = this.resultSetBeanO(rs);

				dataList.add(bean);
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

		return dataList;
	}

}
