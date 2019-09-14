[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable) [![Build Status](https://travis-ci.com/XiangyunHuang/MSG-Book.svg?branch=master)](https://travis-ci.com/XiangyunHuang/MSG-Book) [![Netlify Status](https://api.netlify.com/api/v1/badges/bb36db58-2a81-4e96-8397-5f9384138185/deploy-status)](https://app.netlify.com/sites/nostalgic-boyd-830eb6/deploys) ![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/xiangyunhuang/msg-book) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/xiangyunhuang/msg-book) ![GitHub contributors](https://img.shields.io/github/contributors/xiangyunhuang/msg-book) ![GitHub repo size](https://img.shields.io/github/repo-size/xiangyunhuang/msg-book) ![Docker Pulls](https://img.shields.io/docker/pulls/xiangyunhuang/msg-book) [![](https://images.microbadger.com/badges/image/xiangyunhuang/msg-book.svg)](https://microbadger.com/images/xiangyunhuang/msg-book "Get your own image badge on microbadger.com") ![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/xiangyunhuang/msg-book) [![DOI](https://zenodo.org/badge/201584237.svg)](https://zenodo.org/badge/latestdoi/201584237)
---

## 现代统计图形

本仓库作为《现代统计图形》书稿的托管地址，网页版托管在 <https://bookdown.org/xiangyun/msg/>

## Modern Statistical Graphics

This is code and text behind the [Modern Statistical Graphics](https://bookdown.org/xiangyun/msg/).

## 授权 LICENSE

<a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/2.5/cn/"><img alt="知识共享许可协议" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/2.5/cn/88x31.png" /></a>

本作品采用<a rel="license" href="https://creativecommons.org/licenses/by-nc-sa/2.5/cn/">知识共享署名-非商业性使用-相同方式共享 2.5 中国大陆许可协议</a>进行许可。

## 复现 Reproducibility

作者将本书用到的 R 包以及安装 R 包需要的系统软件依赖，编译 PDF 格式电子版需要的 LaTeX 环境一起打包在 Docker 镜像里，所以最佳的复现方式是基于容器。一共是两步

1. 克隆本仓库，进入本项目根目录

    ```bash
    git clone https://github.com/XiangyunHuang/MSG-Book.git && cd MSG-Book
    ```

1. 接着执行如下一行命令

    ```bash
    docker-compose run book bash -c "sh ./_build.sh"
    ```
