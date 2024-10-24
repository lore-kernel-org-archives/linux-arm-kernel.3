Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521D0CE8E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXZ6TXYybMPH59ATV+51FjnRZuotyBc+NLrjbqpIbBc=; b=TIGQ+xR0vHLLC7Fw3cTMRkk3Bl
	PPSkzzb7uYEUMm0tldbHZyR4mDG3Pb9/h/m66LRf+J7M44m47he2/zKlhQrF3HUD1WFGSaXxfdz58
	2lL2aBVK4ntFreHnVeoj+gP1Wijv/6WQ6pBWtB3822WPO4uBzlZIW7iPVEw1HUBsgBW0MnAKKVUj2
	WoDYGs7DA69rz7sDq8KeAyiyX5CtGefvjhu7mrR2j+2+nXuOCAF0wZjo5GqYDG3HAiIA4ik/2jakA
	c+qr8+4qyzIMK3+sW+m7EqVJoUW2v/S+h5BOv/RpvxDzxhDg3jTKiNNkPLLB1BKjY+XKAL/3OLFMM
	wS+A5v6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wTE-00000000GuB-07Nd;
	Thu, 24 Oct 2024 11:57:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wRf-00000000GmR-2ToM;
	Thu, 24 Oct 2024 11:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729770961;
	bh=UTOsiYOsEFpIkcBWAg2RFk3EFbVEjNespoY0SWiII5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T0o6FWSDRctpxeOSnO61m027Xay7aeUjYT4UlaTdZzw5J6fuf7g0u8rbyYieFWn2h
	 4eEGivcWpMAtcdBMB09BOwXnIqawHFZ5qGKT1oECDFmsXAAEfJtN9wx5u3e/HG1V9p
	 9ynl9YxM8ZLWIHY27sgTUWjylFDieaIaqXekh0Kfyww4PzRCoRCoYDCyGX6ovP2cXR
	 GclklolAQRujPbYRQ7I0uMN51Z6+6mtW66dlQB4kIAJS+JMALmtQh6hnmuMUVw6/8A
	 uOTMbG48FXheVmYpz9bHzHar+EHC4wO7XDNGcyTa3WRVjMkWqEDmn21DPBaGq9/9F3
	 a2FUNHcigaaCw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B5F717E35DC;
	Thu, 24 Oct 2024 13:56:01 +0200 (CEST)
Message-ID: <566e4de8-b8bb-466c-83c4-217dad8ace63@collabora.com>
Date: Thu, 24 Oct 2024 13:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] memory: mtk-smi: mt8188: Add SMI clamp function
To: =?UTF-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzk@kernel.org" <krzk@kernel.org>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240821082845.11792-1-friday.yang@mediatek.com>
 <20240821082845.11792-4-friday.yang@mediatek.com>
 <25b487b7-63e0-402d-a0a2-ed9d03e82630@kernel.org>
 <cdbac20d7a49ff2fbd3e6d4f24ae441ffbe87f05.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cdbac20d7a49ff2fbd3e6d4f24ae441ffbe87f05.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_045603_836984_157AA855 
X-CRM114-Status: GOOD (  24.32  )
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

