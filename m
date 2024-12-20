Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C92E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GihI+WisojgBHpW5R0ME2hXDuA+DiNX0v2ROBByVWgY=; b=ZVb6DbbJVV6k9rUnbYgD4nc+QN
	FJXPuGFgzA7tZeF4fFa0W25SxzxUeS20flaUR7ikx1Ws5Nvk44MpO6Tl8/GcesiHRn4YP34NSnDFK
	yWH+zhzSxskEHPidkI5rLVzt7BuacLWCaqmz0jeamtX6VqRimqaJZ7h+SkQF5TV8tXQhhN8U2sr4m
	fxTQft9s64QfRcmIlmBTjhfCl7vNJ/YWYsbIDnuKJVPP5xsAKytXtkG9d5lFdm041e2mbQZlCdf9q
	kMCFD3XxfpYeAcH9y3EJmhz2PZYnkEawambza8OUfT4+lPfwdAdAEgs1egDClvH4vxPqpnQGoKsTJ
	NHQQeeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYPI-00000004HXR-0tqa;
	Fri, 20 Dec 2024 08:30:48 +0000
Received: from mail-m127208.xmail.ntesmail.com ([115.236.127.208])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYO7-00000004HN5-2ZVn;
	Fri, 20 Dec 2024 08:29:37 +0000
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6524bd1b;
	Fri, 20 Dec 2024 16:29:28 +0800 (GMT+08:00)
Message-ID: <3663bbec-fcb2-4f93-aae6-3c2082491069@rock-chips.com>
Date: Fri, 20 Dec 2024 16:29:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/15] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-9-damon.ding@rock-chips.com>
 <aiggslcdbdmnc2amlvmzycyxmu3f5zp6kt4ifgzq5gkuugmnem@oqnwf4o7hbss>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <aiggslcdbdmnc2amlvmzycyxmu3f5zp6kt4ifgzq5gkuugmnem@oqnwf4o7hbss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkkfSFZMQ0hDHUMeTkMYGEJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e32f9ba603a3kunm6524bd1b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRA6Lgw6ETIUTQg#DBcePSI8
	AiwKCRBVSlVKTEhPTUNISExLSkJLVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ0pDNwY+
DKIM-Signature: a=rsa-sha256;
	b=iEi6g1WMQQreiv/+FEJCxMCUiHjf/pV7eXzPhn/R84mzSsPiUpa3E0pgNA78zs+aUH82NbkYE5nvx0SD3EXcLWntxzRLBLx5uPo67d6NN2FC4uiXzp/o+RB9hp572xA8aE1pa2rgbtS2afjv1ldkQhc3tnc4vYHr8cUpRnoDCyg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=GihI+WisojgBHpW5R0ME2hXDuA+DiNX0v2ROBByVWgY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_002936_183035_67EF117E 
X-CRM114-Status: GOOD (  22.87  )
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

On 2024/12/20 8:16, Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 04:05:57PM +0800, Damon Ding wrote:
>> The rockchip_dp_of_panel_on_aux_bus() helps to check whether the DT
>> configurations related to the DP AUX bus are correct or not.
>>
>> If failed to get the panel from the platform bus, it is good to try
>> the DP AUX bus. Then, the probing process will continue until it enters
>> the analogix_dp_bind(), where devm_of_dp_aux_populate_bus() is called
>> after &analogix_dp_device.aux has been initialized.
> 
> No. devm_of_dp_aux_populate_bus() should be called before bind(). And
> bind should only be called from the done_probing() callback. The reason
> is very simple: the panel driver might be built as a module and might be
> not available when the analogix driver is being probed.
> 
> Also, please invert the logic of the commit message (and the driver).
> The platform bus should be a fallback if there is no AUX bus panel, not
> other way around.
> 

I have tried the logic as you recommanded, and it is really a good way. 
I will fix this in the next version.

>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 24 +++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index ba5263f85ee2..60c902abf40b 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -317,6 +317,24 @@ static const struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs =
>>   	.atomic_check = rockchip_dp_drm_encoder_atomic_check,
>>   };
>>   
>> +static bool rockchip_dp_of_panel_on_aux_bus(const struct device_node *np)
>> +{
>> +	struct device_node *bus_node, *panel_node;
>> +
>> +	bus_node = of_get_child_by_name(np, "aux-bus");
>> +	if (!bus_node)
>> +		return false;
>> +
>> +	panel_node = of_get_child_by_name(bus_node, "panel");
>> +	of_node_put(bus_node);
>> +	if (!panel_node)
>> +		return false;
>> +
>> +	of_node_put(panel_node);
>> +
>> +	return true;
>> +}
>> +
>>   static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>>   {
>>   	struct device *dev = dp->dev;
>> @@ -435,8 +453,10 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>   		return -ENODEV;
>>   
>>   	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (ret < 0) {
>> +		if (!rockchip_dp_of_panel_on_aux_bus(dev->of_node))
>> +			return ret;
>> +	}
>>   
>>   	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>>   	if (!dp)
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon


