Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80265D63938
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vY+P6653qZd3fvJVitAWCoJniHKg6ESP3O1ck7P9Hes=; b=FLLMOCU22nG50UXn3ZL8Z+ApVh
	w3ESyrfdLdSmrYI/AanFdCdKS6pu4y6oWeKXhCBEPxBgPwaoyNilDZs36HAd4eef2FSZtec82aUEj
	1cLQTbapnrJYE98Ue5ijF4S+J9pdIo42ZLxITEoGpWtUActryAiCdspnibONVCauUmjbnTjDwQIyy
	TQ3qcutT00Iku0TBkbPc64NPD7d1sYpysyI+dxdKxNkX/aLoecQGuBDNkFFP+N88gulfvPQ/MfaAZ
	ZTJoRbjAvEed65HRYoY8lElY2RMT1RlnodP48xz5etzuSqug9CTLh1WOd0IeKFZGB4xgBnhMCvhPO
	z+MYTPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkMB-0000000FN3i-2JGq;
	Wed, 20 Nov 2024 13:02:55 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkLE-0000000FMy5-2RE3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 13:01:58 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B088D201D81;
	Wed, 20 Nov 2024 14:01:54 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AABEC200262;
	Wed, 20 Nov 2024 14:01:54 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 58A4D203C8;
	Wed, 20 Nov 2024 14:01:54 +0100 (CET)
Date: Wed, 20 Nov 2024 14:01:54 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <Zz3dwo5lQZBNpdwM@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
 <20241119203903.GA2249015-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119203903.GA2249015-robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_050156_893542_A10835C0 
X-CRM114-Status: GOOD (  21.58  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 02:39:03PM -0600, Rob Herring wrote:
> On Tue, Nov 19, 2024 at 04:00:19PM +0100, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
> >  2 files changed, 108 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > new file mode 100644
> > index 000000000000..a141e826a295
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2021-2024 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> > +
> > +maintainers:
> > +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > +
> > +description:
> > +  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
> > +  The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> > +  the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> > +  interface over Pinctrl device or the output can be routed
> > +  to the embedded SerDes for SGMII connectivity.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: nxp,s32g2-dwmac
> > +      - items:
> > +        - enum:
> > +            - nxp,s32g3-dwmac
> > +            - nxp,s32r45-dwmac
> > +        - const: nxp,s32g2-dwmac
> > +
> > +  reg:
> > +    items:
> > +      - description: Main GMAC registers
> > +      - description: GMAC PHY mode control register
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-names:
> > +    const: macirq
> > +
> > +  clocks:
> > +    items:
> > +      - description: Main GMAC clock
> > +      - description: Transmit clock
> > +      - description: Receive clock
> > +      - description: PTP reference clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: stmmaceth
> > +      - const: tx
> > +      - const: rx
> > +      - const: ptp_ref
> > +
> > +required:
> > +  - clocks
> > +  - clock-names
> > +
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    bus {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      ethernet@4033c000 {
> > +        compatible = "nxp,s32g2-dwmac";
> > +        reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
> > +              <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
> > +        interrupt-parent = <&gic>;
> > +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names = "macirq";
> > +        snps,mtl-rx-config = <&mtl_rx_setup>;
> > +        snps,mtl-tx-config = <&mtl_tx_setup>;
> > +        clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;
> > +        clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
> > +        phy-mode = "rgmii-id";
> > +        phy-handle = <&phy0>;
> > +
> > +        mtl_rx_setup: rx-queues-config {
> > +          snps,rx-queues-to-use = <5>;
> > +        };
> > +
> > +        mtl_tx_setup: tx-queues-config {
> > +          snps,tx-queues-to-use = <5>;
> > +        };
> > +
> > +        mdio {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +          compatible = "snps,dwmac-mdio";
> > +
> > +          phy0: ethernet-phy@0 {
> > +            reg = <0>;
> > +          };
> > +        };
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 4e2ba1bf788c..a88d1c236eaf 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -66,6 +66,9 @@ properties:
> >          - ingenic,x2000-mac
> >          - loongson,ls2k-dwmac
> >          - loongson,ls7a-dwmac
> > +        - nxp,s32g2-dwmac
> > +        - nxp,s32g3-dwmac
> > +        - nxp,s32r-dwmac
> 
> You really only need to add nxp,s32g2-dwmac since it's always present.

Ok, I will remove those two in v6.

> 
> Other than the yamllint issue,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks.
/Jan

