Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC016CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYFyMmosJfCGXPey/kJzbsgDJfoqgAg9lmTWdG1QPGs=; b=gQql2B+UI3ao0OG05I57tTLEIr
	mH+uWxEY59CgyiJtu3fec/65KZajpm6gTtsMGOTYlYtgKl6cxQP+bVCX3O9NYFhkE8VFaEO3jMpU9
	cCNXiP15euq4KPkri1f0L/nuZG8AsmfVL6eKfIH8OL574CG9MBDDxFEg9MEM+waCfoWt3hDZUO1sx
	F0wQI24YbprghcPaagsKHYv0NgCqUteVuoMNGUV2RREOLp2jcMt1hG8HGNUh3l9h7m5dsY5buf1tG
	TFVejFaM2VMwvEQ70YluGmXQpxnb2VVjjtIr29p36Svtmmbn80Lzbp/+tOu0A3L8e9IHSGkgykg1D
	UddFwXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpkU-00000006CRL-22Y5;
	Fri, 31 Oct 2025 14:05:02 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpkR-00000006CQC-2yBl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:05:01 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D76C4202F7E;
	Fri, 31 Oct 2025 15:04:55 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CA781202F7C;
	Fri, 31 Oct 2025 15:04:55 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8372720259;
	Fri, 31 Oct 2025 15:04:55 +0100 (CET)
Date: Fri, 31 Oct 2025 15:04:55 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: Add GMAC Ethernet for S32G2 EVB
 and RDB2 and S32G3 RDB3
Message-ID: <aQTCBwLzhRDl+pH9@lsv051416.swis.nl-cdc01.nxp.com>
References: <20251006-nxp-s32g-boards-v1-1-f70a57b8087f@oss.nxp.com>
 <aP8Ezk_zjo-NZCD4@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP8Ezk_zjo-NZCD4@dragon>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_070500_018387_F92658C9 
X-CRM114-Status: GOOD (  22.99  )
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

