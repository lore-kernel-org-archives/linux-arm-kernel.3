Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5990C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGmhqrAjYzagqI94aWqLld2LAsNs8E1/VGtS52n0S4U=; b=eqREFAae9+UdayeyAAf5UJ8Bai
	A73CZFHux/vyRLuIKo0tsQw9vG9D2fYKgFqZBpzc1vJ4joeAfnc6FaqUFqllyypSLADKzvro77A0v
	al6XutY8yc5Bfs9IrMLBpmgDHMfx8iKR4if4iX2K173IEDCaepmGOdfHeD6uWzmmxVMLBdeFFrYN1
	n3SHfgwxqd+F/FeoME7G281AWZ0QTPP1hd4YVMASt2o2Cb1NdBreRtDjgRSXgRYbUSRnOyElLqtFh
	smjCXDYZ3jxmyA+K1Lx6fLGQ2Jju1Z25hKRSPgMRYVnHhjF/UghMFrH9evZ1Iuins/qPKsOaP6xvi
	Wra9hmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tloAp-00000007yRI-31dJ;
	Sat, 22 Feb 2025 11:59:59 +0000
Received: from mail-m3292.qiye.163.com ([220.197.32.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlo8I-00000007xyw-2Lui;
	Sat, 22 Feb 2025 11:57:24 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id bdb96d2d;
	Sat, 22 Feb 2025 19:57:15 +0800 (GMT+08:00)
Message-ID: <eb46b2d8-a170-4813-963d-8509089f72fa@rock-chips.com>
Date: Sat, 22 Feb 2025 19:57:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/14] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Lucas Stach <l.stach@pengutronix.de>, heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, dmitry.baryshkov@linaro.org,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-9-damon.ding@rock-chips.com>
 <cfc5b39e21fb214c53fda3276847b8e235af818f.camel@pengutronix.de>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <cfc5b39e21fb214c53fda3276847b8e235af818f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0odQ1ZCQ09CGEhCQ0tMTklWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a952d84d7db03a3kunmbdb96d2d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Njo6HDo6IzISGR8CThJLNRoh
	GU8aCwhVSlVKTE9LSUlOT0hMSUlKVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPSk5JNwY+
DKIM-Signature: a=rsa-sha256;
	b=gTKOoqjoAKeFhXf1a8vmXg379vWYpEnKYnWD8KI0jK15KYdeKWwgwvp3kY0GK0x79LyCoTpcw+VSZq059SK53WSlCuP5TJKbYlTRYmQRY19EDQdLxuTeMVNBb+bqPTib5svQpS9eeXAMEptvdCAFFK74gn2utyUTVoD/0KO+uqw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wGmhqrAjYzagqI94aWqLld2LAsNs8E1/VGtS52n0S4U=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_035723_148700_B3CED8FC 
X-CRM114-Status: GOOD (  21.68  )
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

Hi Lucas,

On 2025/2/8 3:42, Lucas Stach wrote:
> Hi Damon,
> 
> Am Donnerstag, dem 23.01.2025 um 18:07 +0800 schrieb Damon Ding:
>> Move drm_of_find_panel_or_bridge() a little later and combine it with
>> component_add() into a new function rockchip_dp_link_panel(). The function
>> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
>> aiding to support for obtaining the eDP panel via the DP AUX bus.
>>
>> If failed to get the panel from the DP AUX bus, it will then try the other
>> way to get panel information through the platform bus.
>>
> The changes in this patch effectively revert 86caee745e45
> ("drm/rockchip: analogix_dp: allow to work without panel"). Please
> correct this in the next revision of this patchset.
> 
> Regards,
> Lucas
> 

Oh, I see. I will fix it in the next version.

>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v4:
>> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>>    component_add() when getting panel from the DP AUX bus
>>
>> Changes in v5:
>> - Use the functions exported by the Analogix side to get the pointers of
>>    struct analogix_dp_plat_data and struct drm_dp_aux.
>> - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
>>
>> Changes in v6:
>> - Keep drm_err() in rockchip_dp_poweron()
>> - Pass 'dp' in drm_...() rather than 'dp->drm_dev'
>> ---
>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 37 ++++++++++++++-----
>>   1 file changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index 13f32aeea7ca..004b1b68d1cf 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -393,11 +393,27 @@ static const struct component_ops rockchip_dp_component_ops = {
>>   	.unbind = rockchip_dp_unbind,
>>   };
>>   
>> +static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
>> +{
>> +	struct analogix_dp_plat_data *plat_data = analogix_dp_aux_to_plat_data(aux);
>> +	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
>> +	int ret;
>> +
>> +	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = component_add(dp->dev, &rockchip_dp_component_ops);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return ret;
>> +}
>> +
>>   static int rockchip_dp_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>>   	const struct rockchip_dp_chip_data *dp_data;
>> -	struct drm_panel *panel = NULL;
>>   	struct rockchip_dp_device *dp;
>>   	struct resource *res;
>>   	int i;
>> @@ -407,10 +423,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>   	if (!dp_data)
>>   		return -ENODEV;
>>   
>> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
>> -	if (ret < 0 && ret != -ENODEV)
>> -		return ret;
>> -
>>   	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>>   	if (!dp)
>>   		return -ENOMEM;
>> @@ -434,7 +446,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>   
>>   	dp->dev = dev;
>>   	dp->adp = ERR_PTR(-ENODEV);
>> -	dp->plat_data.panel = panel;
>>   	dp->plat_data.dev_type = dp->data->chip_type;
>>   	dp->plat_data.power_on = rockchip_dp_poweron;
>>   	dp->plat_data.power_off = rockchip_dp_powerdown;
>> @@ -450,9 +461,17 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>   	if (IS_ERR(dp->adp))
>>   		return PTR_ERR(dp->adp);
>>   
>> -	ret = component_add(dev, &rockchip_dp_component_ops);
>> -	if (ret)
>> -		return ret;
>> +	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
>> +	if (ret) {
>> +		if (ret != -ENODEV) {
>> +			drm_err(dp, "failed to populate aux bus : %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		ret = rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	return 0;
>>   }
> 
> 
> 

Best regards
Damon


