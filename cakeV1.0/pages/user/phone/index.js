// pages/product/index.js
const app = getApp();
Page({
  /**
   * 页面的初始数据
   */
  data: {
    code:0,
    phone:{},
    security:'',
    verifycode: '',
    userInfo: {},
    userinfos:{}
  },
  getphone:function(e){
    this.setData({
      phone:e.detail.value
    });
  },
  getcode:function(){
    var pattern = /^0?(13|14|15|18|17|)[0-9]{9}$/;
    var pho = this.data.phone;
    if(!pattern.test(pho)){ 
        wx.showModal({
          title: '提示',
          content: '手机号码有误',
          showCancel: false
        })
       return false 
    }
    var that = this;
    var codes = 61;
    var time = setInterval(function(){
      codes --;
      if(codes >= 0){
        that.setData({
          code: codes,
        })
      }
      if (codes < 0){
        wx.setStorageSync('verifycode', [])  //同步更新缓存
        clearInterval(time)
      }
    }, 1000);
    wx.request({
      url: 'http://cake.com/index/member/Verify', //接口
      header: {
        'content-type': 'application/json' // 默认值
      },
      dataType: 'json',
      method: 'POST',
      data: {
        phone: this.data.phone,
      },
      success: function (res) {
        console.log(res.data.code)
        that.setData({
          security: res.data.code
        })
        wx.setStorageSync('verifycode', res.data.code)
        console.log(wx.getStorageSync('verifycode'))
      }
    })
  },
  codesubmit:function(e){
    if (e.detail.value.security == wx.getStorageSync('verifycode') && e.detail.value.phone == this.data.phone) {
      wx.request({
        url: 'http://cake.com/index/member/save', //接口
        header: {
          'content-type': 'application/json' // 默认值
        },
        dataType: 'json',
        method: 'POST',
        data: {
          phone: this.data.phone,
          userInfo: app.globalData.userInfo
        },
        success: function (res) {
          console.log(res.data)
          if (res.data){
            wx.showToast({
              title: '绑定成功',
              icon: 'success',
              duration: 1000
            })
            wx.setStorageSync('userinfos', res.data.userinfos)
          }else{
            wx.showModal({
              title: '提示',
              content: '绑定出现错误请重试',
              showCancel: false
            })
          }
          
        }
      })
    }else{
      wx.showModal({
        title: '提示',
        content: '验证码错误或过期',
        showCancel: false
      })
    }
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
    //console.log(this.data.security)
    //console.log(this.data.cart)
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