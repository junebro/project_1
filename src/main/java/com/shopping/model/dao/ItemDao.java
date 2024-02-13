package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Item;

public class ItemDao extends SuperDao{
	
	private Item resultSet2Bean(ResultSet rs) {
			
		try {
			Item bean = new Item();
			
			bean.setITMMD(rs.getString("itmmd"));
			bean.setITMFD(rs.getString("itmfd"));
			bean.setITMCD(rs.getInt("itmcd")); 
			bean.setITMNM(rs.getInt("itmnm"));
			bean.setITMOD(rs.getInt("itmod"));
			
			return bean;		
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ; 
		}
	}	
	
	public List<Item> getDataList(int ssz, int esz) {
		
		String sql = " SELECT * FROM titm ";
		sql += " WHERE itmcd BETWEEN ? AND ? ";
		sql += " ORDER BY itmnm ASC "; 

		PreparedStatement pstmt = null;
		ResultSet rs = null ;	
		
		List<Item> dataList = new ArrayList<Item>() ;
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ssz);
			pstmt.setInt(2, esz);			
			
			rs = pstmt.executeQuery() ;
			
			// 목록에 담기
			while(rs.next()) {
				Item bean = this.resultSet2Bean(rs);
				
				dataList.add(bean);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dataList;
	}

}
