Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E9BC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 21:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLCAM/aenf/B6rJGb3K/NYYxfklMigmm0bvZNOcD3CE=; b=X+o9cxiMkHMWqs5sO5y192Eb0L
	3yIUaZe6A7n/5KkftKkVV/QSTBOnJVsowt2YokjbCbUUEXnszqh+R8M44+yZ06V9PG1hgMF7aTqMJ
	zvjdQMOXQDVTWEgnEUii8sUSPhUIuw5f+qORIJoEnJjxrBs5BDHQJGpm1t8fm0elNo/o4JZvt+GC5
	R3aMqQ7925Bi0KmQTQc/7R3mwYjfPWnRW/RIxq+ZaIF4O1RoxtNANAxiCxB79VOxvYxn9lVRN5eq4
	ih6qtUYQqAFBBWmlYeGq6dGU+Pz5pkXAD6SydRc0lHKtgkiNqbCO+pMqGaWLFbExHF8EKpgVr7vuU
	N39r8RLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqehR-00000009lss-29GS;
	Mon, 25 Aug 2025 21:25:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqeeg-00000009lRv-45G7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 21:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CAB76023B;
	Mon, 25 Aug 2025 21:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B47C4CEED;
	Mon, 25 Aug 2025 21:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756156975;
	bh=l+302sdoxhUbhMzKkT4wkwdq4eHKUpQjmtWZfxKoga8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UcgMEh3p+CplQZ32HJ2eXNNfERFHlx365eJRZvmWsrUE8QEntcuBZdVWBWBjL6Fck
	 +uwxzDPaocOckAC/Q0YdbYr+xE/kKh/E+NLeDYF1RdVAAL08h6p0TIxvgoLk2hfbDB
	 ZpedqxOv/j02bonBagtjTvG+WOhcW/p+d7J4zqw9ESEKT7w9jrLh7F3tFEXUo3uESj
	 NNl5HjdOrcGIeOX7nZH8Xy7HGDVV9JCZ4edcm5RMfN3QSoy8Mk9JQf5l+OSdcKkd8n
	 KGGULcvX7dr46Ew4nmlswKf/6+jHQJOzLvk5mrkkQ8r6Eg9glMpjmQeg48exFXRMx1
	 urbRBOcojTj3Q==
Date: Mon, 25 Aug 2025 16:22:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, kernel@pengutronix.de, primoz.fiser@norik.com, 
 davem@davemloft.net, festevam@gmail.com, alexandre.torgue@foss.st.com, 
 Markus.Niebel@ew.tq-group.com, krzk+dt@kernel.org, shawnguo@kernel.org, 
 edumazet@google.com, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, s.hauer@pengutronix.de, 
 linux-arm-kernel@lists.infradead.org, pabeni@redhat.com, Frank.Li@nxp.com, 
 kuba@kernel.org, othacehe@gnu.org, linux-kernel@vger.kernel.org, 
 alexander.stein@ew.tq-group.com, mcoquelin.stm32@gmail.com, 
 frieder.schrempf@kontron.de, conor+dt@kernel.org, linux@ew.tq-group.com, 
 imx@lists.linux.dev, andrew+netdev@lunn.ch, netdev@vger.kernel.org, 
 richardcochran@gmail.com
To: Joy Zou <joy.zou@nxp.com>
In-Reply-To: <20250825091223.1378137-1-joy.zou@nxp.com>
References: <20250825091223.1378137-1-joy.zou@nxp.com>
Message-Id: <175615562513.578111.8377939047997958239.robh@kernel.org>
Subject: Re: [PATCH v9 0/6] Add i.MX91 platform support
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


