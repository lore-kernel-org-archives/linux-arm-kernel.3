Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF20C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKpfbxWFHCWJMPd0MtA6m1KCI2Zy5ycZwqT9NywXrYE=; b=s113mQ0v3ZOYKaEsD+/scKKBYB
	8gzeyTHKHn61BpVjbQcScUeFEQBI+pru743nMX4AK5gcLqT7HmHqtdtKPhToKwq1c3AdiHB7V5agp
	h76Bmti3kM8jIcrD8IcFTzodK7cJSKU2g2p140tYzMHkULZYg7DF1RONWROZ3S7vregT45ZhDy52T
	ZkQaY+1ytz5AYAHSd1nbECsbGSbi2TEUmphuUhd7RPq1OBiMiIAoJRCaTtgVde2059hoE6eK3hA45
	dXXAbANizXr+1dV8P/juiJ0uzbKw1DzHxW9VCxBzdh+KJkyPw7yRpQaY//DCAeGgA2knI5+njcWEv
	TMDCJC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRla-0000000FtYB-1ajj;
	Tue, 30 Jun 2026 06:16:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRlZ-0000000FtXl-0ybt;
	Tue, 30 Jun 2026 06:16:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D59D60008;
	Tue, 30 Jun 2026 06:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00711F000E9;
	Tue, 30 Jun 2026 06:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782800176;
	bh=PKpfbxWFHCWJMPd0MtA6m1KCI2Zy5ycZwqT9NywXrYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W+X9KlcvTWyRNceahzNOSAi+hAuwgdXYSaojsYwy8zCJuvWWTvRUYp6/GSjJvC0IO
	 1MutRnXS2H6Sq2TTE9CNIz3WiLKrLbGo/rpAU3HnGDt9QAP01cyw/Irci4EaLgcpAe
	 +1Ve8YvIhgrXbcMa4SX7PW1EjwcDSKdIo6GuYKWr8LK9lAZIUWHqLWkrJFH+GxzGxf
	 nO2hjCryUtJLrwIPtGrImkXftXNQEUD2wgNKtwO1h0tgEItehkBkAEGQnViQwoNHRc
	 Nn5YK3JcoVl5DMqCHr4YGJdmjLZ5Yb53Xfl/BVRgUqXRDuSce9dzFcavxAiZ3O4yGn
	 HQgGshjRWcJyw==
Message-ID: <0f5a408b-5c55-4cd2-831a-49316c9912c9@kernel.org>
Date: Tue, 30 Jun 2026 08:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port OTG support
To: Joey Lu <a0987203069@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-3-a0987203069@gmail.com>
 <20260625-sexy-black-tarantula-4031a6@quoll>
 <24de6a00-ba4e-455b-baa7-479d1cc2edf3@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <24de6a00-ba4e-455b-baa7-479d1cc2edf3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 29/06/2026 12:40, Joey Lu wrote:
> 
> On 6/25/2026 3:58 PM, Krzysztof Kozlowski wrote:
>> On Thu, Jun 25, 2026 at 10:39:56AM +0800, Joey Lu wrote:
>>>   properties:
>>>     compatible:
>>>       enum:
>>>         - nuvoton,ma35d1-usb2-phy
>>>   
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>>     "#phy-cells":
>>> -    const: 0
>>> +    const: 1
>>> +    description:
>>> +      The single cell selects the PHY port. 0 selects the OTG port (USB0,
>>> +      shared with DWC2 gadget controller) and 1 selects the host-only port
>>> +      (USB1).
>>>   
>>> -  clocks:
>>> -    maxItems: 1
>> This is odd, considering that parent does not have clocks. So explain me
>> this:
>> 1. USB PHY needed clocks.
>> 2. You extend USB PHY to cover second part.
>> 3. That extension for second part means that clocks are not needed.
>> Really, how? How is it possible in hardware?
> The hardware has two independent clock domains:
> 
>    - The PHY analog block takes the 24 MHz HXT as its reference, wired
>      directly to the PHY's internal PLL, which derives the required 
> operating
>      frequencies internally. This reference path is entirely outside the SoC
>      software clock tree; no software-gatable clock gate needs to be enabled
>      for the PHY to power up and lock its PLL. The only software control the
>      PHY driver exercises is toggling each PHY's Power-On Reset (POR) bit,
>      which resides in the SYS register block. The driver accesses this via
>      the parent regmap
> 
>    - `HUSBH0_GATE` / `HUSBH1_GATE` / `USBD_GATE` are AHB/APB bus interface
>      clocks for the host and gadget (EHCI, OHCI, DWC2). They gate
>      the register-access path between the CPU and each controller, not 
> the PHY
>      analog circuitry itself.
> 
> The original single-port driver enabled `HUSBH0_GATE` as if it belonged 
> to the
> PHY, but that gate is actually owned by EHCI0/OHCI0 and is already 
> managed by
> those controller drivers through their own `clocks` DTS bindings. The PHY
> driver was redundantly enabling the same gate.
> 
> When extending the driver to cover PHY1, the same pattern held: EHCI1/OHCI1
> manage `HUSBH1_GATE` themselves. There is no clock that belongs 
> exclusively to
> the PHY, so `clocks` will be dropped from the PHY binding entirely.

What driver has to do with it?

You did not answer the question. How adding missing OTG to existing
device causes that hardware to lose a clock? How is it possible?


>>> +  nuvoton,rcalcode:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    minItems: 1
>>> +    maxItems: 2
>> You should require two values. I understand that any PHY is optional,
>> thus you skip the entry, so how would you provide value for PHY1 only?
> `nuvoton,rcalcode` will be changed to require exactly two values
> (`minItems: 2, maxItems: 2`), one for PHY0 and one for PHY1 respectively.
> The property will remain optional overall; when absent, each port 
> retains its
> power-on default value loaded at hardware initialisation. When present, both
> entries must be supplied.

So are you going to implement it or not?


>>> +    items:
>>> +      minimum: 0
>>> +      maximum: 15
>>> +    description:
>>> +      Resistor calibration trim codes for PHY0 and PHY1 respectively.
>>> +      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
>>> +      adjusts the PHY's internal termination resistance. Both entries are
>>> +      optional; when absent the hardware reset default is used.
>>>   
>>> -  nuvoton,sys:
>>> -    $ref: /schemas/types.yaml#/definitions/phandle
>>> +  nuvoton,oc-active-high:
>>> +    type: boolean
>>>       description:
>>> -      phandle to syscon for checking the PHY clock status.
>>> +      When present, the over-current detect input from the VBUS power switch
>>> +      is treated as active-high. The default (property absent) is active-low.
>>> +      This setting is shared by both USB host ports.
>>>   
>>>   required:
>>>     - compatible
>>> +  - reg
>> That's ABI break which was not explained in the commit msg - neither
>> specifying impact nor actually providing reasons why you break ABI.
>>
>> And honestly, you have no resources here except the address, so now it
>> is clear that this should be folded into parent. See DTS101 talk slides.
> The commit message will be updated to explicitly acknowledge the ABI break:
> existing DTS files that contain a standalone `usb-phy` node without a `reg`
> property will fail dt-schema validation after this change. The impact is
> limited to the MA35D1 SoC; no upstream DTS for this SoC existed before this
> patch series, so no in-tree board files are broken. The break is intentional

But all of out of tree users are broken.


Best regards,
Krzysztof

