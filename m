Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB5BC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 07:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubKYP1zSBGc+rwmnowfgVjjXjs0JP0E+gkluFgCYnjY=; b=u6m7UU1jzqkghMSKvzZTzvK6dY
	67qAzAXgP1Px/2NI2rFdD3Mf5KCHpfaH9v23uuKVGrgUtw6BJzryehaLjUL00ApmGAM3oODE3YGUc
	4tIRK23GSVYtQD5O2RKxNfTqztzoC7wdtIaoLQbWdvEomXG+7K77ZTkDYhhTjBzaV4s7DikqgeJ84
	pibiIwrscDkZhgreHCkUEple0OI7YYRpiSN0L3u069CRtoCDGsFlGucaQCGg4UXoI0VTvv+xSclXP
	9seIeWG46hHPGsmTUCzq2aQpI6/WM0pxsiL71D4b+hyt7UFCAqnCKyZHgb3UCDtdyLBqBR/hK91/t
	irAu9NVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWs0n-00000007VdT-25g8;
	Wed, 02 Jul 2025 07:36:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWqwd-00000007P2i-0HkH;
	Wed, 02 Jul 2025 06:27:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C47CE5C4ABA;
	Wed,  2 Jul 2025 06:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A6CC4CEEE;
	Wed,  2 Jul 2025 06:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751437665;
	bh=b1raSCnVk/x9Xxqknj4FVa7tpOBkc/kLtEQ6J+PvXac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vj3cc4AQYlH6o3b4qrzMkDKClYEhqGVqfZTckD7VMqGkGIUY7WUh/Ko5jVuW3rCnm
	 ZXa5Sx3IEPsc+cL1Tbq8chjgbsc45sQFfiJMnit9G+RbmU4vhB9EPAzm9WWrIQAWD8
	 qn18UO+OlhM4KV7rJEXx2striA4Ot5olpeXJYe8duS56D2UvvFm+FbwBlHnrsd1f1s
	 zCnNneY2ScJSPHFO8O5qplzYNv1r1xhCw4GFB517MVDkw6tk25GzRZZPNIlKCQ6WXP
	 K4FCbamQKRbvglxP6KRPz7KihZUZKAuBz6BIchdOJYUdx9mk3yuE6Y9919HgxxVipe
	 hp4qruqsD8bKQ==
Message-ID: <158755b2-7b1c-4b1c-8577-b00acbfadbdc@kernel.org>
Date: Wed, 2 Jul 2025 08:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/14] dt-bindings: net: mediatek,net: allow irq names
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
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250628165451.85884-1-linux@fw-web.de>
 <20250628165451.85884-2-linux@fw-web.de>
 <20250701-wisteria-walrus-of-perfection-bdfbec@krzk-bin>
 <9AF787EF-A184-4492-A6F1-50B069D780E7@public-files.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <9AF787EF-A184-4492-A6F1-50B069D780E7@public-files.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_232747_200574_092FB849 
X-CRM114-Status: GOOD (  29.76  )
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

On 01/07/2025 12:51, Frank Wunderlich wrote:
> Am 1. Juli 2025 08:44:02 MESZ schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>> On Sat, Jun 28, 2025 at 06:54:36PM +0200, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> In preparation for MT7988 and RSS/LRO allow the interrupt-names
>>
>> Why? What preparation, what is the purpose of adding the names, what do
>> they solve?
> 
> Devicetree handled by the mtk_eth_soc driver have
> a wild mix of shared and non-shared irq definitions
> accessed by index (shared use index 0,
> non-shared
> using 1+2). Some soc have only 3 FE irqs (like mt7622).
> 
> This makes it unclear which irq is used for what
> on which SoC. Adding names for irq cleans this a bit
> in device tree and driver.

It's implied ABI now, even if the binding did not express that. But
interrupt-names are not necessary to express that at all. Look at other
bindings: we express the list by describing the items:
items:
  - description: foo
  - ... bar

> 
>>> property. Also increase the maximum IRQ count to 8 (4 FE + 4 RSS),
>>
>> Why? There is no user of 8 items.
> 
> MT7988 *with* RSS/LRO (not yet supported by driver
> yet,but i add the irqs in devicetree in this series)
> use 8 irqs,but RSS is optional and 4 irqs get working
> ethernet stack.