On Mon, Oct 27, 2025 at 01:36:14PM +0800, Shawn Guo wrote:
> On Mon, Oct 06, 2025 at 06:31:28PM +0200, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > Add support for the Ethernet connection over GMAC controller connected to
> > the Micrel KSZ9031 Ethernet RGMII PHY located on the boards.
> > 
> > The mentioned GMAC controller is one of two network controllers
> > embedded on the NXP Automotive SoCs S32G2 and S32G3.
> > 
> > The supported boards:
> >  * EVB:  S32G-VNP-EVB with S32G2 SoC
> >  * RDB2: S32G-VNP-RDB2
> >  * RDB3: S32G-VNP-RDB3
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/s32g2.dtsi        | 50 ++++++++++++++++++++++++-
> >  arch/arm64/boot/dts/freescale/s32g274a-evb.dts  | 21 ++++++++++-
> >  arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 19 ++++++++++
> >  arch/arm64/boot/dts/freescale/s32g3.dtsi        | 50 ++++++++++++++++++++++++-
> >  arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 21 ++++++++++-
> >  5 files changed, 157 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> > index d167624d1f0c..d06103e9564e 100644
> > --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> > @@ -3,7 +3,7 @@
> >   * NXP S32G2 SoC family
> >   *
> >   * Copyright (c) 2021 SUSE LLC
> > - * Copyright 2017-2021, 2024 NXP
> > + * Copyright 2017-2021, 2024-2025 NXP
> >   */
> >  
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > @@ -738,5 +738,53 @@ gic: interrupt-controller@50800000 {
> >  			interrupt-controller;
> >  			#interrupt-cells = <3>;
> >  		};
> > +
> > +		gmac0: ethernet@4033c000 {
> 
> Please sort devices in order of unit-address.
> 

Moved up.

> > +			compatible = "nxp,s32g2-dwmac";
> > +			reg = <0x4033c000 0x2000>, /* gmac IP */
> > +			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > +			interrupt-parent = <&gic>;
> > +			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "macirq";
> > +			snps,mtl-rx-config = <&mtl_rx_setup>;
> > +			snps,mtl-tx-config = <&mtl_tx_setup>;
> > +			status = "disabled";
> > +
> > +			mtl_rx_setup: rx-queues-config {
> > +				snps,rx-queues-to-use = <5>;
> > +
> > +				queue0 {
> > +				};
> 
> We usually have newline between nodes.
> 

Added newline between queue subnodes.

> > +				queue1 {
> > +				};
> > +				queue2 {
> > +				};
> > +				queue3 {
> > +				};
> > +				queue4 {
> > +				};
> > +			};
> > +
> > +			mtl_tx_setup: tx-queues-config {
> > +				snps,tx-queues-to-use = <5>;
> > +
> > +				queue0 {
> > +				};
> > +				queue1 {
> > +				};
> > +				queue2 {
> > +				};
> > +				queue3 {
> > +				};
> > +				queue4 {
> > +				};
> > +			};
> > +
> > +			gmac0mdio: mdio {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				compatible = "snps,dwmac-mdio";
> > +			};
> > +		};
> >  	};
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> > index c4a195dd67bf..f020da03979a 100644
> > --- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> > +++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> > @@ -1,7 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> >  /*
> >   * Copyright (c) 2021 SUSE LLC
> > - * Copyright 2019-2021, 2024 NXP
> > + * Copyright 2019-2021, 2024-2025 NXP
> >   */
> >  
> >  /dts-v1/;
> > @@ -15,6 +15,7 @@ / {
> >  
> >  	aliases {
> >  		serial0 = &uart0;
> > +		ethernet0 = &gmac0;
> 
> Sort aliases in alphabetical order.

Swapped.

> 
> Shawn
> 

Prepared v2.
Thanks for review.

/Jan

> >  	};
> >  
> >  	chosen {
> > @@ -43,3 +44,21 @@ &usdhc0 {
> >  	no-1-8-v;
> >  	status = "okay";
> >  };
> > +
> > +&gmac0 {
> > +	clocks = <&clks 24>, <&clks 19>, <&clks 18>, <&clks 15>;
> > +	clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
> > +	phy-mode = "rgmii-id";
> > +	phy-handle = <&rgmiiaphy4>;
> > +	status = "okay";
> > +};
> > +
> > +&gmac0mdio {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	/* KSZ 9031 on RGMII */
> > +	rgmiiaphy4: ethernet-phy@4 {
> > +		reg = <4>;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> > index 4f58be68c818..b9c2f964b3f7 100644
> > --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> > +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> > @@ -16,6 +16,7 @@ / {
> >  	aliases {
> >  		serial0 = &uart0;
> >  		serial1 = &uart1;
> > +		ethernet0 = &gmac0;
> >  	};
> >  
> >  	chosen {
> > @@ -77,3 +78,21 @@ &usdhc0 {
> >  	no-1-8-v;
> >  	status = "okay";
> >  };
> > +
> > +&gmac0 {
> > +	clocks = <&clks 24>, <&clks 19>, <&clks 18>, <&clks 15>;
> > +	clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
> > +	phy-mode = "rgmii-id";
> > +	phy-handle = <&rgmiiaphy1>;
> > +	status = "okay";
> > +};
> > +
> > +&gmac0mdio {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	/* KSZ 9031 on RGMII */
> > +	rgmiiaphy1: ethernet-phy@1 {
> > +		reg = <1>;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > index be3a582ebc1b..e31184847371 100644
> > --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> >  /*
> > - * Copyright 2021-2024 NXP
> > + * Copyright 2021-2025 NXP
> >   *
> >   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> > @@ -883,6 +883,54 @@ gic: interrupt-controller@50800000 {
> >  			      <0x50420000 0x2000>;
> >  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> >  		};
> > +
> > +		gmac0: ethernet@4033c000 {
> > +			compatible = "nxp,s32g2-dwmac";
> > +			reg = <0x4033c000 0x2000>, /* gmac IP */
> > +			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > +			interrupt-parent = <&gic>;
> > +			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "macirq";
> > +			snps,mtl-rx-config = <&mtl_rx_setup>;
> > +			snps,mtl-tx-config = <&mtl_tx_setup>;
> > +			status = "disabled";
> > +
> > +			mtl_rx_setup: rx-queues-config {
> > +				snps,rx-queues-to-use = <5>;
> > +
> > +				queue0 {
> > +				};
> > +				queue1 {
> > +				};
> > +				queue2 {
> > +				};
> > +				queue3 {
> > +				};
> > +				queue4 {
> > +				};
> > +			};
> > +
> > +			mtl_tx_setup: tx-queues-config {
> > +				snps,tx-queues-to-use = <5>;
> > +
> > +				queue0 {
> > +				};
> > +				queue1 {
> > +				};
> > +				queue2 {
> > +				};
> > +				queue3 {
> > +				};
> > +				queue4 {
> > +				};
> > +			};
> > +
> > +			gmac0mdio: mdio {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				compatible = "snps,dwmac-mdio";
> > +			};
> > +		};
> >  	};
> >  
> >  	timer {
> > diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> > index e94f70ad82d9..4a74923789ae 100644
> > --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> > +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> >  /*
> > - * Copyright 2021-2024 NXP
> > + * Copyright 2021-2025 NXP
> >   *
> >   * NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)
> >   */
> > @@ -18,6 +18,7 @@ aliases {
> >  		mmc0 = &usdhc0;
> >  		serial0 = &uart0;
> >  		serial1 = &uart1;
> > +		ethernet0 = &gmac0;
> >  	};
> >  
> >  	chosen {
> > @@ -93,3 +94,21 @@ &usdhc0 {
> >  	disable-wp;
> >  	status = "okay";
> >  };
> > +
> > +&gmac0 {
> > +	clocks = <&clks 24>, <&clks 19>, <&clks 18>, <&clks 15>;
> > +	clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
> > +	phy-mode = "rgmii-id";
> > +	phy-handle = <&rgmiiaphy1>;
> > +	status = "okay";
> > +};
> > +
> > +&gmac0mdio {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	/* KSZ 9031 on RGMII */
> > +	rgmiiaphy1: ethernet-phy@1 {
> > +		reg = <1>;
> > +	};
> > +};
> > 
> > ---
> > base-commit: fd94619c43360eb44d28bd3ef326a4f85c600a07
> > change-id: 20251006-nxp-s32g-boards-2d156255b592
> > 
> > Best regards,
> > -- 
> > Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > 
> > 
> 

