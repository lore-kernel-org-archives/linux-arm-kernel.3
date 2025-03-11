Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B939FC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQWx5VAm++Mg4qFGTmxWsxcgqpsvyWAr2kViVxw69SQ=; b=0Wceo77u87d7NLUaZMLnb6bvvo
	DZltGblr5o5V0wly+iPfu3ME08Osop1CZlcR2+Hnho9R7NB3QIndo//FKyzntU9iobfcYwc0j+b2r
	Z2ccVaZV49UR9vOUYgf7xuiPLi6cflbuEkGIqTn2kBgCVX4/sNxlNNuEENt1rOJ+Wz4wa2BeXe4OY
	WRUwA6F6mzCzpA9lotgsM+MwwD9Xonw0cyJ0Pf3ysT+AgQHRu/SS0FJzD81r4wjo7GH6Ckf5c3Hn4
	/Y34WROH4+ijzLfIaU5LvWu4p8mjBkTzgPtMMKcWFWNv/GmgbGaSvNiA25Oqt0tTfNhEmXLIwhvcb
	bWuFdtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trwFx-00000005CcV-2bkb;
	Tue, 11 Mar 2025 09:50:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trwCs-00000005C32-3V3A;
	Tue, 11 Mar 2025 09:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741686444;
	bh=2y0BgM8k6LyEGSxamKC+4zLWW/hmmLsnmqOuELJkL3w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JN9I+Z/QGiPLB+q1sP4gpy2p3ZCdttcYv8IsfYhNTL/EoCqIQT3gyLvfbCYrbAUa+
	 4pxYhYBjMBqh7SjGxUr5ROj8CLxkfjFLGx7iF0Nyu4XLxdYuPlz76tpODlFgHX9q3v
	 kvaVvC6OW73QT/o9NFKnN/1tWxhuiMgRco+1VxjWIuF9LTeCO0y/agCAtcjFGP4YeQ
	 Nnk5eOpYVjerhu3bxGXXqDWsbkYvmlVTztt0F3P2WVRTCtEVaEaeNTtqMzO61GUcKc
	 gbb1CZTjPPw9g8V/WpWKJgJG3amwSRv9rQRTUhQ29aozCWFNJc8i7H3CtrgJoXZg0g
	 xHCnFSLjMoNqg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A443317E0FB8;
	Tue, 11 Mar 2025 10:47:23 +0100 (CET)
Message-ID: <b09f618a-eaf9-4258-ae2d-67eff1cb249f@collabora.com>
Date: Tue, 11 Mar 2025 10:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: add single burst switch
To: =?UTF-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>,
 =?UTF-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "robh@kernel.org" <robh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 =?UTF-8?B?QW5keS1sZCBMdSAo5Y2i5LicKQ==?= <Andy-ld.Lu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?WW9uZyBNYW8gKOavm+WLhyk=?= <yong.mao@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>
References: <20250306085028.5024-1-axe.yang@mediatek.com>
 <20250306085028.5024-2-axe.yang@mediatek.com>
 <3e84fda8-2566-4f18-8ef9-850c84789c34@collabora.com>
 <f84800fac589429157cd84034ef2f4541d3486a7.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f84800fac589429157cd84034ef2f4541d3486a7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_024727_025041_55F7F57B 
X-CRM114-Status: GOOD (  24.49  )
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

Il 07/03/25 07:59, Axe Yang (杨磊) ha scritto:
> On Thu, 2025-03-06 at 10:19 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 06/03/25 09:48, Axe Yang ha scritto:
>>> Add 'mediatek,disable-single-burst' setting. This property can be
>>> used to switch bus burst type, from single burst to INCR, which is
>>> determined by the bus type within the IP. Some versions of the IP
>>> are using AXI bus, thus this switch is necessary as 'single' is not
>>> the burst type supported by the bus.
>>>
>>> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
>>
>> I am mostly sure that this is not something to put in devicetree, but
>> as
>> platform data for specific SoC(s), as much as I'm mostly sure that
>> all of
>> the instances of the MSDC IP in one SoC will be *all* using either
>> single
>> or INCR.
> 
> No, actually MSDC IPs in one SoC are using different versions.
> Usually MSDC1 (index from 1) is used as eMMC host, the left hosts are
> used as SD/SDIO hosts. They have similar designs, but there are still
> difference.
> 
>>
>> So, I think I know the answer but I'll still ask just to be extremely
>> sure:
>>
>> is there any MediaTek SoC that has different IP versions for
>> different MSDC
>> instances, and that hence require single burst on one instance and
>> INCR on
>> another instance?
> 
> Yes. Actually every SoC has different IP versions for eMMC and SD/SDIO
> host as I said.
> e.g. For MT8168, signel burst bit should be set to 1 for eMMC Host, but
> 0 for SD/SDIO Host.
> 
>>
>> And if there is - is there a pattern? Is it always SDIO requiring
>> INCR or
>> always eMMC/SD requiring it?
>>
>>
> 
> No, there is no pattern. Both eMMC and SD/SDIO hosts need to be
> configured base on IP version. There is no binding relationship between
> eMMC/SD/SDIO and the burst type. eMMC burst type might be INCR or
> single, same as SD/SDIO.
> 

Okay but if there are different IP versions, and AXI/AHB is determined
by the IP version, why aren't you parsing the MAIN_VER/ECO_VER registers of
the MSDC IP to check whether to use INCR or SINGLE?

Cheers,
Angelo

> 
> Regards,
> Axe
> 
> 
>>
>>> ---
>>>    Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> index 0debccbd6519..6076aff0a689 100644
>>> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> @@ -100,6 +100,14 @@ properties:
>>>        minimum: 0
>>>        maximum: 0xffffffff
>>>
>>> +  mediatek,disable-single-burst:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +    description:
>>> +      Burst type setting. For some versions of the IP that do not
>>> use
>>> +      AHB bus, the burst type need to be switched to INCR.
>>> +      If present, use INCR burst type.
>>> +      If not present, use single burst type.
>>> +
>>>      mediatek,hs200-cmd-int-delay:
>>>        $ref: /schemas/types.yaml#/definitions/uint32
>>>        description:
>>
>>
>>


