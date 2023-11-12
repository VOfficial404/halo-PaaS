# 注意

Codesandbox的所有项目都是公开的（日志，终端输出，项目文件），所以我们不建议在Codesandbox部署halo

# 部署
点击`New sandbox`，选择Docker

![屏幕截图 2023-09-23 011241](https://github.com/V-Official-233/halo-PaaS/assets/104217168/421dd586-1a87-4fd9-a8e1-2fe1a7bdda1d)

![屏幕截图 2023-09-23 011616](https://github.com/V-Official-233/halo-PaaS/assets/104217168/2b0e90cc-cb7e-4337-8507-51370421cb67)

打开左侧文件中的`.codesandbox`文件夹中的`Dockerfile`

![屏幕截图 2023-09-23 011656](https://github.com/V-Official-233/halo-PaaS/assets/104217168/f4ab0d5f-2eee-4cc0-8a8b-d4386bf8c463)

将里面的内容修改为
```
# CodeSandbox supports debian & ubuntu based images
FROM debian

# Example; install htop by default
RUN apt update -y && apt install -y openjdk-17-jdk && apt install -y openjdk-17-jre && apt install -y wget
```
`Ctrl+S`保存修改后在左上角重启沙盒

![屏幕截图 2023-09-23 011935](https://github.com/V-Official-233/halo-PaaS/assets/104217168/601c1b54-ea8c-4520-a884-bc9b5703025b)

重启后，在中间打开一个终端

![屏幕截图 2023-09-23 012818](https://github.com/V-Official-233/halo-PaaS/assets/104217168/7495306c-eb2a-4b28-bf02-4eb1ab11b162)

输入
```
wget -O halo.jar https://github.com/V-Official-233/halo-PaaS/releases/download/v2.10.2/halo-2.10.2.jar
```

下载Jar

然后输入输入以下命令运行halo
```
java -jar halo.jar
```


