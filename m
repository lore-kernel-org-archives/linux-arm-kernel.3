Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1788C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4ufy+pdH/kfJz3W/Sq+mTTbQ/D8XrkXggTWUdePvjU=; b=NKGDLWThqG/562e8Epe8FDalfF
	XryiVOtMm64HJyBIxqcOxJpcOGDFB/OtDN5QfFgV3RuCKlHYwNzifE8UTL9n+R+AEFiQbRSVDOiPe
	7iXJ6ku66zoZUdtAzFQfziMPdDLaqy7iONpNwgkHzxb6ySwUkS0SoWRmFNY1Rf22Geo9+TGBnTWTu
	hOWZkjuuh6FSDPLYLrVh7DpS2bc7/X8XiCSt6EnWFdeQRLyvakrG4W6x7nZGXzXM5OOzfP7KwnPzl
	EZqTuuKEyJhWLmdpQeWu4ZHxBR1i5qP7SzYDQlMbzLDaGRMEjcSzAErtolGfwU6TpH3EkMSR/icVB
	eJXCjxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUYQ-0000000CrKl-15t8;
	Mon, 24 Feb 2025 09:15:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUE5-0000000CmIu-3iPj;
	Mon, 24 Feb 2025 08:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740387248;
	bh=6bOy9KlYLQyrPSIjTKd8+I20FV1jUat1LPHJT2fj0CA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IOM2g64PkCwY3bMfCSfg7CSfBu84lFzLss4S42gqmJlCwkEhycqrjpG30bm248nDv
	 N2eBYf/mT745k7zVqwGMRyDXwGEw5CCSPpFa7Wt1+0gV85jkKdhZD/KWJR8FZwkYCi
	 nRwbtChVaYQXkMCggjYwZDLUYgdTGozDnrxe1cjfFzW4UzpRh7BzcF2fK9XIC5m0Mz
	 ZlMM7E11sm5//N0lJl4+Jpmfv0vqLQXKZd7S3JX/Jk3pIuD/hDI9S284Sz+fdtBQJG
	 hTWr6ZUQwsj61oViQd+y2+7kyCwwWBpUTWRunsaonBSuiXM+BKmDH1QwJNQopQ5mUP
	 GVuMcIR0KIA6A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6949E17E001F;
	Mon, 24 Feb 2025 09:54:07 +0100 (CET)
Message-ID: <5d10f630-57a4-427d-a14e-e4058d4fdffe@collabora.com>
Date: Mon, 24 Feb 2025 09:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
To: ChiYuan Huang <cy_huang@richtek.com>,
 =?UTF-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "fparent@baylibre.com" <fparent@baylibre.com>,
 =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "macpaul@gmail.com" <macpaul@gmail.com>,
 =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 "simon.sun@yunjingtech.com" <simon.sun@yunjingtech.com>,
 =?UTF-8?B?WW93LXNoaW4gTGlvdSAo5YqJ56WQ54KYKQ==?=
 <yow-shin.liou@mediatek.com>,
 =?UTF-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?= <Chris-qj.Chen@mediatek.com>
References: <20250220143354.2532448-1-macpaul.lin@mediatek.com>
 <cb392432-e452-4460-ace6-54b3649aed52@collabora.com>
 <f09f880b7f9b642140109f17ed3f89aa44195b99.camel@mediatek.com>
 <Z7vRUmETQaYRbEyZ@git-send.richtek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <Z7vRUmETQaYRbEyZ@git-send.richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_005410_067557_5CFC007B 
X-CRM114-Status: GOOD (  14.95  )
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

Il 24/02/25 02:54, ChiYuan Huang ha scritto:
> On Fri, Feb 21, 2025 at 11:39:09AM +0000, Macpaul Lin (林智斌) wrote:
>> On Thu, 2025-02-20 at 16:58 +0100, AngeloGioacchino Del Regno wrote:
>>>
>>>
>>
>> [snip]
>>
>>>> +             tcpc {
>>>> +                     compatible = "mediatek,mt6360-tcpc";
>>>> +                     interrupts-extended = <&pio 17
>>>> IRQ_TYPE_LEVEL_LOW>;
>>>> +                     interrupt-names = "PD_IRQB";
>>>> +
>>>> +                     connector {
>>>> +                             compatible = "usb-c-connector";
>>>> +                             label = "USB-C";
>>>> +                             data-role = "dual";
>>>> +                             op-sink-microwatt = <10000000>;
>>>> +                             power-role = "dual";
>>>> +                             try-power-role = "sink";
>>>
>>> Would be appreciated if you could also complete the node by adding
>>> the pd-revision
>>> property, enabling full USBC Power Delivery for the MT6360 PMIC.
>>>
>>
>> Well, I have no idea about the pd-revision of MT6360.
>> I could found MT6360 supports PD 3.0 according to the datasheet,
>> however, I have no idea about the other fields like major and minor
>> values. Dear ChiYuan, could you help to provide the value of pd-
>> revision? The property has been defined in
>> Documentation/devicetree/bindings/connector/usb-connector.yaml.
>>
> Hi, Macpaul:
> 
> You can specify the version information to 3.1 version 1.6.
> Just add the below property into the 'connector' node.
> 
> pd-revision = /bits/ 8 <0x03 0x01 0x01 0x06>;
> 
> Regards,
> ChiYuan

Thanks ChiYuan, that's great to know.

With this - all boards relying on MT6360 can charge use the full set of supported
USB Power Delivery capabilities (that, since the PD revision is specific to the
MT6360 TCPC, and not board specific!).

Macpaul, please add the pd-revision as suggested, and for v6, please add my:

Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo




