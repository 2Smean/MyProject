package user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import mysql.db.DbConnect;

public class ProductDao {
    DbConnect db = new DbConnect();

    // 사용자 정보 저장
    public  List<ProductDto> showProduct() {
        List<ProductDto> list = new Vector<ProductDto>();
        Connection conn = db.getConnection();
        String sql = "SELECT * FROM Product";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                ProductDto dto = new ProductDto();
                dto.setnProductSeq(rs.getInt("nProductSeq"));
                dto.setsProductName(rs.getString("sProductName"));
                dto.setsProductAuthor(rs.getString("sProductAuthor"));
                dto.setsProductPublisher(rs.getString("sProductPublisher"));
                dto.setsProductDescription(rs.getString("sProductDescription"));
                dto.setsProductImage(rs.getString("sProductImage"));
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt, conn);
        }
        return list;

    }
    public ProductDto showModal(int nProductSeq) {
        Connection conn = db.getConnection();
        String sql = "SELECT * FROM Product WHERE nProductSeq = ?";
        PreparedStatement pstmt = null;
        ProductDto dto = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, nProductSeq);
            rs = pstmt.executeQuery();


            if (rs.next()) {
                System.out.println("여기느 ㄴ왔냐 ");
                dto = new ProductDto();
                dto.setnProductSeq(rs.getInt("nProductSeq"));
                dto.setsProductName(rs.getString("sProductName"));
                dto.setsProductAuthor(rs.getString("sProductAuthor"));
                dto.setsProductPublisher(rs.getString("sProductPublisher"));
                dto.setsProductDescription(rs.getString("sProductDescription"));
                dto.setsProductImage(rs.getString("sProductImage"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return dto;
    }


    // 사용자 정보 검색
    public UserDto getUserByEmail(String email) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        UserDto user = null;

        if (conn != null) {
            String sql = "SELECT * FROM users WHERE user_email = ?";

            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);
                rs = pstmt.executeQuery();


                if (rs.next()) {
                    System.out.println("여기느 ㄴ왔냐 ");
                    user = new UserDto();
                    user.setsUserEmail(rs.getString("user_email"));
                    user.setsUserPassword(rs.getString("user_password"));
                    user.setsUserName(rs.getString("user_name"));
                    user.setsUserPhoneNumber(rs.getString("user_phone_number"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                db.dbClose(rs, pstmt, conn);
            }
        }

        return user;
    }

    // 사용자 정보 삭제
    public void deleteUser(String email) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;

        if (conn != null) {
            String sql = "DELETE FROM users WHERE user_email = ?";

            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);
                pstmt.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                db.dbClose(pstmt, conn);
            }
        }
    }

    // 사용자가 데이터베이스에 존재하는지 확인
    public UserDto Checklogin(UserDto dto) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM user WHERE sUserEmail = ? AND sUserPassword = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getsUserEmail());
            pstmt.setString(2, dto.getsUserPassword());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                dto.setsUserType(rs.getString("sUserType"));
                dto.setsUserPassword(rs.getString("sUserPassword"));
                dto.setsUserPhoneNumber(rs.getString("sUserPhoneNumber"));
                dto.setsUserEmail(rs.getString("sUserEmail"));
                dto.setsUserName(rs.getString("sUserName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("걸렸다 ㅅㅂ");
        } finally {
            db.dbClose(rs, pstmt, conn);
        }
        return dto;
    }



    public boolean sUserExistsInDB(String sUserEmail, String sUserpassword) {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean exists = false;

        if (conn != null) {
            String sql = "SELECT * FROM user WHERE sUserEmail = ? AND sUserPassword = ?";

            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, sUserEmail);
                pstmt.setString(2, sUserpassword);
                rs = pstmt.executeQuery();

                exists = rs.next(); // 결과가 존재하는지 확인

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                db.dbClose(rs, pstmt, conn);
            }
        }

        return exists;
    }

}