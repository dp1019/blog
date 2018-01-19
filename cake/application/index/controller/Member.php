<?php

namespace app\index\controller;

use think\Controller;
use think\Request;
use app\admin\model\VipModel;
use GuzzleHttp\Client;
class Member extends Controller
{
    public function login(Request $request)
    {
        $code = $request->get('code');
        $client = new Client();
        $url = "https://api.weixin.qq.com/sns/jscode2session?appid=wx2e4365b7f0e09e8f&secret=c60f6b800399f031776da0a4c5993284&js_code=$code&grant_type=authorization_code";
        $response = $client->request('GET', $url);
        return $response->getBody();
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index(Request $request)
    {
        if ($request) {
            $phone = $request->post();
            $data = $phone['userInfo'];
            $data['nickname'] = $data['nickName'];
            $vip = new VipModel();
            if(!$vip->where(['nickname' => $data['nickName']])->find()){
                $rs = $vip->allowField(true)->save();
                $vipuser = $vip->with(['order','point','address'])->where(['nickname' => $data['nickName']])->find();
                return json([
                    'userinfos' => $vipuser
                ]);
            }
            $vipuser = $vip->with(['order','point','address'])->where(['nickname' => $data['nickName']])->find();
                return json([
                    'userinfos' => $vipuser
                ]);
        }
    }

    public function Verify(Request $request)
    {
        //$phone = $request->post('phone');
        //$sms = new Smssend();
        $code = str_pad(mt_rand(0, 999999), 6, "0", STR_PAD_BOTH);
        //$date = $sms->sendSms($phone,$code);
        //dump($date->Message == 'OK');die;
        //if ($date->Message == 'OK') {
            return json([
                'code' => $code
            ]);
        //}
    }

    public function save(Request $request)
    {
        $phone = $request->post();
        $data = $phone['userInfo'];
        $data['nickname'] = $data['nickName'];
        $data['phone'] = $phone['phone'];
        $vip = new VipModel();
        if (!$vip->where(['phone' => $phone['phone']])->find()){
            if ($vip->where(['nickname' => $data['nickName']])->update(['phone' => $phone['phone']])){
                $vipuser = $vip->with(['order','point','address'])->where(['nickname' => $data['nickName']])->find();
                return json([
                    'userinfos' => $vipuser
                ]);
            }
        }      
    }

}
