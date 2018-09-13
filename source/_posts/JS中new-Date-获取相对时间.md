---
title: JS中new Date()获取相对时间
date: 2018-09-12 23:31:14
tags:
---

今天由于项目需求，看了下 [js-cookie](https://github.com/js-cookie/js-cookie) 的源码，发现了一段代码比较有意思，分享一下

```js
attributes.expires = new Date(new Date() * 1 + attributes.expires * 864e5);
```

其中 `new Date() * 1` 会隐式调用 `Date.prototype` 上的 `valueOf()` 方法，而该方法等同于 `Date.prototype.getTime()`

下面四种获取的结果都是一样的

```js
new Date().valueOf();

new Date().getTime();

newDate() * 1 + newDate();
```

`864e5` 是一天的毫秒数，采用的是科学计数法 等同于 `86400000`

SO：上面的代码就很好理解了，就是给当前 cookie 设置有效期，而有效期是在当前时间的基础上加上设置的天数

### 总结

通过这种可以处理相对当前时间的前一天、后一天等相对时间，不必引入三方库，反而增加了应用的大小

