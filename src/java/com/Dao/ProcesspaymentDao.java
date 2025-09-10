package com.Dao;

import com.bean.Processpaymentbean;
import com.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProcesspaymentDao {
    public boolean savePayment(Processpaymentbean payment) throws ClassNotFoundException {
        boolean result = false;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO payments (reservationId, amount, paymentMethod, paymentSuccess) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, payment.getReservationId());
            stmt.setDouble(2, payment.getAmount());
            stmt.setString(3, payment.getPaymentMethod());
            stmt.setBoolean(4, payment.isPaymentSuccess());

            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}