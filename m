Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9954FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvSLJsSKtV9uXxpBWgcGj79K9jO2mrlDrMJEnzEg0Bo=; b=h9tftAGnrXUyfr9ejbiCCaGb0C
	owQ8Fiu16h7NkhIpSFQCP9Cfrd2ypwhemSgkjHc1KbbUl4XtRm9MqrtOvxXCfzwDpGeEtmchWY/xn
	wr2iuunF7XnyuJa8HmxN1+xtwZeMDUOkMl42PzNyeLCPB4huUIYyjgQkRCnACPvvhv0cNUKV/gazy
	e7z8H2HB1mDlmyiRt1KdkidWjEArLxDibMHoo2WsTH01MyRhqs5C+DYA7N2QjrcIoac6foE4rEsf8
	yI5KHoXYJcijtgGW986q2wE+Cd3stM71L8Yocjjt+6h3l6TZrcejBWrr7SmpfwtReNtW4yp7G6I22
	nLolEt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2QH-0000000DQH6-1yhX;
	Fri, 11 Jul 2025 01:19:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzbX-0000000D8xt-05Nv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 22:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B699644682;
	Thu, 10 Jul 2025 22:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B35C4CEE3;
	Thu, 10 Jul 2025 22:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752185938;
	bh=RxVBwyXBv5LWziR/6/tS4iFFqMsUTBajjCGOPP5GU5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qa6aYs06ohrcMbMTOjTn2wKTdl/OLauQ6W1uuk6tcOhc/BzKbdCpMfuwzcJbPXGvz
	 P70J1etQPpq76UkNWWKPVIKYg259eOEdLiuqqWDn+teo3D1j2qLpziXm0g6CxYO+j2
	 Oli1odsGQatjX0+3xt5fsJdbkCJ66eIUc4IXqQQzxgMvDcjlOOYk5s+01tosaHUdCO
	 6WpwAhy3v6gZ3+L6vzB8RqjQ6a0K//jzWxb1pK/GwQnO1+5hYNtW0f+bWjQGtu2SV8
	 Ee1Zzmar2RDnXFfwBe9NrKV0nkjJM7CT2+1yBqlZAHLBsmYejYBfWfHGkHcZieUkkP
	 zA/U6VhCqVUeQ==
Date: Thu, 10 Jul 2025 17:18:55 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: display: imx: Add bindings for i.MX94
 DCIF
Message-ID: <20250710221855.GA4126646-robh@kernel.org>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-6-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709122332.2874632-6-laurentiu.palcu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_151859_101232_3A501602 
X-CRM114-Status: GOOD (  20.56  )
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

On Wed, Jul 09, 2025 at 03:23:24PM +0300, Laurentiu Palcu wrote:
> DCIF is the i.MX94 Display Controller Interface which is used to
> drive a TFT LCD panel or connects to a display interface depending
> on the chip configuration.

Drop 'bindings for' in the subject. You already said 'bindings' once.

> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/imx/nxp,imx94-dcif.yaml  | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> new file mode 100644
> index 0000000000000..e4cab43c77ebc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX94 Display Control Interface (DCIF)
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +
> +description:
> +  The Display Control Interface(DCIF) is a system master that fetches graphics
> +  stored in memory and displays them on a TFT LCD panel or connects to a
> +  display interface depending on the chip configuration.
> +
> +properties:
> +  compatible:
> +    const: nxp,imx94-dcif
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description:
> +          Interrupt output for CPU domain 0 (controlled by common registers group).
> +      - description:
> +          Interrupt output for CPU domain 1 (controlled by background layer registers group).
> +      - description:
> +          Interrupt output for CPU domain 2 (controlled by foreground layer registers group).
> +
> +  interrupt-names:
> +    items:
> +      - const: common
> +      - const: bg_layer
> +      - const: fg_layer
> +
> +  clocks:
> +    items:
> +      - description: APB bus clock
> +      - description: AXI bus clock
> +      - description: Pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: axi
> +      - const: pix
> +
> +  assigned-clocks:
> +    description: Reference to DISPLAYMIX CSR clock mux.
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    description: Parent of the clock mux.
> +    maxItems: 1

You don't have to document assigned-clocks. Allowed anywhere with 
'clocks'.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  nxp,blk-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: A phandle which points to NXP displaymix blk-ctrl.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Display Pixel Interface(DPI) output port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        display-controller@4b120000 {
> +            compatible = "nxp,imx94-dcif";
> +            reg = <0x0 0x4b120000 0x0 0x300000>;
> +            interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "common", "bg_layer", "fg_layer";
> +            clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
> +            clock-names = "apb", "axi", "pix";
> +            assigned-clocks = <&dispmix_csr 0>;
> +            assigned-clock-parents = <&ldb_pll_pixel>;
> +            power-domains = <&scmi_devpd 11>;
> +            nxp,blk-ctrl = <&dispmix_csr>;
> +
> +            port {
> +                dcif_out: endpoint {
> +                    remote-endpoint = <&ldb_in>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.46.1
> 

