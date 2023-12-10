# 此文档将于2024年1月1日废弃，原因请见：https://blog.replit.com/hosting-changes

# 优缺点
## 优点
- 免费托管和提供一个域名，且机子较为稳定

## 缺点
- 个人免费版只有每个月只有10G出站流量，图片只能使用图床
- 个人免费版只有10G存储
- 目前未找到自定义域名的方法

## 安装与更新脚本
### 稳定版 （当前版本：2.11.2）
#### 安装

```
bash <(curl -s https://raw.githubusercontent.com/V-Official-233/halo-PaaS/main/replit-install.sh)
```
#### 更新

```
bash <(curl -s https://raw.githubusercontent.com/V-Official-233/halo-PaaS/main/replit-update.sh)
```

### 测试版（当前版本：2.11.0-rc.2）
#### 安装

```
bash <(curl -s https://raw.githubusercontent.com/V-Official-233/halo-PaaS/main/replit-alpha-install.sh)
```
#### 更新

```
bash <(curl -s https://raw.githubusercontent.com/V-Official-233/halo-PaaS/main/replit-alpha-update.sh)
```

## 关于数据持久化
因为replit平台会不定时的清除本地的数据库，所以请使用我修改过`application/src/main/resources/application.yaml`文件中的工作目录为`/home/runner/${REPL_SLUG}/.halo`的修改版Jar

（或者是使用原版Jar+外接mysql或postgresql数据库）

> 如果是使用2.10.0及之前的修改版Jar编译的工作目录为`/home/halo/${REPL_SLUG}/.halo2`，与当前新版本（2.10.2）的工作路径有出入，请在更新前先使用备份备份好您的个人数据

## 部署

新建一个bash项目

![屏幕截图 2023-08-30 220735](https://github.com/V-Official-233/halo-PaaS/assets/104217168/dcab5433-48f2-4dba-b1c7-6415ec4d8c6b)

然后在右边的`Shell`里输入安装脚本

回车运行等待输出结束，在左下角的`Tools`里找到`Secrets`（环境变量）

![屏幕截图 2023-08-30 221437](https://github.com/V-Official-233/halo-PaaS/assets/104217168/57e4097b-cc98-455b-b41a-ce58d198a81c)

然后编辑环境变量，选择`Edit as JSON` 

- 使用外接数据库的环境变量示例
```json
{
  "HALO_WORK_DIR": "${PWD}/.halo2", #工作目录，必须设置
  "halo.cache.page.disabled": "false", #如果要用页面缓存则保留此环境变量
  "spring.r2dbc.url": "your sql host", #数据库连接地址，请参考文档 https://docs.halo.run/getting-started/install/docker-compose 设置
  "spring.r2dbc.username": "your sql username", #数据库用户名
  "spring.r2dbc.password": "your sql password", #数据库密码
  "spring.sql.init.platform": "your sql type", #数据库类型（mysql、postgresql、H2）
  "halo.external-url": "your domain" #外部访问链接，如果需要在公网访问，需要配置为实际访问地址（例：https://www.halo.run）
}
```

- 使用本地H2数据库的环境变量示例
```json
{
  "HALO_WORK_DIR": "${PWD}/.halo2", #工作目录，必须设置
  "halo.cache.page.disabled": "false", #如果要用页面缓存则保留此环境变量
  "halo.external-url": "your domain" #外部访问链接，如果需要在公网访问，需要配置为实际访问地址（例：https://www.halo.run）
}
```
更多环境变量，可参考[官方文档](https://docs.halo.run/getting-started/install/docker-compose#%E5%88%9B%E5%BB%BA%E5%AE%B9%E5%99%A8%E7%BB%84)

修改好环境变量后，点击项目上方的`Run`启动即可

## 项目保活
要注意的是，replit的项目一旦没有访问便会自动休眠，所以我们需要用到[Uptimerobot](https://uptimerobot.com)来每间隔几分钟对项目进行请求来阻止休眠，打开[Uptimerobot](https://uptimerobot.com)注册（登录）账号后进入Dashboard，点击左上角的Add New Monitor

![屏幕截图 2023-09-23 000726](https://github.com/V-Official-233/halo-PaaS/assets/104217168/8b775108-2847-4aeb-8e28-7158c0cd36fb)

![IMG_20230923_001219](https://github.com/V-Official-233/halo-PaaS/assets/104217168/fce72d9f-3916-4dc0-97d1-9f8953358020)

`Monitor Type`（类型）选择HTTP(s)

`Friendly Name`（监控名称）可以随意填写

`URL (or IP) `填写你的站点访问链接

其他的监控项不用动，然后在右侧选择通知你的方式
![IMG_20230923_001821](https://github.com/V-Official-233/halo-PaaS/assets/104217168/3fe409d8-16b4-434a-bee3-ac4a5628897d)

填写完成后点击`Save Change`保存即可

## 关于用量
![屏幕截图 2023-09-23 002146](https://github.com/V-Official-233/halo-PaaS/assets/104217168/1074c244-f4c8-4f67-85b2-e7b863ec45a5)

replit个人账户每月限制10G出站流量与10G存储空间，如果只是拿来搭建Halo个人认为是足够使用了

## 绑定域名
新版本的replit已经限制了绑定域名

您可以尝试

[使用Cloudflare Workers来“绑定”域名](https://github.com/V-Official-233/halo-PaaS/blob/main/docs/Cloudflare-Workers.md)
