Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB129C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGeWmn+7dN7qVlWb70UZTMoFGv6yi5gXMUKkERJ9lEc=; b=C4a+k6K2n7gdHNOTpwF21jNrKu
	Fz1vuV02jW2jL4n6rLX6AedGD3gO2jNiuezBOTbC/zU3xHfwyriPXgmU3EQKcZ8lrDn7Hb1rXKgd+
	jkOHiml4+seIgvvf6joyD6aI/T4puubyP7CEodFfcFNPeGEYcfSCFZBB5vwIueDJeyJLYaOSGSuES
	kOljl8xqdsbBJCQyBMCExVMmB6H0Nr+g3ab80Dq1/lI00LYuHlfsMouRW/wXi/j0PeKIUPTJKM5e8
	8XpoAirQEqS7TEFqMBsiv+qoT99RZpC4jTUKV99YS0CjHzCnRAxut7KwwK+EWE+tFtQxcSdwOJWlh
	rgR42BGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taWOk-00000009jOa-3Icc;
	Wed, 22 Jan 2025 08:47:42 +0000
Received: from mail-m1973183.qiye.163.com ([220.197.31.83])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taWNR-00000009jBP-0BP6;
	Wed, 22 Jan 2025 08:46:22 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 965a3ba9;
	Wed, 22 Jan 2025 16:46:13 +0800 (GMT+08:00)
Message-ID: <a8bee693-cbde-469d-abcf-363311cfd904@rock-chips.com>
Date: Wed, 22 Jan 2025 16:46:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/20] drm/rockchip: analogix_dp: Replace DRM_...()
 functions with drm_...() or dev_...()
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, dmitry.baryshkov@linaro.org,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-6-damon.ding@rock-chips.com>
 <40b09942.533e.19449c023a1.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <40b09942.533e.19449c023a1.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxlKTFYfSElJQh9CTU4eQ01WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a948d30cfa903a3kunm965a3ba9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K006Lhw6SjIVEi8SKE4XShUf
	HEMaFBJVSlVKTEhMTkhOTkxOTEhIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOQkpPNwY+
DKIM-Signature: a=rsa-sha256;
	b=CdOlo6lmDRB4B2FOT82IxbLbIyXMAxBKKopGXCJ2EzehgX1Cl05tmxy0Ma0cDy0A9sn1y4xgW1WMUgIw1T8zrJovXdz668XXGBCK9+ee9XMAsGo5n2i2fN+zmnJs4sLvXMi528J8v5akDjJ8Ho8EjAVfK7sqEdneI6gW6SYe7/Q=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=SGeWmn+7dN7qVlWb70UZTMoFGv6yi5gXMUKkERJ9lEc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_004621_583301_C2571E66 
X-CRM114-Status: GOOD (  14.75  )
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

Hi Andy,

