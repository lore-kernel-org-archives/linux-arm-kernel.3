Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EABBCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eETzeTs7x1ObrPGKgoyixQBUN2hNcybRJGCq372veZY=; b=nk+ckK/Ej72yKsgR2+LdHOrWxZ
	fWeAgFlNXWOM23ZL0cUCDjfPbntx54ZcNeSprCfjxeL1ysxcvs/yFGo+Tymp4aGnSEzaX88L2w6A1
	PEgYOnBad8B1ixjqmK2YyjC6uS4RN15uA6g9+FKvkl+ReZ4jmGSXCsphomAcJY7njGXQayVJqRoE/
	rpO8vyPIcM47rWVDwDUD0YCmYxBM4o0p3O0dZpQq/UlwtP0DlyA7SKf8nkqZC91spy3/47bbe6SD0
	JZpePjo1jfkg1BFFcG3Kf1p2venG5d7nRUb7KiEQMyRmdnSnj1luJkPgPdtrH0h965xUW7zHfyIJn
	dJy3RD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqlu-00000009VHr-38DF;
	Mon, 03 Nov 2025 09:22:42 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqls-00000009VHM-2p0l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:22:42 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E617B1A1C9E;
	Mon,  3 Nov 2025 10:22:36 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D946C1A1C6E;
	Mon,  3 Nov 2025 10:22:36 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A68D62025C;
	Mon,  3 Nov 2025 10:22:36 +0100 (CET)
Date: Mon, 3 Nov 2025 10:22:36 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
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
	netdev@vger.kernel.org,
	Enric Balletbo i Serra <eballetb@redhat.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: Add GMAC Ethernet for S32G2
 EVB and RDB2 and S32G3 RDB3
Message-ID: <aQh0XFu+crFwmVeB@lsv051416.swis.nl-cdc01.nxp.com>
References: <20251031-nxp-s32g-boards-v2-1-6e214f247f4e@oss.nxp.com>
 <aQTlPgDLRwOhzD/V@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQTlPgDLRwOhzD/V@lizhi-Precision-Tower-5810>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_012240_869854_FD755C63 
X-CRM114-Status: GOOD (  18.14  )
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

On Fri, Oct 31, 2025 at 12:35:10PM -0400, Frank Li wrote:
> On Fri, Oct 31, 2025 at 03:06:17PM +0100, Jan Petrous via B4 Relay wrote:
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
> > Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> > Changes in v2:
> >  - fixed correct instance orders, include blank lines
> >  - Link to v1: https://lore.kernel.org/r/20251006-nxp-s32g-boards-v1-1-f70a57b8087f@oss.nxp.com
> > ---
> ...
> > +
> > +			gmac0mdio: mdio {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				compatible = "snps,dwmac-mdio";
> 
> compatible should be first property,  Move address(size)-cells after it.
> 

Moved compatible up.

> 
> > +			};
> > +		};
> > +
> >  		gic: interrupt-controller@50800000 {
> >  			compatible = "arm,gic-v3";
> >  			reg = <0x50800000 0x10000>,
> > diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> > index c4a195dd67bf..fb4002a2aa67 100644
> > --- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> > +++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> ...
> > +
> > +&gmac0mdio {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> 
> needn't it here because your dtsi already set it.
> 

Removed.

> Frank
>

Sent v3.
Thanks for review.
/Jan



