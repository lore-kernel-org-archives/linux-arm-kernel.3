Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578B8C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcbYXs+5scM2Ewr0ehY0oWRXHkwlQznubZyVEYLUaIk=; b=u1vjGR2X103FAc0FLMo3d9sMmZ
	fAVk+P3ZIqvAHPw6YHH3GJULAJv1VXuVEnCfr5jaUuhGjbhb7P5rTWfe0aqFFYXC7gGoqdPNA6AnD
	l4tJtUCQC1wX3Rh6OaL7I/SpCshkp3lJCuufRr2ygX5yqiD1Bsetp2dFG+dGCig6oivxGv9vjz1Is
	ysR/uTyqMmJjSIPfP2vsVMpzpEyzKQMDG4LLYJeeePkDOK1S4V8KfGUjF/tdVy/IuTUEFcN/njIpT
	9smPeXA7DYqjcWKpGhNwiLN8uS4VxQ4MKShx8/8NIgJgGbFq0m1PdN+Q6Ha5hWKCuByE1fJ6BAK6b
	sIqds2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoSa-0000000EUJz-13ms;
	Thu, 12 Jun 2025 20:23:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoHm-0000000ETH3-3cBQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 20:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A6BF629D7;
	Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7DBC4CEED;
	Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759149;
	bh=sLxW/2gM/xqjmwMF98veHA/94KEa5ynyyYmqAzwLAQk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Xt0LIvRFtNEdszKSMxfx0SHkf4CXLdrEB8u0VRJPpGTd5cqGqlzku5M3Qm1bPm4B/
	 POaxPoE6fOGMo2iKzgOJkYrdJCSQlS/zCmHK37UAZj/5ob+oquaXRjIXAvxgUsC4I3
	 L6nbpjlL4FKMIhTYg0pYm4KJSNrzrX5lz6ZwlLJfwZwddwIhS8QFe5lOn8jVwAW6vt
	 4Xn1TqmV4LccpdsaRQ9xHa9Go/BXQzunnGrHV+WSsPv7JSfv3almt4rky4y1cxjS4y
	 A15oJVNrVzKdF9W5pmA704lE21yKGaFignM+cYUGscM8A3GHiuNAYcWoMMzvITNLSx
	 234fWPDag6aag==
Date: Thu, 12 Jun 2025 15:12:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
Message-Id: <174975871931.2916531.8899085865861205227.robh@kernel.org>
Subject: Re: [PATCH 0/5] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
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


On Thu, 12 Jun 2025 20:53:36 +0530, Kaustabh Chakraborty wrote:
> Exynos7870 has a IP subsystem in its architecture dedicated to display
> management. Notably, this block includes the Display Enhancement
> Controller (DECON), and the DSI Master (DSIM).
> 
> The following series and its sub-series implement all components for a
> functioning display pipeline. All vital information which helped shaping
> up the patches have been retrieved from Exynos7870 vendor kernel sources
> as provided by Samsung.
> 
> Testing has been done on all three devices available upstream, i.e.
> Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2 Core
> (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte). Regrettably,
> I've only been able to test the functionality on video mode, as none of
> the devices have panels working in command mode.
> 
> This series implements changes in the SoC subsystem, which includes
> devicetree additions. It depends on all sub-series listed below:
> (Legend: [R]eviewed, [A]ccepted)
> 
> exynosdrm-decon            - https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org
> exynos7870-mipi-phy        - https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
> exynos7870-dsim            - https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org
> panel-samsung-s6e8aa5x01   - https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org
> panel-synaptics-tddi       - https://lore.kernel.org/r/20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Kaustabh Chakraborty (5):
>       dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
>       arch: arm64: dts: exynos7870: add DSI support
>       arch: arm64: dts: exynos7870-on7xelte: enable display panel support
>       arch: arm64: dts: exynos7870-a2corelte: enable display panel support
>       arch: arm64: dts: exynos7870-j6lte: enable display panel support
> 
>  .../soc/samsung/samsung,exynos-sysreg.yaml         |  6 ++
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 41 ++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 +++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 40 +++++++++
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 94 ++++++++++++++++++++++
>  5 files changed, 219 insertions(+)
> ---
> base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
> change-id: 20250523-exynos7870-drm-dts-87ccab731ba9
> 
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
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
 Base: using specified base-commit 0bb71d301869446810a0b13d3da290bd455d7c78

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org:

arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: False schema does not allow {'compatible': ['samsung,exynos7870-mipi-video-phy'], '#phy-cells': 1, 'samsung,disp-sysreg': [[12]], 'samsung,cam-sysreg': [13], 'phandle': 73}
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam-sysreg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam0-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam1-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy:compatible:0: 'samsung,exynos7870-mipi-video-phy' is not one of ['samsung,s5pv210-mipi-video-phy', 'samsung,exynos5420-mipi-video-phy', 'samsung,exynos5433-mipi-video-phy']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: Unevaluated properties are not allowed ('compatible', 'samsung,cam-sysreg' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/system-controller@10480000/mipi-phy: failed to match any schema with compatible: ['samsung,exynos7870-mipi-video-phy']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4300-panel']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: False schema does not allow {'compatible': ['samsung,exynos7870-mipi-video-phy'], '#phy-cells': 1, 'samsung,disp-sysreg': [[12]], 'samsung,cam-sysreg': [13], 'phandle': 73}
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam-sysreg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam0-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam1-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy:compatible:0: 'samsung,exynos7870-mipi-video-phy' is not one of ['samsung,s5pv210-mipi-video-phy', 'samsung,exynos5420-mipi-video-phy', 'samsung,exynos5433-mipi-video-phy']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: Unevaluated properties are not allowed ('compatible', 'samsung,cam-sysreg' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/system-controller@10480000/mipi-phy: failed to match any schema with compatible: ['samsung,exynos7870-mipi-video-phy']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: False schema does not allow {'compatible': ['samsung,exynos7870-mipi-video-phy'], '#phy-cells': 1, 'samsung,disp-sysreg': [[12]], 'samsung,cam-sysreg': [13], 'phandle': 72}
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam-sysreg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam0-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: 'samsung,cam1-sysreg' is a required property
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy:compatible:0: 'samsung,exynos7870-mipi-video-phy' is not one of ['samsung,s5pv210-mipi-video-phy', 'samsung,exynos5420-mipi-video-phy', 'samsung,exynos5433-mipi-video-phy']
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: system-controller@10480000 (samsung,exynos7870-pmu): mipi-phy: Unevaluated properties are not allowed ('compatible', 'samsung,cam-sysreg' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/system-controller@10480000/mipi-phy: failed to match any schema with compatible: ['samsung,exynos7870-mipi-video-phy']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4101-panel']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['samsung,s6e8aa5x01']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#






