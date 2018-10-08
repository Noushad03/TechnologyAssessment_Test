# TechnologyAssessment_Test

# webconnect
**WebConnectConfiguration**

Use below code on `Appdelegate` in `didFinishLaunchingWithOptions`

```
WebConnectConfiguration()
.baseUrl(baseUrl: "https://reqres.in/api/")
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
.url(url: "offers")
.header(header: ["Test": "Header"])
.queryParam(queryParam: ["name":"Hello"])
.callback(callBack: { (status, response) in

if status {
print("Get response", response as Any)

let jsonData = response?.data(using: .utf8)!
let decoder = JSONDecoder()
let modelData = try! decoder.decode(Model.self, from: jsonData!)
print("page = \(modelData.page)")
}
else {

}

})
.loader(loader: loaderIndicator)
.connect()
```

`url(url: "offers")` - This is required url for the Api's apart from your baseUrl

`baseUrl(baseUrl: "...")` - Optional if any specific API requires different baseUrl. `By default = that you provided in configuration`

`header(header: ["Test": "Header"])` - Optional  you can pass the `hearder` as `Dictionary` . `By default = nil`

`queryParam(queryParam: ["name":"Hello"])` - Optional method, you can put your `query parameters` as `dictionary`. `By default = nil`

`callback(callBack: { (status, response) in })` - Optional, Using this you can get response within this method. Like above example.

`loader(loader: loaderIndicator)` - Optional, if you want to show loader during hit Api's than you can set your loader.

-----

**HTTP POST**
```
WebConnect.post()
.url(url: "users")
.header(header: ["Test": "Header"])
.bodyParam(bodyParam: ["name":"Amit","job":"manager"])
callback(callBack: { (status, response) in

if status {
//  print("Post response", response as Any)
}
else {

}
})
.loader(loader: loaderIndicator)
.connect()
```
**HTTP PUT**
```
WebConnect.put()
.url(url: "users")
.header(header: ["Test": "Header"])
.bodyParam(bodyParam: ["name":"Amit","job":"manager"])
callback(callBack: { (status, response) in

if status {
//  print("Put response", response as Any)
}
else {

}
})
.loader(loader: loaderIndicator)
.connect()
```
**HTTP PATCH**
```
WebConnect.patch()
.url(url: "users/2")
.bodyParam(bodyParam: ["name":"Amit","job":"manager"])
.callback { (status, response) in

if status {
print("Patch response", response as Any)
}
else {

}

}
.loader(loader: loaderIndicator)
.connect()

```

**HTTP DELETE**
```
WebConnect.delete()
.url(url: "users")
.header(header: ["Test": "Header"])
.bodyParam(bodyParam: ["name":"Amit","job":"manager"])
.loader(loader: loaderIndicator)
callback(callBack: { (status, response) in

if status {
//  print("Delete response", response as Any)
}
else {

}
})
.connect()
```

`url(url: "offers")` - This is required url for the Api's apart from your baseUrl

`baseUrl(baseUrl: "...")` - Optional if any specific API requires different baseUrl. `By default = that you provided in configuration`

`header(header: ["Test": "Header"])` - Optional  you can pass the `hearder` as `Dictionary` . `By default = nil`

`bodyParam(bodyParam: ["name":"Amit","job":"manager"])` - Optional method, you can put your body parameters as `dictionary` . `By default = nil`

`callback(callBack: { (status, response) in })` - Optional, Using this you can get response within this method. Like above example.

`loader(loader: loaderIndicator)` - Optional, if you want to show loader during hit Api's than you can set your loader.

----

**HTTP DOWNLOAD**

```
WebConnect.download(fileName:"bigImage.png")
.url(url: "1024x1024-Wallpapers-010.jpg")
.baseUrl(baseUrl: "http://res.cloudinary.com/clickapps/image/upload/v1504245457/test/")
.callback(callBack: { (status, data) in

if status {

let image = UIImage(data: data as! Data)

self.downLoadImage.image = image
//print("image",image)
}
else {

print("downloading failed")
print("downloading failed \(data)")
}

})
.progress(progress: { (progress) in

print("Download Progress percentage = \(Int(progress * 100)) %")

})
//.connect()
```
`url(url: "offers")` - This is required url for the Api's apart from your baseUrl

`baseUrl(baseUrl: "...")` - Optional if any specific API requires different baseUrl. `By default = that you provided in configuration`

`callback(callBack: { (status, response) in })` - Optional, Using this you can get response within this method. Like above example.

`loader(loader: loaderIndicator)` - Optional, if you want to show loader during hit Api's than you can set your loader.

-------
**HTTP UPLOAD MULTIPART**

```
var dictProfileImage = [String:AnyObject]()

dictProfileImage["data"] = UIImageJPEGRepresentation(img!, 0.5) as AnyObject?
dictProfileImage["mimeType"] = "image/jpg" as AnyObject?
dictProfileImage["fileName"] = "avatar_profile.jpg" as AnyObject?
dictProfileImage["keys"] = "image" as AnyObject

var arrayData = [AnyObject]()
arrayData.append(dictProfileImage as AnyObject)


WebConnect.uploadPut()
.url(url: "put your url")
.baseUrl(baseUrl: "put your base url")
.bodyParam(bodyParam: params )
.header(header: headers)
.dataParams(dataParams: arrayData)
.callback(callBack: { (status, response) in

print("upload response", response)
})
.progress(progress: { (progress) in

print("Download Progress percentage = \(Int(progress * 100)) %")

})
.connect()
}


```

**Upcoming Features**
1. HTTP HEAD
