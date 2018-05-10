package scenarios;

import io.appium.java_client.ios.IOSDriver;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

public class Screenshot
{
    private IOSDriver driver;

    public Screenshot(IOSDriver driver)
    {
        this.driver = driver;
    }

    public void takeScreenshot(String sender)
    {
        try {
            File ss = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
            String ssName = sender + new SimpleDateFormat("yyyy-MM-dd_HH-ss").format(new GregorianCalendar().getTime());
            File ssFile = new File("screenshots/",ssName+".png");
            FileUtils.copyFile(ss,ssFile);
            System.out.println(ssName);

        }catch (Exception ex)
        {
            System.out.println("=*=*=*=*=*=*=*=*=*=*= "+ex.getMessage()+" =*=*=*=*=*=*=*=*=*=*= ");
        }
    }

}
