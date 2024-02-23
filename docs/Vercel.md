使用Vercel来“绑定”域名

在Github新建一个仓库（非公开），仓库中新建文件`vercel.json`，内容填写：

```json
{
  "routes": [
    {
      "src": "/(.*)",
      "dest": "https://xxx.com/$1"
    }
  ]
}
```

> 注意 其中`https://xxx.com`就是目标链接，请在目标链接后带上`/$1`

然后转到Vercel，选择刚刚创建的库部署即可