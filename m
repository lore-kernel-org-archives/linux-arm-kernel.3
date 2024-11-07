Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C2ED4334F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPyoRa+DeF6ygd94aVkx5wNR1v/4kRo4A5lQOTzYd+w=; b=IBoQwnBwrjx6gL
	DYDTnLiFxxgkBennXMwPOXLykay2MRIRcrEpTc2q+wvAfL/dQAnaxc2fJ8xLCQvkhCoRIQohIY/NU
	P/UTHm29a4OSLjbiQpL5A0vksiP0yqPaCPhixdMgFFZAQuJOPDQrY2zI2FL6q2u+mOEqDZBS/YZCr
	Jhr+CxsB9YU2wYYaNBGngffXyHp+fbW9yRanH46Zp4SndZ4BKnD1S9Q4fdmIqNPNII6/SYR37Pnu3
	oZGF9pAblQtDXpmo4d1A3VN1T95HyyGCg6Jy0VEZ916e9PO79ScSn08x45h2ztTaPutNRjuop0kJe
	qlOIoHHEe75VGi08r2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90xt-00000006nAe-1vON;
	Thu, 07 Nov 2024 11:46:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90w6-00000006meb-3n2Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51E5AA43C5A;
	Thu,  7 Nov 2024 11:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33ADC4CECC;
	Thu,  7 Nov 2024 11:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730979865;
	bh=We1tizgp6+CrhO05WmQLAXoXUBOb6hkJgmh4mu+qU9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pf/XT8QyNRsFfDEr9bG5jPCQ/LjbX1QPgoS34/4L8YtytTAEW4/NlNYGT2DsCf/Yx
	 ZKv5PqJi5i154oBu2csLqKqA9VTwTjQe7a0HTy5k7PyXSy1PrImZFbJMUNhDjmGqju
	 2mcmNYFcd6n9le9QWtmm8b1ZVYV3eRWdhcVFjW/uPxh3gFesZPnHL4c2gdqOU6nalg
	 hCIL07XPKA/DdOep2ml4TB021pHM7qF/OfHva1VMtlYAWQ5kvY4PxnonGD9wOFJxFa
	 6lR7aVldCVL1lIDxFKhyjbkqWpqlk1IG1pZRsGt55H41Km80IXomChro/ZObN+kgz6
	 vn9sjhwSqwscA==
Message-ID: <2c368f5a-4b58-45de-8140-21b2f7af4d12@kernel.org>
Date: Thu, 7 Nov 2024 12:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
To: MD Danish Anwar <danishanwar@ti.com>, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, ssantosh@kernel.org, nm@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20241107104557.1442800-1-danishanwar@ti.com>
 <20241107104557.1442800-2-danishanwar@ti.com>
 <7f0a73c3-9977-4d07-b996-683ed18e4724@kernel.org>
 <8156fd61-c476-4b58-b3b2-e8bc4f93035e@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <8156fd61-c476-4b58-b3b2-e8bc4f93035e@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_034427_108254_5B1D00DE 
X-CRM114-Status: GOOD (  19.36  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 07/11/2024 12:36, MD Danish Anwar wrote:
> 
> 
> On 07/11/24 5:01 pm, Krzysztof Kozlowski wrote:
>> On 07/11/2024 11:45, MD Danish Anwar wrote:
>>> Add clocks, assigned-clocks and assigned-clock-parents for ICSSG
>>
>> Why? We see what you are doing from the diff, no point to repeat it. I
>> don't understand why you are doing it.
>>
>>>
>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>> ---
>>>  .../devicetree/bindings/soc/ti/ti,pruss.yaml          | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>> index 3cb1471cc6b6..cf4c5884d8be 100644
>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>> @@ -92,6 +92,17 @@ properties:
>>>      description: |
>>>        This property is as per sci-pm-domain.txt.
>>>  
>>> +  clocks:
>>> +    items:
>>> +      - description: ICSSG_CORE Clock
>>> +      - description: ICSSG_ICLK Clock
>>> +
>>> +  assigned-clocks:
>>> +    maxItems: 1
>>> +
>>> +  assigned-clock-parents:
>>> +    maxItems: 1
>>
>> Why? This is really not needed, so you need to explain why you are doing
>> things differently than entire Linux kernel / DT bindings.
>>
> 
> I need to add this to the device tree node
> 
> +		clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
> +			 <&k3_clks 81 20>; /* icssg0_iclk */
> +		assigned-clocks = <&k3_clks 81 0>;
> +		assigned-clock-parents = <&k3_clks 81 2>;
> 
> But without the above change in the binding I am getting below errors
> while running dtbs check.
> 
> /workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30000000:
> 'assigned-clock-parents', 'assigned-clocks' do not match any of the
> regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', '^pa-stats@[a-f0-9]+$',
> 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a-f0-9]+$',
> 'mdio@[a-f0-9]+$', 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$',
> 'mii-rt@[a-f0-9]+$', 'pinctrl-[0-9]+'
> +/workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30080000:
> 'anyOf' conditional failed, one must be fixed:
> 
> To fix this warning I added these in the binding and the warnings were
> fixed.

nah, cannot reproduce. Just be sure you work on recent kernel (last time
you were sending it on some ancient stuff) and your packages are
updated, including dt schema and other kernel dependencies.

Best regards,
Krzysztof


