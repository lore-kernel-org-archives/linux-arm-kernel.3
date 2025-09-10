Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847C5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txjGcCfVEiaKedp4h4DBbOOLmlRFP+QO/g38Ui4POo8=; b=hII50Xg6S8+vLhVmnkADl+orXI
	9E62T7A8R5aqrSVVH8SXH6PPsddSiiCjIQRGQ7Rtb19vaGTHXAEg8Fjkz+IACJQiWldFAG4ItVlj6
	rtC8YuO91SaBBYNdiRZel1dY6i9TsbBLYWYgyiOkB5+pzj3yWUlPIotN5BkOLUzhxJzgNLDXdcUwc
	lSc6j4Xsot9R22BgIUr8P9HP8b3Ebw0/CLUuICjoLvQ6hEqqRuYKQGm1MmhaSw4fMLe4novozcgBZ
	NHkBdru+9xavTEosycN10W9tQ3+p0JbEGs88W5MdmeOYI5JSzKQLb5LnnWyGQ4lOjnlsR7XfaFA1z
	J0yxIAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwATj-0000000BfLS-173I;
	Wed, 10 Sep 2025 02:22:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwATg-0000000BfKW-3GWw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:22:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 258644429B;
	Wed, 10 Sep 2025 02:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFFDC4CEF4;
	Wed, 10 Sep 2025 02:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757470952;
	bh=oWlqndBd3eq4k+3ghnP4AOom/bFf4tXLD4z+QR1ca4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQxScFZMdOBLa3xHO6K22mBmbwmsx3oPkoU+o85x9RyqQziu16MlTeR8NTPBNM4bG
	 W1x/PEx8BWo+PJB9oSS7l5WD+NbswC8bv7KasFvlkgPsvMOOhyP54e0h8D97ShEf9f
	 +0V8m5zbdbCL33CT5osJinQ6zV8lrjs7kiVul4tSdj+j8V6pEjuoxZBmdi0XtAy6MX
	 6s3g33HrDbaq5k862b9kZlug+CQouoB92Qm5WtkmJOuHWiNoc5zw0Xc6t3OySodd7j
	 MYsNJU2AC1OG2O8gtn0qcOPy0W64oldeZM+ssA5MF5Qo6G9CfKZzCALwR6W3ZJ5pSl
	 Pl4A7et32MwMA==
Date: Tue, 9 Sep 2025 21:22:30 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v4 01/10] dt-bindings: net: sun8i-emac: Add A523
 GMAC200 compatible
Message-ID: <20250910022230.GA3646514-robh@kernel.org>
References: <20250908181059.1785605-1-wens@kernel.org>
 <20250908181059.1785605-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908181059.1785605-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_192232_865099_1A9F72CD 
X-CRM114-Status: GOOD (  24.35  )
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

On Tue, Sep 09, 2025 at 02:10:50AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The Allwinner A523 SoC family has a second Ethernet controller, called
> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> numbering. This controller, according to BSP sources, is fully
> compatible with a slightly newer version of the Synopsys DWMAC core.
> The glue layer around the controller is the same as found around older
> DWMAC cores on Allwinner SoCs. The only slight difference is that since
> this is the second controller on the SoC, the register for the clock
> delay controls is at a different offset. Last, the integration includes
> a dedicated clock gate for the memory bus and the whole thing is put in
> a separately controllable power domain.
> 
> Add a compatible string entry for it, and work in the requirements for
> a second clock and a power domain.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v2:
> - Added "select" to avoid matching against all dwmac entries
> Changes since v1:
> - Switch to generic (tx|rx)-internal-delay-ps properties
> ---
>  .../net/allwinner,sun8i-a83t-emac.yaml        | 96 ++++++++++++++++++-
>  1 file changed, 94 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> index 2ac709a4c472..9d205c5d93ca 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> @@ -10,6 +10,21 @@ maintainers:
>    - Chen-Yu Tsai <wens@csie.org>
>    - Maxime Ripard <mripard@kernel.org>
>  
> +# We need a select here so we don't match all nodes with 'snps,dwmac'
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - allwinner,sun8i-a83t-emac
> +          - allwinner,sun8i-h3-emac
> +          - allwinner,sun8i-r40-gmac
> +          - allwinner,sun8i-v3s-emac
> +          - allwinner,sun50i-a64-emac
> +          - allwinner,sun55i-a523-gmac200
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      oneOf:
> @@ -26,6 +41,9 @@ properties:
>                - allwinner,sun50i-h616-emac0
>                - allwinner,sun55i-a523-gmac0
>            - const: allwinner,sun50i-a64-emac
> +      - items:
> +          - const: allwinner,sun55i-a523-gmac200
> +          - const: snps,dwmac-4.20a
>  
>    reg:
>      maxItems: 1
> @@ -37,14 +55,19 @@ properties:
>      const: macirq
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    clock-names:
> -    const: stmmaceth
> +    minItems: 1
> +    maxItems: 2

minItems: 1
items:
  - const: stmmaceth
  - const: mbus

>  
>    phy-supply:
>      description: PHY regulator
>  
> +  power-domains:
> +    maxItems: 1
> +
>    syscon:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -191,6 +214,45 @@ allOf:
>              - mdio-parent-bus
>              - mdio@1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun55i-a523-gmac200
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: mbus

Just 'minItems: 2' here.

> +        tx-internal-delay-ps:
> +          default: 0
> +          minimum: 0
> +          maximum: 700
> +          multipleOf: 100
> +          description:
> +            External RGMII PHY TX clock delay chain value in ps.
> +        rx-internal-delay-ps:
> +          default: 0
> +          minimum: 0
> +          maximum: 3100
> +          multipleOf: 100
> +          description:
> +            External RGMII PHY TX clock delay chain value in ps.
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: stmmaceth

maxItems: 1

> +        power-domains: false
> +
> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -323,4 +385,34 @@ examples:
>          };
>      };
>  
> +  - |
> +    ethernet@4510000 {
> +        compatible = "allwinner,sun55i-a523-gmac200",
> +                     "snps,dwmac-4.20a";
> +        reg = <0x04510000 0x10000>;
> +        clocks = <&ccu 117>, <&ccu 79>;
> +        clock-names = "stmmaceth", "mbus";
> +        resets = <&ccu 43>;
> +        reset-names = "stmmaceth";
> +        interrupts = <0 47 4>;
> +        interrupt-names = "macirq";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&rgmii1_pins>;
> +        power-domains = <&pck600 4>;
> +        syscon = <&syscon>;
> +        phy-handle = <&ext_rgmii_phy_1>;
> +        phy-mode = "rgmii-id";
> +        snps,fixed-burst;
> +        snps,axi-config = <&gmac1_stmmac_axi_setup>;
> +
> +        mdio {
> +            compatible = "snps,dwmac-mdio";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ext_rgmii_phy_1: ethernet-phy@1 {
> +                reg = <1>;
> +            };
> +        };
> +    };
>  ...
> -- 
> 2.39.5
> 

