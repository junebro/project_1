package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Product;
import com.shopping.model.bean.Product_main;
import com.shopping.utility.MyUtility;
import com.shopping.utility.Paging;

public class ProductDao extends SuperDao {
	
	public List<Product_main> getDataList(String mbrid){
		
		String sql = " SELECT A.PROTP, A.PRONM, A.PROPR, A.PROIMG,ROUND(AVG(D.RVWGR), 2) AS RVWGR, ";
		sql += " CASE WHEN C.PRODT >= ADD_MONTHS(SYSDATE, -1) THEN 'new' ELSE NULL END AS PRODT, ";
		sql += " CASE WHEN B.PRONM IS NOT NULL THEN 'LK'  END AS LK ";
		sql += " FROM TPRM A ";
		sql += " LEFT OUTER JOIN TLKE B ON A.PRONM = B.PRONM AND MBRID = ? ";
		sql += " INNER JOIN TPRO C ON C.PROCD = A.PROCD ";
		sql += " LEFT OUTER JOIN TRVW D ON D.PROCD = A.PROCD ";
		sql += " GROUP BY A.PROTP, A.PRONM, A.PROPR, A.PROIMG, B.PRONM , C.PRODT ";
		sql += " ORDER BY A.PRONM ";
		
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;

		List<Product_main> dataList = new ArrayList<Product_main>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mbrid);
			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				Product_main bean = this.resultSet2Bean(rs);

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
	
	public List<Product> getDataColor(){

		String sql = " SELECT *  ";
		sql += " FROM TPRO ";
		sql += " ORDER BY PRONM ";
		
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;

		List<Product> dataColor = new ArrayList<Product>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				
				Product bean = this.resultSetProduct(rs);
				
				dataColor.add(bean);
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
		return dataColor;
	}
	
	
	private Product resultSetProduct(ResultSet rs) {
		
		try {
			Product bean = new Product() ;
			
			bean.setPROTP(rs.getInt("PROTP")); 
			bean.setPROCD(rs.getString("PROCD"));
			bean.setPRONM(rs.getString("PRONM"));
			bean.setPROCR(rs.getString("PROCR"));
			
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}
	
	private Product_main resultSet2Bean(ResultSet rs) {
	
		try {
			Product_main bean = new Product_main() ;
			
			bean.setPROTP(rs.getInt("PROTP"));
			bean.setPRONM(rs.getString("PRONM"));
			bean.setPROPR(rs.getInt("PROPR"));
			bean.setPROIMG(rs.getString("PROIMG"));
			bean.setRVWGR(rs.getInt("RVWGR"));
			bean.setPRODT(rs.getString("PRODT"));
			bean.setLK(rs.getString("LK"));
			
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}
}
