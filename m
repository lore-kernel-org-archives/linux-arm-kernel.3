Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF682CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVznKrEnrij0RB/Hlv2EoVhlytvAntMVhI6idUfFh/M=; b=Wx67eNCOGSaCU+QU2yLWWCsWwC
	HLpW5+bxCyckRI5ewFGvZx2fZXiJRFEOGhI1ZZur/t1Tx9FCRpPNqGpHJHkIY+pXr0jpUyn3nxIM1
	krfpdVKt4Qm4shCnWbupmwNPlp5Vels6SmVQ5pErLRwvugii1c3saa+ro+Apv5BXID69XU0anPKTi
	C0zq7PsmHY0hw71PIlfQUCac+AJ94irf+VS27GmFOKu+/HXAT+lN7Weob/6w3v/WoCmYa7VgXAyuD
	CEsiQ4QtclUajTa1t456WjP4Ffj3MjF1q9Ep+8NVu5ZMcxVJqqZuT9zPHlkb17oad3U26ndn9vli0
	OM+CrDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGY3c-0000000DD7t-0lq1;
	Wed, 05 Nov 2025 07:35:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGY3a-0000000DD7a-2ard;
	Wed, 05 Nov 2025 07:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86304601FF;
	Wed,  5 Nov 2025 07:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F404C4CEFB;
	Wed,  5 Nov 2025 07:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762328148;
	bh=BrWa/lzA23oyRXVpHd04uUOezDwX9GRDHz8VGSC/tcQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FHXe7M6i3Dyl1CPBdWHLGb9KKKCS8oXugkm38c2A3fTh3YhLjTYU/CAu8wHLUwcwH
	 zi+xnCqG0E7kWGZJoQ6i6cpF3It6QIwNsRmqoS5mmCteAvvApyI4kr1Aud1c352JKf
	 uijzo0EOaz+Gx77HT0PNhWjAbnVlibJoH/VtP5KjTt/wBR/K45KhEmb8o81EPHrWRl
	 1Zg9G54lW8qXUt+Yo6F1Amue7aiQu9MuVLAALUXVnMZd9FhknV7Xvs0uvQCIkdHEZz
	 VBntuwXrx8FzKUNf/bNFK47I3SPNdJNPwqNI7t4/i7C8xNaes42Z924KoLT7BWutpW
	 SOt4sOsgK15fw==
Message-ID: <89733ddf-8af3-42d0-b6e5-20b7a4ef588c@kernel.org>
Date: Wed, 5 Nov 2025 08:35:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB
 PHY
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Doug Anderson
 <dianders@google.com>, Joy Chakraborty <joychakr@google.com>,
 Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan
 <badhri@google.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20251029214032.3175261-1-royluo@google.com>
 <20251029214032.3175261-2-royluo@google.com>
 <20251030-cunning-copper-jellyfish-1b5f3b@kuoka>
 <CA+zupgxV7SH8Jmghg7HUkWi63dN3m6KLQNBbf+BOQPFbRsiKiw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CA+zupgxV7SH8Jmghg7HUkWi63dN3m6KLQNBbf+BOQPFbRsiKiw@mail.gmail.com>
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

On 01/11/2025 00:45, Roy Luo wrote:
> On Thu, Oct 30, 2025 at 12:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Wed, Oct 29, 2025 at 09:40:31PM +0000, Roy Luo wrote:
>>> Document the device tree bindings for the USB PHY interfaces integrated
>>> with the DWC3 controller on Google Tensor SoCs, starting with G5
>>> generation. The USB PHY on Tensor G5 includes two integrated Synopsys
>>> PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
>>>
>>> Due to a complete architectural overhaul in the Google Tensor G5, the
>>> existing Samsung/Exynos USB PHY binding for older generations of Google
>>> silicons such as gs101 are no longer compatible, necessitating this new
>>> device tree binding.
>>>
>>> Signed-off-by: Roy Luo <royluo@google.com>
>>> ---
>>>  .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++++
>>>  1 file changed, 127 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
>>> new file mode 100644
>>> index 000000000000..8a590036fbac
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
>>> @@ -0,0 +1,127 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (C) 2025, Google LLC
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Google Tensor Series (G5+) USB PHY
>>> +
>>> +maintainers:
>>> +  - Roy Luo <royluo@google.com>
>>> +
>>> +description: |
>>> +  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
>>> +  Google Tensor SoCs, starting with the G5 generation.
>>> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
>>> +  and USB 3.2/DisplayPort combo PHY IP.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: google,gs5-usb-phy
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: USB3.2/DisplayPort combo PHY core registers.
>>> +      - description: USB3.2/DisplayPort combo PHY Type-C Assist registers.
>>> +      - description: USB2 PHY configuration registers.
>>> +      - description: USB3.2/DisplayPort combo PHY top-level registers.
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: usb3_core
>>> +      - const: usb3_tca
>>> +      - const: usb2_cfg
>>> +      - const: usb3_top
>>
>> These prefixes are redundant. Also, you are still referencing here
>> completely different devices. MMIO of IP blocks do not have size of 0xc
>> and they do not span over other blocks (0x0c410000 and then next one is
>> 0x0c637000).
> 
> I'd like to explain why MMIO of IP blocks looks discontinuous.
> As outlined in the description, this device contains two SNPS PHY IPs
> including eUSB2 PHY and USB3.2/DP combo PHY, and is integrated
> with the SNPS DWC3 USB controller. A top-level subsystem wrapper
> sits above the PHYs and controller. This wrapper integrates these IPs
> and is where the Tensor-specific implementation resides. It's essential
> to touch these wrapper registers to control the underlying SNSP IPs.
> Unfortunately, the top-level wrapper's MMIO space lacks a clear
> boundary between these IPs. Specifically, the registers required to
> configure a particular IP are not always adjacent to that IP, and in
> some cases, multiple IPs may even share the same address space.
> 
> The following is the register layout overview:
> - 0xc400000: Dedicated address space for DWC3 controller IP.
> - 0xc410000: Dedicated address space for USB3.2/DP combo PHY IP.
> - 0cc440000: Dedicated address space for the eUSB2 PHY IP.
>                       While this is not in use, it should perhaps be
> called out in
>                       the binding for completeness.
> - 0xc450000: This address range contains top-level wrapper registers
>                       and its space is shared by two devices: the DWC3
>                       controller and the eUSB2 PHY.
>                       It includes control registers for the DWC3 controller
>                       (e.g. hibernation control and interrupt registers) and
>                       the eUSB2 PHY (e.g. registers for USB2 PHY
>                       frequency configuration).
>                       Because the space is shared, the MMIO range for the
>                       PHY becomes fragmented and is only allocated a size
>                       of 0xc, as the remaining registers in this range are
>                       assigned to the DWC3 controller.
> - 0xc460000: This address range contains registers for other blocks
>                       within the same top-level wrapper (such as PCIe PHY
>                       and DP controller) which are not relevant to USB.
> - 0xc637000: Another region of top-level wrapper registers.
>                       This area is relevant to both the eUSB2 PHY IP
>                       (e.g. control register for vbus valid) and USB3.2/DP
>                       combo PHY (e.g. registers relevant to PHY firmware).

