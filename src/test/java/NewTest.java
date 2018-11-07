import junit.framework.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.net.MalformedURLException;
import java.net.URL;

public class NewTest {

    private WebDriver driver;
    @Test
    public void testEasy() {
        driver.get("http://demo.guru99.com/test/guru99home/");
        String title = driver.getTitle();
        Assert.assertTrue(title.contains("Demo Guru99 Page"));
    }
    @BeforeTest
    public void beforeTest() throws MalformedURLException {
        //this can be set in commands
        //ChromeDriverManager.getInstance().setup();
        //System.setProperty("webdriver.chrome.driver","../../ChromeDriver/chromedriver");
        //driver = new ChromeDriver();

        DesiredCapabilities dc = DesiredCapabilities.chrome();
        dc.setCapability("version", "");
        dc.setCapability("platform", "LINUX");
        String host = System.getProperty("seleniumhub");

        driver = new RemoteWebDriver(new URL("http://" + host + ":4444/wd/hub"), dc);
        driver.manage().window().maximize();
    }
    @AfterTest
    public void afterTest() {
        driver.quit();
    }
}
