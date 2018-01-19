// pages/product/product.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    coupon:[

        {   couponImg: "images/couponImg.png",
            coupon_discount: 5 ,
            coupon_enough: 50 ,
            coupon_minus: 5 ,
            overdueDate: "2017.11.01-12.1"},
        {
            couponImg: "images/couponImg.png",
            coupon_discount: 10,
            coupon_enough: 100,
            coupon_minus: 10,
            overdueDate: "2017.11.01-12.1"}
      ],
      couponOverdue: [

          {
            couponOverdueImg: "images/coupon_overdueImg.png",
            overdueImg:"images/overdue.png",               
            couponOverdue_discount: 5,
            couponOverdue_enough: 50,
            couponOverdue_minus: 5,
            overdueDate: "2017.11.01-12.1"},
          {
            couponOverdueImg: "images/coupon_overdueImg.png",
            overdueImg: "images/overdue.png" ,
            couponOverdue_discount: 10,
            couponOverdue_enough: 100,
            couponOverdue_minus: 10,
            overdueDate: "2017.11.01-12.1"
          }
      ],
      num:1,
      condition:true,
      currentTab: 0
   

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
  },
  changeCoupon:function(e){
      console.log(e)
      this.setData({
          num:e.target.dataset.num,
        //   condition:!e.target.dataset.condition
      })
      
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
  
  },
  //滑动切换
  swiperTab: function (e) {
      var that = this;
      that.setData({
          currentTba: e.detail.current
      });
  },
  //点击切换
  clickTab: function (e) {

      var that = this;

      if (this.data.currentTab === e.target.dataset.current) {
          return false;
      } else {
          that.setData({
              currentTab: e.target.dataset.current
          })
      }
  }  
})