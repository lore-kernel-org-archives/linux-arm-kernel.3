Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA99D44D78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFZk380cV6/9YIdKNXug7XOXwLA3sKvtu/AMTL+SIfM=; b=t/mtFF0/rYIfTcFI+ECg6qDeXV
	I0JNmxcTNER1cR3dNE+PRHur6EXOAuF36OGiVB1valdgRCv4JniB+ef7f7cCm45pDXzZXGns8ii7e
	Hk3f1meV7RZUhn2YpTAMoCOi5wyD4pWaC2qRVE1sK1i4Qy4iEFhR24HGlMo9iFDu0VqH0SeX/wMm7
	kguIxou+e7siGnEQstqTUIIi4qFsN5oNGRyPMD+VzfbWIRQllJo0LK06zCY2xY2yT6vY1L0R1EpVZ
	Sa2e2WUt8ExJCuvGeIvWp6F4onl0Jwc/wMdg9wWpQUOwZQOh7mJpeFTkoTGccdDsvL9xP7cAabcn5
	ON0LNZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h1A-00000003bPK-1pTk;
	Wed, 06 Nov 2024 14:28:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gyv-00000003at3-2Cit;
	Wed, 06 Nov 2024 14:26:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3E6DA43D9F;
	Wed,  6 Nov 2024 14:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3280CC4CEC6;
	Wed,  6 Nov 2024 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730903160;
	bh=sNQN7d+7mMF2pNrk500mlBetX/2XhhGnzLAs9VyZ840=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfLryTKQD1k9UP5jUpSTXyV8PLRs2R1RKdouDoI/PVIQXLEKQA/LNgQUoU0jG5hYb
	 IayngI+HvRQmkjZ2Tx3F2/ka0fgyF6zZQZTbG09yPwSR8w/XNVdinCRzRAwLIKOXGI
	 aW24HABJGgzrlikYGE1m3FfgLZppjxdMNApdWwaKz3kM6LthjFTvYedbdFXjnsXHK/
	 ooZ/sCnr4VW/kKjPcaMXyzeyNWjg/3A52vML2f8L8vpEobXi5USX7OOYdtvi4J3gdv
	 37OMscpJ9O6tBhQ4H9Mgh0LMVmXCsGMplNMoPHIfwyBU5TEeZ/0/XQa7T7pgpwqozI
	 0vLbIrByLmSJw==
Date: Wed, 6 Nov 2024 08:25:58 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/3] dt-bindings: display: rockchip: Add schema for
 RK3588 DW DSI2 controller
Message-ID: <20241106142558.GA3329455-robh@kernel.org>
References: <20241106123304.422854-1-heiko@sntech.de>
 <20241106123304.422854-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106123304.422854-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_062601_723931_781D5C70 
X-CRM114-Status: GOOD (  17.74  )
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

On Wed, Nov 06, 2024 at 01:33:03PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The RK3588 implements this
> specification in its two MIPI DSI-2 Host Controllers that are based on a
> new Synopsis IP.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../rockchip/rockchip,rk3588-mipi-dsi2.yaml   | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
> new file mode 100644
> index 000000000000..8fc6b4a63f06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-mipi-dsi2.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip specific extensions to the Synopsys Designware MIPI DSI2
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3588-mipi-dsi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: sys
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      This SoC uses GRF regs to switch between vopl/vopb.
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: dcphy
> +
> +  ports:

Nodes after properties.

> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input node to receive pixel data.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: DSI output node to panel.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: apb
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - rockchip,grf
> +  - phys
> +  - phy-names
> +  - ports
> +  - reg
> +
> +allOf:
> +  - $ref: ../dsi-controller.yaml#

Absolute path: /schemas/...

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      dsi0: dsi@fde20000 {

Drop unused labels.

> +        compatible = "rockchip,rk3588-mipi-dsi2";
> +        reg = <0x0 0xfde20000 0x0 0x10000>;
> +        interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&cru PCLK_DSIHOST0>, <&cru CLK_DSIHOST0>;
> +        clock-names = "pclk", "sys";
> +        resets = <&cru SRST_P_DSIHOST0>;
> +        reset-names = "apb";
> +        power-domains = <&power RK3588_PD_VOP>;
> +        phys = <&mipidcphy0>;
> +        phy-names = "dcphy";
> +        rockchip,grf = <&vop_grf>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          dsi0_in: port@0 {
> +            reg = <0>;
> +          };
> +
> +          dsi0_out: port@1 {
> +            reg = <1>;
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.45.2
> 