That's separate change than fixing ABI and that user MUST BE HERE. You
cannot add some future interrupts for some future device. Adding new
device is the only reason to add more interrupts.

> 
> I hope this explanation makes things clearer...


Commit msg must explain all this, not me asking.

> 
>>> but set boundaries for all compatibles same as irq count.
>>
>> Your patch does not do it.
> 
> I set Min/max-items for interrupt names below like
> interrupts count defined.

No, you don't. It's all fluid and flexible - limited constraints.

> 
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>> v7: fixed wrong rebase
>>> v6: new patch splitted from the mt7988 changes
>>> ---
>>>  .../devicetree/bindings/net/mediatek,net.yaml | 38 ++++++++++++++++++-
>>>  1 file changed, 37 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
>>> index 9e02fd80af83..6672db206b38 100644
>>> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
>>> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
>>> @@ -40,7 +40,19 @@ properties:
>>>  
>>>    interrupts:
>>>      minItems: 1
>>> -    maxItems: 4
>>> +    maxItems: 8
>>> +
>>> +  interrupt-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: fe0
>>> +      - const: fe1
>>> +      - const: fe2
>>> +      - const: fe3
>>> +      - const: pdma0
>>> +      - const: pdma1
>>> +      - const: pdma2
>>> +      - const: pdma3
>>>  
>>>    power-domains:
>>>      maxItems: 1
>>> @@ -135,6 +147,10 @@ allOf:
>>>            minItems: 3
>>>            maxItems: 3
>>>  
>>> +        interrupt-names:
>>> +          minItems: 3
>>> +          maxItems: 3
>>> +
>>>          clocks:
>>>            minItems: 4
>>>            maxItems: 4
>>> @@ -166,6 +182,9 @@ allOf:
>>>          interrupts:
>>>            maxItems: 1
>>>  
>>> +        interrupt-namess:
>>> +          maxItems: 1
>>> +
>>>          clocks:
>>>            minItems: 2
>>>            maxItems: 2
>>> @@ -192,6 +211,10 @@ allOf:
>>>            minItems: 3
>>>            maxItems: 3
>>>  
>>> +        interrupt-names:
>>> +          minItems: 3
>>> +          maxItems: 3
>>> +
>>>          clocks:
>>>            minItems: 11
>>>            maxItems: 11
>>> @@ -232,6 +255,10 @@ allOf:
>>>            minItems: 3
>>>            maxItems: 3
>>>  
>>> +        interrupt-names:
>>> +          minItems: 3
>>> +          maxItems: 3
>>> +
>>>          clocks:
>>>            minItems: 17
>>>            maxItems: 17
>>> @@ -274,6 +301,9 @@ allOf:
>>>          interrupts:
>>>            minItems: 4
>>>  
>>> +        interrupt-names:
>>> +          minItems: 4
>>> +
>>>          clocks:
>>>            minItems: 15
>>>            maxItems: 15
>>> @@ -312,6 +342,9 @@ allOf:
>>>          interrupts:
>>>            minItems: 4
>>>  
>>> +        interrupt-names:
>>> +          minItems: 4
>>
>> 8 interrupts is now valid?
>>
>>> +
>>>          clocks:
>>>            minItems: 15
>>>            maxItems: 15
>>> @@ -350,6 +383,9 @@ allOf:
>>>          interrupts:
>>>            minItems: 4
>>>  
>>> +        interrupt-names:
>>> +          minItems: 4
>>
>> So why sudenly this device gets 8 interrupts? This makes no sense,
>> nothing explained in the commit msg.
> 
> 4 FrameEngine IRQs are required to be defined (currently 2 are used in driver).
> The other 4 are optional,but added in the devicetree

There were only 4 before and you do not explain why all devices get 8.
You mentioned that MT7988 has 8 but now make 8 for all other variants!

Why you are not answering this question?

> to not run into problems supporting old devicetree
> when adding RSS/LRO to driver.

This is not about driver, it does not matter for the driver. Binding and
DTS are supposed to be complete.

> 
>> I understand nothing from this patch and I already asked you to clearly
>> explain why you are doing things. This patch on its own makes no sense.
>>
>> Best regards,
>> Krzysztof
>>
> 
> 
> regards Frank


Best regards,
Krzysztof

