package pages;

import io.appium.java_client.ios.IOSDriver;
import scenarios.Screenshot;

public class MainPage
{
    IOSDriver driver;

    public MainPage(IOSDriver driver)
    {
        this.driver = driver;
    }

    public void testControls()
    {
        Screenshot ss = new Screenshot(this.driver);
        ss.takeScreenshot("antes");
        driver.findElementByAccessibilityId("TextField1").sendKeys("HOLA, hola, hola");
        ss.takeScreenshot("despues");
    }
}
