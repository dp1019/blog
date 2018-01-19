// pages/product/product.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    
    cakeDetails: [],  //当前产品
    nowPrice: 0,    // 当前价格
    num: 1,         // 产品购买数量
    standard_id: 0, // 当前产品规格
    active_number: 0,
    standard_name:'',
    img:'',
    indicatorDots: false,
    circular: false
  },
  // normalPickerBindchange: function (e) {
  //   this.setData({
  //     picker1Value: e.detail.value
  //   })
  // },
  // normalPickerBindchange2: function (e) {
  //   this.setData({
  //     picker2Value: e.detail.value
  //   })
  // },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      cakeDetails: app.globalData.cakes[options.index],
      nowPrice: app.globalData.cakes[options.index].standards[0].member_price,
      standard_id: app.globalData.cakes[options.index].standards[0].id,
      standard_name: app.globalData.cakes[options.index].standards[0].name,
      img : app.globalData.cakes[options.index].imgs[0]
    })
  },
  change: function (e) {
    //console.log(e)
    var index = e.target.dataset.index
    this.setData({
      nowPrice: this.data.cakeDetails.standards[index].member_price,
      standard_id: this.data.cakeDetails.standards[index].id,
      standard_name : this.data.cakeDetails.standards[index].name,
      active_number: index
    })
  },
  add: function (e) {
    //console.log(this.data.cakeDetails)
    this.setData({
      num: this.data.num + 1
    });
  },
  reduce: function (e) {
    if (this.data.num == 1) {
      return false;
    }
    this.setData({
      num: this.data.num - 1
    });
  },
  readyToOrder:function(){
    var readyToOrder = []   // 生成预备订单数据
    readyToOrder.push({
      'standard_name': this.data.standard_name,//规格名称
      'nowPrice': this.data.nowPrice,//当前产品价格
      'cake': this.data.cakeDetails, //当前产品
      'cake_id': this.data.cakeDetails.id,//当前产品id
      'num': this.data.num,  //购买的数量
      'standard': this.data.standard_id, //规格的id
      'img': this.data.img //产品图片
    })
    wx.setStorageSync('readyToOrder', readyToOrder)  //设置预备订单数据
    wx.setStorageSync('is_cart',false)  // 从立即购买到预备订单的数据
    // 跳转
    wx.navigateTo({
      url: '/pages/order/ordersub/index'
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

  }
})