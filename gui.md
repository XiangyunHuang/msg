# 图形界面 {#cha:GUI}

虽然 R 自身几乎没有图形用户界面（GUI），但 CRAN 中存在若干用来生成 GUI 的附加包，例如 **RGtk2** 和 **gWidgets**，R 基础包中也有 **tcltk** 可以制作简单的图形界面。根据作者自身的经验，**gWidgets** 是最易学的一个附加包。尽管 **tcltk** 包由 R 自带、用户不必额外安装，但它的图形界面相对简陋，帮助文档也不够健全，而且个人认为 tcl/tk 界面不够美观，尽管如此，还是有很多包都基于 **tcltk** 包来创建界面，比如 John Fox 的 **Rcmdr** [@Rcmdr] 包就是一个比较成熟和著名的 R 用户界面；**RGtk2** 包的功能非常完善，但用它构建界面也经常让人觉得过于繁琐。相比之下，**gWidgets** 则是在抽象程度和功能之间有着很好的平衡的一个附加包，因此这里我们着重介绍它。

**gWidgets** 包本身只是一个抽象框架，它需要附着在一个具体的界面包上才能生成具体界面元素，这也是它的灵活性所在：使用 **gWidgets** 包创建图形界面时，我们可以不必关心最终用哪种界面实现，这些界面与创建界面的代码是分离的。对 **gWidgets** 包而言，它至少有两种界面实现：GTK+ 界面和 tcl/tk 界面，分别对应着 **gWidgetsRGtk2** 包和 **gWidgetstcltk** 包（历史上曾经有过基于 **gWidgetsrJava** 包的 Java 界面但后来作者不再维护这个包了）。由于 GTK+ 界面看起来美观一些，这里我们只以 GTK+ 界面为例，但创建 GUI 的代码几乎可以不作任何修改转化为 tcl/tk 界面（有时候会有细微差别）。首先我们需要安装并加载 **gWidgetsRGtk2** 包：


``` r
install.packages("gWidgetsRGtk2")
library(gWidgetsRGtk2)
options(guiToolkit = "RGtk2") # 这项设置可省略
# 如果要创建 tcl/tk 界面则需要安装 gWidgetstcltk 并设置 options(guiToolkit='tcltk')
```

创建图形界面有三大关键要素：一是界面控件，如按钮、下拉框、文本框等，二是这些控件的位置安排，或者嵌套关系，三是事件，因为控件通常是用来响应一些用户事件的，例如鼠标点击或键盘动作等。这些要素在 gWidgets 的框架下非常简易明了，下面我们以一个最简单的例子说明这些要素：


``` r
gw <- gwindow("Hi Window!") # 创建一个窗口，它是所有控件的载体
gb <- gbutton("Open", container = gw, handler = function(h, ...) {
  gfile("Open a file", type = "open")
})
```

首先我们用 `gwindow()` 函数创建了一个窗口，几乎所有的界面都需要有一个窗口来装载图形控件，这个函数的第一个参数是窗口的标题；接下来我们用 `gbutton()` 创建一个按钮，注意此时我们指定这个按钮被装在刚才创建的窗口对象中，这通过 `container` 参数实现，`gbutton()` 的第一个参数为按钮上的文本；在创建按钮时我们也绑定了一个事件在它上面，即 `handler` 参数，这个参数的取值为一个函数，上例中的函数格式为这个参数的固定取值格式（第一个参数为 `h`，剩下的参数为 `...`），函数用来执行事件，比如这里如果我们点击按钮，那么触发的事件将是弹出一个打开文件的对话框，它通过 `gfile()` 函数实现。在真实的应用中，我们一般需要对打开的文件进行进一步操作，这个文件的地址可从 `gfile()` 的返回值中得到。

**gWidgets** 包中的控件包括：

`gwindow()`
: 窗口

`gbutton()`
: 按钮

`gedit(), gtext(), glabel()`
: 单行文本框和多行文本框，标签（它只能显示文本，不可编辑）

`gcheckbox(), gcheckboxgroup(), gradio()`
: 复选框、复选框组和单选框

`gcombobox(), gdroplist()`
: 下拉框（前者允许用户自行输入选项，后者只能从给定列表中选择）

`gfile(), gfilebrowse(), gcalendar()`
: 文件对话框和日历控件 

`gmessage(), ginput(), gconfirm(), galert()`
: 消息对话框、输入对话框、确认对话框和警告对话框

`gdf(), gdfnotebook()`
: 可编辑的数据表控件（后者的界面更丰富）

`gtable()`
: 不可编辑的数据表控件

`ggroup()`
: 组合控件，它没有具体外观，但可以作为其它控件的载体，将其它控件组合在一起

`gframe()`
: 框架，可选择性地带文本标签

`gmenu(), gtoolbar(), gstatusbar()`
: 菜单、工具栏和状态栏

`ggraphics()`
: 图形控件，可将 R 图形嵌入界面中（依赖于 **cairoDevice** 包）

`gimage()`
: 图片控件，可显示任意本地图片文件

`gnotebook()`
: 标签页，或选项卡，包含若干子页面，顶部为页面名称，页面之间可以来回切换显示

