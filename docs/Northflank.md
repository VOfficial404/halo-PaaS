# 在Northflank部署halo博客
感谢[@hanbing777](https://github.com/hanbing777)提供的Northflank账号
注意，Northflank 需要 visa 或是 mastercard 来绑卡验证
# 部署
首先请Fork本仓库，这里不再演示
在右上角找到`Create New`，选择`Service`

![image](https://github.com/V-Official-233/halo-PaaS/assets/104217168/4a923a07-6e51-451b-abca-e35a3f32b35c)

选择`Build and deploy a Git repo`名称随便写，选择Fork的仓库，并选择`main`分支

![image](https://github.com/V-Official-233/halo-PaaS/assets/104217168/b81b3855-8915-4d3b-abb5-0f01b2b61c8b)

`Build options`设置如下

![image](https://github.com/V-Official-233/halo-PaaS/assets/104217168/7c74e088-029c-4b69-b43f-794507333b8e)

环境变量设置具体可参考官方文档

![image](https://github.com/V-Official-233/halo-PaaS/assets/104217168/a57634e8-699f-40cd-a3be-e180beebf564)

端口设置8090，选择http（记得打开Publicly expose this port to the internet）

![image](https://github.com/V-Official-233/halo-PaaS/assets/104217168/64a448ed-816e-495f-855c-3f82b25ce39c)

配置选择512M的

![image](https://github.com/V-Official-233/halo-PaaS/assets/104217168/c06911ac-32ba-485a-9e09-37899468cb2a)

为了持久化数据，新建一个储存卷，路径填写`/root/.halo2`

![image](https://github.com/V-Official-233/halo-PaaS/assets/104217168/d9724806-50cb-4b2d-b802-a3dafa759e8d)

（因为只有0.2C，所以启动时间可能会比较长）
# 更新
仓库同步改动后 Northflank会自动重新部署

![image](https://github.com/V-Official-233/halo-PaaS/assets/104217168/c7037499-5cce-4634-8867-056fd24f2f18)

![image](https://github.com/V-Official-233/halo-PaaS/assets/104217168/98fcac2c-899f-4ad3-85f5-807c9837017c)
