# halo-PaaS

![halo on paas（纯黑背景）](https://github.com/V-Official-233/halo-PaaS/assets/104217168/6a878caf-f9ca-4358-a8e5-9ecf100b6ff8)

将 halo 博客部署在 [replit](https://replit.com/)、[fly.io](https://fly.io)、[CodeSandbox](https://codesandbox.io)等PaaS平台


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

# 部署

[在replit平台部署](https://github.com/V-Official-233/halo-PaaS/blob/main/replit-install.md)

[在Codesandbox平台部署](https://github.com/V-Official-233/halo-PaaS/blob/main/Codesandbox-install.md)

# Demo
后台管理员账号密码均为：
- 账号：admin
- 密码：123456

[Halo on replit](https://halo-dev-replith2.halo-replit.repl.co/console/dashboard)

[Halo on Codesandbox](https://jx4ckr-8090.csb.app/console/dashboard)

# 代办
- [x] replit
- [x] CodeSandbox
- [ ] Zeabur
- [ ] fly.io
- [ ] railway
- [ ] render
- [ ] Northflank
- [ ] Koyeb

> 欢迎提交 Pull Request 来让我们的教程更好
