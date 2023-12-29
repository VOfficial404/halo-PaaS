# halo-PaaS

将 halo 博客部署在Zeabur、railway、render、fly.io、CodeSandbox等PaaS平台


# 鸣谢
<p align="center">
    <a href="https://halo.run" target="_blank" rel="noopener noreferrer">
        <img width="100" src="https://halo.run/logo" alt="Halo logo" />
    </a>
</p>
<p align="center"><b>Halo</b> [ˈheɪloʊ]，强大易用的开源建站工具。</p>

# 关于数据持久化
由于部分PaaS平台无永久卷，我们建议您做好备份，以及使用一些免费的Mysql或是Postgresql数据库以防止默认的H2数据库被PaaS平台清除，以下是一些免费的数据库：

> 因为halo的数据是储存在 `/root/.halo2` 目录下，所以对于无法持久化数据的平台（例如Zeabur）需要您做好备份，避免数据丢失

- [Planetscale](https://app.planetscale.com/) （Mysql）
- [db4free](https://db4free.net/) （Mysql）
- [Remote mysql](https://remotemysql.com/) （Mysql）
- [tidbcloud](https://tidbcloud.com) （Mysql）
- [Elephantsql](https://www.elephantsql.com/) （Protgresql）
- [Aiven](https://console.aiven.io/)（Postgresql or Mysql）

# Docs

[在Codesandbox平台部署](https://github.com/V-Official-233/halo-PaaS/blob/main/docs/Codesandbox.md)

[使用Cloudflare Workers“绑定”域名](https://github.com/V-Official-233/halo-PaaS/blob/main/docs/Cloudflare-Workers.md)



# 待办
- [ ] Koyeb
- [ ] Zeabur
- [ ] fly.io （need visa or mastercard）
- [ ] railway （not free）
- [ ] render （not free）
- [ ] Huggingface?
- [ ] Northflank
- [x] CodeSandbox
- [ ] 集成Cloudflare Argo隧道
- [ ] 集成哪吒探针（待商议）

> 以上排序不代表优先级
>
> 从2023年12月31日开始不再提供在replit部署，原因请见：https://blog.replit.com/hosting-changes
> 
> 欢迎提交 Pull Request 来让我们的教程更好
