// pages/address/addressChoice.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    array:[
      {
        img:'../images/address.png',
        username:'陈小姐',
        phone:'1366669999',
        address:'广东省广州市海珠区新港东路',
        editImg:'../images/edit.png',
        deleteImg:'../images/delete.png'
      },
      {
        img: '../images/address.png',
        username: '陈小姐',
        phone: '1366669999',
        address: '广东省广州市海珠区新港东路',
        editImg: '../images/edit.png',
        deleteImg: '../images/delete.png'
      },
      {
        img: '../images/address.png',
        username: '陈小姐',
        phone: '1366669999',
        address: '广东省广州市海珠区新港东路',
        editImg: '../images/edit.png',
        deleteImg: '../images/delete.png'
      }
      ,
      {
        img: '../images/address.png',
        username: '陈小姐',
        phone: '1366669999',
        address: '广东省广州市海珠区新港东路',
        editImg: '../images/edit.png',
        deleteImg: '../images/delete.png'
      }
      ,
      {
        img: '../images/address.png',
        username: '陈小姐',
        phone: '1366669999',
        address: '广东省广州市海珠区新港东路',
        editImg: '../images/edit.png',
        deleteImg: '../images/delete.png'
      }
    ]
  },

  addAddress :function(){
    wx.navigateTo({
      url: '../add/addressAdd',
    })
  },
  bindViewTap1:function(){
    wx.navigateTo({
      url: '../edit/addressEdit',
    })
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