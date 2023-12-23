import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class App {

    private JFrame frame;
    private JTextField usernameField;
    private JPasswordField passwordField;

    public static void main(String[] args) {
        EventQueue.invokeLater(() -> {
            try {
                App window = new App();
                window.frame.setVisible(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    public App() {
        initialize();
    }

    private void initialize() {
        System.setProperty("java.awt.headless", "true");
        frame = new JFrame();
        frame.setBounds(100, 100, 300, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().setLayout(new GridLayout(3, 2));

        JLabel lblUsername = new JLabel("Username:");
        frame.getContentPane().add(lblUsername);

        usernameField = new JTextField();
        frame.getContentPane().add(usernameField);
        usernameField.setColumns(10);

        JLabel lblPassword = new JLabel("Password:");
        frame.getContentPane().add(lblPassword);

        passwordField = new JPasswordField();
        frame.getContentPane().add(passwordField);

        JButton btnSave = new JButton("Save");
        btnSave.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                saveToDatabase();
            }
        });
        frame.getContentPane().add(btnSave);
    }

    private void saveToDatabase() {
        String username = usernameField.getText();
        String password = new String(passwordField.getPassword());

        try {
            // Connect to MySQL database
            Connection connection = DriverManager.getConnection("jdbc:mysql://mysql:3306/mydatabase", "root", "VijBor$@123456");

            // Insert data into the 'users' table
            String query = "INSERT INTO users (username, password) VALUES (?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                preparedStatement.executeUpdate();
            }

            JOptionPane.showMessageDialog(frame, "Data saved successfully!");

            // Close the connection
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(frame, "Error saving data!");
        }
    }
}
