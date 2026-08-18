Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E030DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BErwctM4A7kxtwrjZRz1X5U4oldam1I7GBohsfgr2L8=; b=Q/wyntGHHbtO/BkrcK9DsWNlvB
	WJBFHDmG23eFN4V3T6DY+wQgSPnRsLuuzHY1AaZbzicpZvM6/TSadaTJHXNzPVqO1MFWAn5lz1I58
	uMfBFrNPnzY8Pwkvh8AI5Wm/gw7sN8Ju0Gl2gtmJ4o0b2Hw+nscLYeTDnH1dx88ltj2lE5J2AIuR2
	oMDNTWQS/7UhCqon4H6tcaEd9Ab08lOoIgN9Bckmw00D5DWEqEWnJjIVADKN2P9bCpS9h0xu8+plq
	+eqvHaYIuRcjirR5mOgOEf5QfqIpSEpBtlatqW8q0rSZpM+G5C4OsO1rh+OKU0Zh1qV64YkYgN+kf
	qvy6KNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLn4-00000008GsO-0Gni;
	Tue, 18 Aug 2026 15:31:50 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLn2-00000008Grk-0i5h;
	Tue, 18 Aug 2026 15:31:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB4E411B470;
	Tue, 18 Aug 2026 17:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787067101;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BErwctM4A7kxtwrjZRz1X5U4oldam1I7GBohsfgr2L8=;
	b=Vx6FSmEBNh0N1N/YLOwOElJGTLiHSvmUgwUDdb3vM5wJkLLBdaMgsNGGSIX6AETHcgBLS7
	Y/vFdp9o1ZB0G+0Qt7aGEEZdHsz0uEaD0/+AThG9/SBthG4or4qe4C1iTsO7phXy43bnc3
	oWiUtcWbMsunQR/VxEx8k/JEcCaMqwqG4y7AjzB+jjVcruWW0mLCXolBtaOsEr6KjNBYOa
	MiwZuJqj6mWBmnEbzKLALNlnIP22rcaskearR9Snkg+n0kOXZgAPPnXTLMH2dFxiaE5r86
	NGN3eUVvRUbRkkZUaM8UB5Cm+BDldbuXZ7Dpt7/lioy1HZpcRl6nFaS6S7uEXw==
Message-ID: <90397158-8119-46fc-9597-fb80846fc18d@nabladev.com>
Date: Tue, 18 Aug 2026 17:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3
 xHCI USB controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-6-marex@nabladev.com>
 <20260818-brainy-burgundy-monkey-fc2a0d@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260818-brainy-burgundy-monkey-fc2a0d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_083148_439701_53A9199C 
X-CRM114-Status: GOOD (  14.56  )
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

On 8/18/26 10:15 AM, Krzysztof Kozlowski wrote:
> On Sun, Aug 16, 2026 at 11:37:07PM +0200, Marek Vasut wrote:
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  access-controllers:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 3
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: bus_early
>> +      - const: suspend
>> +
>> +  dr_mode:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum: [host, peripheral, otg]
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  phy-names:
>> +    minItems: 1
>> +    items:
>> +      - const: usb2-phy
>> +      - const: usb3-phy
>> +
>> +  resets:
>> +    minItems: 1
> 
> Hm? You keep coming with some odd style, not present in any other files.
> Where do you see such code - property followed by minItems alone? This
> applies to other places as well.

This should clearly be maxItems: 1, fixed, thanks .

>> +
>> +  st,syscfg:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: Phandle to system configuration controller.
>> +    items:
>> +      - items:
>> +          - description: phandle to syscfg
>> +          - description: USB3DR control offset within syscfg
>> +
>> +  st,enable-port-power-control:
>> +    type: boolean
>> +    description: Enable Host-Mode Port Power Control (bit-3 of capability param HCCPARAMS)
> 
> Why wouldn't this be enavled always? Why is this a board-level property?

A board can have external USB power controller chip like TCPP02/TCPP03 
and the DWC3 IP does not control the port power directly. This seems to 
be common on the STM32MP2 . Hence this property, which disables the port 
power control functionality in DWC3 IP and lets the chip do it instead.

>> +
>> +  st,ovrcur-active-low:
> 
> Don't re-invent stuff:
> st,over-current-active-low

It seems I can even use generic "over-current-active-low" .

>> +    type: boolean
>> +    description: Over-Current signal polarity is active-low
>> +
>> +  st,vbusen-active-low:
>> +    type: boolean
>> +    description: VBUS-ENABLE signal polarity is active-low
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - phys
>> +  - phy-names
>> +  - resets
>> +  - st,syscfg
>> +
>> +unevaluatedProperties: false
> 
> So where did you reference any other schema - for properties here and
> for this unevaluatedProps?

I seem to be getting this one wrong all the time, so let me ask -- when 
do I use unevaluatedProperties:false and when additionalProperties:false 
, what is the rule of thumb here ?

>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>> +
>> +    usb3dr: usb@48300000 {
> 
> Drop unused label
Done, thanks.

