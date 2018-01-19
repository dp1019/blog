// pages/product/product.js
Page({
    data: {
        cryIcon: "images/cryIcon.png",
        count: "150",
        shoping: "images/shoping.png",
        shopNum: 1,
        cate: [
            {
                cateName: "包装好看"
            }, {
                cateName: "好 吃"
            }, {
                cateName: "物所超值"
            }, {
                cateName: "有图评价"
            }
        ],
        data: [
            {
                photo: "images/photo.png",
                name: "张大鹏",
                update_time: "2017-10-12",
                message: "好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻",
                reply: '',
                img: [
                    {imgUrl:"images/photo.png"},
                    {imgUrl: "images/photo.png"},
                    {imgUrl: "images/photo.png"}  
                ]
            },
            {
                photo: "images/photo.png",
                name: "张大鹏",
                update_time: "2017-10-12",
                message: "好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻",
                reply: "感谢你能喜欢fgnfgngfnhgf",
                img:[]
            },
            {
                photo: "images/photo.png",
                name: "张大鹏",
                update_time: "2017-10-12",
                message: "好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻好吃不油腻",
                reply: '',
                img: [
                    {
                        imgUrl: "images/photo.png",
                        imgUrl: "images/photo.png"
                    }
                ]
            }
        ]
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