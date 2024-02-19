package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.MyOrder;

public class MyOrderDao extends SuperDao{
	public List<MyOrder> getDataList(String mbrid){
		String sql = " SELECT A.MBRID, A.ORDDT, A.ORDQTY, A.ORDSZ, A.TOTPR, B.PROIMG, B.PRONM, B.PROCR ";
		sql += " FROM TORD A ";
		sql += " LEFT OUTER JOIN TPRO B ON A.PROCD = B.PROCD";
		sql += " WHERE A.MBRID = ?";

		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;

		List<MyOrder> dataList = new ArrayList<MyOrder>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mbrid);
			System.out.println(sql);
			System.out.println(mbrid);
			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				MyOrder bean = this.resultSet2Bean(rs);

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
	
	private MyOrder resultSet2Bean(ResultSet rs) {
		
		try {
			MyOrder bean = new MyOrder() ;
			
			bean.setMBRID(rs.getString("MBRID"));
			bean.setORDDT(rs.getString("ORDDT"));
			bean.setPROIMG(rs.getString("PROIMG"));
			bean.setPRONM(rs.getString("PRONM"));
			bean.setPROCR(rs.getString("PROCR"));
			bean.setORDSZ(rs.getInt("ORDSZ"));
			bean.setORDQTY(rs.getInt("ORDQTY"));
			bean.setTOTPR(rs.getInt("TOTPR"));
			
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}
}
