package com.Dao;

import com.bean.Reservation1Bean;
import java.sql.*;

public class Reservation1Dao {

    private static final String URL = "jdbc:mysql://localhost:3306/hotel";
    private static final String USER = "root";
    private static final String PASSWORD = "shetty7639";

    public int saveReservation(Reservation1Bean reservation) {
        int status = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            String query = "INSERT INTO reservation1 (customerId, roomId, hotelId, checkin, checkout, guests, roomType, specialRequests, priceDisplay) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, reservation.getCustomerId());
            ps.setString(2, reservation.getRoomId());
            ps.setInt(3, reservation.getHotelId());
            ps.setString(4, reservation.getCheckin());
            ps.setString(5, reservation.getCheckout());
            ps.setInt(6, reservation.getGuests());
            ps.setString(7, reservation.getRoomType());
            ps.setString(8, reservation.getSpecialRequests());
            ps.setString(9, reservation.getPriceDisplay());

            status = ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int getReservationCount(int hotelId) {
        int count = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            String query = "SELECT COUNT(*) FROM reservation1 WHERE hotelId=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, hotelId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
