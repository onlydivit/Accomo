package com.Dao;

import com.bean.ReservationHotel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReservationHotelDao {
    private static final String URL = "jdbc:mysql://localhost:3306/Hotel";
    private static final String USER = "root";
    private static final String PASSWORD = "shetty7639";

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public boolean saveReservation(ReservationHotel reservation) {
        String query = "INSERT INTO Reservations (hotel_id, room_id, customer_id, checkin_date, checkout_date, guests, room_type, special_requests, price_range) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, reservation.getHotelId());
            stmt.setString(2, reservation.getRoomId());
            stmt.setString(3, reservation.getCustomerId());
            stmt.setString(4, reservation.getCheckinDate());
            stmt.setString(5, reservation.getCheckoutDate());
            stmt.setInt(6, reservation.getGuests());
            stmt.setString(7, reservation.getRoomType());
            stmt.setString(8, reservation.getSpecialRequests());
            stmt.setString(9, reservation.getPriceRange());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
