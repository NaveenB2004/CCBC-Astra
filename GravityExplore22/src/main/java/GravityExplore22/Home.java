/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */
package GravityExplore22;

import com.formdev.flatlaf.FlatDarkLaf;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import javax.swing.ImageIcon;
import javax.swing.JWindow;

/**
 *
 * @author NaveenBalasooriya
 */
public class Home extends JWindow {
    
    //add all images to src/main/resources/pkg(imgs)/

    Image splashScreen;
    ImageIcon imageIcon;

    public Home() {
        splashScreen = Toolkit.getDefaultToolkit().getImage(getClass().getResource("/Imgs/SplashImg.jpg"));
        // Create ImageIcon from Image
        imageIcon = new ImageIcon(splashScreen);
        // Set JWindow size from image size
        setSize(imageIcon.getIconWidth(), imageIcon.getIconHeight());
        // Get current screen size
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        // Get x coordinate on screen for make JWindow locate at center
        int x = (screenSize.width - getSize().width) / 2;
        // Get y coordinate on screen for make JWindow locate at center
        int y = (screenSize.height - getSize().height) / 2;
        // Set new location for JWindow
        setLocation(x, y);
        // Make JWindow visible
        setVisible(true);
    }
    // Paint image onto JWindow

    public void paint(Graphics g) {
        super.paint(g);
        g.drawImage(splashScreen, 0, 0, this);
    }

    public static void main(String[] args) {

        FlatDarkLaf.setup();
        
        Home splash = new Home();
        try {
            // Make JWindow appear for 10 seconds before disappear
            Thread.sleep(3000);
            splash.dispose();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        Welcome welcome = new Welcome();
        welcome.setVisible(true);

    }
}
