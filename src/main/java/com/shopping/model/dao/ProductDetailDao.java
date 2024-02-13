package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Product;

public class ProductDetailDao extends SuperDao {
	
	private Product resultSet2Bean(ResultSet rs) {
		try {
			Product bean = new Product() ;
			
			bean.setPROTP(rs.getInt("protp"));
			bean.setPROCD(rs.getString("procd"));
			bean.setPRONM(rs.getString("pronm"));
			bean.setPROSSZ(rs.getInt("prossz"));
			bean.setPROESZ(rs.getInt("proesz"));
			bean.setPROCR(rs.getString("procr"));
			bean.setPROPR(rs.getInt("propr"));
			bean.setPROIMG(rs.getString("proimg"));
			bean.setPROIMG1(rs.getString("proimg1"));
			bean.setPROIMG2(rs.getString("proimg2"));
			bean.setPROIMG3(rs.getString("proimg3"));
			bean.setPROPNT(rs.getInt("propnt"));
			bean.setPROCMN(rs.getString("procmn"));
			bean.setLK(rs.getString("lk"));
			
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}

	// 상세페이지에서 사용
	public List<Product> getDataList(String pronm, String mbrid) {

		String sql = " SELECT CASE WHEN b.pronm IS NOT NULL THEN 'LK' END AS LK, A.* FROM tpro A ";
		sql += " LEFT OUTER JOIN TLKE B ON A.pronm = B.pronm AND B.mbrid = ? ";
		sql += " WHERE A.pronm = ? ";
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		List<Product> dataList = new ArrayList<Product>() ;
		
		super.conn = super.getConnection() ;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mbrid);
			pstmt.setString(2, pronm);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product bean = this.resultSet2Bean(rs) ;
				
				dataList.add(bean) ;
			}			
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return dataList ;
	}
}
