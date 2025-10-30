Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054B0CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uuuCBDSw8a+MUtqAmuKGWwMG/BX8hLINv9CQ7kRW6Q=; b=gGcn0J6KVWV0xLqTUst/a2Dmzw
	dLZDE4aHD6K1tD1+Mg6HnIy2MgoIIPdNITYuEtF4rgvXO33TF1WPFueXvaztJJQJpQX8WAdQ5UMr0
	UYRo9/v0QIz7RTvs0/6RcoHgXKdPuYMY6tJBMCT6WghttLQ7eZxAiUrXou7i2tJow/+Pg+epRAOGn
	hS2m4+ueU3EyorQcQ1WbR7/fVg7hLMvbZIJNoSxD0k6ZeX8dVviZhgWtrm5/BqjyFO0zOMhRt399U
	uFexEbGW+2MSLlX4hEtuC9n8XjHzltJDzpGYiraBL3/rLt9SHesiwrBAQwMY2G1szWROj8xKcasiI
	ROEX7Kww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENEQ-00000003dXM-3eAZ;
	Thu, 30 Oct 2025 07:38:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENEF-00000003dVU-3Zlr;
	Thu, 30 Oct 2025 07:37:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3553A44591;
	Thu, 30 Oct 2025 07:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2C8C4CEF1;
	Thu, 30 Oct 2025 07:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761809871;
	bh=p5DHJywARmB6vgwsW87ali+itZaEbJODsI/RAOXtFCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTu0b8qNGle6R+nWGmP4sNLndzagsCvdS/cbADesFxlULifaO76DGm7ScTcoqCjfZ
	 fP5A7qc+k+GR7FJ13+GWv4Rw59IycUpgKVZ6ZJiGv3Plx/qxok01KYRsRvBcKe9+G1
	 Dv9ssTxAPwWBqV6erVoEaiFEvLsGTUDvIT1icXMUvwlJRE8dHDlaHEnUWomt04+sOz
	 yRTLDWvk0P2VxTjrQpx02G5OaH0kGK3OMmpm3i7lekjMcE1Df15k5rOgRrgWje0dln
	 yGJDcg4EEc5LXOxsc3ty2JeUUHgFecigDQ0w58W0Y0Q30kw1Lh9pkcdXgj3Z2P/PD6
	 iLjEuL9hL0tNg==
Date: Thu, 30 Oct 2025 08:37:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Doug Anderson <dianders@google.com>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: google: Add Google Tensor G5
 USB PHY
Message-ID: <20251030-cunning-copper-jellyfish-1b5f3b@kuoka>
References: <20251029214032.3175261-1-royluo@google.com>
 <20251029214032.3175261-2-royluo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029214032.3175261-2-royluo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_003751_927787_A0074E72 
X-CRM114-Status: GOOD (  21.76  )
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

On Wed, Oct 29, 2025 at 09:40:31PM +0000, Roy Luo wrote:
> Document the device tree bindings for the USB PHY interfaces integrated
> with the DWC3 controller on Google Tensor SoCs, starting with G5
> generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
> 
> Due to a complete architectural overhaul in the Google Tensor G5, the
> existing Samsung/Exynos USB PHY binding for older generations of Google
> silicons such as gs101 are no longer compatible, necessitating this new
> device tree binding.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> new file mode 100644
> index 000000000000..8a590036fbac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025, Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor Series (G5+) USB PHY
> +
> +maintainers:
> +  - Roy Luo <royluo@google.com>
> +
> +description: |
> +  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
> +  Google Tensor SoCs, starting with the G5 generation.
> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
> +  and USB 3.2/DisplayPort combo PHY IP.
> +
> +properties:
> +  compatible:
> +    const: google,gs5-usb-phy
> +
> +  reg:
> +    items:
> +      - description: USB3.2/DisplayPort combo PHY core registers.
> +      - description: USB3.2/DisplayPort combo PHY Type-C Assist registers.
> +      - description: USB2 PHY configuration registers.
> +      - description: USB3.2/DisplayPort combo PHY top-level registers.
> +
> +  reg-names:
> +    items:
> +      - const: usb3_core
> +      - const: usb3_tca
> +      - const: usb2_cfg
> +      - const: usb3_top

These prefixes are redundant. Also, you are still referencing here
completely different devices. MMIO of IP blocks do not have size of 0xc
and they do not span over other blocks (0x0c410000 and then next one is
0x0c637000).


> +            reg = <0 0x0c410000 0 0x20000>,
> +                  <0 0x0c430000 0 0x1000>,
> +                  <0 0x0c450014 0 0xc>,
> +                  <0 0x0c637000 0 0xa0>;
> +
> +  "#phy-cells":
> +    description: |
> +      The phandle's argument in the PHY specifier selects one of the three
> +      following PHY interfaces.
> +      - 0 for USB high-speed.
> +      - 1 for USB super-speed.
> +      - 2 for DisplayPort.
> +    const: 1
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: USB2 PHY clock.
> +      - description: USB2 PHY APB clock.
> +      - description: USB3.2/DisplayPort combo PHY clock.
> +      - description: USB3.2/DisplayPort combo PHY firmware clock.
> +    description:
> +      USB3 clocks are optional if the device is intended for USB2-only
> +      operation.

No, they are not. SoCs are not made that internal wires are being
disconnected when you solder it to a different board.

I stopped reviewing here.

You are making unusual, unexpected big changes after v4. At v4 you
received only few nits because the review process was about to finish.

Now you rewrite everything so you ask me to re-review from scratch.

> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: usb2
> +      - const: usb2_apb
> +      - const: usb3
> +      - const: usb3_fw

Again, what's with the prefixes? apb is bus clock, so how you could have
bus clock for usb2 and usb3? This means you have two busses, so two
devices.

> +
> +  resets:
> +    minItems: 2
> +    items:
> +      - description: USB2 PHY reset.
> +      - description: USB2 PHY APB reset.
> +      - description: USB3.2/DisplayPort combo PHY reset.
> +    description:
> +      USB3 clocks are optional if the device is intended for USB2-only
> +      operation.
> +
> +  reset-names:
> +    minItems: 2
> +    items:
> +      - const: usb2
> +      - const: usb2_apb
> +      - const: usb3

And here?

This all looks like downstream code.

Best regards,
Krzysztof


