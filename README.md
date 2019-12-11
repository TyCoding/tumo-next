# Tumo-next-themes

>   A simple and beautiful hexo themes.

## Introduce 

`tumo-next-themes` is a [Hexo](https://hexo.io/zh-cn/) themes, it change from [Next](http://theme-next.iissnan.com/) theme. It's very simple enough, removed bloted style from Next theme.



**Theme style reference [https://mrbird.cc/](https://mrbird.cc/). **

## Simple

[https://tycoding.cn/](https://tycoding.cn/)

## Get Started

>   1.  Get theme code

```shell
cd your_blog_root/

git clone https://github.com/TyCoding/tumo-next.git themes/tumo-next
```



>   2.  Edit you_blog_root/_config.yml

```yaml
theme: tumo-next
```

## Document

-   [https://hexo.io/zh-cn/](https://hexo.io/zh-cn/)
-   [http://theme-next.iissnan.com/](http://theme-next.iissnan.com/)

## Config

>    Change Sidebar Menu

Sidebar menu is Hexo social links. If you change sidebar menu, you need edit `themes/tumo-next/_config.yml`. When you finish config, you need to restart the hexo service.

```yaml
social:
  GitHub: https://github.com/TyCoding || github
```



>   Change Header Menu

If you change header menu, you need also edit `themes/tumo-next/_config.yml`: 

```yaml
menu:
  home: /
  archives: /archives/
  about: /about/
  links: /links/
```

Others, Header menu is fixed, If you want to add a new Page ( create  a new URL Page ), you need to use `hexo new xx` to create new Markdown file, Hexo will render this file with the file directory as the new URL.



>   Change Top Menu 

You can top links, it will display globally. You need edit `themes/tumo-next/_config.yml`:

```yaml
top:
  links: 
    '🐤SpringCloud分布式项目脚手架': 'https://github.com/TyCoding/cloud-template'
```

