# MYPlaceHolder 
A drop-in UITableView/UICollectionView superclass category for showing empty datasets whenever the view has no content to display 
## 集成后的效果

## 使用MYPlaceHolder

导入头文件

```Objective-C
#import "CYLTableViewPlaceHolder.h"
 ```

遵循协议

 ```Objective-C
 @interface ViewController ()<MYPlaceHolderDelegate>
 ```

实现协议方法：
仅一个必须实现的协议方法：
创建一个自定义的占位视图并返回

```Objective-C
@required
- (UIView *)makePlaceHolderView;
 ```

占位视图的点击事件等，请自行在 `- (UIView *)makePlaceHolderView;` 中所创建的 View 中实现。

另外，占位视图默认的设置是不能滚动的，也就不能下拉刷新了，但是如果想让占位视图可以滚动，则需要实现下面的可选代理方法。

 ```Objective-C
@optional
- (BOOL)enableScrollWhenPlaceHolderViewShowing;
 ```

## 适用于多种应用应用场景

* 网络故障
* 网络不可用，禁止重新加载
* 暂无数据
