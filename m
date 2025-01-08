Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E20E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 07:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdTKZGSkjwAmTKKK3v6Ntuyop6gLT/xtF2sKEE70n2g=; b=orCDE2ankPNMoLEjU81t6wrzoe
	HgrjWcv5h4sMF5Ph/F+fUmKHt84qe9BYUA3NnvLOs/9sZG2+EPZU1nzyq0JacxuxgtGVC6WHSyMG4
	DAPNbXEsHXeiEawp0EmET5nf581q3dKZBEowjeZgQnPGGXQp24etw22WIC11J9Gnalpo3mPYQRzNM
	G0a4dgs7vM3G+9GKvj2RTQsMEv6x2m8NkBg2t36yx5vb5lM8UwVMRD6J6e/ZbqKehDOXh/yENnnaO
	TBYv2D+FX+GUwSUT4DOJp3b9PbJYRsSOA31bn/49jtLK7MCdjhQ/pgcH9acbHm3o+Y14BNTDIsBtY
	ZHYOkH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQUw-00000007Qqc-2q90;
	Wed, 08 Jan 2025 07:29:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQIj-00000007Op8-1TUg;
	Wed, 08 Jan 2025 07:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pdTKZGSkjwAmTKKK3v6Ntuyop6gLT/xtF2sKEE70n2g=; b=CZouGP1s5T7XQ2gKVYoghxyS4e
	jcwqvmPWKxMCaw+jd/LWzGMdowjcWm5H9g/dUwRFvpNLdJ5+Pzup3rYe0zNi+wYCTgQrYOkN8o7zu
	Waj0fWcBsf4sNIhpJjBuRq2QGE0DtVvU9YXO8vFH4e7KDWYAzNR8crYBxZ0N+Kby2YlEV0PQvWBu1
	acvh/Xxog/eWpXN3GloOgH9MaEekg3rCtHvtSamCg2ZPMuIgNqSJi1apUAdHg2BuhcRx7/mhJM77X
	6h4aupdw4IbGPteg301D4gy38loJICKkekoiZeUWeVjq0PnK8WIy+McGtZT4IlFFXkU9d1zb0yY3q
	iBaV86sA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQIg-00000009HzT-1vn4;
	Wed, 08 Jan 2025 07:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B589A40A21;
	Wed,  8 Jan 2025 07:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C136C4CEE0;
	Wed,  8 Jan 2025 07:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736320578;
	bh=/nZWOZiAApJjEeZw8vk1otC1prkpz+lJLIdowQPpjys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HLsyw3M+3Pa17joy1bRfI9u5T7eGbFbYAN7qMyv6s4H7l3qY/73g5yCdSRi0ekuGu
	 BcbvrPAYZARHS91tJHAZZFjSU/aStVwPmvzvSiOaDYAB4fJYVLCBGb65dNvncQJ8Gn
	 SG8RV9/wt2UiEgcRioOKfDjOMJii6lKSDksNKz1pVgppcgBxPCkNkp73PWIryu5Dah
	 grvp4BEdC82tXh7y/aps8o7mLM+nUGgu9vJn+19Y4Z7j1X0hkfUOKP41nnCsPzkQpO
	 gD2O0A4As1KPr8uxaBKr+NaGsGjwTZayoEuIslvDtFbFqABWqdGezA/IGO2yCZg6X+
	 ttyihQrsxJRLg==
Message-ID: <14a456bd-3f24-4daf-9329-873d0f051a83@kernel.org>
Date: Wed, 8 Jan 2025 08:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
To: =?UTF-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Ryder Lee <Ryder.Lee@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 =?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-2-jianjun.wang@mediatek.com>
 <ndj6j2mmylipr7mxg42f3lcwgx55cvcjnuuofmlk6n6t5uz5pr@bxugolyfublc>
 <04ae2a07e2c2d3c03e82596034b1b7711450a0ae.camel@mediatek.com>
 <eb2088d3-81f6-4cb8-a4d7-6ef985aedbda@kernel.org>
 <9b0a463312702fb78e4ca2ba79c9ec6b62e33c58.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9b0a463312702fb78e4ca2ba79c9ec6b62e33c58.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_071622_771275_D183F164 
X-CRM114-Status: GOOD (  21.32  )
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

On 07/01/2025 09:43, Jianjun Wang (王建军) wrote:
> On Mon, 2025-01-06 at 13:27 +0100, Krzysztof Kozlowski wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 06/01/2025 10:26, Jianjun Wang (王建军) wrote:
>>> On Fri, 2025-01-03 at 10:10 +0100, Krzysztof Kozlowski wrote:
>>>> External email : Please do not click links or open attachments
>>>> until
>>>> you have verified the sender or the content.
>>>>
>>>>
>>>> On Fri, Jan 03, 2025 at 02:00:11PM +0800, Jianjun Wang wrote:
>>>>> +        clock-names:
>>>>> +          items:
>>>>> +            - const: pl_250m
>>>>> +            - const: tl_26m
>>>>> +            - const: peri_26m
>>>>> +            - const: peri_mem
>>>>> +            - const: ahb_apb
>>>>> +            - const: low_power
>>>>> +
>>>>> +        resets:
>>>>> +          minItems: 1
>>>>> +          maxItems: 2
>>>>> +
>>>>> +        reset-names:
>>>>> +          minItems: 1
>>>>> +          maxItems: 2
>>>>
>>>> Why resets are flexible?
>>>
>>> There are two resets, one for MAC and another for PHY, some
>>> platforms
>>> may only use one of them.
>>
>> Even more questions. What does it mean use? Is it there or is it not?
> 
> It will be used by calling the reset controller's APIs in the PCIe
> controller driver. Ideally, it should be de-asserted before PCIe
> initialization and should be asserted if PCIe powers down or the driver
> is removed.

So it is there? Then drop minItems.

> 
>> Platform like SoC? But this is one specific SoC, it cannot be used on
>> different SoC.
> 
> Yes, it should be SoC, each SoC have its own resets, and the number of
> resets for each SoC is defined by the hardware design, most SoCs should
> have one reset for MAC and one reset for PHY.

You respond with some obvious things, so this review won't work.
Properties are supposed to be constrained. Your arguments that something
else has something else, do not apply. It does not matter what something
else has.

> 
>>
>>>
>>> Would you prefer to set the number of resets to a fixed value for
>>> specific platforms?
>>
>> Everything should be constrained to match hardware.
> 
> For MT8196, there are 2 resets. Should I use a fixed item in this case?

Yes. I asked why this soc has this flexible and you speak about some
other socs.



Best regards,
Krzysztof

