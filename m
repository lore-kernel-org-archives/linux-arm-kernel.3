Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB4C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 06:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdKe8zvjQUFTSojxLI/rQWZSTGiI6bm2KGRlBUPs3xs=; b=TZTiADspvNwBe4Xl83WOjO7M9z
	WkXq3cFG/P1no8nnitjOnXyyRAGu8I1IikYaEuda+8VrvEXGqnfT2EXOg026BV5g+hGIL0K+ErCs7
	JbOcmXwnEjok9L9TDiJoZUdb7q9GO6Cx0yLnEmwypzrxxaqF64yGgRsvIQo0g09NIHmsbEK3Ws86E
	fMdeOMeqNi/ODWAtCf12sHBTiJPR4m+UspV8IxLxHlp0Pjcr7v+Vu5jAtETMbxSjZPO3W94Ak46CX
	q6DWhXHfrW1T0hnigFn5/11AO7EzASVyFeECGY75GO7KPKvOKSIPuMGJP95aBVzZDqHpSgL6PHBSr
	5/+WN/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTajC-00000001jpn-2vly;
	Mon, 23 Jun 2025 06:32:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTaN1-00000001grH-1Ana;
	Mon, 23 Jun 2025 06:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E284A50079;
	Mon, 23 Jun 2025 06:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E59C4CEED;
	Mon, 23 Jun 2025 06:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750658969;
	bh=PNHYsFG5NwLTdXL4ZX15juhfF+vA0FSIDNnfrT5LYJ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bvccnq/HXIbUblT5RrRtuAtCGHJuyMSm1Z/UMMJtou3oboBKjzaJShWzRGacGss13
	 mVw6eUVJUEFvn573v2h9O1Sg9EwFqebJ2E4AEYntQxQGtSXeVlu7nfGo84TRnh4yCL
	 RhdYeT1Vd+sBT7jh7vOc7BkKT+P9nkdNEQcwqmZFqmvcU8IaOnVE939FUGlMhL/ghc
	 FlnS72275/iEu6OAwcV49oCsgqpogcJcHctjQAqy1/sngt/aO2EqIza0XcC8FkQ6xq
	 ocnyJWPOe7NRrbts4g7jOV7z+EpbIgs+rod7dElCbvrbKiAzmRzNw1BbBWXYsmElyI
	 KfXU9HAlZSyLw==
Message-ID: <ab698ba0-6c6e-4d52-bef8-a6843aaa6cbf@kernel.org>
Date: Mon, 23 Jun 2025 08:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: net: mediatek,net: update for
 mt7988
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250620083555.6886-1-linux@fw-web.de>
 <20250620083555.6886-2-linux@fw-web.de>
 <jnrlk7lwob2qel453wy2igaravxt4lqgkzfl4hctybwk7qvmwm@pciwvmzkxatd>
 <100D79A2-12A9-478D-81F7-F2E5229C4269@public-files.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <100D79A2-12A9-478D-81F7-F2E5229C4269@public-files.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_230931_463390_FD6D1568 
X-CRM114-Status: GOOD (  26.42  )
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

On 22/06/2025 13:44, Frank Wunderlich wrote:
> Hi,
> 
> Thank you for review.
> 
> Am 22. Juni 2025 13:10:31 MESZ schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>> On Fri, Jun 20, 2025 at 10:35:32AM +0200, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Update binding for mt7988 which has 3 gmac and 2 reg items.
>>
>> Why?
> 
> I guess this is for reg? Socs toll mt7986 afair
>  get the SRAM register by offset to the MAC
>  register.
> On mt7988 we started defining it directly.

This should be explained in commit msg. Why are you doing the changes...

> 
>>> MT7988 has 4 FE IRQs (currently only 2 are used) and the 4 IRQs for
>>> use with RSS/LRO later.
>>>
>>> Add interrupt-names to make them accessible by name.
>>>
> ...
>>>    reg:
>>> -    maxItems: 1
>>> +    items:
>>> +      - description: Register for accessing the MACs.
>>> +      - description: SoC internal SRAM used for DMA operations.
>>
>> SRAM like mmio-sram?
> 
> Not sure,but as far as i understand the driver
>  the sram is used to handle tx packets directly
>  on the soc (less dram operations).
> 
> As mt7988 is the first 10Gbit/s capable SoC
>  there are some changes. But do we really need 
>  a new binding? We also thing abour adding
>  RSS/LRO to mt7986 too,so we come into
>  similar situation regarding the Interrupts/  
>  -names.

If it is mmio-sram, then it is definitely not reg property.

Anyway
wrap emails
according to list
discussion rules.

> 
>>> +    minItems: 1
>>>  
>>>    clocks:
>>>      minItems: 2
>>> @@ -40,7 +43,11 @@ properties:
>>>  
>>>    interrupts:
>>>      minItems: 1
>>> -    maxItems: 4
>>> +    maxItems: 8
>>> +
>>> +  interrupt-names:
>>> +    minItems: 1
>>> +    maxItems: 8
>>
>> So now all variants get unspecified names? You need to define it. Or
>> just drop.
> 
> Most socs using the Fe-irqs like mt7988,some
>  specify only 3 and 2 soc (mt762[18]) have only
>  1 shared irq. But existing dts not yet using the
>  irq-names.
> Thats why i leave it undefined here and
>  defining it only for mt7988 below. But leaving it
>  open to add irq names to other socs like filogic
>  socs (mt798x) where we are considering
>  adding rss/lro support too.
> 

I explained this is wrong. Your binding must be specific, not flexible.

>>>  
>>>    power-domains:
>>>      maxItems: 1
>>> @@ -348,7 +355,19 @@ allOf:
>>>      then:
>>>        properties:
>>>          interrupts:
>>> -          minItems: 4
>>> +          minItems: 2
>>
>> Why? Didn't you say it has 4?
> 
> Sorry missed to change it after adding the 2
>  reserved fe irqs back again (i tried adding only used irqs - rx+tx,but got info that all irqs can be used - for future functions - so added all available).
> 
>>> +
>>> +        interrupt-names:
>>> +          minItems: 2
>>> +          items:
>>> +            - const: fe0
>>> +            - const: fe1
>>> +            - const: fe2
>>> +            - const: fe3
>>> +            - const: pdma0
>>> +            - const: pdma1
>>> +            - const: pdma2
>>> +            - const: pdma3
>>>  
>>>          clocks:
>>>            minItems: 24
>>> @@ -381,8 +400,11 @@ allOf:
>>>              - const: xgp2
>>>              - const: xgp3
>>>  
>>> +        reg:
>>> +          minItems: 2
>>
>>
>> And all else? Why they got 2 reg and 8 interrupts now? All variants are
>> now affected/changed. We have been here: you need to write specific
>> bindings.
> 
> Mt7988 is more powerful and we wanted to add
>  all irqs available to have less problems when
>  adding rss support later. E.g. mt7986 also have
>  the pdma irqs,but they are not part of
>  binding+dts yet. Thats 1 reason why
>  introducing irq-names now. And this block is
>  for mt7988 only...the other still have a regcount of 1 (min-items).

This explains me nothing. Why do you change other hardware? Why when
doing something for MT7988 you also state that other SoCs have different
number of interrupts?



Best regards,
Krzysztof

