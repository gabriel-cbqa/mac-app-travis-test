package scenarios;

import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

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
        System.out.print("PRUEBAAAAAA\n\n\n"+driver);
    }
}
