使用Cloudflare Workers反代无法绑定域名的平台
> 要注意！Cloudflare Workers免费版每日有100,000次的访问限制，超过此限制后将无法访问您的站点
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
> 1. 使用第二段支持http/https流量 的worker反代时，请加上http:// 或 https://（加上协议头）
>
> 2. 另外不管是哪个代码，在填写反代地址时末尾都不要带上`/`
>     - 错误URL示例：https://example.example.com/
>     - 正确URL示例：https://example.example.com
> 
> 感谢[abing7k](https://github.com/abing7k)提供的第二段Worker代码
