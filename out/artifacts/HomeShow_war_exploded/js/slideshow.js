/**
 * 轮播图js
 * @type {Element}
 */
// 获取轮播图的组件
var box = document.getElementsByClassName("box")[0];
// 获取所有的图片li（图片的容器）
var li_list = document.querySelectorAll("#imgul li"); //获取图片的li
// // 获取12345，数字
// var ol_list = document.querySelectorAll("ol li");
var timer = null; //声明定时器
var count = 0;
// 下一张
function auto() {
  //执行自动轮播
  count++;
  if (count > li_list.length - 1) {
    count = 0;
  }
  for (var i = 0; i < li_list.length; i++) {
    li_list[i].style = "display:none;";
    // ol_list[i].className = "";
  }
  li_list[count].style = "display:block;";
  // ol_list[count].className = "active";
}
timer = setInterval(auto, 1500); //调用定时器

box.onmouseover = function() {
  //鼠标划上去，停止轮播
  clearInterval(timer);
};
box.onmouseout = function() {
  //鼠标划出，继续轮播
  timer = setInterval(auto, 1500); //调用定时器
};

// //点击小按钮，切换图片
// for (var j = 0; j < ol_list.length; j++) {
//   ol_list[j].ind = j; //为每个小按钮添加下标
//   ol_list[j].onclick = function() {
//     //进入点击事件
//     for (var i = 0; i < li_list.length; i++) {
//       // 干掉所有其他不是点击下标的图片
//       li_list[i].style = "display:none;";
//       ol_list[i].className = "";
//     }
//     li_list[this.ind].style = "display:block;"; //留下点击的图片
//     ol_list[this.ind].className = "active"; // 留下点击的图片
//     count = this.ind; // 把当前的角标值赋值给count 希望他从当前再开始
//   };
// }
