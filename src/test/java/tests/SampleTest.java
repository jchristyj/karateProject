import com.intuit.karate.junit5.Karate;

public class SampleTest {
	
	@Karate.Test
	Karate testsample() {
		return Karate.run("sample").relativeTo(getClass());
		
	}
}