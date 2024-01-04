# halo-PaaS

将 halo 博客部署在Zeabur、Koyeb、Northflank、railway、render、fly.io、CodeSandbox等PaaS平台


# 鸣谢
本项目参考了以下项目：
<p align="center">
    <a href="https://halo.run" target="_blank" rel="noopener noreferrer">
        <img width="100" src="https://halo.run/logo" alt="Halo logo" />
    </a>
</p>
<p align="center"><b>Halo</b> [ˈheɪloʊ]，强大易用的开源建站工具。</p>


Lu7fer/Jar4Halo 使用Github Action构建Halo Jar

# 关于数据持久化
由于部分PaaS平台无永久卷，我们建议您做好备份，以及使用一些免费的MySQL或是PostgreSQL数据库以防止默认的H2数据库被PaaS平台清除，以下是一些免费的数据库：

> 因为halo的数据是储存在 `/root/.halo2` 目录下，所以对于无法持久化数据的平台（例如Zeabur）需要您做好备份，避免数据丢失

- [Planetscale](https://app.planetscale.com/) （Mysql）
- [db4free](https://db4free.net/) （Mysql）
- [Remote mysql](https://remotemysql.com/) （Mysql）
- [tidbcloud](https://tidbcloud.com) （Mysql）
- [Elephantsql](https://www.elephantsql.com/) （Protgresql）
- [Aiven](https://console.aiven.io/)（Postgresql or Mysql）

# Docs

[在Zeabur平台部署](https://github.com/V-Official-233/halo-PaaS/blob/main/docs/Zeabur.md)

[在Codesandbox平台部署](https://github.com/V-Official-233/halo-PaaS/blob/main/docs/Codesandbox.md)

[使用Cloudflare Workers“绑定”域名](https://github.com/V-Official-233/halo-PaaS/blob/main/docs/Cloudflare-Workers.md)



# 待办
- [ ] Koyeb
- [ ] Zeabur
- [ ] fly.io （need visa or mastercard）
- [ ] Huggingface?
- [ ] Northflank
- [x] CodeSandbox
- [ ] railway （not free）
- [ ] render （not free）
- [ ] 集成Cloudflare Argo隧道
- [ ] 集成哪吒探针（待商议）

> 以上排序不代表优先级
>
> 从2023年12月31日开始不再提供在replit部署，原因请见：https://blog.replit.com/hosting-changes
> 
> 欢迎提交 Pull Request 来让项目变得更好