On 2025/1/9 14:28, Andy Yan wrote:
> 
> Hi Damon,
> 
> At 2025-01-09 11:27:10, "Damon Ding" <damon.ding@rock-chips.com> wrote:
>> According to the comments in include/drm/drm_print.h, the DRM_...()
>> functions are deprecated in favor of drm_...() or dev_...() functions.
>>
>> Use drm_err()/drm_dbg_core()/drm_dbg_kms() instead of
>> DRM_DEV_ERROR()/DRM_ERROR()/DRM_DEV_DEBUG()/DRM_DEBUG_KMS() after
>> rockchip_dp_bind() is called, and replace DRM_DEV_ERROR() with dev_err()
>> before calling it.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>> .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 29 ++++++++++---------
>> 1 file changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index 546d13f19f9b..8114c3238609 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -100,13 +100,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
>>
>> 	ret = clk_prepare_enable(dp->pclk);
>> 	if (ret < 0) {
>> -		DRM_DEV_ERROR(dp->dev, "failed to enable pclk %d\n", ret);
>> +		drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
> 
>                 You just need to pass dp here:
>                  drm_err(dp, "failed to enable pclk %d\n", ret);
> 

I see. It is really better to pass dp instead of dp->drm_dev. I will 
update all relevant logs in the next version.

>> 		return ret;
>> 	}
>>
>> 	ret = rockchip_dp_pre_init(dp);
>> 	if (ret < 0) {
>> -		DRM_DEV_ERROR(dp->dev, "failed to dp pre init %d\n", ret);
>> +		drm_err(dp->drm_dev, "failed to dp pre init %d\n", ret);
>> 		clk_disable_unprepare(dp->pclk);
>> 		return ret;
>> 	}
>> @@ -126,12 +126,13 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>> static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
>> 				 struct drm_connector *connector)
>> {
>> +	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
>> 	struct drm_display_info *di = &connector->display_info;
>> 	/* VOP couldn't output YUV video format for eDP rightly */
>> 	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
>>
>> 	if ((di->color_formats & mask)) {
>> -		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
>> +		drm_dbg_kms(dp->drm_dev, "Swapping display color format from YUV to RGB\n");
>> 		di->color_formats &= ~mask;
>> 		di->color_formats |= DRM_COLOR_FORMAT_RGB444;
>> 		di->bpc = 8;
>> @@ -201,17 +202,17 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
>> 	else
>> 		val = dp->data->lcdsel_big;
>>
>> -	DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
>> +	drm_dbg_core(dp->drm_dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
>>
>> 	ret = clk_prepare_enable(dp->grfclk);
>> 	if (ret < 0) {
>> -		DRM_DEV_ERROR(dp->dev, "failed to enable grfclk %d\n", ret);
>> +		drm_err(dp->drm_dev, "failed to enable grfclk %d\n", ret);
>> 		return;
>> 	}
>>
>> 	ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
>> 	if (ret != 0)
>> -		DRM_DEV_ERROR(dp->dev, "Could not write to GRF: %d\n", ret);
>> +		drm_err(dp->drm_dev, "Could not write to GRF: %d\n", ret);
>>
>> 	clk_disable_unprepare(dp->grfclk);
>> }
>> @@ -236,7 +237,7 @@ static void rockchip_dp_drm_encoder_disable(struct drm_encoder *encoder,
>>
>> 	ret = rockchip_drm_wait_vact_end(crtc, PSR_WAIT_LINE_FLAG_TIMEOUT_MS);
>> 	if (ret)
>> -		DRM_DEV_ERROR(dp->dev, "line flag irq timed out\n");
>> +		drm_err(dp->drm_dev, "line flag irq timed out\n");
>> }
>>
>> static int
>> @@ -277,7 +278,7 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>>
>> 	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>> 	if (IS_ERR(dp->grf)) {
>> -		DRM_DEV_ERROR(dev, "failed to get rockchip,grf property\n");
>> +		dev_err(dev, "failed to get rockchip,grf property\n");
>> 		return PTR_ERR(dp->grf);
>> 	}
>>
>> @@ -287,19 +288,19 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>> 	} else if (PTR_ERR(dp->grfclk) == -EPROBE_DEFER) {
>> 		return -EPROBE_DEFER;
>> 	} else if (IS_ERR(dp->grfclk)) {
>> -		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
>> +		dev_err(dev, "failed to get grf clock\n");
>> 		return PTR_ERR(dp->grfclk);
>> 	}
>>
>> 	dp->pclk = devm_clk_get(dev, "pclk");
>> 	if (IS_ERR(dp->pclk)) {
>> -		DRM_DEV_ERROR(dev, "failed to get pclk property\n");
>> +		dev_err(dev, "failed to get pclk property\n");
>> 		return PTR_ERR(dp->pclk);
>> 	}
>>
>> 	dp->rst = devm_reset_control_get(dev, "dp");
>> 	if (IS_ERR(dp->rst)) {
>> -		DRM_DEV_ERROR(dev, "failed to get dp reset control\n");
>> +		dev_err(dev, "failed to get dp reset control\n");
>> 		return PTR_ERR(dp->rst);
>> 	}
>>
>> @@ -315,12 +316,12 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
>>
>> 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
>> 							     dev->of_node);
>> -	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>> +	drm_dbg_kms(drm_dev, "possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>>
>> 	ret = drm_simple_encoder_init(drm_dev, encoder,
>> 				      DRM_MODE_ENCODER_TMDS);
>> 	if (ret) {
>> -		DRM_ERROR("failed to initialize encoder with drm\n");
>> +		drm_err(drm_dev, "failed to initialize encoder with drm\n");
>> 		return ret;
>> 	}
>>
>> @@ -340,7 +341,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>>
>> 	ret = rockchip_dp_drm_create_encoder(dp);
>> 	if (ret) {
>> -		DRM_ERROR("failed to create drm encoder\n");
>> +		drm_err(drm_dev, "failed to create drm encoder\n");
>> 		return ret;
>> 	}
>>
>> -- 
>> 2.34.1
>>

Best regards,
Damon

