# Chaoxing Spider

## 介绍

通过抓取(chaoxing)图片合成 PDF.

## 环境

- `bash`
- `python 3`
- `TeXLive`

## To Do

验证码识别与绕过.

WebUI:

```bash
https://readsvr.chaoxing.com/n/antispiderShowVerify.ac
```

验证码提交接口(cookie):

```bash
https://readsvr.chaoxing.com/n/processVerify.ac?ucode=xsst
```

验证码图片接口:
```bash
https://readsvr.chaoxing.com/n/processVerifyPng.ac
```

```
<span class="yzmImg">
    <img src="/n/processVerifyPng.ac" 
onclick="this.src='/n/processVerifyPng.ac?t='+Math.floor(2147483647 * Math.random())" width="104" height="44">
</span>
```
