Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51B0CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 02:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ljhn8bif18aFps1rRdBClCGFFynJpfAeepmIW2TXY3A=; b=Z+n21JGykLa/mmYHQClbtRRlu3
	NtdrT2CmLGpxIpq/iwd65iq8dcshiUCDceB2fRb6EoLQT+Ycq3n5fNSaQBk1RoYPYNLGulC4bO0in
	DZ1wdFxu/BdiLQfybU8cJO1hLVaWb7EbagSmts8JwoyLniRTsjiO7vdkK8AUxubcv/+YPYkuOwY3p
	wUWvbhRTx7FfrqQgvO4T7Sizlo2kfJnNAXXhPlC814oXzQQx7E98JzBnx0SlGMHMt58QGnIapMIGj
	ErZEHdBTHRsWLks/tnJxNIXS+VRjpZ+QXPBLqmMxSj/KSWDyTUBvuO2/2ouEB4k5HmhXxbw5xyBe4
	RHCooz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bSl-00000005GeD-0KsN;
	Thu, 25 Sep 2025 02:12:03 +0000
Received: from mail-m49220.qiye.163.com ([45.254.49.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bSh-00000005Gc1-1DUZ;
	Thu, 25 Sep 2025 02:12:01 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23f942a34;
	Thu, 25 Sep 2025 10:11:53 +0800 (GMT+08:00)
Message-ID: <7cf14078-5d4f-4ced-bdcf-182371d0fd35@rock-chips.com>
Date: Thu, 25 Sep 2025 10:11:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] drm/rockchip: analogix_dp: Apply
 &analogix_dp_plat_data.attach() to attach next bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-14-damon.ding@rock-chips.com>
 <2cu3ge6kjeibfznvt6c52xn2rp5zb3wk3pkb7gly34qrjlueem@7wqyowascpn5>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <2cu3ge6kjeibfznvt6c52xn2rp5zb3wk3pkb7gly34qrjlueem@7wqyowascpn5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a997ea4309303a3kunm542c945b85b02
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5LT1ZIGh1PTEMdGUpDSx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=iVKD7f62uqeDZeWknCM50t4q+F59fTE4NNT58Y0093B07tMOfWOMy8AZVe6YOCr802f8Pf+EvfpvFbJEg2wVUjJcIBAH3suMh+XfmN4d3KXJXFGIQ0VcjzG3rZuDDk/5Md8wIwVl5DruEmeVZoWpbNKEhRNxy82ULkMok5Cfsmg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Ljhn8bif18aFps1rRdBClCGFFynJpfAeepmIW2TXY3A=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_191159_856347_B1D634E0 
X-CRM114-Status: GOOD (  16.36  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

On 9/12/2025 7:05 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 04:58:42PM +0800, Damon Ding wrote:
>> There may be the panel or bridge after &analogix_dp_device.bridge.
>> Add rockchip_dp_attach() to support the next bridge attachment for
>> the Rockchip side.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index 0784f19a2ed9..39f1ed293c75 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -164,6 +164,24 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>>   	return 0;
>>   }
>>   
>> +static int rockchip_dp_attach(struct analogix_dp_plat_data *plat_data,
>> +				     struct drm_bridge *bridge)
>> +{
>> +	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
>> +	int ret;
>> +
>> +	if (plat_data->next_bridge) {
>> +		ret = drm_bridge_attach(&dp->encoder.encoder, plat_data->next_bridge, bridge,
>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> 
> Can this be handled inside analogix_dp_bridge's attach callback?

I found that the &analogix_dp_plat_data.attach() callbacks of Rockchip 
and Exynos sides are the same. It should be nice to handle the next 
bridge attachment in analogix_dp_bridge_attach(), which would allow us 
to remove the &analogix_dp_bridge_attach().

> 
>> +		if (ret) {
>> +			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static bool
>>   rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>>   				   const struct drm_display_mode *mode,
>> @@ -452,6 +470,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>   	dp->plat_data.dev_type = dp->data->chip_type;
>>   	dp->plat_data.power_on = rockchip_dp_poweron;
>>   	dp->plat_data.power_off = rockchip_dp_powerdown;
>> +	dp->plat_data.attach = rockchip_dp_attach;
>>   	dp->plat_data.ops = &rockchip_dp_component_ops;
>>   
>>   	ret = rockchip_dp_of_probe(dp);
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon


