Koyeb需要绑卡使用

![image](https://github.com/user-attachments/assets/24f64b2d-d9b0-4870-9f1f-593448fc1372)

首先新建卷

![image](https://github.com/user-attachments/assets/f126bcc3-51c2-4403-8195-4bfd7439772e)

![image](https://github.com/user-attachments/assets/cbe4c640-a9ee-491e-957f-d9ce4e33b514)


部署

[![Deploy to Koyeb](https://www.koyeb.com/static/images/deploy/button.svg)](https://app.koyeb.com/deploy?name=halo&type=docker&image=halohub%2Fhalo%3A2.19.3&command=--spring.r2dbc.url%3D%5B%E6%95%B0%E6%8D%AE%E5%BA%93%E8%BF%9E%E6%8E%A5URL%5D+-+--spring.r2dbc.username%3D%5B%E6%95%B0%E6%8D%AE%E5%BA%93%E7%94%A8%E6%88%B7%E5%90%8D%5D+--spring.r2dbc.password%3D%5B%E6%95%B0%E6%8D%AE%E5%BA%93%E5%AF%86%E7%A0%81%5D+--spring.sql.init.platform%3D%5B%E6%95%B0%E6%8D%AE%E5%BA%93%E7%B1%BB%E5%9E%8B%5D+--halo.external-url%3D%5B%E5%A4%96%E9%83%A8%E8%AE%BF%E9%97%AE%E5%9C%B0%E5%9D%80%5D&instance_type=nano&regions=was&env%5B%5D=&ports=8090%3Bhttp%3B%2F)

请修改数据库连接信息或是换用h2