Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00441C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWR3P9a3VrIV8qP5UgPCHYWIPwa3nmAE5w1K4MebQps=; b=0WlOxwrVahdUQKiCBtZLOsEkKc
	zKSW5QUYfrSjIiq9q4eeMOswNcuNHhpRDLy8txx+JO8aQkDmED4qrqEr138ExxUqOrE5Zr10BNYBv
	H2affBYqsm/GYsZ2xtzIy3wP/gRHZlPXn/WNn8s5C3IkBMutLvpAVfQcY3rlc8N9mBUQU6aAm4oqP
	7vW9coKKyPjO3S3EFxNIr/AhXmSGcH9PMwcA/gC3XOD4kUNB9HmcZYc+cA/CGpASBn3V/LaaeK2Bb
	eHQhz3ogH8fkqxP0ntwk0NwQpCTMarnvg9/yeTWPAIyY08a0msJZROXQacj6HET3C2sZHrvKc3ULm
	t0v01Ohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFS-00000003425-19fM;
	Mon, 14 Jul 2025 18:49:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL2d-00000002emg-405n;
	Mon, 14 Jul 2025 15:24:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09A7A45AE1;
	Mon, 14 Jul 2025 15:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8C6C4CEED;
	Mon, 14 Jul 2025 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506670;
	bh=ebj+x8BRZYtGu0+fsstXx8pq/KEArsv8puj0jnGCTeo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iZHQZOFy58hQK1TSK64A8XEqaieOFuOfXEe6RfCMqk7LwtAtsGFYTHdY41MflNb1B
	 Iu9LpTCtiRvogtl7Y2S3ooz/Ppm7K11IzpBGw5Aj2SrkWdJmpDil7RzHTkqOAsHQzC
	 YJ3I9umQ8HRCcd33qoPXlEaEJLCnx0AVRVURElQVnfTvRGYX++OfzHilQz17SqSMZd
	 jcHfPuWHHb+skUh51KpMgKpewT/ct/f27nxaZY9lTSJQ3WeukfBEbjOdNOalxcLCzB
	 VR25VcbfD5FmAQHtRLkzaFMzXLhV2x1+RDie4mwmpmQl5xYbmCAqbRauk5iHHZ5ATK
	 BNaTxLu/KgAsg==
Date: Mon, 14 Jul 2025 10:24:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Yao Zi <ziyao@disroot.org>, linux-rockchip@lists.infradead.org
To: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250712173805.584586-1-jonas@kwiboo.se>
References: <20250712173805.584586-1-jonas@kwiboo.se>
Message-Id: <175250104064.2052710.11974428601899236231.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_082432_040436_AE8CD9DC 
X-CRM114-Status: GOOD (  19.71  )
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


On Sat, 12 Jul 2025 17:37:42 +0000, Jonas Karlman wrote:
> This series adds dt-bindings and initial device tree for the following
> Rockchip RK3528A boards:
> - Radxa ROCK 2A/2F
> - ArmSoM Sige1
> - FriendlyElec NanoPi Zero2
> 
> The bt/wifi_reg_on pins are described in the device tree using
> rfkill-gpio nodes.
> 
> Changes in v3:
> - Rename led nodes to led-0/led-1
> - Remove pinctrl* props from sdio0
> - Collect a-b tags
> 
> Changes in v2:
> - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
> - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
> - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
> - Add bluetooth and wifi nodes on Sige1
> - Collect t-b tag for NanoPi Zero2
> 
> These boards can be booted from emmc or sd-card using the U-Boot 2025.07
> generic-rk3528 target or work-in-progress patches for these boards [1].
> 
> For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
> Fix UART DMA support for RK3528" [2] is required.
> 
> [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
> [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
> 
> Jonas Karlman (6):
>   dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
>   arm64: dts: rockchip: Add Radxa ROCK 2A/2F
>   dt-bindings: arm: rockchip: Add ArmSoM Sige1
>   arm64: dts: rockchip: Add ArmSoM Sige1
>   dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
>   arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |  17 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>  .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
>  .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
>  .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
>  .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
>  .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>  7 files changed, 1211 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
> 
> --
> 2.49.0
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
 Base: tags/v6.16-rc1-53-g96cbdfdd3ac2 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250712173805.584586-1-jonas@kwiboo.se:

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






