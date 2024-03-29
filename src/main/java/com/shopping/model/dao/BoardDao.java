package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Board;
import com.shopping.utility.Paging;

public class BoardDao extends SuperDao{
	public List<Board> getDataList(Paging paging){
		// 페이징 처리를 이용하여 데이터를 조회합니다.		
		// 답글을 고려해야 되기 때문에 over() 구문을 변경합니다.
		/*
		 * String sql =
		 * " select no, id, password, subject, contents, readhit, regdate, remark, groupno, orderno, depth "
		 * ; sql +=
		 * " from (select rank() over(order by groupno desc, orderno asc) as ranking, no, id, password, subject, contents, readhit, "
		 * ; sql += " regdate, remark, groupno, orderno, depth ";
		 *   sql += " from boards "
		 * ;
		 * 
		 * // 필드 검색을 위하여 mode 변수로 분기 처리하도록 합니다. String mode = paging.getMode() ; String
		 * keyword = paging.getKeyword() ;
		 * 
		 * if(mode==null || mode.equals("all") || mode.equals("null") ||
		 * mode.equals("")) { }else { // 전체 모드가 아니면 sql += " where " + mode + " like '%"
		 * + keyword + "%'" ; }
		 * 
		 * sql += " )"; sql += " where ranking between ? and ? ";
		 */
		//String sql = " select no, id, password, subject, contents, readhit, regdate, remark, groupno, orderno, depth "; 
		//sql += " from (select rank() over(order by no desc) as ranking, no, id, password, subject, contents, readhit, regdate, remark, groupno, orderno, depth from boards";
		String sql = " select no, id, password, subject, contents, readhit, regdate, remark, groupno, orderno, depth ";
		sql += " from (select rank() over(order by groupno desc, orderno asc) as ranking, no, id, password, subject, contents, readhit, ";
		sql += " regdate, remark, groupno, orderno, depth ";
		sql += " from boards " ;
		
		String mode = paging.getMode() ;
		String keyword = paging.getKeyword() ;
		
		if(mode==null || mode.equals("all") || mode.equals("null") || mode.equals("")) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ; 
		}
		  
		 sql += " )";
		 sql += " where ranking between ? and ? ";
		
		
		PreparedStatement pstmt = null ; // 문장 객체
		ResultSet rs = null ;
		
		List<Board> dataList = new ArrayList<Board>();
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());			
			
			rs = pstmt.executeQuery() ;
			
			// 요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {				
				Board bean = this.resultSet2Bean(rs) ;
				
				dataList.add(bean) ;
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
		return dataList ;
	}	
	
	public List<Board> getAllList() {
		
		String sql = "select * from boards";
				
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board bean = null;
		
		List<Board> datalist = new ArrayList<Board>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bean = this.resultSet2Bean(rs);
				datalist.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				this.closeConnection();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return datalist;
	}

	private Board resultSet2Bean(ResultSet rs) {
		try {
			Board bean = new Board() ;			
			bean.setNo(rs.getInt("no"));
			bean.setId(rs.getString("id"));
			bean.setPassword(rs.getString("password"));
			bean.setSubject(rs.getString("subject"));
			bean.setContents(rs.getString("contents"));
			bean.setDepth(rs.getInt("depth"));
			bean.setGroupno(rs.getInt("groupno"));
			bean.setOrderno(rs.getInt("orderno"));
			bean.setReadhit(rs.getInt("readhit"));				
			bean.setRemark(rs.getString("remark"));	
			bean.setRegdate(String.valueOf(rs.getDate("regdate")));	 // 날짜 형식의 컬럼		
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}

	public Board getDataBean(int no) {
		String sql = "select * from boards";
		sql += " where no = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board bean = null;
		
		super.conn = super.getConnection();
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();

				if(rs.next()) {
					bean = this.resultSet2Bean(rs);
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) {rs.close();}
					if(pstmt != null) {pstmt.close();}
					super.closeConnection();
				}catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return bean;
	}

	public int insertData(Board bean) {
		
		String sql = "insert into boards(no,id,password,subject,contents,groupno)";
		sql += " values(seqboard.nextval, ?,?,?,?, seqboard.currval)";
		
		PreparedStatement pstmt = null;
		int cnt = -99;
		
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getContents());
			
			cnt = pstmt.executeUpdate();
			
					
		}catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			}catch (Exception e2){
				e2.printStackTrace();
			}
			
		}
		
		return cnt;
	}

	public int deleteDataBean(int no) {
		String sql = "delete from boards";
		sql += " where no = ?";
		
		PreparedStatement pstmt = null;
		int cnt = -9999;
		

		super.conn = super.getConnection();
		
			try {
				pstmt = conn.prepareStatement(sql);
				conn.setAutoCommit(false);
				
				pstmt.setInt(1, no);
				
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
					if(pstmt != null) {pstmt.close();}
					super.closeConnection();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}		
			return cnt ;
	}

	public int updateData(Board bean) {
		
		String sql = "update boards set id=?, password=?, subject=?, contents=?, regdate=default" ;
		sql += " where no = ?";
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getContents());
			pstmt.setInt(5, bean.getNo());
			
			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public Integer getReplyCount(Integer groupno) {
		// 해당 그룹 번호(groupno)에 속해 있는 데이터의 행 개수를 반환해 줍니다.

		String sql = " select count(*) as cnt from boards " ;
		sql += " where groupno = ? " ;
		
		int cnt = -1 ; // 데이터 행 개수
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		super.conn = super.getConnection() ;
		
		try {
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, groupno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt") ;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt ;
	}

	public int replyData(Board bean, Integer orderno) {

		String sql = "" ;
		PreparedStatement pstmt = null ;
		int cnt = - 1 ;
		
		super.conn = super.getConnection() ;
		
		try {
			// step 01 : 동일한 그룹 번호에 대하여 orderno 컬럼의 숫자를 1씩 증가 시켜 주어야 합니다.
			sql = " update boards set orderno = orderno + 1 " ;
			sql += " where groupno = ? and orderno > ? " ;			
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, bean.getGroupno());
			pstmt.setInt(2, orderno);
			cnt = pstmt.executeUpdate() ;
			
			if(pstmt!=null) {pstmt.close();}
			
			// step 02 : 답글(bean) 객체 정보를 이용하여 데이터 베이스에 추가합니다.
			sql = " insert into boards(no, id, password, subject, contents, groupno, orderno, depth)" ;
			sql += " values(seqboard.nextval, ?, ?, ?, ?, ?, ?, ?) " ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getContents());
			pstmt.setInt(5, bean.getGroupno());
			pstmt.setInt(6, bean.getOrderno());
			pstmt.setInt(7, bean.getDepth());
			
			cnt = pstmt.executeUpdate() ;
			conn.commit();
			
		} catch (SQLException e) {			
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}

	public void updateReadhit(int no) {
		String sql = " update boards set readhit = readhit + 1 where no = ? " ;		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;
		
		try {
			super.conn = super.getConnection() ;  
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;			
			pstmt.setInt(1, no);			
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
	}
	
	
}//endline
