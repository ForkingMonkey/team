//
//  DWCashGuidu.h
//  team
//
//  Created by wangqiqi on 2017/8/22.
//  Copyright © 2017年 duxing. All rights reserved.
//

/****************************
 #warning set four macro define
 if you want go to set >>>>>>>>
 TARGETS -> Build Settings -> <search 便捷操作> —>Preprocessor Macros
 
 DWCrashSafeClose <如果定义那么将不执行方法>
 
 DWCrashSubarrayReturnNil <subarrayWithRange: 如果range.location 没有越界，可是range.length越界了，那么默认会截取range.location rang.length = self.count - rang.length 的一个子数组，当然如果你不想有这个操作的话，那么 go to define this macro>
 
 DWCrashInsertBeyondBoundsLastValue <insertObject:atIndex: 如果index 越界默认的操作是直接返回当前方法，如果你想当这个值添加到最后一个，那么 go to define this macro>
 
 DWCrashRemoveBeyondBoundsReturn <removeObjectsInRange: 如果range.location 没有越界，可是range.length越界了，那么默认会移除range.location rang.length = self.count - rang.length 的一个子数组，当然如果你不想有这个操作的话，那么 go to define this macro>
 
 ****************************/


