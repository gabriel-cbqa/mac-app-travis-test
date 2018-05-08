package scenarios;

import io.appium.java_client.ios.IOSDriver;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

public class IOSSetup {
    public IOSDriver driver;

    public void prepareForAppium() throws MalformedURLException {
        File appDir = new File("apps/");
        File app = new File(appDir, "TestApp.app");
        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("deviceName", "iPhone 8 Plus");
        capabilities.setCapability("platformName", "iOS");
        capabilities.setCapability("platformVersion","11.2");
        capabilities.setCapability("app", app.getAbsolutePath());
        capabilities.setCapability("skipUnlock","true");
        capabilities.setCapability("automationName", "XCUITest");
        driver = new IOSDriver(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
    }

}
