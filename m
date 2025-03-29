Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA236C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loomyeiCFnFYgwxoF262fF2k3IXCFxhccdSxr9Y8Ab0=; b=O6MhSoLILy8MxxkcN3umXiBCP9
	va8GtouxA1Q0zu4Yu3+1mhQhyboVwaLMjdufOG3dI+0n83ebYujWdI2fK9O1lujEHJQtkan3c+sbz
	pp0fBR+2mhKy/0VjUDI5mlIbxmk3A7Acs59hCxpwAr9ABpoV7czid2hgLPo93jevuPCMGP+8bpMOK
	ksB2gf+XRvvwDnt2T3Qt3+qFpFoYgVJssYb0dXdhtF8NIgh5g00Ubcr7rNG58J0jerrD55ilGPtkL
	eb/fmZQkI/aefXLEG9tEWm2M7YIyhGYHUpYCMuud47pSzYrlo7AVJ0weo0evXwEB17S9eKxkfVozJ
	fiXz4UhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyZiQ-0000000FLls-32AM;
	Sat, 29 Mar 2025 17:11:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyZgg-0000000FLdj-1MeF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 17:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57764437A5;
	Sat, 29 Mar 2025 17:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620FFC4CEE2;
	Sat, 29 Mar 2025 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743268177;
	bh=Yrw919Z8v9sEOEODycWBG0VcN6JIS2JIx7r8X2SNbqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2e1lVzEIvqf8lTsrBOSozuxtbCArwAs8UQRY23wwkrO922x4WOT97/YmYE1kBx1h
	 hrVMXalk0q6ylxGuY63GwGj7vkUCTafxVvG+KXeW0+LpkmXoXfAPjdw+ZqHFaFbS/m
	 p0km9gIq2073Orqk0UMuOroc/9WQi1mZFq8RtD1mPY76N3y4LD4uk1PUmOGCIMGkoS
	 U/bt8VATBZu9+hSBrfVxZ0zG9WASaNewvAakSIzZ13y2Dzu1j5r4WEwL1gdY7Asa1y
	 Xe/km4URkWd6FU13FL6jv4jaXkN5+sKt5bUpMlooiEHVVLugz7mmuJ7G1vnvOMnLbS
	 xUONiztU+GCmA==
Date: Sat, 29 Mar 2025 12:09:36 -0500
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
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add MTIP L2 switch description
Message-ID: <20250329170936.GA2246988-robh@kernel.org>
References: <20250328133544.4149716-1-lukma@denx.de>
 <20250328133544.4149716-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328133544.4149716-2-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_100938_409327_E377D31E 
X-CRM114-Status: GOOD (  23.15  )
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

On Fri, Mar 28, 2025 at 02:35:41PM +0100, Lukasz Majewski wrote:
> This patch provides description of the MTIP L2 switch available in some
> NXP's SOCs - e.g. imx287.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
> Changes for v2:
> - Rename the file to match exactly the compatible
>   (nxp,imx287-mtip-switch)
> ---
>  .../bindings/net/nxp,imx287-mtip-switch.yaml  | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml b/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> new file mode 100644
> index 000000000000..a3e0fe7783ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,imx287-mtip-switch.yaml#
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
> +properties:
> +  compatible:
> +    const: nxp,imx287-mtip--switch
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The physical base address and size of the MTIP L2 SW module IO range
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
> +  ethernet-ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^port@[0-9]+$":
> +        type: object
> +        description: MTIP L2 switch external ports
> +
> +        $ref: ethernet-controller.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            items:
> +              - enum: [1, 2]
> +            description: MTIP L2 switch port number
> +
> +          label:
> +            description: Label associated with this port
> +
> +        required:
> +          - reg
> +          - label
> +          - phy-mode
> +          - phy-handle
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
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include<dt-bindings/interrupt-controller/irq.h>
> +    switch@800f0000 {
> +        compatible = "nxp,imx287-mtip-switch";
> +        reg = <0x800f0000 0x20000>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&mac0_pins_a>, <&mac1_pins_a>;
> +        phy-supply = <&reg_fec_3v3>;
> +        interrupts = <100>, <101>, <102>;
> +        clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
> +        clock-names = "ipg", "ahb", "enet_out", "ptp";
> +        status = "okay";
> +
> +        ethernet-ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                mtip_port1: port@1 {
> +                        reg = <1>;
> +                        label = "lan0";
> +                        local-mac-address = [ 00 00 00 00 00 00 ];
> +                        phy-mode = "rmii";
> +                        phy-handle = <&ethphy0>;
> +                };
> +
> +                mtip_port2: port@2 {
> +                        reg = <2>;
> +                        label = "lan1";
> +                        local-mac-address = [ 00 00 00 00 00 00 ];
> +                        phy-mode = "rmii";
> +                        phy-handle = <&ethphy1>;
> +                };
> +        };
> +
> +        mdio_sw: mdio {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                reset-gpios = <&gpio2 13 0>;
> +                reset-delay-us = <25000>;
> +                reset-post-delay-us = <10000>;
> +
> +                ethphy0: ethernet-phy@0 {
> +                        reg = <0>;
> +                        smsc,disable-energy-detect;

With a custom property, you should have a specific compatible.

> +                        /* Both PHYs (i.e. 0,1) have the same, single GPIO, */
> +                        /* line to handle both, their interrupts (AND'ed) */
> +                        interrupt-parent = <&gpio4>;
> +                        interrupts = <13 IRQ_TYPE_EDGE_FALLING>;

The error report is because the examples have to guess the number of 
provider interrupt cells and only 1 guess is supported. It guessed 1 
from above.

In any case, unless the phys are built-in and fixed, they are out of 
scope of this binding. So perhaps drop the interrupts and smsc property.

Rob

