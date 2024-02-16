package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Tpro;

public class TproDao extends SuperDao {
	
	public List<Tpro> getTproSelectList(){
	String sql = "select * from tpro";
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Tpro> dataList = new ArrayList<Tpro>();
	
	super.conn = super.getConnection();
	
		try {
		
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Tpro bean = this.allResultBean(rs);
				
				dataList.add(bean);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
         }
		
		return dataList;
	}
	
	private Tpro allResultBean(ResultSet rs) {
		try { 
			Tpro bean = new Tpro();
						
			bean.setPROTP(rs.getString("PROTP"));
			bean.setPROCD(rs.getString("PROCD"));
			bean.setPRONM(rs.getString("PRONM"));
			bean.setPROSSZ(rs.getString("PROSSZ"));
			bean.setPROESZ(rs.getString("PROESZ"));
			bean.setPROCR(rs.getString("PROCR"));
			bean.setPROPR(rs.getString("PROPR"));
			bean.setPROIMG(rs.getString("PROIMG"));
			bean.setPROIMG1(rs.getString("PROIMG1"));
			bean.setPROIMG2(rs.getString("PROIMG2"));
			bean.setPROIMG3(rs.getString("PROIMG3"));
			bean.setPROPNT(rs.getString("PROPNT"));
			bean.setPROCMN(rs.getString("PROCMN"));
			return bean;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}


}
