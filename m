Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DE5C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXO7j/EW0YZHZmrgrDHnxMJbXeUhG4A5t7N4/mNJ/U0=; b=yLBf3NVGrpebILcpjCcvsBdiyf
	Oc8WpyE23SujYJlg15iDr5qICL63uvOW9k1gAt0Kubd67y8/mhbdwrkA2Wux2a1XolGMMcgPysHl/
	zd6BtU5k/iLaN5tBen7bb9E1DzJLIK6ng3EruLssz1s10rio/5MSo2qfKuO3SPohA8/uEGsBkXEvY
	W6atVTCnCNNYDvXc3CVJTngmLf4/qvZcb3Dggp2qi+8TjdpEGUwnxHwWkWqWLUvdIUAkuoBGeaBUu
	4q3OS7ktgmojPeQFjIEcIPvVr5R2fLO9pe7CDQjOkBslxNUTtNYWpuVd6TnZdz8QSi87dt8YTAmK2
	ZkcKkT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufxqV-0000000CYOi-28hX;
	Sun, 27 Jul 2025 09:39:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufxny-0000000CYDK-14hp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 09:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3D3643F3D;
	Sun, 27 Jul 2025 09:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F0FC4CEEB;
	Sun, 27 Jul 2025 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753608987;
	bh=3KwHDBXWQOpr86hh/WgXBV9m9JGz7kpYAsJ27ibYkBc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CleSKY6oYIOqUNNodUPeJS3HEm1Cv7ET2XDHb9qBTv6RGO+5Yr8v4eGzHmMUbsQOv
	 KnEG9Y+kBRcXsgUGzPbgazE/Ro7TV5N520M3eFXqib0dd/jbn3rfhclfK1VstmRkzn
	 IC0BDYxMawwO/SREWuVmP5qmJzaUMoAvTDKXk+mfs7JdyKObpTG74RMqaVNPT1EKaO
	 jMs/ZarvFq50IN5/GNPZYnMr8dkoL9RilmsfWBT4UBSddoFOK08SzZnj6Xxy+M+5hY
	 8ez8LzAEeiAlsCk7b3CQjpLGijkqtTdtGWN/fDo4+6QcMCk1NY8lbDX62emxhIV9P0
	 6hIRJVdwg+FPA==
Message-ID: <b8e570ab-313f-4f20-bedb-a1191c672435@kernel.org>
Date: Sun, 27 Jul 2025 11:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: aspeed: Add
 parent node compatibles and refine documentation
To: Ryan Chen <ryan_chen@aspeedtech.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kevin Chen <kevin_chen@aspeedtech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <20250722095156.1672873-1-ryan_chen@aspeedtech.com>
 <20250722095156.1672873-2-ryan_chen@aspeedtech.com>
 <001d37c7-f704-4554-a4db-0cc130e07dd6@kernel.org>
 <OS8PR06MB7541F8D3AEE1A618DB31F07BF25FA@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <384635a3-c6ed-44f8-a54a-2b20e20694cd@kernel.org>
 <OS8PR06MB75418BD29DCD6E93F2A44903F25BA@OS8PR06MB7541.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <OS8PR06MB75418BD29DCD6E93F2A44903F25BA@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_023630_350167_D64414C6 
X-CRM114-Status: GOOD (  17.97  )
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

On 27/07/2025 03:47, Ryan Chen wrote:
>> Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: aspeed: Add parent
>> node compatibles and refine documentation
>>
>> On 23/07/2025 10:08, Ryan Chen wrote:
>>>> Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller:
>>>> aspeed: Add parent node compatibles and refine documentation
>>>>
>>>> On 22/07/2025 11:51, Ryan Chen wrote:
>>>>> +  INTC0 is used to assert GIC if interrupt in INTC1 asserted.
>>>>> +  INTC1 is used to assert INTC0 if interrupt of modules asserted.
>>>>> +  +-----+   +---------+
>>>>> +  | GIC |---|  INTC0  |
>>>>> +  +-----+   +---------+
>>>>> +            +---------+
>>>>> +            |         |---module0
>>>>> +            | INTC0_0 |---module1
>>>>> +            |         |---...
>>>>> +            +---------+---module31
>>>>> +            |---....  |
>>>>> +            +---------+
>>>>> +            |         |     +---------+
>>>>> +            | INTC0_11| +---| INTC1   |
>>>>> +            |         |     +---------+
>>>>> +            +---------+     +---------+---module0
>>>>> +                            | INTC1_0 |---module1
>>>>> +                            |         |---...
>>>>> +                            +---------+---module31
>>>>> +                            ...
>>>>> +                            +---------+---module0
>>>>> +                            | INTC1_5 |---module1
>>>>> +                            |         |---...
>>>>> +                            +---------+---module31
>>>>
>>>> You binding also said intc1 is the parent of intc-ic, so where is here intc-ic?
>>>>
>>>> This diagram and new binding do not match at all.
>>>
>>> The corresponded compatible is following.
>>>
>>>   +-----+   +---------+
>>>   | GIC |---|  INTC0  | -> (parent : aspeed,ast2700-intc0)
>>>   +-----+   +---------+
>>>             +---------+
>>>             |        |---module0
>>>             | INTC0_0 |---module1
>>> 			(child : aspeed,ast2700-intc-ic)
>>>             |        |---...
>>>             +---------+---module31
>>>             |---....  |
>>>             +---------+
>>>             |         |    					 +---------+
>>>             | INTC0_11 | +----------------------------	| INTC1   |  -> ->
>> (parent : aspeed,ast2700-intc1)
>>
>> AGAIN (second time): that's not what your binding said.
>>
>> Your binding is explicit here, which is what we want in general. It says that inct1 is
>> one of the parents of intc-ic.

... and you never addressed that. :/

>>
>> Let me be clear, because you will be dragging this talk with irrelevant arguments
>> forever - changing this binding is close to no. If you come with correct arguments,
>> maybe would work. But the main point is that you probably do not have to even
>> change the binding to achieve proper hardware description. Work on that.
>>
> 
> If I do not change the binding, I think the yaml and dts can still fit the interrupt
> nesting architecture by using both interrupts and interrupts-extended.
> 
> For first-level controllers, use the standard interrupts property
> (e.g. with the GIC as the parent).
> 
> For second-level INTC-IC instances, use interrupts-extended to refer to the
> first-level INTC-IC, following common Linux practice for stacked interrupt controllers.
> For example:
> dts
> // First level
> intc0_11: interrupt-controller@12101b00 {
>     compatible = "aspeed,ast2700-intc-ic";
>     reg = <...>;
>     interrupt-controller;
>     #interrupt-cells = <2>;
>     interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>, ...;
> };
> 
> // Second level, cascaded
> intc1_0: interrupt-controller@14c18100 {
>     compatible = "aspeed,ast2700-intc-ic";
>     reg = <...>;
>     interrupt-controller;
>     #interrupt-cells = <2>;
>     interrupts-extended = <&intc0_11 0 IRQ_TYPE_LEVEL_HIGH>;

This looks like changing the meaning of the interrupt. What was the
interrupt here before? What interrupt is here now?

> };
> In yaml, I can use:
> oneOf:
>   - required: [interrupts]
>   - required: [interrupts-extended]
> This allows both cases to be valid.


Hm? Since when you need both cases?


Best regards,
Krzysztof

