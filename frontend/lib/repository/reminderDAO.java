import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReminderDAO {
    private final Connection conn;

    public ReminderDAO() throws SQLException {
        this.conn = DatabaseConnector.getConnection();
    }

    public void addReminder(Reminder reminder) throws SQLException {
        String sql = """
            INSERT INTO reminders
            (id, pickup_type, day_of_week, time_of_day, remind_set_out, remind_bring_in, enabled, notes)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """;
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, reminder.getId());
        stmt.setString(2, reminder.getPickupType());
        stmt.setInt(3, reminder.getDayOfWeek());
        stmt.setTime(4, reminder.getTimeOfDay());
        stmt.setBoolean(5, reminder.isRemindSetOut());
        stmt.setBoolean(6, reminder.isRemindBringIn());
        stmt.setBoolean(7, reminder.isEnabled());
        stmt.setString(8, reminder.getNotes());
        stmt.executeUpdate();
    }

    public List<Reminder> getAllReminders() throws SQLException {
        List<Reminder> reminders = new ArrayList<>();
        String sql = "SELECT * FROM reminders";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            reminders.add(new Reminder(
                    rs.getString("id"),
                    rs.getString("pickup_type"),
                    rs.getInt("day_of_week"),
                    rs.getTime("time_of_day"),
                    rs.getBoolean("remind_set_out"),
                    rs.getBoolean("remind_bring_in"),
                    rs.getBoolean("enabled"),
                    rs.getString("notes")
            ));
        }
        return reminders;
    }

    public void deleteReminder(String id) throws SQLException {
        String sql = "DELETE FROM reminders WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.executeUpdate();
    }

    public void updateReminder(Reminder reminder) throws SQLException {
        String sql = """
            UPDATE reminders SET
            pickup_type=?, day_of_week=?, time_of_day=?, remind_set_out=?, remind_bring_in=?, enabled=?, notes=?
            WHERE id=?
        """;
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, reminder.getPickupType());
        stmt.setInt(2, reminder.getDayOfWeek());
        stmt.setTime(3, reminder.getTimeOfDay());
        stmt.setBoolean(4, reminder.isRemindSetOut());
        stmt.setBoolean(5, reminder.isRemindBringIn());
        stmt.setBoolean(6, reminder.isEnabled());
        stmt.setString(7, reminder.getNotes());
        stmt.setString(8, reminder.getId());
        stmt.executeUpdate();
    }
}