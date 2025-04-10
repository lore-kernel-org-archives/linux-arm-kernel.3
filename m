Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2F7C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 21:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQaIiE3HZdfLJdMeI65g7dqP0JgaFanErXkLlthbif4=; b=qrDyS2s9FXz1y76DblXScH11K5
	OLG3vijFzWCQ5il5KpOWz+fQrGRZUoGAkF0AMU02pKPBi92fiTQEO6SS+GbYy4YkHYlqbjz7J8zxL
	Z6X7F6AiY1Ll5aSfTe4TK3btijjQC5aYtKG2v4LAbKXeAC5FrCxc9vCnGmtNcQrQhLZcE9kmcr2Fi
	7uTDC7tdMVhVDHn0mOEcuebc+8PVgvZMY00a7C5plMpyCkZtLkoOMc5xKEL2cXKArcwsi3qznMycS
	6sVfyqof4HHVJslDja91uoBNZs/AHqO1cFMO5MtAAR8yoRAzdCeQXSuvejjUzdw/tHotb5yuZraOY
	I046sz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2z1S-0000000Brdb-24od;
	Thu, 10 Apr 2025 21:01:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2yzf-0000000BrQc-2hoE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 20:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DC964385F;
	Thu, 10 Apr 2025 20:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0591C4CEDD;
	Thu, 10 Apr 2025 20:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744318767;
	bh=ecHUf2Hpwk+1O+STcd+2A4XQmIHogrxTQ9Qfsd65yEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1/YGJY5o59GBadahGD1tR89MMuhoDVyWrfwPbWC2WmIFRfkO1I3q7C1ionfou5gQ
	 qw31+65qNcKO1aO7auRqDAIqq980sBsJrHIQwj3suyRosRcCKeSsfig1FGlb3bQtNA
	 67pQ9bInybrVNUa/bXoe0K6I/af3uzudSkAbXkKyY2srHwU8uSg7nc/Ta9puCNmxT0
	 dEJtM///RfVWw0t26NJIHXUpkFKiPp+LzEi/RPs2fMKWx0mz+y/z5QwHqp8VatCP0T
	 c/c7l7Z/kOzy3HlkDypmFNu4c1WIyHZc9tkX6kmcc+6J1+RPLA35+EclYWjNJR4LLa
	 uXJoN82QRWu0w==
Date: Thu, 10 Apr 2025 15:59:25 -0500
From: Rob Herring <robh@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [net-next v4 1/5] dt-bindings: net: Add MTIP L2 switch
 description
Message-ID: <20250410205925.GA1041840-robh@kernel.org>
References: <20250407145157.3626463-1-lukma@denx.de>
 <20250407145157.3626463-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145157.3626463-2-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_135927_724515_E211237F 
X-CRM114-Status: GOOD (  23.52  )
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

On Mon, Apr 07, 2025 at 04:51:53PM +0200, Lukasz Majewski wrote:
> This patch provides description of the MTIP L2 switch available in some
> NXP's SOCs - e.g. imx287.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
> Changes for v2:
> - Rename the file to match exactly the compatible
>   (nxp,imx287-mtip-switch)
> 
> Changes for v3:
> - Remove '-' from const:'nxp,imx287-mtip-switch'
> - Use '^port@[12]+$' for port patternProperties
> - Drop status = "okay";
> - Provide proper indentation for 'example' binding (replace 8
>   spaces with 4 spaces)
> - Remove smsc,disable-energy-detect; property
> - Remove interrupt-parent and interrupts properties as not required
> - Remove #address-cells and #size-cells from required properties check
> - remove description from reg:
> - Add $ref: ethernet-switch.yaml#
> 
> Changes for v4:
> - Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and remove already
>   referenced properties
> - Rename file to nxp,imx28-mtip-switch.yaml
> ---
>  .../bindings/net/nxp,imx28-mtip-switch.yaml   | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> new file mode 100644
> index 000000000000..1afaf8029725
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP SoC Ethernet Switch Controller (L2 MoreThanIP switch)
> +
> +maintainers:
> +  - Lukasz Majewski <lukma@denx.de>
> +
> +description:
> +  The 2-port switch ethernet subsystem provides ethernet packet (L2)
> +  communication and can be configured as an ethernet switch. It provides the
> +  reduced media independent interface (RMII), the management data input
> +  output (MDIO) for physical layer device (PHY) management.
> +
> +$ref: ethernet-switch.yaml#/$defs/ethernet-ports
> +

> +patternProperties:
> +  "^(ethernet-)?ports$":

New bindings should only use 'ethernet-ports'.

> +    type: object
> +    additionalProperties: true

But what's this for? I thought you had some constrants for phy-mode and 
phy-handle?

> +
> +properties:
> +  compatible:
> +    const: nxp,imx28-mtip-switch
> +
> +  reg:
> +    maxItems: 1
> +
> +  phy-supply:
> +    description:
> +      Regulator that powers Ethernet PHYs.
> +
> +  clocks:
> +    items:
> +      - description: Register accessing clock
> +      - description: Bus access clock
> +      - description: Output clock for external device - e.g. PHY source clock
> +      - description: IEEE1588 timer clock
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: ahb
> +      - const: enet_out
> +      - const: ptp
> +
> +  interrupts:
> +    items:
> +      - description: Switch interrupt
> +      - description: ENET0 interrupt
> +      - description: ENET1 interrupt
> +
> +  pinctrl-names: true
> +
> +  mdio:
> +    type: object
> +    $ref: mdio.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Specifies the mdio bus in the switch, used as a container for phy nodes.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - mdio
> +  - ethernet-ports
> +
> +additionalProperties: false

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include<dt-bindings/interrupt-controller/irq.h>
> +    switch@800f0000 {
> +        compatible = "nxp,imx28-mtip-switch";
> +        reg = <0x800f0000 0x20000>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&mac0_pins_a>, <&mac1_pins_a>;
> +        phy-supply = <&reg_fec_3v3>;
> +        interrupts = <100>, <101>, <102>;
> +        clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
> +        clock-names = "ipg", "ahb", "enet_out", "ptp";
> +
> +        ethernet-ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            mtip_port1: ethernet-port@1 {
> +                reg = <1>;
> +                label = "lan0";
> +                local-mac-address = [ 00 00 00 00 00 00 ];
> +                phy-mode = "rmii";
> +                phy-handle = <&ethphy0>;
> +            };
> +
> +            mtip_port2: ethernet-port@2 {
> +                reg = <2>;
> +                label = "lan1";
> +                local-mac-address = [ 00 00 00 00 00 00 ];
> +                phy-mode = "rmii";
> +                phy-handle = <&ethphy1>;
> +            };
> +        };
> +
> +        mdio_sw: mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            reset-gpios = <&gpio2 13 0>;
> +            reset-delay-us = <25000>;
> +            reset-post-delay-us = <10000>;
> +
> +            ethphy0: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +
> +            ethphy1: ethernet-phy@1 {
> +                reg = <1>;
> +            };
> +        };
> +    };
> -- 
> 2.39.5
> 

