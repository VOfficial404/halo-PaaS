使用Cloudflare Workers反代无法绑定域名的平台
# 仅支持https流量
```js
const host = 'example.example.com';

addEventListener(
  "fetch",event => { 

      let url=new URL(event.request.url);
      url.hostname=host;
      let request=new Request(url,event.request);
      event. respondWith(
          fetch(request)
      )
  }
)
```

# 支持http/https流量 
```js
const hostname = "http://example.com or https://example.com"

 

function handleRequest(request) {

  let url = new URL(request.url);

  return fetch(new Request(hostname + url.pathname,request));

}

 

addEventListener("fetch", event => {

 event.respondWith(handleRequest(event.request));

})

```
> 使用第二段支持http/https流量 的worker反代时，请加上http:// 或 https://（加上协议头）
> 
> 感谢[abing7k](https://github.com/abing7k)提供的第二段worker代码
