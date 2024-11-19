Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FE0D6C285
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 18:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EG0hlpseCEapMGEupQiC/A0S0mf9ZZv+NgMH6SqcII=; b=adDKXflZwtgf4wJtY0+/PzFcYX
	rHE8yWmG9XDlgz50D/3Cg6TRjE+ZFWqOoGYGH/L04H6bvmthN+0/aUuvo67IK29REymQS6abaYdX6
	qnx097XR65FGSCT6UAIwblHav1ouGLSjocnR2qZJ4mWzzIcerhDh2NgqyshqltowAVk19rFPB5PST
	TaJXzrf/EHq/ZUrAgK/8qpwFzoL6hhQoxCRXTMMslIMi0uRuEOLXBuxp8vRrtiWibB/kjmaLqbJ5u
	GxipXFzcoIiuVOgxpgZPPjxO/+zuc9qcbjp97AozKAn7MpmBV2KypI7OsCvO2lCoIhbBkkOuI66LH
	JukuTZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSjK-0000000DLXa-0sjH;
	Tue, 19 Nov 2024 18:13:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSiO-0000000DLOe-2GDZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 18:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECAFE5C01B7;
	Tue, 19 Nov 2024 18:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736BAC4CECF;
	Tue, 19 Nov 2024 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732039959;
	bh=+wbYj1AcnlE6pU8bR4zENHUExkruGEtGXcEXeHgtAlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RjyjfgPEAoxFatLZFmGR2PBmelIKrLaBAqYHegwKX+KelbP31+plkliWveQbHJHJx
	 h+r+tlCjkoQMjFwAFqAC5KTr3xyo7PhyGQe6j/LAEfrXAUdbrBTnL8x61RNogiclOh
	 0VCcpb/pnnxzSZSxOLxUrNTWV9Sk2zkMTRh0PkHCbv7u0keiWqQg6dPNheodVQn2N/
	 TwSUMUOnSK+k6YsMpFtNFPnlWNUC9HCmSYGxkNRvrAAiW4c7Dnc1qIVuQwOdFnIUOi
	 v0lRhl9MQsf8Rblk5Y+qsrLSaB41wL/L6foueUoHGNnd+4e3xJwXzXBts5U+VOQQ3z
	 hU+ZE9CjWVVQA==
Date: Tue, 19 Nov 2024 12:12:37 -0600
From: Rob Herring <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
Message-ID: <20241119181237.GA1871579-robh@kernel.org>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118082707.8504-2-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_101240_665303_F7F1BF92 
X-CRM114-Status: GOOD (  23.18  )
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

On Mon, Nov 18, 2024 at 04:27:05PM +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 173 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> new file mode 100644
> index 000000000000..92cbbcc72f2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> @@ -0,0 +1,173 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton DWMAC glue layer controller
> +
> +maintainers:
> +  - Joey Lu <yclu4@nuvoton.com>
> +
> +description:
> +  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
> +  Synopsys DesignWare MAC (version 3.73a).
> +
> +# We need a select here so we don't match all nodes with 'snps,dwmac'

You mean snps,dwmac-3.70a?

> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - nuvoton,ma35d1-dwmac
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:

oneOf is not correct. I think you wanted 'items'.

> +      - enum:
> +          - nuvoton,ma35d1-dwmac
> +      - const: snps,dwmac-3.70a

But you said above the h/w is 3.73a.

Really, I'd prefer to just drop this because it's not useful on its own. 
But the driver does check for snps,dwmac-3.70a. All those 
of_device_is_compatible() calls in the driver should really be replaced 
with static match data structs.

> +
> +  reg:
> +    description:
> +      Register range should be one of the GMAC interface.

Need to define how many entries and what they are if more than 1.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MAC clock
> +      - description: PTP clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +
> +  nuvoton,sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to access syscon registers.
> +          - description: GMAC interface ID.
> +            enum:
> +              - 0
> +              - 1
> +    description:
> +      A phandle to the syscon with one argument that configures system registers
> +      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: stmmaceth
> +
> +  phy-mode:
> +    enum:
> +      - rmii
> +      - rgmii
> +      - rgmii-id
> +      - rgmii-txid
> +      - rgmii-rxid
> +
> +  phy-handle:
> +    $ref: /schemas/types.yaml#/definitions/phandle

The type is already defined. Drop.

> +    description:
> +      Specifies a reference to a node representing a PHY device.
> +
> +  tx-internal-delay-ps:
> +    enum: [0, 2000]
> +    default: 0
> +    description:
> +      RGMII TX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
> +
> +  rx-internal-delay-ps:
> +    enum: [0, 2000]
> +    default: 0
> +    description:
> +      RGMII RX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
> +
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - nuvoton,sys
> +  - resets
> +  - reset-names
> +  - phy-mode
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
> +    //Example 1

Not a useful comment.

> +    gmac0: ethernet@40120000 {

Drop unused labels.

> +        compatible = "nuvoton,ma35d1-dwmac";
> +        reg = <0x0 0x40120000 0x0 0x10000>;
> +        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq";
> +        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
> +        clock-names = "stmmaceth", "ptp_ref";
> +
> +        nuvoton,sys = <&sys 0>;
> +        resets = <&sys MA35D1_RESET_GMAC0>;
> +        reset-names = "stmmaceth";
> +
> +        phy-mode = "rgmii-id";
> +        phy-handle = <&eth_phy0>;
> +        mdio0: mdio {
> +            compatible = "snps,dwmac-mdio";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            eth_phy0: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +    };
> +
> +  - |
> +    //Example 2
> +    gmac1: ethernet@40130000 {

Drop the example. It's almost the same as the first one.

> +        compatible = "nuvoton,ma35d1-dwmac";
> +        reg = <0x0 0x40130000 0x0 0x10000>;
> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq";
> +        clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
> +        clock-names = "stmmaceth", "ptp_ref";
> +
> +        nuvoton,sys = <&sys 1>;
> +        resets = <&sys MA35D1_RESET_GMAC1>;
> +        reset-names = "stmmaceth";
> +
> +        phy-mode = "rmii";
> +        phy-handle = <&eth_phy1>;
> +        mdio1: mdio {
> +            compatible = "snps,dwmac-mdio";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            eth_phy1: ethernet-phy@1 {
> +                reg = <1>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 4e2ba1bf788c..aecdb3d37b53 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -66,6 +66,7 @@ properties:
>          - ingenic,x2000-mac
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
> +        - nuvoton,ma35d1-dwmac
>          - qcom,qcs404-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos
> -- 
> 2.34.1
> 

