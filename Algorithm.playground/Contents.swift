//: Playground - noun: a place where people can play

import UIKit
// 声明一个不可修改的数组
let nums = [1, 2, 3]
let nums1 = [Int](repeating:3,count:4)
// 声明一个可以修改的数组
var nums2 = [3, 1, 2]
// 增加一个元素
nums2.append(4)
// 对原数组进行升序排序
nums2.sort(isOrderedBefore: {$0 < $1})
for i in 0 ..< nums2.count {
    print(nums2[i])
}
// 将原数组除了最后一个以外的所有元素赋值给另一个数组
let anotherNums = Array(nums[0 ..< nums.count - 1])


// 用数组实现栈
class Stack {
    var stack: [AnyObject]
    init() {
        stack = [AnyObject]()
    }
    func push(object: AnyObject) {
        stack.append(object)
    }
    func pop() -> AnyObject? {
        if (!isEmpty()) {
            return stack.removeLast()
        } else {
            return nil
        }
    }
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    func peek() -> AnyObject? {
        return stack.last
    }
}



/*
  给一个整型数组和一个目标值，判断数组中是否有两个数字之和等于目标值
 To check whether a set contains a particular item, use the contains(_:) method.
 */

func twoSum(nums: [Int], _ target: Int) -> Bool {
    var set = Set<Int>()
    for num in nums {
        if set.contains(target - num) {
        
            return true
        }
        set.insert(num)
    }
    return false
}
let target = 10;
let arr = [2,7,3,5,6]
let a = twoSum(nums: arr, 10)
print(a)
/*
 给定一个整型数组中有且仅有两个数字之和等于目标值，求两个数字在数组中的序号
 */
func twoSum1(nums: [Int], _ target: Int) -> [Int] {
    var res = [Int]()
    var dict = [Int: Int]()
    for i in 0 ..< nums.count {
        guard let lastIndex = dict[target - nums[i]] else {
            dict[nums[i]] = i
            continue
        }
        res.append(lastIndex)
        res.append(i)
        break
    }
    return res
}
let d = twoSum1(nums: arr, 10)
print(d)

/*
   Given an input string, reverse the string word by word.
 */

func reverseWords(s: String) -> String {
    var chars = [Character](s.characters)
    _reverse(chars: &chars, 0, chars.count - 1)
    var start = 0
    for i in 0 ..< chars.count {
        if i == chars.count - 1 || chars[i + 1] == " " {
            _reverse(chars: &chars, start, i)
            start = i + 2
        }
    }
    return String(chars)
}
private func _reverse( chars: inout [Character], _ start: Int, _ end: Int) {
    var start = start
    var end = end
    while start < end {
        _swap(chars: &chars, start, end)
        start += 1
        end -= 1
    }
}
private func _swap( chars:inout [Character], _ p: Int, _ q: Int) {
    let temp = chars[p]
    chars[p] = chars[q]
    chars[q] = temp
}

let c = reverseWords(s: "Hello World! Felix.")
print()
/*
   Map使用详解
 
 */
let array = [1,2,3,4,5,6]
// 最洁简的写法
let isEven = array.map { $0 % 2 == 0 }
let isEven1 = array.map { num in
    // 写上retrun在Playground中的循环次数是6次 不写是7次 Xcode版本是7.2(7C68)
    return num % 2 == 0
}
// [false, true, false, true, false, true]
print(isEven)
/*
   Map与flatMap的区别
 */

//flatMap返回后的数组中不存在nil 同时它会把Optional解包
let fruits = ["apple", "banana", "orange", ""]
let counts = fruits.flatMap { fruit -> Int? in
    let length = fruit.characters.count
    guard length > 0 else {
        return nil
    }
    return length
}
print(counts)

let counts1 = fruits.map { fruit -> Int? in
    let length = fruit.characters.count
    guard length > 0 else {
        return nil
    }
    return length
}
print(counts1)
//flatMap 还能把数组中存有数组的数组 一同打开变成一个新的数组
let array1 = [[1,2,3], [4,5,6], [7,8,9]]
let arrayMap = array.map { $0 }
print(arrayMap)
let arrayFlatMap = array.flatMap { $0 }
print(arrayFlatMap)


//filter 可以取出数组中符合条件的元素 重新组成一个新的数组
let numbers = [1,2,3,4,5,6]
let evens = numbers.filter { $0 % 2 == 0 }
print(evens)

/*map,flatMap和filter方法都是通过一个已存在的数组，生成一个新的、经过修改的数组。然而有时候我们需要把所有元素的值合并成一个新的值 那么就用到了Reduce

*/
//利用reduce计算数组总所有元素的和
let numbers1 = [1,2,3,4,5]
let sum = numbers1.reduce(0) { $0 + $1 }
let sum1 = numbers1.reduce(0) { total, num in
    return total + num
}
print(sum)

