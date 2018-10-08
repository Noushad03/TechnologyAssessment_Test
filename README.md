# TechnologyAssessment_Test

I  implement this code test Using MVC pattern. And used WebConnect classes for the to manage API's requests.

Use below code on `Appdelegate` in `didFinishLaunchingWithOptions`

```
WebConnectConfiguration()
.baseUrl(baseUrl: "API.kBaseUrl")
.debug(debug: true)
.timeOut(connectTimeout: 20, readTimeout: 20)
.config()
```

`baseUrl(baseUrl: "https://reqres.in/api/")` - This is required base url for the Api's

`debug(debug: true)` - This is optional method with `true/false`  you can check all the requested logs using this method `debugPrint`

`timeOut(connectTimeout: 20, readTimeout: 20)` - This is optional method using this you can set  connection timeout and read timeout for Api's otherwise by default time out is 60 sec for both timeout.

-----

**HTTP GET**

```

WebConnect.get()
.url(url: API.kArticleList)
.queryParam(queryParam: param)
.showCustomLoader(showLoader: true)
.callback { (status, response) in
if status {
print("Get response", response as Any)

})
.loader(loader: loaderIndicator)
.connect()
```
`url(url: "offers")` - This is required url for the Api's apart from your baseUrl

`baseUrl(baseUrl: "...")` - Optional if any specific API requires different baseUrl. `By default = that you provided in configuration`

`queryParam(queryParam: ["name":"Hello"])` - Optional method, you can put your `query parameters` as `dictionary`. `By default = nil`

`callback(callBack: { (status, response) in })` - Optional, Using this you can get response within this method. Like above example.

`loader(loader: loaderIndicator)` - Optional, if you want to show loader during hit Api's than you can set your loader.

-----


After that saved the article request listing save into the `Article` Model class and shows in the table view and its details.

**How to measure code coverage in Xcode**

To measure and visualize code coverage for a project, follow these steps:

- Enable code coverage date gathering. To do this, go to Product › Scheme › Edit Scheme... , and select Test from the left hand side menu. Under the Info section, check the Gather coverage data box.

- To run all unit tests for a test target, in this case TechnologyAssessmentTest, first open the Test navigator in Xcode’s navigation pane. Then, select the small Run button next to your test target name.

- Now open the Report navigator in Xcode’s navigation pane, and select the Test report from the list. This should open up a list of the tests that were just run and indicate which passed and failed. In this case, they all passed.
- To view code coverage, select the Coverage tab. Xcode will display the overall code coverage for the framework, and we can expand this to get coverage data on individual files and functions.

**Unit test and code coverage**

We can explicitly enable the code coverage for the scheme by editing the scheme and tick the box `Code Coverage` from ‘Test’ action. We can filter targets as well if we don’t want to include coverage for UITests. Now that, we have enabled the code coverage for our scheme. Once we build and test this scheme using `CMD+U` button in Xcode this will generate Code coverage reports into the default derived data directory located at ~/Library/Developer/Xcode/DerivedData and you will see the code coverage reports generated at Logs/Test directory.


Inside the Logs/Test directory, there is coverage report, with extension .xccovreport , and the coverage archive, with extension .xccovarchive respectively. As per man page of this utility “The coverage report contains line coverage percentages for each target, source file, and function/method that has coverage information. The coverage archive contains the raw execution counts for each file in the report”.






