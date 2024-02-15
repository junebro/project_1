package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shopping.model.bean.Cart;

public class CartDao extends SuperDao {

	public int insertData(Cart bean) {

		String sql = " insert into TMBR( PROCD, QTY, MBRID, PROSZ)";
		sql += " values(?, ?, ?, ?)";

		PreparedStatement pstmt = null;
		int cnt = -12;

		try {
			super.conn = super.getConnection();

			conn.getAutoCommit();

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getPROCD());
			pstmt.setInt(2, bean.getQTY());
			pstmt.setString(3, bean.getMBRID());
			pstmt.setInt(4, bean.getPROSZ());

			cnt = pstmt.executeUpdate();
			conn.commit();

		} catch (Exception e) {
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
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("장바구니 데이터 인서트 됨");
		return cnt;
	}

	public Cart getDataBean(String PROCD, String MBRID) {
		String sql = " select * from TMBR ";
		sql += " where PROCD = ? AND MBRID = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Cart bean = null;

		System.out.println("멤버 다오 겟머이타 빈 호출됨");
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

	private Cart resultSetBean(ResultSet rs) {
		try {
			Cart bean = new Cart();

			bean.setPROCD(rs.getString("PROCD"));
			bean.setQTY(Integer.parseInt(rs.getString("QTY")));
			bean.setMBRID(rs.getString("MBRID"));
			bean.setPROSZ(Integer.parseInt(rs.getString("PROSZ")));

			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public int deleteData(String PROCD, String MBRID) {
		// 상품은 주문 상세 테이블과 참조 무결성 제약 조건 set null을 가지고 있습니다.
		// 상품 삭제시 주문 상세 테이블의 remark 컬럼을 갱신하도록 합니다.

		String sql = "";
		PreparedStatement pstmt = null;
		int cnt = -9999999;

		try {
			super.conn = super.getConnection();

			Cart bean = this.getDataBean(PROCD, MBRID);

			// getDataBean() 메소드가 실행된 이후에 접속 객체가 닫힙니다.
			// 접속 객체를 다시 열어 주는 효과를 내는 다음 메소드를 다시 호출하도록 합니다.
			super.conn = super.getConnection();
			conn.setAutoCommit(false); // dml과 관련이 있습니다.
			// 다음 항목도 공부하세요 : Connection Pooling 기법

			sql = " delete from TCRT where PROCD = ? AND MBRID = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, PROCD);
			pstmt.setString(2, MBRID);
			cnt = pstmt.executeUpdate();

			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public int updateData(Cart bean) {
		String sql = " update TCRD set PROCD=?, QTY=?, MBRID=?, PROSZ=? ";
		sql += " where PROCD = ?";

		PreparedStatement pstmt = null;
		int cnt = -9999999;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getPROCD());
			pstmt.setInt(2, bean.getQTY());
			pstmt.setString(3, bean.getMBRID());
			pstmt.setInt(4, bean.getPROSZ());

			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
}
