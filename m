Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733D1C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6wqEYagxvd4/Cj0/ocHirbcZL52gPs/50d+sbM0eO8=; b=XUWXmW1sNbWvqQ6/qlXnyR6z+v
	8/lZE4Q7l6GqLG5c5nu14EeSsp2ML4PBvcdVA70RNHYEIjM83wJ0qQHsSMBIX0ZkreNsrbFFf+jsv
	t7oevSyT19NgEh8K17P0MLiH1P0pKq3ap+Wjhbr4vMIpai5tRGJGE+zVL+3EB64WwCAXfZcRmi5ng
	Zg4siN/GRzs63YzBaMuumYP8Xdcumcz0sW6m1iU+ce2E392MIdn8Z9cKZJ7VsTTOuHkHo8b6nM/TC
	wgyEAYSyvT8lZGQ5pDUpkQRSabJ9Emi6HAcrlQ5bHtC64RhqINFHGe3zcwA4XAMDnLEk2GlnFMuBB
	40iQfwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZhMo-0000000AWnk-2NTM;
	Thu, 10 Jul 2025 02:50:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZhI7-0000000AVxl-41Qi;
	Thu, 10 Jul 2025 02:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFE135C6BD5;
	Thu, 10 Jul 2025 02:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCC7C4CEF5;
	Thu, 10 Jul 2025 02:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752115542;
	bh=DbJ7pzvyLSajFxPAjFNYWqJERvyPy80AQtVzVHLDCDs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GYRDqzqSMAPcWOjTOiM60Ttb6B3Tgp727qClmWixa6Lmprs6KTULXchOBDZS1dneb
	 jjYdqNG7sjQC5hxzo9WY3uCEY26EP4xQMTcOMGBm6BFE54ll1Vg3ixMjoxA+wvS92S
	 sfby6XDLjyiJKvPGAMuwqNMnjfsYWyz6LaxrINr9TaEPSdsdV7EESzwYaxljdcLcAo
	 hv5hr6PpZNpT+s5/1yvPYKLam2UEE+w5AoiuZAzr/ARbxumVnlGiy71X/j0zi5566c
	 U8Bm//c/RGf8W9+FjLr+om46N0KscL9sAsrvO3xfbQgJEa+7uv0FgNlSm/zZ+ClN8N
	 ZMYoaDDS+X2TQ==
Date: Wed, 09 Jul 2025 21:45:41 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>, 
 linux-arm-kernel@lists.infradead.org
To: Yao Zi <ziyao@disroot.org>
In-Reply-To: <aG3vPsUd-FPkhi-S@pie.lan>
References: <20250708224921.2254116-1-jonas@kwiboo.se>
 <20250708224921.2254116-3-jonas@kwiboo.se> <aG3vPsUd-FPkhi-S@pie.lan>
Message-Id: <175211539781.410915.4272303348693567023.robh@kernel.org>
Subject: Re: [PATCH 2/6] arm64: dts: rockchip: Add Radxa ROCK 2A/2F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_194544_379992_C6E4024D 
X-CRM114-Status: GOOD (  25.64  )
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


