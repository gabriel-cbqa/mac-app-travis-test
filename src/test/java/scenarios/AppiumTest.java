package scenarios;

import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import pages;

import java.net.MalformedURLException;

public class AppiumTest extends IOSSetup
{

    @BeforeClass
    public void prepare() throws MalformedURLException {
        prepareForAppium();
    }

    @Test
    public void launchTest()
    {
        MainPage main = new MainPage(this.driver);
        main.testControls();
    }
}
