首先在[Serv00](https://www.serv00.com)注册一个账号

# 部署
首先，在Panel中的Additional services选项卡中找到Run your own applications项目，将其设置为Enabled。

![image](https://github.com/user-attachments/assets/57deceff-2132-4ac9-bd17-ab8b7e10a790)


然后ssh上你的虚拟主机后，使用以下命令安装pm2
```auto
bash <(curl -s https://github.com/V-Official-233/halo-PaaS/raw/main/serv00-install-pm2.sh)
```

创建一个工作目录
```auto
cd domains && mkdir halo
```

进入目录并下载编译好的Jar包
> 可以从本项目直接下载，也可以下载halo官方编译的Jar包
```auto
cd halo && wget https://github.com/V-UwU/halo-PaaS/releases/download/v2.17.2/halo.jar
```
然后在Serv00的面板新建一个mysql数据库，并在下载Jar包的目录新建文件夹`.halo`，创建文件`application.yaml`
```yaml
server:
  port: #你在面板中放行的端口
  # Response data gzip.
  compression:
    enabled: false
spring:
  #sql:
  #  init.platform: mysql
  r2dbc:
    url: r2dbc:pool:mysql://数据库地址:3306/数据库名
    username: #数据库用户名
    password: #数据库密码
halo:
  # Your admin client path is https://your-domain/{admin-path}
  admin-path: admin
  # memory or level
  cache: level
```

然后在Jar所在目录新建文件`run.sh`
```auto
#!/bin/bash
export HALO_WORK_DIR="/home/用户名/domains/halo/.halo"
export HALO_EXTERNAL_URL="https://xxxxx.com"
java17 -server -Xms128m -Xmx256m -jar -Duser.timezone=Asia/Shanghai /home/用户名/domains/halo/halo.jar --spring.config.additional-location=/home/用户名/domains/halo/.halo/application.yaml
```
然后测试运行：
```
chmod +x run.sh && ./run.sh
```
确定运行没有问题后，按 Ctrl+c即可停止运行。

使用pm2管理运行：
```
chmod +x run.sh && pm2 start ./run.sh --name halo
```

# 自动重启

在Panel中找到Cron jobs选项卡，使用Add cron job功能添加任务，Specify time选择After reboot，即为重启后运行。Form type选择Advanced，Command写：

```auto
/home/你的用户名/.npm-global/bin/pm2 resurrect >/dev/null 2>&1 && /home/你的用户名/.npm-global/bin/pm2 restart all >/dev/null 2>&1
```


添加完之后，在SSH窗口保存pm2的当前任务列表快照：
```
pm2 save
```
