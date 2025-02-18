Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018C7C021AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 23:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTIgIfjXftTaGPBnTVA/URR4YojqwNH/5CR347EldVE=; b=U3jtpH7wAtmFt5tV1j6BvbDgZQ
	8O4NhzKTi51czZBljUHecFtPvcHR8DF4qDtuwnjWByYTrW3ffJeQYWdO9VpmJTmwMD+a/kq13ew+2
	CdfFa0SqKwuWx6Op/vsxZpaGDDj2/+z1+iADC2pVL0UvOXeKCrMqDttV5Y+rA4moSGuPv8Vg0Y3e8
	3sImO/BpFbNSVWIP/tnbg5iazORNdjSXPPLCcrYa/XA0AwPp6gJYMWghZCWxqEzNh9YgDawUlGpXT
	SH1tWOse7qhsfZJERUz7wguLwyWbmIkyedQDh42CdVWhNgH96gQ5C2WJpnZAH0g6dyZ8RzThYigIJ
	kjPORkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkXDo-0000000AHVU-0jI8;
	Tue, 18 Feb 2025 23:41:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkXCL-0000000AHM3-0pIz;
	Tue, 18 Feb 2025 23:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739922015;
	bh=vtJYJScwIgD7t/Kjv9WAvIrpkcvjsYEil5lQtdhNnDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gtaqD/GWX2crjMIVsm9VhPgIp6ynjZ09aQZr76a03msFBEu3FN4S2lLI3hKVIXR6g
	 2LOCyx9ZvSLA2TOXcjTszgbUuSNTbm1pbAWf0hAavTRc+y2+rR8S5pcR5E2wOcF8tR
	 LRplrtXfSFculPVtvURaCiLm3OcJ5reQycDBmNKAfUAstLCB74ZnIj1JtUDQNODQ4a
	 PsSfM1eMYJZBW7KBtqIiKNy3XmfNDycBWITJZVKFPkmnkjVddJqR+8RPSF3Sjl54be
	 1+K0vAO/qvlBsPPMzC1rIMLXxt4k7mfTjUcjcl7YqwJxTtAnEeoQmXZqMMltmntcOq
	 eKv7Rd4oXgWSg==
Received: from [192.168.1.143] (144.232.221.87.dynamic.jazztel.es [87.221.232.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 881CB17E1411;
	Wed, 19 Feb 2025 00:40:13 +0100 (CET)
Message-ID: <0dd48599-448f-4472-9a8a-54b7f0379c13@collabora.com>
Date: Wed, 19 Feb 2025 01:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, airlied@gmail.com,
 andy.yan@rock-chips.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, kernel@collabora.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
References: <1919367.CQOukoFCf9@diego>
 <20250218121749.1382322-1-liujianfeng1994@gmail.com>
 <lnuceofdwm6lgibworaghcujp6rrncvn4e2xc2vzltimjw3rqu@jur7x5cxt5ue>
 <2425191.NG923GbCHz@diego>
 <ldgdrytto5y2xf3ois23j4ymtajtwmqlxjr2zyqhwbbxcx6f6y@gzb37fntx2x6>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <ldgdrytto5y2xf3ois23j4ymtajtwmqlxjr2zyqhwbbxcx6f6y@gzb37fntx2x6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_154017_390190_2C6C6B2E 
X-CRM114-Status: GOOD (  27.28  )
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

Hi,

On 2/18/25 6:05 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Feb 18, 2025 at 03:53:06PM +0100, Heiko Stübner wrote:
>> Am Dienstag, 18. Februar 2025, 15:13:07 MEZ schrieb Sebastian Reichel:
>>> On Tue, Feb 18, 2025 at 08:17:46PM +0800, Jianfeng Liu wrote:
>>>> On Tue, 18 Feb 2025 11:00:57 +0100, Heiko Stübnerwrote:
>>>>> So I guess step1, check what error is actually returned.
>>>>
>>>> I have checked that the return value is -517:
>>>>
>>>> rockchip-drm display-subsystem: [drm] *ERROR* failed to get pll_hdmiphy1 with -517
>>>>
>>>>> Step2 check if clk_get_optional need to be adapted or alternatively
>>>>> catch the error in the vop2 and set the clock to NULL ourself in that case.
>>>>
>>>> I tried the following patch to set the clock to NULL when clk_get_optional
>>>> failed with value -517, and hdmi0 is working now. There are also some
>>>> boards like rock 5 itx which only use hdmi1, I think we should also add
>>>> this logic to vop2->pll_hdmiphy0.
>>>>
>>>> @@ -3733,6 +3751,15 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
>>>>  		return PTR_ERR(vop2->pll_hdmiphy0);
>>>>  	}
>>>>  
>>>> +	vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
>>>> +	if (IS_ERR(vop2->pll_hdmiphy1)) {
>>>> +		drm_err(vop2->drm, "failed to get pll_hdmiphy1 with %d\n", vop2->pll_hdmiphy1);
>>>> +		if (vop2->pll_hdmiphy1 == -EPROBE_DEFER)
>>>> +			vop2->pll_hdmiphy1 = NULL;
>>>> +		else
>>>> +			return PTR_ERR(vop2->pll_hdmiphy1);
>>>> +	}
>>>> +
>>>
>>> This first of all shows, that we should replace drm_err in this
>>> place with dev_err_probe(), which hides -EPROBE_DEFER errors by
>>> default and instead captures the reason for /sys/kernel/debug/devices_deferred.
>>>
>>> Second what you are doing in the above suggestion will break kernel
>>> configurations where VOP is built-in and the HDMI PHY is build as a
>>> module.
>>>
>>> But I also think it would be better to have the clocks defined in the
>>> SoC level DT. I suppose that means vop2_bind would have to check if
>>> the HDMI controller <ID> is enabled and only requests pll_hdmiphy<ID>
>>> based on that. Considering there is the OF graph pointing from VOP
>>> to the enabled HDMI controllers, it should be able to do that.
>>
>>
>> I was more thinking about fixing the correct thing, with something like:
>>
>> ----------- 8< ----------
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index cf7720b9172f..50faafbf5dda 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -5258,6 +5258,10 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
>>         if (!clkspec)
>>                 return ERR_PTR(-EINVAL);
>>
>> +       /* Check if node in clkspec is in disabled/fail state */
>> +       if (!of_device_is_available(clkspec->np))
>> +               return ERR_PTR(-ENOENT);
>> +
>>         mutex_lock(&of_clk_mutex);
>>         list_for_each_entry(provider, &of_clk_providers, link) {
>>                 if (provider->node == clkspec->np) {
>> ----------- 8< ----------
>>
>> Because right now the clk framework does not handle nodes in
>> failed/disabled state and would defer indefinitly.
> 
> Also LGTM.

Thank you all for the feedback and proposed solutions!

I'm currently on leave and without access to any testing hw, but I'll be
back in a couple of days.

Regards,
Cristian

