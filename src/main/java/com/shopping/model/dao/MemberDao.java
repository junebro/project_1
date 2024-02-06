package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;

public class MemberDao extends SuperDao {
	public MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	public int updateData(Member bean) {
		String sql = " update TMBR set MBRNM=?, MBRPW=?, MBRAR=?, MBRHP=?, MBREM=?, MBRPT=?, MBRBT=?, MBRGD=?";
		sql += " where MBRID = ? ";
		PreparedStatement pstmt = null;
		int cnt = -11;
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getMBRNM());
			pstmt.setString(2, bean.getMBRPW());
			pstmt.setString(3, bean.getMBRAR());
			pstmt.setString(4, bean.getMBRHP());
			pstmt.setString(5, bean.getMBREM());
			pstmt.setInt(6, bean.getMBRPT());
			pstmt.setString(7, bean.getMBRBT());
			pstmt.setString(8, bean.getMBRID());

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

		return cnt;
	}

	public Member getDataBean(String MBRID) {
		String sql = " select * from TMBR ";
		sql += " where MBRID = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

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

	public int insertData(Member bean) {

		String sql = " insert into TMBR(MBRID, MBRNM, MBRPW, MBRAR, MBRHP, MBREM, MBRPT, MBRBT, MBRGD)";
		sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement pstmt = null;
		int cnt = -10;

		try {
			super.conn = super.getConnection();

			conn.getAutoCommit();

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getMBRID());
			pstmt.setString(2, bean.getMBRNM());
			pstmt.setString(3, bean.getMBRPW());
			pstmt.setString(4, bean.getMBRAR());
			pstmt.setString(5, bean.getMBRHP());
			pstmt.setString(6, bean.getMBREM());
			pstmt.setInt(7, bean.getMBRPT());
			pstmt.setString(8, bean.getMBRBT());
			pstmt.setString(9, bean.getMBRGD());

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

		return cnt;
	}

	public Member getDataByIdAndPassword(String MBRID, String MBRPW) {

		String sql = " select * from TMBR";
		sql += " where MBRID = ? and MBRPW = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		super.conn = super.getConnection();

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MBRID);
			pstmt.setString(2, MBRPW);
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

	private Member resultSetBean(ResultSet rs) {
		try {
			Member bean = new Member();

			bean.setMBRID(rs.getString("MBRID"));
			bean.setMBRNM(rs.getString("MBRNM"));
			bean.setMBRPW(rs.getString("MBRPW"));
			bean.setMBRAR(rs.getString("MBRAR"));
			bean.setMBRHP(rs.getString("MBRHP"));
			bean.setMBREM(rs.getString("MBREM"));
			bean.setMBRPT(rs.getInt("MBRPT"));
			bean.setMBRBT(rs.getString("MBRBT"));
			bean.setMBRGD(rs.getString("MBRGD"));

			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public List<Member> getDataList() {

		String sql = " select * from TMBR";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Member> dataList = new ArrayList<Member>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				Member bean = this.resultSetBean(rs);

				dataList.add(bean);
			}

		} catch (SQLException e) {
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