On Wed, 09 Jul 2025 04:25:34 +0000, Yao Zi wrote:
> On Tue, Jul 08, 2025 at 10:48:52PM +0000, Jonas Karlman wrote:
> > The ROCK 2A and ROCK 2F is a high-performance single board computer
> > developed by Radxa, based on the Rockchip RK3528A SoC.
> >
> > Add initial device tree for the Radxa ROCK 2A and ROCK 2F boards.
> >
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > ---
> > Schematics:
> > - https://dl.radxa.com/rock2/2a/v1.2/radxa_rock_2a_v1.2_schematic.pdf
> > - https://dl.radxa.com/rock2/2f/radxa_rock2f_v1.01_schematic.pdf
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |   2 +
> >  .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 292 ++++++++++++++++++
> >  .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++++
> >  .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
> >  4 files changed, 386 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
> 
> While testing the patch on my Rock 2A board, I noticed one of my SDcard
> that works perfectly on Radxa E20C and NanoPi Zero 2 cannot be correctly
> read out under UHS-125-SDR mode,
> 
> 	# dd if=/dev/mmcblk1 of=/dev/null bs=4M count=4
> 	[   18.616828] mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
> 	[   19.193315] mmc1: Skipping voltage switch
> 	[   19.202046] mmc1: tried to HW reset card, got error -110
> 	[   19.213312] mmcblk1: recovery failed!
> 	[   19.213709] I/O error, dev mmcblk1, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 256 prio class 0
> 	[   19.225201] mmcblk1: recovery failed!
> 	[   19.225530] I/O error, dev mmcblk1, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> 	[   19.226283] Buffer I/O error on dev mmcblk1, logical block 0, async page read
> 	dd: /dev/mmcblk1: I/O error
> 
> which could be reproduced stably.
> 
> the SDMMC controller issued interesting messages during the tuning
> process,
> 
> 	[    0.665246] mmc_host mmc1: Bus speed (slot 0) = 148500000Hz (slot req 150000000Hz, actual 148500000HZ div = 0)
> 	[    0.851940] dwmmc_rockchip ffc30000.mmc: All phases work, using default phase 90.
> 
> but actually it doesn't work with phase = 90. If the frequency is
> limited to 100MHz with max-frequency = <100000000> instead of the
> default 150MHz, tuning results in a very different phase,
> 
> 	[    0.665483] mmc_host mmc1: Bus speed (slot 0) = 99600000Hz (slot req 100000000Hz, actual 99600000HZ div = 0)
> 	[    1.166340] dwmmc_rockchip ffc30000.mmc: Successfully tuned phase to 141
> 
> and the card works, too. If I set rockchip,default-sample-phase to 141
> in devicetree, the card could work at full 150MHz as well.
> 
> I think there's something wrong with the tuning process, or the board's
> design cannot always run reliably at 150MHz.
> 
> Could you reproduce similar failures on Radxa 2A? If so, it may be
> necessary to lower the SDMMC's maximum frequency for the board.
> 
> Regards,
> Yao Zi
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
 Base: tags/v6.16-rc1-34-g7f9509791507 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for aG3vPsUd-FPkhi-S@pie.lan:

arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/power-management@ff600000: failed to match any schema with compatible: ['rockchip,rk3528-pmu', 'syscon', 'simple-mfd']
arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/power-management@ff600000/power-controller: failed to match any schema with compatible: ['rockchip,rk3528-power-controller']
arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: gpu@ff700000 (rockchip,rk3528-mali): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3528-mali', 'arm,mali-450'] is too short
	'allwinner,sun8i-a23-mali' was expected
	'rockchip,rk3528-mali' is not one of ['allwinner,sun4i-a10-mali', 'allwinner,sun7i-a20-mali', 'allwinner,sun8i-h3-mali', 'allwinner,sun8i-r40-mali', 'allwinner,sun50i-a64-mali', 'rockchip,rk3036-mali', 'rockchip,rk3066-mali', 'rockchip,rk3128-mali', 'rockchip,rk3188-mali', 'rockchip,rk3228-mali', 'samsung,exynos4210-mali', 'st,stih410-mali', 'stericsson,db8500-mali', 'xlnx,zynqmp-mali']
	'rockchip,rk3528-mali' is not one of ['allwinner,sun50i-h5-mali', 'amlogic,meson8-mali', 'amlogic,meson8b-mali', 'amlogic,meson-gxbb-mali', 'amlogic,meson-gxl-mali', 'hisilicon,hi6220-mali', 'mediatek,mt7623-mali', 'rockchip,rk3328-mali']
	'allwinner,sun7i-a20-mali' was expected
	'arm,mali-400' was expected
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml#
arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/gpu@ff700000: failed to match any schema with compatible: ['rockchip,rk3528-mali', 'arm,mali-450']
arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/power-management@ff600000: failed to match any schema with compatible: ['rockchip,rk3528-pmu', 'syscon', 'simple-mfd']
arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/power-management@ff600000/power-controller: failed to match any schema with compatible: ['rockchip,rk3528-power-controller']
arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: gpu@ff700000 (rockchip,rk3528-mali): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3528-mali', 'arm,mali-450'] is too short
	'allwinner,sun8i-a23-mali' was expected
	'rockchip,rk3528-mali' is not one of ['allwinner,sun4i-a10-mali', 'allwinner,sun7i-a20-mali', 'allwinner,sun8i-h3-mali', 'allwinner,sun8i-r40-mali', 'allwinner,sun50i-a64-mali', 'rockchip,rk3036-mali', 'rockchip,rk3066-mali', 'rockchip,rk3128-mali', 'rockchip,rk3188-mali', 'rockchip,rk3228-mali', 'samsung,exynos4210-mali', 'st,stih410-mali', 'stericsson,db8500-mali', 'xlnx,zynqmp-mali']
	'rockchip,rk3528-mali' is not one of ['allwinner,sun50i-h5-mali', 'amlogic,meson8-mali', 'amlogic,meson8b-mali', 'amlogic,meson-gxbb-mali', 'amlogic,meson-gxl-mali', 'hisilicon,hi6220-mali', 'mediatek,mt7623-mali', 'rockchip,rk3328-mali']
	'allwinner,sun7i-a20-mali' was expected
	'arm,mali-400' was expected
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml#
arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/gpu@ff700000: failed to match any schema with compatible: ['rockchip,rk3528-mali', 'arm,mali-450']
arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: /soc/power-management@ff600000: failed to match any schema with compatible: ['rockchip,rk3528-pmu', 'syscon', 'simple-mfd']
arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: /soc/power-management@ff600000/power-controller: failed to match any schema with compatible: ['rockchip,rk3528-power-controller']
arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: gpu@ff700000 (rockchip,rk3528-mali): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3528-mali', 'arm,mali-450'] is too short
	'allwinner,sun8i-a23-mali' was expected
	'rockchip,rk3528-mali' is not one of ['allwinner,sun4i-a10-mali', 'allwinner,sun7i-a20-mali', 'allwinner,sun8i-h3-mali', 'allwinner,sun8i-r40-mali', 'allwinner,sun50i-a64-mali', 'rockchip,rk3036-mali', 'rockchip,rk3066-mali', 'rockchip,rk3128-mali', 'rockchip,rk3188-mali', 'rockchip,rk3228-mali', 'samsung,exynos4210-mali', 'st,stih410-mali', 'stericsson,db8500-mali', 'xlnx,zynqmp-mali']
	'rockchip,rk3528-mali' is not one of ['allwinner,sun50i-h5-mali', 'amlogic,meson8-mali', 'amlogic,meson8b-mali', 'amlogic,meson-gxbb-mali', 'amlogic,meson-gxl-mali', 'hisilicon,hi6220-mali', 'mediatek,mt7623-mali', 'rockchip,rk3328-mali']
	'allwinner,sun7i-a20-mali' was expected
	'arm,mali-400' was expected
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml#
arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: /soc/gpu@ff700000: failed to match any schema with compatible: ['rockchip,rk3528-mali', 'arm,mali-450']
arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/power-management@ff600000: failed to match any schema with compatible: ['rockchip,rk3528-pmu', 'syscon', 'simple-mfd']
arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/power-management@ff600000/power-controller: failed to match any schema with compatible: ['rockchip,rk3528-power-controller']
arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: gpu@ff700000 (rockchip,rk3528-mali): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3528-mali', 'arm,mali-450'] is too short
	'allwinner,sun8i-a23-mali' was expected
	'rockchip,rk3528-mali' is not one of ['allwinner,sun4i-a10-mali', 'allwinner,sun7i-a20-mali', 'allwinner,sun8i-h3-mali', 'allwinner,sun8i-r40-mali', 'allwinner,sun50i-a64-mali', 'rockchip,rk3036-mali', 'rockchip,rk3066-mali', 'rockchip,rk3128-mali', 'rockchip,rk3188-mali', 'rockchip,rk3228-mali', 'samsung,exynos4210-mali', 'st,stih410-mali', 'stericsson,db8500-mali', 'xlnx,zynqmp-mali']
	'rockchip,rk3528-mali' is not one of ['allwinner,sun50i-h5-mali', 'amlogic,meson8-mali', 'amlogic,meson8b-mali', 'amlogic,meson-gxbb-mali', 'amlogic,meson-gxl-mali', 'hisilicon,hi6220-mali', 'mediatek,mt7623-mali', 'rockchip,rk3328-mali']
	'allwinner,sun7i-a20-mali' was expected
	'arm,mali-400' was expected
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml#
arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/gpu@ff700000: failed to match any schema with compatible: ['rockchip,rk3528-mali', 'arm,mali-450']






