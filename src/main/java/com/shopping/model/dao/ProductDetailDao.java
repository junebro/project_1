package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.shopping.model.bean.Board;
import com.shopping.model.bean.Grade;
import com.shopping.model.bean.Product;
import com.shopping.utility.Paging;
import com.shopping.utility.reviews_Paging;

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
			bean.setPRODT(rs.getString("prodt"));
			bean.setPROCMN(rs.getString("procmn"));
			bean.setLK(rs.getString("lk"));
			
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}

	public List<Grade> getDataList(String pronm) {

		String sql = " SELECT A.rvwgr AS grade, NVL(AA.count, 0) AS count, NVL(AA.PER, 0)AS per , ";
		sql += " CASE WHEN A.rvwgr = 1 THEN '별로에요'  ";
		sql += " WHEN A.rvwgr = 2 THEN '그냥 그래요'  ";
		sql += " WHEN A.rvwgr = 3 THEN '보통이에요'  ";
		sql += " WHEN A.rvwgr = 4 THEN '맘에 들어요'  ";
		sql += " WHEN A.rvwgr = 5 THEN '아주 좋아요'  ";
		sql += " END TEXT ";
		sql += " FROM trvw A ";
		sql += " LEFT OUTER JOIN ( ";
		sql += " SELECT  ";
		sql += " A.rvwgr AS grade,  ";
		sql += " COUNT(*) AS count,  ";
		sql += " ROUND((COUNT(*) / B.total * 100), 0) AS per  ";
		sql += " FROM trvw A  ";
		sql += " INNER JOIN (SELECT COUNT(*) AS total FROM trvw WHERE pronm = ?) B ON 1 = 1  ";
		sql += " WHERE A.pronm = ?  ";
		sql += " GROUP BY A.rvwgr, B.total  ";
		sql += " ) AA ON A.rvwgr = AA.grade ";
		sql += " GROUP BY A.rvwgr, AA.count, AA.PER ";
		sql += " ORDER BY A.rvwgr DESC ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Grade> dataList = new ArrayList<Grade>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, pronm);
			pstmt.setString(2, pronm);
			
			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				Grade bean = new Grade();
				
				bean.setGRADE(rs.getString("grade"));
				bean.setCOUNT(rs.getInt("count"));
				bean.setPER(rs.getInt("per"));
				bean.setTEXT(rs.getString("text"));
				
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
	
	
	// 상세페이지에서 사용
	public double getTotal(String pronm) {

		String sql = " SELECT ";
		sql += " ROUND(SUM(A.rvwgr * COUNT(*)) / SUM(COUNT(*)), 1) AS per ";
		sql += " FROM trvw A ";
		sql += " WHERE A.pronm = ? ";
		sql += " GROUP BY A.rvwgr ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		double total = 0.0;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pronm);
			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			if (rs.next())  {
				total = rs.getDouble("per");
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

		return total;
	}

	public Map<String, Object> calculate(String pronm, String mbrid, reviews_Paging paging) {
		
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
		
			rs = pstmt.executeQuery();
			List<Map<String, Object>> resultSetProList = new ArrayList<>();
			
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
                
                resultSetProList.add(rowMap);
            }
            
            resultMap.put("resultSetPro", resultSetProList);
            
			if(pstmt!=null){pstmt.close();}
			if(rs != null) {rs.close();}
	
			sql = " SELECT pronm, procd, mbrid, rvwgr, rvwct,  rvwimg1, rvwimg2, rvwimg3, rvwdt ";
			sql += "  FROM ( SELECT  ";
			sql += "  RANK() OVER(ORDER BY rvwno, rvwgr asc) AS ranking, pronm, procd, mbrid, rvwgr, rvwct,  rvwimg1, rvwimg2, rvwimg3, rvwdt ";
			sql += "  FROM trvw   WHERE pronm = ? ";
			sql += "  ) ";
			sql += "  WHERE ranking BETWEEN ? AND ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pronm);
			pstmt.setInt(2, paging.getBeginRow());
			pstmt.setInt(3, paging.getEndRow());
			
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
			
	
			sql = "  SELECT pronm, procd, mbrid, rvwgr, rvwct,  rvwimg1, rvwimg2, rvwimg3, rvwdt ";
			sql += "  FROM trvw WHERE pronm = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pronm);
			System.out.println(sql);
			System.out.println(pronm);
			rs = pstmt.executeQuery();
				
			List<Map<String, Object>> resultSetViewsTotal = new ArrayList<>();
			
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
				
				resultSetViewsTotal.add(rowMap);
			}
			
			resultMap.put("resultSetTotal", resultSetViewsTotal);
            
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
	
	public Map<String, Object> getviewsList(String pronm, String sel_color, String sel_star, reviews_Paging paging ) {

		 String sql = " SELECT ";
		 sql += "    pronm, procd, mbrid, rvwgr, rvwct, rvwimg1, rvwimg2, rvwimg3, rvwdt ";
		 sql += "  FROM ( SELECT ";
		 sql += "     RANK() OVER(ORDER  BY A.rvwno, A.rvwgr asc) AS ranking, A.pronm, A.procd, A.mbrid, A.rvwgr, A.rvwct, A.rvwimg1, A.rvwimg2, A.rvwimg3, A.rvwdt "; 
		 sql += "  FROM trvw A ";
		 sql += "  INNER JOIN tpro B on A.procd = B.procd ";
		 sql += "  WHERE A.pronm = ? "; 
		 if (sel_star == null || sel_star.equals("all") || sel_star.equals("null") || sel_star.equals("")) {
		 } else {
				sql += " AND A.rvwgr LIKE '%" + sel_star + "%' ";
		 }
		 if (sel_color == null || sel_color.equals("all") || sel_color.equals("null") || sel_color.equals("")) {	
		 } else {
			 sql += " AND B.procr LIKE '%" + sel_color + "%' ";
		 }
		 sql += "  ) ";
		 sql += "  WHERE ranking BETWEEN ? AND ? ";
		
		
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;
		System.out.println(sql);
		System.out.println(pronm);
		System.out.println(sel_color);
		System.out.println(sel_star);
		System.out.println(paging.getBeginRow());
		System.out.println(paging.getEndRow());
		Map<String, Object> resultMap = new HashMap<>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pronm);
			pstmt.setInt(2, paging.getBeginRow());
			pstmt.setInt(3, paging.getEndRow());
			
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

		return resultMap;
	}
	
}
