# management-SSM
后台权限管理系统

系统功能
1.角色管理 2.管理员管理 3.菜单管理 4.用户管理 5.业务日志 6.SQL、URL和Spring监控 7.轮播图管理（图片的上传与回显）8.集成MyBatis逆向工程

项目特点
  基于ssm+shiro
  后台脚手架，马上上手
  完善的日志记录体系，可记录登录日志，业务操作日志(可记录操作前和操作后的数据)，异常日志到数据库
  日志删除修改为定时任务(每日21点删除30天以前的日志，配置在global.properties)
  新增菜单管理、SQL、URL和Spring监控
  轮播图管理（图片的上传与回显）
  逆向工程：根据数据库生成pojo和dao（新增），请自行修改配置generatorConfig.xml，配置完运行：com.irs.generator.GeneratorSqlmap.main方法即可。
  对多数据源提供支持（使用方法：在controller层使用注解@DataSource(dataSource="数据源名")）


截图：
