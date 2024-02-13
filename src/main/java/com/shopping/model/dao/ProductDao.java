package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Product;
import com.shopping.utility.MyUtility;
import com.shopping.utility.Paging;

public class ProductDao extends SuperDao {
	public int deleteData(int PROCD) {
		// 상품은 주문 상세 테이블과 참조 무결성 제약 조건 set null을 가지고 있습니다. 
		// 상품 삭제시 주문 상세 테이블의 remark 컬럼을 갱신하도록 합니다.
		
		String sql = "" ;		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;
		
		try {
			super.conn = super.getConnection() ;
			
			Product bean = this.getDataBean(PROCD) ;
			String message = MyUtility.getCurrentTime() + bean.getPRONM() + "(상품 번호 : " + PROCD + "번)이 삭제 되었습니다." ;
			
			// getDataBean() 메소드가 실행된 이후에 접속 객체가 닫힙니다.
			// 접속 객체를 다시 열어 주는 효과를 내는 다음 메소드를 다시 호출하도록 합니다.
			super.conn = super.getConnection() ;
			conn.setAutoCommit(false); // dml과 관련이 있습니다.			
			// 다음 항목도 공부하세요 : Connection Pooling 기법
			
			// step01 : 주문 상세 테이블의 비고 컬럼에 삭제된 히스토리를 남깁니다.
			sql = " update orderdetails set remark = ? where PROCD = ?" ;
			pstmt = conn.prepareStatement(sql) ;			
			pstmt.setString(1, message);
			pstmt.setInt(2, PROCD);			
			cnt = pstmt.executeUpdate() ;
			if(pstmt != null) {pstmt.close();}
			
			// step02 : 상품 테이블에서 해당 상품 번호를 삭제합니다.
			sql = " delete from products where PROCD = ? " ;
			pstmt = conn.prepareStatement(sql) ;			
			pstmt.setInt(1, PROCD);			
			cnt = pstmt.executeUpdate() ;			
						
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
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return cnt ;
	}
	
	
	public int updateData(Product bean) {
		String sql = " update products set PROTP=?, PRONM=?, PROSSZ=?, PROESZ=?, PROCR=?, PROPR=?, PROIMG=?, PROIMG1=?, PROIMG2=?, PROIMG3=?, PROPNT=?, PROCMN=? " ;
		sql += " where PROCD = ?" ;
		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;
		
		try {
			super.conn = super.getConnection() ;  
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getPROTP());
			pstmt.setString(2, bean.getPROCD());
			pstmt.setString(3, bean.getPRONM());
			pstmt.setInt(4, bean.getPROSSZ());
			pstmt.setInt(5, bean.getPROESZ());
			pstmt.setString(6, bean.getPROCR());
			pstmt.setInt(7, bean.getPROPR());
			pstmt.setString(8, bean.getPROIMG());	
			pstmt.setString(9, bean.getPROIMG1());
			pstmt.setString(10, bean.getPROIMG2());
			pstmt.setString(11, bean.getPROIMG3());
			pstmt.setInt(12, bean.getPROPNT());			
			pstmt.setString(13, bean.getPROCMN());			
			
			cnt = pstmt.executeUpdate() ;			
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
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
	}
	
	public Product getDataBean(int PROCD) {
		String sql = "select * from products " ;
		sql += " where PROCD = ?" ;
		
		PreparedStatement pstmt = null ; 
		ResultSet rs = null ;		
		Product bean = null ;
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, PROCD); 
			rs = pstmt.executeQuery() ;
			if(rs.next()) {				
				bean = this.resultSet2Bean(rs) ;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}	
		System.out.println("bean 데이터 조회 결과 :");
		System.out.println(bean); 
		
		return bean ;
	}	
	
