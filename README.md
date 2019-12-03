# media-uni-app
基于uni-app开发的流媒体app(安卓，苹果，小程序一站式多端移动跨平台App，最佳实战)

nav左右滑动切换页面,scorll-view下拉;

![image](https://github.com/calvin008/weimumu-app/blob/master/image/1.gif)

## 目录
[TOC]



### 简介

| 技术              | 名称             |
| ----------------- | ---------------- |
| Spring Boot 2.1.7 | 容器+MVC框架     |
| MyBatis PLUS 2    | ORM框架          |
| uni-app           | 多端小程序生成器 |
| Redis             | 分布式缓存       |
| Docker            | 应用容器引擎     |
| Druid             | 数据库连接池     |
| mysql 8.0.16      | 数据库           |

### 工具
[uni-app官网工具hbuilderx](https://www.dcloud.io/hbuilderx.html)

[小程序开发者工具](https://developers.weixin.qq.com/miniprogram/dev/devtools/devtools.html)

IntelliJ IDEA 2018 后端编辑器

Navicat 数据库连接工具

Vmware 虚拟机

### 文档

# 流媒体小程序

## 第一章导学

**技术栈**

前端:uni-app

后端:springboot2.x+mybatis-plus

数据库:mysql8.0



## 第二章 项目介绍

### 2.1uni-app简介及优势

**uni官网** https://uniapp.dcloud.io/ 

**目录**

```text
┌─components            uni-app组件目录
│  └─comp-a.vue         可复用的a组件
├─hybrid                存放本地网页的目录，详见
├─platforms             存放各平台专用页面的目录，详见
├─pages                 业务页面文件存放的目录
│  ├─index
│  │  └─index.vue       index页面
│  └─list
│     └─list.vue        list页面
├─static                存放应用引用静态资源（如图片、视频等）的地方，注意：静态资源只能存放于此
├─main.js               Vue初始化入口文件
├─App.vue               应用配置，用来配置App全局样式以及监听
├─manifest.json         配置应用名称、appid、logo、版本等打包信息
└─pages.json            配置页面路由、导航条、选项卡等页面类信息
```



**优势**

1.  易用性;首先uni-app是基于vue.js的 ,学习精力可以放在主流前端技术上;
2.  复利性;uni-app是一套可以适用多端的开源框架，一套代码可以同时生成ios，Android，H5，微信小程序，支付宝小程序，百度小程序等。 

### 2.2前端开发工具HBuiler X

**hbuilder x**快捷键

 ![img](https://upload-images.jianshu.io/upload_images/1534169-58aa64ba345a87a1.png?imageMogr2/auto-orient/strip|imageView2/2/w/1006/format/webp) 

**收藏夹**

![image](https://github.com/calvin008/weimumu-app/blob/master/image/shou.jpg)

### 2.3小程序开发工具调试

![image](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\shezhi.jpg)

### 2.4springboot+mybatis plus简介

springboot+mybatis实现一个查询功能

## 第三章  uni-app开发小程序

### 3.1首页开发

### 3.2用户中心开发

### 3.3上传页开发

### 3.4视频页展示页开发

## 第四章 数据库设计介绍

### 4.1vmware安装docker

### 4.2docker快速安装mysql

### 4.3mysql数据库设计介绍

## 第五章 用户登录授权

### 5.1引入依赖和配置

pom依赖引入

```
		 <!--junit-->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
        </dependency>
        <!--mysql-->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.16</version>
        </dependency>
        <!--mybatis plus-->
        <dependency>
            <groupId>com.baomidou</groupId>
            <artifactId>mybatis-plus</artifactId>
            <version>3.2.0</version>
        </dependency>
        <!--lombok-->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.18.8</version>
        </dependency>
        <!--druid-->
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>1.1.19</version>
        </dependency>
        <!--log4j-->
        <dependency>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-log4j12</artifactId>
            <version>1.7.28</version>
        </dependency>
        
```

application配置

​	mysql配置

```
server:
  port: 8080
spring:
  datasource:
    url: jdbc:mysql://192.168.253.133:3307/test?useUnicode=true&useSSL=false&characterEndcoding=utf8&serverTimezon=Asia/Shanghai
    username: root
    password: 123456
    driver-class-name: com.mysql.cj.jdbc.Driver
```

​	mybatis-plus配置

```
@Autowired
    private UserMapper userMapper;

    @Test
    public void select(){
       List<Users> users = userMapper.selectList(null);
        Assert.assertEquals(5, users.size());
        users.forEach(System.out::println);
     }
```



### 5.2 创建entity和dao层

创建entity

```
@Data
public class Users {
    //    用户id
    private String id;
    //    open_id
    private String openId;
    //    用户状态
    private Integer status;
    //    用户账号
    private String username;
    //    用户密码
    private String password;
    //    用户头像
    private String avatarUrl;
    //    用户昵称
    private String nickname;
    //    用户点赞量
    private Long likeCounts;
    //    创建时间
    private Date createTime;
    //最后登录时间
    private Date lastVisitTime;
}
```

配置mapper

```
public interface UsersMapper extends BaseMapper<Users> {

}
```

### 5.3uni-app微信小程序登录

vuex存储微信小程序登录信息

uni-app创建store文件夹

并且建index.js文件

```
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
	state: {
		hasLogin: false,
		userInfo: {},
	},
	mutations: {
		login(state, provider) {

			state.hasLogin = true;
			state.userInfo = provider;
			uni.setStorage({//缓存用户登陆状态
			    key: 'userInfo',  
			    data: provider  
			}) 
			console.log(state.userInfo);
		},
		logout(state) {
			state.hasLogin = false;
			state.userInfo = {};
			uni.removeStorage({  
	            key: 'userInfo'  
	        })
		}
	},
	actions: {
	
	}

})

export default store
```





