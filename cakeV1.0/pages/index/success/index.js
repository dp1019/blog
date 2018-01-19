// pages/product/productDetailsIntroduce.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    count:"150",
    comment: "images/comment.png",
    specification: "2-4人（6寸）",
    price: "88",
    productName: "海洋海风蛋糕",
    introduce: "images/introduce.png",
    shoping: "images/shoping.png",
    /*购物车里面有几件商品*/
    shopNum: 1,
    imgUrls: [
      "images/banner2.png",
      "images/banner2.png",
      "images/banner2.png"
    ],
    cate: [
      {
        cateName: "包装好看"
      },{
        cateName: "好 吃"
      },{
        cateName: "物所超值"
      },{
        cateName: "有图评价"
      }
    ],
    data: [
      {
        photo: "images/photo.png",
        name: "张大鹏",
        update_time: "2017-10-12",
        message: "好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻",
        reply: ''
      },
      {
        photo: "images/photo.png",
        name: "张大鹏",
        update_time: "2017-10-12",
        message: "好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻",
        reply: "感谢你能喜欢"
      }
    ],
    intriduceDate: [
        {
            title: "海洋的风味~清新的浪漫回忆",
            flavor: "海洋风巧克力蓝莓加草莓味",
            sweetness: "60%~80%的糖份",
            crowd: "适合5~30岁的年轻人群",
            retainFreshness: "保鲜期限30天",
            material:"鸡蛋、面粉、巧克力、蓝莓、草莓"
        }
    ],
    circular: true,
    autoplay: true,
    indicatorDots: true,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})