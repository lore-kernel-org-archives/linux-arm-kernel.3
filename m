Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A144C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHg3eE3AJvCOIOyMGUBO3BqmSAFUzqVjMspTtzJCcEs=; b=yN4H/CLUWAABAZiGiH038DBW9b
	nVg4IM04UlAmGk60Jp6AXSb6lDPuGdO2GA238cPVFm/bz6vztmom2vupKXS6k/LyCt9kuu9tyfAVx
	uDFaiId6FRK5G0InaZwqEgkkgFPI+yVllYR9gaoC7gWCD3RTuCJZOxJDeLR7mjX9qRduFo8G9ZMRd
	oxEIuFE4XD53PejnYeExwdtE/9EHIcgkZ49ZUaurLLJ9KEhssA3ewiIdExsBUW3waYjwLrNGkMl0f
	A4MjuqwDDkQ+WEO9FI1a3pliFaKMOBdEgF1/zS0uIX9clfgJlcNDIFAo5e7LdrEGPl3rLX0DIE0Xb
	d+llePNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHiA-00000005cJb-3fy0;
	Mon, 16 Jun 2025 21:49:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHfK-00000005bga-41k2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16EC34AE77;
	Mon, 16 Jun 2025 21:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F29C4CEEF;
	Mon, 16 Jun 2025 21:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750110414;
	bh=JAcWr9Lih1V6trC/l9AqcHpRyK4rtZChF4W18X2kJtw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LZ7oP5exlRpixAW6HVjAqfY+3PptnMakliboKTugLspswvoEDL/EukMV2JsfYOT5/
	 w57Fhfhl0LySHKbwvConyb5AY76ec7Fggrh3gNEenDMX504qP0ZIoe9U3ctUURG26m
	 3dDP7uVBb44FRvIqSTyWk6y5aXxuV6vGCfOSWL/9zNrLa80D6KY2oS7JmG02eR24yx
	 3OZ4RsepWa7iXOZN1onUHDOhlhGbuJep56coCNxRilnLrrlRr3wagwmqsiAzq5IVfm
	 Dw23FOMsjP0WG/MDPvSGbhC95gL61NBnQpy9tBar52S1rZOf6US23NECnenujSEpWT
	 mg3uO/8AT9f2Q==
Date: Mon, 16 Jun 2025 16:46:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, conor+dt@kernel.org, 
 edumazet@google.com, peng.fan@nxp.com, krzk+dt@kernel.org, 
 catalin.marinas@arm.com, shawnguo@kernel.org, linux-kernel@vger.kernel.org, 
 ping.bai@nxp.com, imx@lists.linux.dev, ye.li@nxp.com, 
 richardcochran@gmail.com, linux-pm@vger.kernel.org, festevam@gmail.com, 
 kuba@kernel.org, davem@davemloft.net, mcoquelin.stm32@gmail.com, 
 linux-stm32@st-md-mailman.stormreply.com, s.hauer@pengutronix.de, 
 linux-arm-kernel@lists.infradead.org, frank.li@nxp.com, pabeni@redhat.com, 
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, alexandre.torgue@foss.st.com, 
 will@kernel.org, ulf.hansson@linaro.org, aisheng.dong@nxp.com, 
 xiaoning.wang@nxp.com
To: Joy Zou <joy.zou@nxp.com>
In-Reply-To: <20250613100255.2131800-1-joy.zou@nxp.com>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
Message-Id: <175011005057.2433615.9910599057752637741.robh@kernel.org>
Subject: Re: [PATCH v5 0/9] Add i.MX91 platform support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_144655_045152_71F62BC7 
X-CRM114-Status: GOOD (  26.25  )
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


On Fri, 13 Jun 2025 18:02:46 +0800, Joy Zou wrote:
> The design of i.MX91 platform is very similar to i.MX93.
> Extracts the common parts in order to reuse code.
> 
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core.
> - i.MX91 has different pinmux.
> - i.MX91 has updated to new temperature sensor same with i.MX95.
> 
> ---
> Changes for v5:
> - rename imx93.dtsi to imx91_93_common.dtsi.
> - move imx93 specific part from imx91_93_common.dtsi to imx93.dtsi.
> - modify the imx91.dtsi to use imx91_93_common.dtsi.
> - add new the imx93-blk-ctrl binding and driver patch for imx91 support.
> - add new net patch for imx91 support.
> - change node name codec and lsm6dsm into common name audio-codec and
>   inertial-meter, and add BT compatible string for imx91 board dts.
> 
> Changes for v4:
> - Add one imx93 patch that add labels in imx93.dtsi
> - modify the references in imx91.dtsi
> - modify the code alignment
> - remove unused newline
> - delete the status property
> - align pad hex values
> 
> Changes for v3:
> - Add Conor's ack on patch #1
> - format imx91-11x11-evk.dts with the dt-format tool
> - add lpi2c1 node
> 
> Changes for v2:
> - change ddr node pmu comaptible
> - remove mu1 and mu2
> - change iomux node compatible and enable 91 pinctrl
> - refine commit message for patch #2
> - change hex to lowercase in pinfunc.h
> - ordering nodes with the dt-format tool
> 
> Joy Zou (8):
>   dt-bindings: soc: imx-blk-ctrl: add i.MX91 blk-ctrl compatible
>   arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi
>   arm64: dts: imx93: move i.MX93 specific part from imx91_93_common.dtsi
>     to imx93.dtsi
>   arm64: dts: imx91: add i.MX91 dtsi support
>   arm64: dts: freescale: add i.MX91 11x11 EVK basic support
>   arm64: defconfig: enable i.MX91 pinctrl
>   pmdomain: imx93-blk-ctrl: mask DSI and PXP PD domain register on
>     i.MX91
>   net: stmmac: imx: add i.MX91 support
> 
> Pengfei Li (1):
>   dt-bindings: arm: fsl: add i.MX91 11x11 evk board
> 
>  .../devicetree/bindings/arm/fsl.yaml          |    6 +
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     |   55 +-
>  arch/arm64/boot/dts/freescale/Makefile        |    1 +
>  .../boot/dts/freescale/imx91-11x11-evk.dts    |  878 ++++++++++
>  arch/arm64/boot/dts/freescale/imx91-pinfunc.h |  770 +++++++++
>  arch/arm64/boot/dts/freescale/imx91.dtsi      |  124 ++
>  .../boot/dts/freescale/imx91_93_common.dtsi   | 1215 ++++++++++++++
>  arch/arm64/boot/dts/freescale/imx93.dtsi      | 1412 ++---------------
>  arch/arm64/configs/defconfig                  |    1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |    2 +
>  drivers/pmdomain/imx/imx93-blk-ctrl.c         |   15 +
>  11 files changed, 3166 insertions(+), 1313 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
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
 Base: tags/v6.16-rc1-6-g8a22d9e79cf0 (best guess, 6/7 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250613100255.2131800-1-joy.zou@nxp.com:

arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: /soc@0/bus@44000000/thermal-sensor@44482000: failed to match any schema with compatible: ['fsl,imx91-tmu']






