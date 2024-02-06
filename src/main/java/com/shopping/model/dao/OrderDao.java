package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Order;

public class OrderDao extends SuperDao {

	private Order resultSetBeanO(ResultSet rs) {
		try {
			Order bean = new Order();
			bean.setMbrcd(rs.getString("mbrcd"));
			return bean;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	private Member resultSetBeanM(ResultSet rs) {
		try {
			Member bean = new Member();
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

	public Member getDataByMbrcd(String mbrcd) {
		// 고객 코드를 이용해 고객 정보를 가져옵니다.
		String sql = "select * from TMBR ";
		sql += " where mbrcd = ? ;";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		super.conn = super.getConnection();
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbrcd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = this.resultSetBeanM(rs);
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
