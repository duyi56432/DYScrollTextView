# DYScrollTextView

## 简介
一个高度自定义的文字滚动视图。

功能亮点：

1.高度自定义cell。

2.可改变滚动方向。

![dicImg](https://github.com/duyi56432/DYScollTextView/blob/master/效果图上.gif)  
![dicImg](https://github.com/duyi56432/DYScollTextView/blob/master/效果图下.gif)  

## 博客
[这里有更详细用法](https://www.jianshu.com/p/35ee79534e07)

## 安装

使用 cocoapods
<pre><code> 
pod 'DYScollTextView'
</code></pre>

## 用法
<pre><code> 
_dataArray = @[@"最长寿男性去世",@"各大卫视春晚阵容",@"陈汉典回应演小品",@"易烊千玺囚服",@"陈昱霖ins",@"个税不填房东信息",@"联合国维和遇袭"];
_scrollTextView = [[DYScrollTextView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 90)];
_scrollTextView.delegate = self;
_scrollTextView.intervalTime = 3;
_scrollTextView.scrollPosition = DYScrollPositionTop;
[self.view addSubview:_scrollTextView];
_scrollTextView.cellHeight = 30;
[_scrollTextView start];

</code></pre>
