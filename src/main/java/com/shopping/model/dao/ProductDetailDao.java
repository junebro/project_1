package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shopping.model.bean.Product;

public class ProductDetailDao extends SuperDao {
	
	private Product resultSet2Bean(ResultSet rs) {
		try {
			Product bean = new Product() ;
			System.out.println("둘");
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
			bean.setPRODT(rs.getString("prodt"));
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

	public Map<String, Object> calculate(String pronm, String mbrid) {
		// payer : 계산을 하는 사람();
		// cartList : 카트에 담겨 있는 '상품 번호'와 '구매 수량' 정보		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			
			sql = " SELECT CASE WHEN b.pronm IS NOT NULL THEN 'LK' END AS LK, A.*, ";
			sql += " CASE WHEN TO_DATE(A.prodt, 'YYYY-MM-DD') >= (SYSDATE - 10) THEN A.propr * 0.03 ELSE A.propr * 0.01 END AS propnt "; 
			sql += " FROM tpro A ";
			sql += " LEFT OUTER JOIN TLKE B ON A.pronm = B.pronm AND B.mbrid = ? ";
			sql += " WHERE A.pronm = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbrid);
			pstmt.setString(2, pronm);
			
			System.out.println(sql);
			
			rs = pstmt.executeQuery();
			List<Map<String, Object>> resultSet1List = new ArrayList<>();
			
            while (rs.next()) {
            	
            	Map<String, Object> rowMap = new HashMap<>();
            	
            	rowMap.put("PROTP", rs.getInt("protp"));
            	rowMap.put("PROCD", rs.getString("procd"));
            	rowMap.put("PRONM", rs.getString("pronm"));
            	rowMap.put("PROSSZ", rs.getInt("prossz"));
            	rowMap.put("PROESZ", rs.getInt("proesz"));
            	rowMap.put("PROCR", rs.getString("procr"));
            	rowMap.put("PROPR", rs.getInt("propr"));
            	rowMap.put("PROIMG", rs.getString("proimg"));
            	rowMap.put("PROIMG1", rs.getString("proimg1"));
            	rowMap.put("PROIMG2", rs.getString("proimg2"));
            	rowMap.put("PROIMG3", rs.getString("proimg3"));
            	rowMap.put("PRODT", rs.getString("prodt"));
            	rowMap.put("PROPNT", rs.getString("PROPNT"));
            	rowMap.put("PROCMN", rs.getString("procmn"));
                rowMap.put("LK", rs.getString("lk"));
                
                resultSet1List.add(rowMap);
            }
            
            resultMap.put("resultSet1", resultSet1List);
            
			if(pstmt!=null){pstmt.close();}
			if(rs != null) {rs.close();}
			
			sql = " SELECT pronm, procd, mbrid, rvwgr, rvwct,  rvwimg1, rvwimg2, rvwimg3, rvwdt FROM trvw ";
			sql += " WHERE pronm = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pronm);
			
			System.out.println(sql);
			System.out.println(pronm);
			rs = pstmt.executeQuery();
				
			List<Map<String, Object>> resultSetViewsList = new ArrayList<>();
			
			while (rs.next()) {
				
				Map<String, Object> rowMap = new HashMap<>();
				
				rowMap.put("PRONM", rs.getString("pronm"));
				rowMap.put("PROCD", rs.getString("procd"));
				rowMap.put("MBRID", rs.getString("mbrid"));
				rowMap.put("RVWGR", rs.getString("rvwgr"));
				rowMap.put("RVWCT", rs.getString("rvwct"));
				rowMap.put("RVWIMG1", rs.getString("rvwimg1"));
				rowMap.put("RVWIMG2", rs.getString("rvwimg2"));
				rowMap.put("RVWIMG3", rs.getString("rvwimg3"));
				rowMap.put("RVWDT", rs.getString("rvwdt"));
				
				resultSetViewsList.add(rowMap);
			}
			
			resultMap.put("resultSetViews", resultSetViewsList);
            
			if(pstmt!=null){pstmt.close();}
			if(rs != null) {rs.close();}
			
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
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				super.closeConnection();
			}catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		
		return resultMap;
	}
}
