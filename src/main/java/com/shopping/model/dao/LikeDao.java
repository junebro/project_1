package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LikeDao extends SuperDao{

	public int insertLike(String pronm, String mbrid) {
		// no 컬럼은 시퀀스가 알아서 처리합니다.
				String sql = " INSERT INTO tlke(pronm, mbrid, lkedt) values (?, ?, sysdate) ";

				PreparedStatement pstmt = null;
				int cnt = -999;

				try {
					super.conn = super.getConnection();
					// 자동 커밋 기능을 비활성화 시킵니다.
					// 실행이 성공적으로 완료 된 이후 commit() 메소드를 명시해 줍니다.
					conn.setAutoCommit(false);

					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, pronm);
					pstmt.setString(2, mbrid);

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
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}

				return cnt;
		
	}

	public int deleteLike(String pronm, String mbrid) {
		// no 컬럼은 시퀀스가 알아서 처리합니다.
		String sql = " DELETE FROM tlke WHERE pronm = ? AND mbrid = ? ";

		PreparedStatement pstmt = null;
		int cnt = -999;

		try {
			super.conn = super.getConnection();
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료 된 이후 commit() 메소드를 명시해 줍니다.
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, pronm);
			pstmt.setString(2, mbrid);

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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return cnt;
	}
}
