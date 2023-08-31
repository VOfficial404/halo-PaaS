# 安装在replit平台

## 关于数据持久化
因为replit平台会不定时的清除本地的数据库，所以请使用我修改过`application/src/main/resources/application.yaml`文件中的工作目录为`/home/halo/${REPL_SLUG}/.halo2`的修改版Jar

（或者是使用原版Jar+外接mysql或postgresql数据库）

## 安装

新建一个bash项目

![屏幕截图 2023-08-30 220735](https://github.com/V-Official-233/halo-PaaS/assets/104217168/dcab5433-48f2-4dba-b1c7-6415ec4d8c6b)

然后在右边的`Console`里输入

```
bash <(curl -s https://raw.githubusercontent.com/V-Official-233/halo-PaaS/main/Replit-install.sh)
```

回车运行等待输出结束，在左下角的`Tools`里找到`Secrets`（环境变量）

![屏幕截图 2023-08-30 221437](https://github.com/V-Official-233/halo-PaaS/assets/104217168/57e4097b-cc98-455b-b41a-ce58d198a81c)

然后编辑环境变量，选择`Edit as JSON` 

- 使用外接数据库的环境变量示例
```
{
  "HALO_WORK_DIR": "${PWD}/halo",
  "halo.security.initializer.superadminusername": "初始管理员账户名称（注意不要有大写）",
  "halo.security.initializer.superadminpassword": "初始管理员账户密码",
  "spring.r2dbc.url": "数据库连接地址",
  "spring.r2dbc.username": "数据库用户名",
  "spring.r2dbc.password": "数据库密码",
  "spring.sql.init.platform": "数据库平台名称",
  "halo.external-url": "外部访问链接，如果需要在公网访问，需要配置为实际访问地址"
}
```

- 使用本地H2数据库的环境变量示例
```
{
  "HALO_WORK_DIR": "${PWD}/halo",
  "halo.cache.page.disabled": "false",
  "halo.security.initializer.superadminusername": "初始管理员账户名称（注意不要有大写）",
  "halo.security.initializer.superadminpassword": "初始管理员账户密码",
  "halo.external-url": "外部访问链接，如果需要在公网访问，需要配置为实际访问地址"
}
```
更多环境变量，可参考[官方文档](https://docs.halo.run/getting-started/install/docker-compose#%E5%88%9B%E5%BB%BA%E5%AE%B9%E5%99%A8%E7%BB%84)

修改好环境变量后，点击项目上方的`Run`启动即可

要注意的是，replit的项目一旦没有访问便会自动休眠，所以我们需要用到[Uptimerobot](https://uptimerobot.com)来每间隔几分钟对项目进行请求来阻止休眠，~这里不再过多讲解~ 下次再写