	public int insertData(Product bean) {
		System.out.println(bean);
		
		// 상품 번호는 시퀀스로 처리, 입고 일자는 상황에 맞도록 설정(기본 값 지정)하기로 합니다.
		String sql = " insert into products(PROTP, PROCD, PRONM, PROSSZ, PROESZ, PROCR, PROPR, PROIMG, PROIMG1, PROIMG2, PROIMG3, PROPNT, PROCMN)" ;
		sql += " values(seqproduct.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -999999 ;
		
		try {
			super.conn = super.getConnection() ;
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getPROTP());
			pstmt.setString(2, bean.getPROCD());
			pstmt.setString(3, bean.getPRONM());
			pstmt.setInt(4, bean.getPROSSZ());
			pstmt.setInt(5, bean.getPROESZ());
			pstmt.setString(6, bean.getPROCR());
			pstmt.setString(7, bean.getPROIMG());
			pstmt.setString(8, bean.getPROIMG1());
			pstmt.setString(9, bean.getPROIMG2());
			pstmt.setString(10, bean.getPROIMG3());
			pstmt.setInt(11, bean.getPROPNT());
			pstmt.setString(12, bean.getPROCMN());
			cnt = pstmt.executeUpdate() ;
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
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}	
		return cnt ;
	}	
	
	public List<Product> getDataList(Paging paging){
		String sql = " select PROTP, PROCD, PRONM, PROSSZ, PROESZ, PROCR, PROPR, PROIMG, PROIMG1, PROIMG2, PROIMG3, PROPNT, PROCMN" ;
		sql += " from (select rank() over(order by PROCD desc) as ranking, PROTP, PROCD, PRONM, PROSSZ, PROESZ, PROCR, PROPR, PROIMG, PROIMG1, PROIMG2, PROIMG23, PROPNT, PROCMN" ;
		sql += " from products " ;
		
		// 필드 검색을 위하여 mode 변수로 분기 처리하도록 합니다.
		String mode = paging.getMode() ;
		String keyword = paging.getKeyword() ;
		
		if(mode==null || mode.equals("all") || mode.equals("null") || mode.equals("")) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ; 
		}
		
		sql += " )" ;
		sql += " where ranking between ? and ?" ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		List<Product> dataList = new ArrayList<Product>() ;
		
		super.conn = super.getConnection() ;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());
			
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
	
	public List<Product> getDataList(int beginRow, int endRow){
		String sql = " select PROTP, PROCD, PRONM, PROSSZ, PROESZ, PROCR, PROPR, PROIMG, PROIMG1, PROIMG2, PROIMG3, PROPNT, PROCMN" ;
		sql += " from (select rank() over(order by PROCD asc) as ranking, PROTP, PROCD, PRONM, PROSSZ, PROESZ, PROCR, PROPR, PROIMG, PROIMG1, PROIMG2, PROIMG3, PROPNT, PROCMN" ;
		sql += " from products)" ;
		sql += " where ranking between ? and ?" ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		List<Product> dataList = new ArrayList<Product>() ;
		
		super.conn = super.getConnection() ;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
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
	
	private Product resultSet2Bean(ResultSet rs) {
		try {
			Product bean = new Product() ;
			
			bean.setPROTP(rs.getInt("PROTP"));
			bean.setPROCD(rs.getString("PROCD"));
			bean.setPRONM(rs.getString("PRONM"));
			bean.setPROSSZ(rs.getInt("PROSSZ"));
			bean.setPROESZ(rs.getInt("PROESZ"));
			bean.setPROCR(rs.getString("PROCR"));
			bean.setPROPR(rs.getInt("PROPR"));
			bean.setPROIMG(rs.getString("PROIMG"));
			bean.setPROIMG1(rs.getString("PROIMG1"));
			bean.setPROIMG2(rs.getString("PROIMG2"));
			bean.setPROIMG3(rs.getString("PROIMG3"));
			bean.setPROPNT(rs.getInt("PROPNT"));
			bean.setPROCMN(rs.getString("PROCMN"));
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}
}
