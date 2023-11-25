# 由于身体原因，本项目暂时停止维护

# halo-PaaS

将 halo 博客部署在 replit、Zeabur、railway、render、fly.io、CodeSandbox等PaaS平台


# 鸣谢
<p align="center">
    <a href="https://halo.run" target="_blank" rel="noopener noreferrer">
        <img width="100" src="https://halo.run/logo" alt="Halo logo" />
    </a>
</p>
<p align="center"><b>Halo</b> [ˈheɪloʊ]，强大易用的开源建站工具。</p>

# 关于数据持久化
由于部分PaaS平台无永久卷，我们建议您使用一些免费的Mysql或是Postgresql数据库以及做好备份，以下是一些免费的数据库：

（另外请您定时做好备份，因为halo的数据是储存在 `~/halo` 目录下，所以对于无法持久化数据的平台需要您做好备份，避免数据丢失）

- [Planetscale](https://app.planetscale.com/) （Mysql）
- [db4free](https://db4free.net/) （Mysql）
- [Remote mysql](https://remotemysql.com/) （Mysql）
- [Free Sql Database](https://www.freesqldatabase.com/) （Mysql）
- [Elephantsql](https://www.elephantsql.com/) （Protgresql）
- [Scalingo](https://scalingo.com/)
- [Yugabyte](http://cloud.yugabyte.com/)

# Docs

[在replit平台部署](https://github.com/V-Official-233/halo-PaaS/blob/main/docs/replit.md)

[在Codesandbox平台部署](https://github.com/V-Official-233/halo-PaaS/blob/main/docs/Codesandbox.md)

[使用Cloudflare Workers“绑定”域名](https://github.com/V-Official-233/halo-PaaS/blob/main/docs/Cloudflare-Workers.md)

# 待办
- [x] replit
- [x] CodeSandbox
- [ ] Zeabur
- [ ] fly.io
- [ ] railway
- [ ] render
- [ ] 在无法绑定域名的平台集成Cloudflare Argo隧道
- [ ] 哪吒探针集成（待商议）

> 由于Northflank与koyeb提供都配置过低，现已放弃这两个平台

> 欢迎提交 Pull Request 来让我们的教程更好
