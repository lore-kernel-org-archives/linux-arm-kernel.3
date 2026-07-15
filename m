Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F11C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3mQcEyrJtzUIUxeTEaVv9W7Nl9c/dERPsqjmEowiaQ=; b=288aRYJDNLNxTfqgqRi5uPnvAN
	Ww4dEwzuIRiiQkwFKCqmZNPjpTuDsdGHDvLBMPdpd2ULa5EK1Sbq7d/FgSWdunUhrtIt9ityYWpqv
	Wi/9j2Yf1hLLjQP5hCVD0bRekQK0lUX+wslWgWenl2hJozsP2e+Gys6N3imf5lIj1zylsWAhNKDcX
	osBsQk+KfocJMdAqtLX9lNGdyHevRrygQOscEHG4bjXRqA2vK7wiyX4nhQixO6IqkK3Nrs31xmeA6
	RiDRxd95wrVv/YIO3QO0mklge7nrIzDqrzFVXW6pFksS/8rzMkTHRiwyC3n/7TlmTy4OpB93bNWfQ
	G9H1orcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk16y-0000000FErW-0R2h;
	Wed, 15 Jul 2026 15:01:24 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk16v-0000000FEql-04mm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:01:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9A94B201CD0;
	Wed, 15 Jul 2026 17:01:11 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wk16l-001xBS-1i;
	Wed, 15 Jul 2026 17:01:11 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wk16l-0000000BlOO-1dv7;
	Wed, 15 Jul 2026 17:01:11 +0200
Date: Wed, 15 Jul 2026 17:01:11 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Wei Xu <xuwei5@hisilicon.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, devicetree@vger.kernel.org, Tom Rini <trini@konsulko.com>, 
	imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, Peter Robinson <pbrobinson@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/7] Import optee node from u-boot device trees
Message-ID: <f225zh7v6z2a2lwbtk3lhw3mcsttneba364de5vjl4pcj5gr65@ckuo6hyj46vx>
References: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_080121_364231_BBEE17ED 
X-CRM114-Status: GOOD (  27.48  )
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

Hi Mathieu,

On 26-07-15, Mathieu Dubois-Briand wrote:
> In a recent discussion on the U-Boot mailing list [1], it was found out
> that several platforms were adding the OP-TEE device tree-node thanks to
> some U-Boot specific dtsi. This was deemed as a bad solution, as this
> should instead be added in the DTS files hosted in Linux sources,
> particularly for platforms already using the "upstream" (Linux) device
> tree.
> 
> Most i.MX8 and i.MX9 platforms are already using OF_UPSTREAM
> configuration in U-Boot. Some are not, but are fairly new, so we can
> expect them to use the Linux device tree once their support is a bit
> more stable. So they will benefit from these changes once upstream
> device trees are refreshed in U-Boot.
> 
> STM32MP157 platforms are using OF_UPSTREAM, with similar consequences.
> 
> The two other platforms are using an U-Boot specific device tree, yet
> adding these nodes on the kernel side will help to reduce the
> differences.
> 
> The zynqmp platform was ignored, as a similar change was previously
> reverted [2]. I also ignored a few platforms without direct match
> between U-Boot and Linux dts files.

We do the same in barebox bootloader for all OP-TEE supported i.MX
platforms. Therefore this change would cause a regression for barebox as
well.

Furthermore, this change would cause an anyoing dmesg warning on
platforms which don't use OP-TEE at all, because it's not ensured that
the OP-TEE firmware was actually loaded.

Therefore the bootloader adds the OP-TEE nodes only if the OP-TEE binary
was actually loaded.

Therefore I vote for dynamic adding the nodes and not this static
approach.

Furthermore OP-TEE can provide a DTB overlay fragment with all the
required nodes, which you only need to apply within the bootloader. This
is cleanest way. You only need to provide OP-TEE the DTB location during
runtime.

Regards,
  Marco

> Also add the OP-TEE node on the imx93 FRDM platform device tree: while
> this is not part of U-Boot code today, it is the change that triggered
> the U-Boot discussion.
> 
> [1]: https://lore.kernel.org/all/20260706145906.GW749385@bill-the-cat/
> [2]: https://lore.kernel.org/all/20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com/
> 
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
> Changes in v2:
> - Splitting i.MX8 SoC changes in a separate commit.
> - Adding bootph-pre-ram on stm32mp157c-ed1 reserved memory.
> - Rebased on v7.2-rc3.
> - Link to v1: https://lore.kernel.org/r/20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com
> 
> ---
> Mathieu Dubois-Briand (7):
>       arm64: dts: freescale: Import optee node from u-boot i.MX91 and i.MX93 device trees
>       arm64: dts: freescale: Import optee node from u-boot i.MX8 device trees
>       arm: dts: st: Import optee node from u-boot device trees
>       arm: dts: st: stm32mp157c-ed1: Add bootph-pre-ram tag on optee reserved memory
>       arm64: dts: hisilicon: hi3798cv200-poplar: Import optee node from u-boot device tree
>       arm64: dts: nuvoton: npcm845-evb: Import optee node from u-boot device tree
>       arm64: dts: freescale: imx93-frdm: Add OP-TEE device tree node
> 
>  arch/arm/boot/dts/st/stm32mp157a-dk1.dts                | 17 +++++++++++++++++
>  arch/arm/boot/dts/st/stm32mp157c-ed1.dts                | 14 ++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi               |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi               |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi               |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts       |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts      |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts  |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts       |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts      |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts         |  7 +++++++
>  .../arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts |  7 +++++++
>  arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts  |  7 +++++++
>  .../arm64/boot/dts/freescale/imx93-var-som-symphony.dts |  7 +++++++
>  arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts    |  7 +++++++
>  arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  7 +++++++
>  16 files changed, 129 insertions(+)
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260710-mathieu-uboot-dts-import-69f51bc097d7
> 
> Best regards,
> -- 
> Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

