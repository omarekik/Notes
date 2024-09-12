* Test case structure of GIVEN/WHEN/THEN:
	> /// \UNIT_TEST_DESIGN_TECHNIQUE{negative/positive test, boundary value analysis, equivalence classes partitioning ...}  
	> /// \UNIT_TEST_DESCRIPTION  
	> /// {  
	> ///   GIVEN:  
	> ///      in1 is 1 and in2 is 2  
	> ///   WHEN:  
	> ///      sum is called  
	> ///   THEN:  
	> ///      result is 3  
	> /// }  
	> TEST(TestSuite, TestCase)  
	> {  
	> // GIVEN  
	> const int in1{1}, in2{2};  
	>   
	> // WHEN  
	> const int result = sum(in1, in2);
	> 
	> // THEN
	> EXPECT_EQ(result, 3);  
	> }  
	
* Boundary testing: 
taking the example of comparaison of float greater than 0, the boundary values are: std::numeric_limits<float>::max(), 0 + std::numeric_limits<float>::epsilon(), 0, std::numeric_limits<float>::lowest() 

* It is possible to filter the test cases to be executed using test case naming pattern in the following instruction:  
	> ::testing::GTEST_FLAG(filter) = "*UpdateFeature*";
	
* Stubs are just external functions. We have 2 type of stubs:  
	* Stubs are not called in unit under test. Just define them to solve linking error (London approach).  
	* Stubs are called in unit under test. Define mocks to test them in your test case:  
		- Check number of calls  
		- Check input parameters  
		- Set output parameters  
		- Return value  

	| Item 	| Example 	| Documentation and further R&D 	|
	|---	|---	|---	|
	| Fixture test 	| https://godbolt.org/z/dE6s43GPj 	| If test name start by 	"DISABLED_", gtest will ignore the test and not run it 	|
	| Value parameterized test 	| https://godbolt.org/z/4jE7crvKo https://godbolt.org/z/sh4WsGa9n https://godbolt.org/z/qj7Kf11Y3 https://godbolt.org/z/eEx6n9KaT 	| * TestWithParam : implecit inheritance from ::testing::Test  <br>* 	TestWithParam more readable using ValuesIn C array  <br>* WithParamInterface : 	explecit inheritance from fixture or ::testing::Test  <br>* WithParamInterface 	more readable 	|
	| Death test 	| https://godbolt.org/z/9aTE3GW7d 	| 	|
	| Stub of undefined method 	| https://godbolt.org/z/MGd1jdxEM 	|   	|
	| Mock virtual method and Matchers selection order	| https://godbolt.org/z/nPnG6vhnr 	| [googlemock/scripts/generator](https://git.xfel.eu/karaboDevices/googletest/tree/master/googlemock/scripts/generator) 	|
	| Mock non virtual 	| https://godbolt.org/z/9bfzv5T9E 	|   	|
	| Private method test 	| https://godbolt.org/z/P5qjh1rEr 	|  	|

* First it is better to test private methods using public ones. If it is not feasible, it is possible to test private method of the unit under test by defining friendness with test case:
	* In the test script define GTEST_FRIEND macro:  
	>	class GTEST_TEST_CLASS_NAME_(TestSuite1, TestCase1); //declare the test case class  
	>	class GTEST_TEST_CLASS_NAME_(TestSuite1, TestCase2); //declare the test case class
	>	//define GTEST_FRIEND macro  
	>	#define GTEST_FRIEND \  
	>	FRIEND_TEST(TestSuite1, TestCase1); \  
	>	FRIEND_TEST(TestSuite1, TestCase2); \  
	* In the unit under test class, next to private specifier, call the GTEST_FRIEND macro:  
	>	private:  
	>		// Declare friend class for testing  
	>		#ifdef GTEST_FRIEND  
	>		GTEST_FRIEND;  
	>		#endif  
	
* Calling, inside the test script, a private function of dependency class DepClass that is not the class under test: In the test script before including the header file of dependency class, redefine private/protected words to public:
	>	#define _ALLOW_KEYWORD_MACROS  
	>	#define private public  
	>	#define protected public  
	>	// Include header files without encapsulation  
	>	#include "DepClass1.hpp"  
	>	#include "DepClass2.hpp"  
	>	#undef private  
	>	#undef protected  
	>	#undef _ALLOW_KEYWORD_MACROS  	
	
* Template class or function should be tested over the function that is instantiating it, so that the template parameter will be defined by the instantiating function.  
    