To me it all feels like you pick up individual registers from the
common, miscellaneous register region aka syscon.

And if that's the case then you create a narrowly constrained binding
which won't work with next generations where hardware engineers decide
to make that shared region a bigger syscon.

> 
> Thanks for taking the time to go through this wall of text.
> This is definitely not an ideal register layout, but I'm open
> to any suggestions on how best to address this fragmentation.
> If discontinuous MMIO space is a concern, does it make sense to
> make the wrapper registers a syscon node so that it can be
> shared by multiple devices?

0xc450014 looks like that. 0x0c637000, depends how other devices really
use it.

You should post somewhere full DTS for clarity. It's not a requirement
but it actually can answer several questions.

> 
>>
>>
>>> +            reg = <0 0x0c410000 0 0x20000>,
>>> +                  <0 0x0c430000 0 0x1000>,
>>> +                  <0 0x0c450014 0 0xc>,
>>> +                  <0 0x0c637000 0 0xa0>;
>>> +
>>> +  "#phy-cells":
>>> +    description: |
>>> +      The phandle's argument in the PHY specifier selects one of the three
>>> +      following PHY interfaces.
>>> +      - 0 for USB high-speed.
>>> +      - 1 for USB super-speed.
>>> +      - 2 for DisplayPort.
>>> +    const: 1
>>> +
>>> +  clocks:
>>> +    minItems: 2
>>> +    items:
>>> +      - description: USB2 PHY clock.
>>> +      - description: USB2 PHY APB clock.
>>> +      - description: USB3.2/DisplayPort combo PHY clock.
>>> +      - description: USB3.2/DisplayPort combo PHY firmware clock.
>>> +    description:
>>> +      USB3 clocks are optional if the device is intended for USB2-only
>>> +      operation.
>>
>> No, they are not. SoCs are not made that internal wires are being
>> disconnected when you solder it to a different board.
>>
>> I stopped reviewing here.
>>
>> You are making unusual, unexpected big changes after v4. At v4 you
>> received only few nits because the review process was about to finish.
>>
>> Now you rewrite everything so you ask me to re-review from scratch.
> 
> Apologies for the trouble, my intent was to address your feedback on v4
> by describing the USB3/DP PHY block for completeness.
> Like mentioned earlier, this device contains two underlying IPs: eUSB2
> PHY and USB3.2/DP combo PHY. The device can operate in USB2-only
> mode by initializing just the eUSB2 block without touching the USB3
> PHY block - but not the other way around. The v4 patch reflected this
> USB2-only configuration.

You describe the device in your SoC. This SoC either has both or has
not. The case of "can operate in USB2-only mode" is simply not real.

> I tried to support the USB 2.0-only configuration in the binding by
> making the USB 3.0 clocks and resets optional. However, if I
> understand your comment correctly, the binding should describe
> FULL hardware capability. I will make USB3 resources mandatory
> in the next version, please let me know if I've misunderstood it.

Yes, binding should describe complete hardware picture, so with USB3 and
all wires/signals being required.

> 
>>
>>> +
>>> +  clock-names:
>>> +    minItems: 2
>>> +    items:
>>> +      - const: usb2
>>> +      - const: usb2_apb
>>> +      - const: usb3
>>> +      - const: usb3_fw
>>
>> Again, what's with the prefixes? apb is bus clock, so how you could have
>> bus clock for usb2 and usb3? This means you have two busses, so two
>> devices.
> 
> The prefixes are to differentiate the clocks and resets for the
> underlying two SNPS IP as outlined in the device description.
> - eUSB2 PHY IP needs clocks and resets for the phy itself
>   and its apb bus.
> - USB3.2/DP combo PHY has its own clocks and resets for
>   the phy, plus it needs a clock for its PHY firmware.

If you have two bus clocks I think you have two separate devices...

> Technically these are two separate IPs, but they're deeply
> integrated together so that they share top-level wrapper
> register space (see the register layout above), and they
> have implicit hardware dependency like mentioned earlier
> (USB2 PHY can work without USB3 PHY, but not vice-versa),
> hence I'm describing them in the same device.

But okay, if that's the case naming is fine.


Best regards,
Krzysztof

