//: Playground - noun: a place where people can play

//Playground的QuickLook功能支持颜色、字符串、图像、视图、Array和Dictionary、Points、rects和sizes、贝塞尔曲线、URLs、Classes和Struct类型
import UIKit

var str = "Hello, playground"

for i in 0..<10 {
   str+="\(i)"
}
str
for i in 0..<20 {
   var j=i%4
}
//通过右边编辑栏中显示效果上的按钮可以实现效果的预览
let color = UIColor.red()
let attribStr = NSMutableAttributedString(string: str,attributes: [NSForegroundColorAttributeName:color,NSFontAttributeName:UIFont.systemFont(ofSize: 32)])
