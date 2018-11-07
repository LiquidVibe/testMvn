import junit.framework.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.net.*;

public class NewTest {

    private WebDriver driver;
    @Test
    public void testEasy() {
        driver.get("http://demo.guru99.com/test/guru99home/");
        String title = driver.getTitle();
        Assert.assertTrue(title.contains("Demo Guru99 Page"));
    }
    @BeforeTest
    public void beforeTest() throws MalformedURLException, UnknownHostException {
        //this can be set in commands
        //ChromeDriverManager.getInstance().setup();
        //System.setProperty("webdriver.chrome.driver","../../ChromeDriver/chromedriver");
        //driver = new ChromeDriver();

        DesiredCapabilities dc = DesiredCapabilities.chrome();
        dc.setCapability("version", "");
        dc.setCapability("platform", "LINUX");

        String ipAddress = InetAddress.getLocalHost().getHostAddress();
        System.out.println(ipAddress);
        String host = System.getProperty("seleniumhub");
        System.out.println(host);
        driver = new RemoteWebDriver(new URL("http://172.19.0.4:4444/wd/hub"), dc);
        driver.manage().window().maximize();
    }
    @AfterTest
    public void afterTest() {
        driver.quit();
    }
}
