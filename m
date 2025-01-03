Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A94E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3pSsdfYoudcRtCx8YptBuJtOn3D3iws60+iI6H2PHY=; b=O1+0HO2PGqyL/936jjNzGqMDlL
	p3M0xLSn1EYGW4119pP74/YOA/mmVVjwVqsWBi5oZ9b7Wgw+/Avd3UyvhHEvfaH0d1VE83KVMjGs8
	87oqRM7wfqwPIZWzUI+k5TV+KuWBM+AJNsNykt37LFyxbRwXLT8Y5BHCv8g15iIj+lLmB0Nb9ah21
	pdMFw9Z2r3xPlh8b3yGpiY1X8HjvMNAynVmtOA4BQDqteLuhByDztLVzZjHNK54J9RQ5xLZyrFKFr
	28H3h4OCvXdXH+hSfL36jpzqZkyZbBNfo9nakFGulRCbJrQqmsw0SgoPWpvrtXmfHYP5OUklk4AuJ
	icIEhV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTk5C-0000000DMJJ-1FX0;
	Fri, 03 Jan 2025 15:59:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTk3y-0000000DM69-2prY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:58:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B42DBA40F73;
	Fri,  3 Jan 2025 15:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AA1C4CECE;
	Fri,  3 Jan 2025 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735919893;
	bh=3IrzjT6gl+FaklBooWlxoSBBE08JetmJ/xWsWjvZdcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eBXx4Igk/IJlguIVS/gVKj8Y4JnuLL/cOIQIFBJBrEN4jtag9uR6hfNHphj14nP9M
	 5xrHGkif3DKCN0siUBKXX6sXZpK+0qYm4YIwW7uGrldZy2yVnd0JkxjjC9l5yZTaIf
	 TkgQDQdZMgr7vPnifgQYnbhey8Y1zn8poKQ63Mlyspn8NR1OzO4dZxwXCTraPCHel0
	 Dmu967JD2uLWNmv7sVNBRt+yCSncCXxqQDC6uCeHEAdbZwWCjp5EiYEhkNvALz/eXc
	 zb9j0CON6IfuOyyVRnCUP3TWOCJcr92mXaOBvVVcvSiFoGKbLQ9Y3pNOYdB8twoGpW
	 fjoO4nL4Yk9rQ==
Message-ID: <5deaaba3-9acf-4715-85d1-6c1f62ccc604@kernel.org>
Date: Fri, 3 Jan 2025 16:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: morello: Add support for common
 functionalities
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>
References: <20250102155416.13159-1-vincenzo.frascino@arm.com>
 <20250102155416.13159-3-vincenzo.frascino@arm.com>
 <b6grcxwvic33ojj3o46sjjvlyc2xwcy247n7ls4lyzkwhd73gs@pxi533kjm3yx>
 <9f430795-03c4-4ff4-ad71-92273877459a@arm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9f430795-03c4-4ff4-ad71-92273877459a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_075814_854766_E6028F8C 
X-CRM114-Status: GOOD (  19.67  )
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

On 03/01/2025 16:32, Vincenzo Frascino wrote:
> 
> 
> On 03/01/2025 07:53, Krzysztof Kozlowski wrote:
>> On Thu, Jan 02, 2025 at 03:54:14PM +0000, Vincenzo Frascino wrote:
>>> The Morello architecture is an experimental extension to Armv8.2-A,
>>> which extends the AArch64 state with the principles proposed in
>>> version 7 of the Capability Hardware Enhanced RISC Instructions
>>> (CHERI) ISA.
>>>
>>> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
>>> some functionalities that have conveniently been included in
>>> morello.dtsi to avoid duplication.
>>>
>>> Introduce morello.dtsi.
>>>
>>> Note: Morello fvp will be introduced with a future patch series.
>>>
>>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>>> ---
>>>  arch/arm64/boot/dts/arm/morello.dtsi | 341 +++++++++++++++++++++++++++
>>>  1 file changed, 341 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/arm/morello.dtsi b/arch/arm64/boot/dts/arm/morello.dtsi
>>> new file mode 100644
>>> index 000000000000..67bc960f4596
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/arm/morello.dtsi
>>> @@ -0,0 +1,341 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>> +/*
>>> + * Copyright (c) 2020-2024, Arm Limited. All rights reserved.
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +/ {
>>> +	interrupt-parent = <&gic>;
>>> +
>>> +	#address-cells = <2>;
>>> +	#size-cells = <2>;
>>> +
>>> +	chosen { };
>>
>> Drop
> 
> Fine, I will do it in the next iteration. The file you asked me to see
> (sm8650.dtsi) has the same expression. 


Because it did exactly the same as you here - copied it.

> Why this is incorrect? What's the rationale?


Redundant, makes this code unnecessary bigger and raises question: what
if something relies on it but the actual dependency is not
expressed/documented?

...

> 
>>> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>>> +			clocks = <&dpu_aclk>;
>>> +
>>> +			hdmi_tx: hdmi-transmitter@70 {
>>> +				compatible = "nxp,tda998x";
>>> +				reg = <0x70>;
>>> +				video-ports = <0x234501>;
>>> +				port {
>>> +					tda998x_0_input: endpoint {
>>> +						remote-endpoint = <&dp_pl0_out0>;
>>> +					};
>>> +				};
>>> +			};
>>> +		};
>>> +
>>> +		gic: interrupt-controller@2c010000 {
>>> +			compatible = "arm,gic-v3";
>>> +			#address-cells = <2>;
>>> +			#interrupt-cells = <3>;
>>> +			#size-cells = <2>;
>>> +			ranges;
>>
>>
>> Missing reg.... and why do you have ranges here? No children.
>>
> 
> I will remove it in the next iteration.
> 


Next patch brought some answers here. I just don't get why entire GIC is
not part of the DTSI.


Best regards,
Krzysztof

