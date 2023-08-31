# halo-PaaS

将 halo 博客部署在 replit、fly.io、CodeSandbox等PaaS平台


# 鸣谢
<p align="center">
    <a href="https://halo.run" target="_blank" rel="noopener noreferrer">
        <img width="100" src="https://halo.run/logo" alt="Halo logo" />
    </a>
</p>
<p align="center"><b>Halo</b> [ˈheɪloʊ]，强大易用的开源建站工具。</p>

# 关于数据持久化
由于部分PaaS平台无永久卷或会定期清除本地的H2数据库（例如Replit），我们建议您使用一些免费的Mysql或是Postgresql数据库（或是使用我修改过工作路径的.Jar），以下是一些免费的数据库：

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