Il 24/10/24 03:29, Friday Yang (杨阳) ha scritto:
> On Wed, 2024-08-21 at 11:00 +0200, Krzysztof Kozlowski wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   On 21/08/2024 10:26, friday.yang wrote:
>>> In order to avoid handling glitch signal when MTCMOS on/off, SMI
>> need
>>> clamp and reset operation. Parse power reset settings for LARBs
>> which
>>> need to reset. Register genpd callback for SMI LARBs and apply
>> reset
>>> operations in the callback.
>>>
>>> Signed-off-by: friday.yang <friday.yang@mediatek.com>
>>> ---
>>>   drivers/memory/mtk-smi.c | 148
>> ++++++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 146 insertions(+), 2 deletions(-)
>>>
>>
>> ...
>>
>>> +
>>> +static int mtk_smi_larb_parse_reset_info(struct mtk_smi_larb
>> *larb)
>>> +{
>>> +struct device_node *reset_node;
>>> +struct device *dev = larb->dev;
>>> +int ret;
>>> +
>>> +/* only larb with "resets" need to get reset setting */
>>> +reset_node = of_parse_phandle(dev->of_node, "resets", 0);
>>
>> Nope, you do not parse rasets.
> 
> 1.If I need to use the Linux reset control framework, 'resets' is the
> required property.

Leave that to the reset API, don't manually parse the resets phandle here,
that's what Krzysztof was meaning.

> 2.'reset-names' give the list of reset signal name strings sorted in
> the same order as the 'resets' property. SMI driver will use 'reset-
> names' to match reset signal names with reset specifiers.
> 3.Not all SMI larbs need to apply reset operations, only SMI larbs
> which may have bus glitch issues need this. Just to confirm if this
> larb support reset function.
> 
>>
>>> +if (!reset_node)
>>> +return 0;
>>> +of_node_put(reset_node);
>>> +
>>> +larb->rst_con = devm_reset_control_get(dev, "larb_rst");

"larb" is just fine as a name: it's clear that this is a reset, as
it's specified as `reset-names = "name"`.

>>
>> Where are the bindings? Why do you add undocumented properties? How
>> possible this passes dtbs_check???
>>
> 
> This is not the new added property in SMI larb DT node.
> It is the reset signal name which is inclued in 'reset-names'.
> Just like this:
> 
> resets = <&imgsys1_dip_nr_rst MT8188_SIM_RST_LARB15>;
> reset-name = 'larb_rst';
> 
> Maybe I can add this name to the 'reset-name' property binding
> description, like this, is this clear for you?
> 
> reset-name:

It's "reset-names" btw.

>      const: larb_rst
>      description: the name of reset signal. SMI driver need to obtain 		
>   the reset controller based on this.
> 
>>
>>> +if (IS_ERR(larb->rst_con))
>>> +return dev_err_probe(dev, PTR_ERR(larb->rst_con),
>>> +     "cannot get larb reset controller\n");
>>> +
>>> +larb->nb.notifier_call = mtk_smi_genpd_callback;
>>> +ret = dev_pm_genpd_add_notifier(dev, &larb->nb);
>>> +if (ret) {
>>> +dev_err(dev, "Failed to add genpd callback %d\n", ret);
>>> +return -EINVAL;
>>> +}
>>> +
>>> +return 0;
>>> +}
>>> +
>>>   static int mtk_smi_larb_probe(struct platform_device *pdev)
>>>   {
>>>   struct mtk_smi_larb *larb;
>>> @@ -538,6 +662,7 @@ static int mtk_smi_larb_probe(struct
>> platform_device *pdev)
>>>   if (!larb)
>>>   return -ENOMEM;
>>>   
>>> +larb->dev = dev;
>>>   larb->larb_gen = of_device_get_match_data(dev);
>>>   larb->base = devm_platform_ioremap_resource(pdev, 0);
>>>   if (IS_ERR(larb->base))
>>> @@ -554,15 +679,29 @@ static int mtk_smi_larb_probe(struct
>> platform_device *pdev)
>>>   if (ret < 0)
>>>   return ret;
>>>   
>>> -pm_runtime_enable(dev);
>>> +/* find sub common to clamp larb for ISP software reset */
>>> +ret = mtk_smi_larb_parse_clamp_info(larb);
>>> +if (ret) {
>>> +dev_err(dev, "Failed to get clamp setting for larb\n");
>>> +goto err_pm_disable;
>>> +}
>>> +
>>> +ret = mtk_smi_larb_parse_reset_info(larb);
>>> +if (ret) {
>>> +dev_err(dev, "Failed to get power setting for larb\n");
>>> +goto err_pm_disable;
>>> +}
>>> +
>>>   platform_set_drvdata(pdev, larb);
>>>   ret = component_add(dev, &mtk_smi_larb_component_ops);
>>>   if (ret)
>>>   goto err_pm_disable;
>>> +
>>> +pm_runtime_enable(dev);
>>> +
>>>   return 0;
>>>   
>>>   err_pm_disable:
>>> -pm_runtime_disable(dev);
>>>   device_link_remove(dev, larb->smi_common_dev);
>>
>> Label asls pm disable. Where is the pm disable?
>>
> 
> Thanks, I will fix it to 'err_link_remove'.
> 

...or you can just use devm_pm_runtime_enable() instead, and not worry
about disabling it on your own.

Regards,
Angelo

