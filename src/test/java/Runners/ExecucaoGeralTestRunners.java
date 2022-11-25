package Runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.*;
import net.masterthought.cucumber.*;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;




public class ExecucaoGeralTestRunners {
    
    @Test
    public void runExecucaoGeralParalela()
    {
        Runner.Builder builder = new Runner.Builder();
        builder.path("classpath:features/usuarios")
        .tags("~@skipme")
        .outputCucumberJson(true);
        Results result = builder.parallel(5);
       /*builder.tags("@smoke", "customer");Parametro E*/
        /*builder.tags("@smoke,customer");Parametro OU*/
        generateReport(result.getReportDir());
        Assertions.assertEquals(0, result.getFailCount());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "projeto-karate-dsl");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
