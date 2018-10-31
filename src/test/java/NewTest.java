import junit.framework.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class NewTest {

    private WebDriver driver;
    @Test
    public void testEasy() {
        driver.get("http://demo.guru99.com/test/guru99home/");
        String title = driver.getTitle();
        Assert.assertTrue(title.contains("Demo Guru99 Page"));
    }
    @BeforeTest
    public void beforeTest() {
        //this can be set in commands
        //ChromeDriverManager.getInstance().setup();
        //System.setProperty("webdriver.chrome.driver","../../ChromeDriver/chromedriver");
        driver = new ChromeDriver();
    }
    @AfterTest
    public void afterTest() {
        driver.quit();
    }
}
