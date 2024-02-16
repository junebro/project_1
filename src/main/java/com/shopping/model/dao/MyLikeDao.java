package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.MyLike;

public class MyLikeDao extends SuperDao {

	public List<MyLike> getDataList(String mbrid){
		
		String sql = " SELECT A.MBRID, A.PRONM, A.LKEDT, B.PROIMG, B.PROPR ";
		sql += " FROM TLKE A ";
		sql += " LEFT OUTER JOIN TPRM B ON A.PRONM = B.PRONM";
		sql += " WHERE A.MBRID = ?";
		
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;

		List<MyLike> dataList = new ArrayList<MyLike>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mbrid);
			System.out.println(sql);
			System.out.println(mbrid);
			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				MyLike bean = this.resultSet2Bean(rs);

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
	
	private MyLike resultSet2Bean(ResultSet rs) {
		
		try {
			MyLike bean = new MyLike() ;
			
			bean.setPRONM(rs.getString("PRONM"));
			bean.setMBRID(rs.getString("MBRID"));
			bean.setLKEDT(rs.getString("LKEDT"));
			bean.setPROIMG(rs.getString("PROIMG"));
			bean.setPROPR(rs.getInt("PROPR"));
			
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}
}