On Mon, 25 Aug 2025 17:12:17 +0800, Joy Zou wrote:
> The design of i.MX91 platform is very similar to i.MX93.
> Extracts the common parts in order to reuse code.
> 
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core.
> - i.MX91 has different pinmux.
> 
> ---
> Changes for v9:
> - rebased onto commit 0f4c93f7eb86 ("Add linux-next specific files for 20250822")
>   to align with latest changes.
> - there is no functional changes for these patches.
> - Link to v8: https://lore.kernel.org/imx/20250806114119.1948624-1-joy.zou@nxp.com/
> 
> Changes for v8:
> - add Reviewed-by tag for patch #2/3/4/5/6/7/8/9/11.
> - modify commit message for patch #10.
> - move imx91 before imx93 in Makefile for patch #6.
> - modify the commit message to keep wrap at 75 chars for patch #5.
> - Link to v7: https://lore.kernel.org/imx/20250728071438.2332382-1-joy.zou@nxp.com/
> 
> Changes for v7:
> - Optimize i.MX91 num_clks hardcode with ARRAY_SIZE()for patch #10.
> - Add new patch in order to optimize i.MX93 num_clks hardcode
>   with ARRAY_SIZE() for patch #9.
> - remove this unused comments for patch #6.
> - align all pinctrl value to the same column for patch #6.
> - add aliases because remove aliases from common dtsi for patch #6.
> - remove fec property eee-broken-1000t from imx91 and imx93 board dts
>   for patch #6 and #7.
> - The aliases are removed from common.dtsi because the imx93.dtsi
>   aliases are removed for patch #4.
> - Add new patch that move aliases from imx93.dtsi to board dts for
>   patch #3.
> - These aliases aren't common, so need to drop in imx93.dtsi for patch #3.
> - Only add aliases using to imx93 board dts for patch #3.
> - patch #3 changes come from review comments:
>   https://lore.kernel.org/imx/4e8f2426-92a1-4c7e-b860-0e10e8dd886c@kernel.org/
> - add clocks constraints in the if-else branch for patch #2.
> - reorder the imx93 and imx91 if-else branch for patch #2.
> - patch #2 changes come from review comments:
>   https://lore.kernel.org/imx/urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26/
> - add Reviewed-by tag for patch #2.
> - Link to v6: https://lore.kernel.org/imx/20250623095732.2139853-1-joy.zou@nxp.com/
> 
> Changes for v6:
> - add changelog in per patch.
> - correct commit message spell for patch #1.
> - merge rename imx93.dtsi to imx91_93_common.dtsi and move i.MX93
>   specific part from imx91_93_common.dtsi to imx93.dtsi for patch #3.
> - modify the commit message for patch #3.
> - restore copyright time and add modification time for common dtsi for
>   patch #3.
> - remove unused map0 label in imx91_93_common.dtsi for patch #3.
> - remove tmu related node for patch #4.
> - remove unused regulators and pinctrl settings for patch #5.
> - add new modification for aliases change patch #6.
> - Link to v5: https://lore.kernel.org/imx/20250613100255.2131800-1-joy.zou@nxp.com/
> 
> Changes for v5:
> - rename imx93.dtsi to imx91_93_common.dtsi.
> - move imx93 specific part from imx91_93_common.dtsi to imx93.dtsi.
> - modify the imx91.dtsi to use imx91_93_common.dtsi.
> - add new the imx93-blk-ctrl binding and driver patch for imx91 support.
> - add new net patch for imx91 support.
> - change node name codec and lsm6dsm into common name audio-codec and
>   inertial-meter, and add BT compatible string for imx91 board dts.
> - Link to v4: https://lore.kernel.org/imx/20250121074017.2819285-1-joy.zou@nxp.com/
> 
> Changes for v4:
> - Add one imx93 patch that add labels in imx93.dtsi
> - modify the references in imx91.dtsi
> - modify the code alignment
> - remove unused newline
> - delete the status property
> - align pad hex values
> - Link to v3: https://lore.kernel.org/imx/20241120094945.3032663-1-pengfei.li_1@nxp.com/
> 
> Changes for v3:
> - Add Conor's ack on patch #1
> - format imx91-11x11-evk.dts with the dt-format tool
> - add lpi2c1 node
> - Link to v2: https://lore.kernel.org/imx/20241118051541.2621360-1-pengfei.li_1@nxp.com/
> 
> Changes for v2:
> - change ddr node pmu compatible
> - remove mu1 and mu2
> - change iomux node compatible and enable 91 pinctrl
> - refine commit message for patch #2
> - change hex to lowercase in pinfunc.h
> - ordering nodes with the dt-format tool
> - Link to v1: https://lore.kernel.org/imx/20241108022703.1877171-1-pengfei.li_1@nxp.com/
> 
> Joy Zou (6):
>   arm64: dts: freescale: move aliases from imx93.dtsi to board dts
>   arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi and
>     modify them
>   arm64: dts: imx91: add i.MX91 dtsi support
>   arm64: dts: freescale: add i.MX91 11x11 EVK basic support
>   arm64: dts: imx93-11x11-evk: remove fec property eee-broken-1000t
>   net: stmmac: imx: add i.MX91 support
> 
>  arch/arm64/boot/dts/freescale/Makefile        |    1 +
>  .../boot/dts/freescale/imx91-11x11-evk.dts    |  674 ++++++++
>  arch/arm64/boot/dts/freescale/imx91-pinfunc.h |  770 +++++++++
>  arch/arm64/boot/dts/freescale/imx91.dtsi      |   71 +
>  .../{imx93.dtsi => imx91_93_common.dtsi}      |  176 +-
>  .../boot/dts/freescale/imx93-11x11-evk.dts    |   20 +-
>  .../boot/dts/freescale/imx93-14x14-evk.dts    |   15 +
>  .../boot/dts/freescale/imx93-9x9-qsb.dts      |   18 +
>  .../dts/freescale/imx93-kontron-bl-osm-s.dts  |   21 +
>  .../dts/freescale/imx93-phyboard-nash.dts     |   21 +
>  .../dts/freescale/imx93-phyboard-segin.dts    |    9 +
>  .../freescale/imx93-tqma9352-mba91xxca.dts    |   11 +
>  .../freescale/imx93-tqma9352-mba93xxca.dts    |   25 +
>  .../freescale/imx93-tqma9352-mba93xxla.dts    |   25 +
>  .../dts/freescale/imx93-var-som-symphony.dts  |   17 +
>  arch/arm64/boot/dts/freescale/imx93.dtsi      | 1518 ++---------------
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |    2 +
>  17 files changed, 1863 insertions(+), 1531 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
>  copy arch/arm64/boot/dts/freescale/{imx93.dtsi => imx91_93_common.dtsi} (90%)
>  rewrite arch/arm64/boot/dts/freescale/imx93.dtsi (97%)
> 
> --
> 2.37.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.17-rc1-2-ge0a4a651f7c8 (best guess, 12/14 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250825091223.1378137-1-joy.zou@nxp.com:

arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: /: failed to match any schema with compatible: ['fsl,imx91-11x11-evk', 'fsl,imx91']
arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: /: failed to match any schema with compatible: ['fsl,imx91-11x11-evk', 'fsl,imx91']
arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: /soc@0/system-controller@4ac10000: failed to match any schema with compatible: ['fsl,imx91-media-blk-ctrl', 'syscon']