`gslider(), gspinbutton()`
: 滑动条和计数按钮，前者可由鼠标拖动滑杆改变控件的值，后者通过鼠标点击按钮上的上下或左右箭头来逐步改变值

`gtree()`
: 树型控件（展示树型嵌套结构）

大部分控件都有其取值，可以用函数 `svalue()` 提取或改变。例如文本框控件的取值就是其中的文本，我们也可以通过 `svalue()` 改变文本框中的文本：


``` r
gtxt <- gedit("initial text", container = TRUE)
svalue(gtxt) # 返回 'initial text'
svalue(gtxt) <- "changed text" # 文本框中的文本被更新
```

类似地，我们也可以用 `enabled()` 和 `visible()` 分别控制控件的可用性（不可用时控件通常变为灰色）和可见性。我们还可以用一系列 `addHandlerXXX()` 函数来事后往控件上添加事件，例如 `addHandlerClicked()` 可以添加鼠标点击事件，等等。

特别值得一提的是，gWidgets 和 R 的数据结构融合得非常好，对于熟悉 R 数据结构的用户来说，这些控件甚至可以直接当作 R 对象使用。典型的例子如数据表控件，我们可以用方括号从控件中取值：



``` r
gtb <- gtable(iris, container = TRUE)
gtb[1, 1] # 表中第 1 行第 1 列的值
gtb[1:10, 1:2] # 前 10 行前 2 列的值
```

最后我们展示一个简单的应用实例：在 \@ref(sec:color) 小节中我们介绍了 R 中的颜色生成机制，其中有一种就是通过红绿蓝三原色混合生成颜色，我们可以利用 gWidgets 创建一个简易图形界面来动态实现这种混合，最终效果如图 \@ref(fig:color-selector)。


``` r
library(gWidgetsRGtk2)
g <- ggroup(horizontal = FALSE, container = gwindow("Color Selector"))
x <- c(0, 0, 0) # 红绿蓝颜色成分向量
for (i in 1:3) {
  gslider(from = 0, to = 1, by = 0.05, action = i, handler = function(h, ...) {
    x[h$action] <<- svalue(h$obj)
    par(bg = rgb(x[1], x[2], x[3]), mar = rep(0, 4))
    plot.new()
  }, container = g)
}
ggraphics(container = g, width = 200, height = 100)
```
\begin{figure}

{\centering \subfloat[(\#fig:color-selector-1)]{\includegraphics[width=0.45\linewidth]{images/gwidgets-color-selector1} }\subfloat[(\#fig:color-selector-2)]{\includegraphics[width=0.45\linewidth]{images/gwidgets-color-selector2} }

}

\caption[(ref:color-selector-s)]{(ref:color-selector)}(\#fig:color-selector)
\end{figure}

(ref:color-selector-s) 用 **gWidgets** 制作的颜色混合器

(ref:color-selector) 用 **gWidgets** 制作的颜色混合器：调节红绿蓝三原色的成分可以获得新的混合色。


上面的代码中，首先我们用 `ggroup()` 来排版布局，主要是让控件以纵向方向排列，因为默认情况下新控件会横向排列；接着我们用循环创建三个滑动条分别代表红绿蓝，它们的取值范围为 0 到 1，滑动一步时值的变动为 0.05，其中绑定的事件为画空白图，图的背景按照向量 x 的三个成分由 `rgb()` 函数混合而成，这里我们使用了一点新概念，即 `action` 参数，它的意义稍微有点曲折：`action` 参数将来会传给 `handler` 参数中的函数，具体传递过程是，它的取值会被放在 `h` 参数的 `action` 子元素中，也就是我们可以用 `h$action` 来提取传入的值；循环中三个滑动条的 `action` 值分别为 1、2、3，而 `handler` 的函数中 `h$obj` 可以用来调用控件本身，所以用 `svalue()` 就可以提取该控件当前的值，并赋给 x 中的第 i 个元素，这里的赋值符号用的是双箭头 `<<-`，原因是在普通的赋值符下（等号 `=` 或者单箭头 `<-`），R 的变量作用域会使得函数内部对变量的修改只是局部的修改，外部的变量值不会改变，但双箭头可以从内部改变外部变量的值。这样，每次我们拖动第 i 个滑动条时，触发的事件是 x 中的第 i 个值被修改为滑动条的值，然后带背景色的空白图形会根据新的颜色被重画。最后我们使用了图形控件 `ggraphics()` 将 R 图形嵌入当前的图形界面，一个完整的颜色混合器界面就完成了。图 \@ref(fig:color-selector) 中左图显示的是 50\% 的红色配 50\% 的蓝色，结果是紫色；右图是 70\% 红、100\% 绿和 10\% 蓝混合的结果。

通过以上介绍，我们相信在 R 中创建 GUI 不再是难事。在日常工作中，偶尔写一个简单界面也能为我们的工作增添一些乐趣和便利。**formatR** 包 [@formatR] 就是作者编写的一个用来自动整理 R 代码的图形界面，点一下按钮，文本框中的 R 代码就会被整理整齐（自动添加空格和缩进），更多介绍参见 <https://yihui.org/formatr/>。另外，图形界面也是让图形发挥更大功效的有力工具，如 GGobi 软件若离开了它的图形界面，可能会失色不少。


