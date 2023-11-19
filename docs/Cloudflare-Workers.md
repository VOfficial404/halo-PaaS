使用Cloudflare Workers反代无法绑定域名的平台
```
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
