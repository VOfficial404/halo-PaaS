# 安装在replit平台

## 关于数据持久化
因为replit平台会不定时的清除本地的数据库，所以请使用修改过`application/src/main/resources/application.yaml`文件中的工作目录为`/home/halo/${REPL_SLUG}/.halo2`的修改版Jar

（或者是使用原版Jar+外接mysql或postgresql数据库）
