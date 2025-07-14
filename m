Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B6CC83F2C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24qz9MfpPF/A0eWcTbNAXZUW//EajI9TQdgN1IJk5ag=; b=zuIUvx+fX8eeb8Iu0aFPicHdTL
	iK9wAh4qgie3PiZz9GFQtmEnqXiAFk+8k47VaUA/g+uFocKmh4jRgwi2ZDsX3NMxHTKeBjN3lT7xJ
	2HGCx+HP4taMALRmvY1ReJPaUOw4ncwcNWiiw9YbTMTBBAWW0YfL3B+TIivJaumSrITfnPNv7rfCB
	PBmJF2ZS/tCOAjqukwAPS/F1v9me/FY8PJBe+w0keEhxiJ6tUQ0AGuNUd33CwJgxs++ol+by5ypS/
	kQH22ESoLXcGmTXCujATr7/XA8GbwAxMN6u0beugSBza0Sqp827WQJJG3NPfrTpN42uRsgCpRj+PJ
	MSurrVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFQ-0000000341h-2iKl;
	Mon, 14 Jul 2025 18:49:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL2c-00000002elh-06Ee
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C6DD61424;
	Mon, 14 Jul 2025 15:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E52AC4CEED;
	Mon, 14 Jul 2025 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506668;
	bh=ktNO7LEQdy0GHDB+hXo/q0jiK/4tozOsIx4loGUdtzE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=M+/ooOUJuBz9lMqcBJZ4qIV+TrHdqbA5PVl9isUyRbOd6rVNZCYm1XiXRSu78FFUA
	 t0mfRhK2syI98LZkiXxhnSrrRUuhJpZKFJRtAclT7CHHXvEtqUQ6YtmLUQXNPQvOJ4
	 Wkx62RfNbNQ2ASGrg8qc5rSQRPygCTz2Rb267Zte6LlgY6efaBeC3fK7CDQZ/Ep015
	 DBg2F08cA4k6yAip63HYAJd7+4WxtHl+vJ4/FjN31gqD5g9TsmFISKFv76Y1NU/xP/
	 yU8wCl45TdK9rWvKFtTUQCf/qskpzI5gzI04fVJgCGqNbRezdLSdUjJuqRd+nLVNo7
	 H6tD7MAI/4OMg==
Date: Mon, 14 Jul 2025 10:24:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 linux-kernel@vger.kernel.org, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 linux-clk@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Le Goffic <legoffic.clement@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, Will Deacon <will@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-doc@vger.kernel.org
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
Message-Id: <175250103913.2052612.18370309931037326490.robh@kernel.org>
Subject: Re: [PATCH v2 00/16] Introduce STM32 DDR PMU for STM32MP platforms
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


On Fri, 11 Jul 2025 16:48:52 +0200, Clément Le Goffic wrote:
> This patch series introduces the DDR Performance Monitor (DDRPERFM) support for
> STM32MP platforms.
> 
> The series firstly improves the STM32MP25 RCC driver to make it usable
> as an access controller, needed for driver probe.
> 
> It also includes the addition of device tree bindings, the HDP driver,
> documentation and updates to the device tree files for
> STM32MP13, STM32MP15 and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 DDR PMU driver.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
> Changes in v2:
> - MAINTAINERS:
>     Due to reorganisation, my contract with ST ends at the end of this month
>     and I will no longer have access to this mailbox.
>     Therefore, I will be available for any mission related to embedded and
>     kernel linux.
>     Change email address in MAINTAINERS file for STM32 DDR PMU driver.
> - devicetrees:
>   -stm32mp257f-dk: add LPDDR4 channel
>   -stm32mp257f-ev1: add DDR4 channel
> - dt-bindings:
>   - perf:
>     - Change Maintainer email address
>     - Drop obvious descriptions (clocks and reset property)
>     - Drop redundant "bindings" in commit message
>     - Drop unneedded "stm32mp151-ddr-pmu" compatible
>     - s/st,dram-type/memory-channel/, memory-channel property is not in
>       dtschema library so it will produce an error in the v2.
>   - rcc:
>     - Add required "access-controller-cells" property in example
>   - ddr-channel:
>     - Add bindings as per jedec,lpddrX-channel bindings
> - driver:
>   - Substitute the parsing of the 'st,dram-type' vendor devicetree
>     property value with the parsing of the [lp]ddr channel compatible
>   - Remove unneeded "stm32mp151-ddr-pmu" compatible
>   - Use dev_err_probe when possible
>   - Assert and deassert reset line unconditionnaly
>   - Use `devm_reset_control_get_optional_exclusive` instead of
>     `of_property_present` then `devm_reset_control_get`
>   - Use `devm_clk_get_optional_prepared` instead of `of_property_present`
>     then `devm_clk_get_prepared`
>   - Disable and unprepare the clock at end of probe
>   - Add io.h include as per LKP test report
>   - Removed `of_match_ptr` reference in `platform_driver` struct
>   - Add `pm_sleep_ptr` macro for `platform_driver` struct's `pm` field
>   - Link to v1: https://lore.kernel.org/r/20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com
> 
> ---
> Clément Le Goffic (16):
>       bus: firewall: move stm32_firewall header file in include folder
>       dt-bindings: stm32: stm32mp25: add `access-controller-cell` property
>       clk: stm32mp25: add firewall grant_access ops
>       arm64: dts: st: set rcc as an access-controller
>       dt-bindings: memory: add jedec,ddr[3-4]-channel binding
>       arm64: dts: st: add LPDDR channel to stm32mp257f-dk board
>       arm64: dts: st: add DDR channel to stm32mp257f-ev1 board
>       dt-bindings: perf: stm32: introduce DDRPERFM dt-bindings
>       perf: stm32: introduce DDRPERFM driver
>       Documentation: perf: stm32: add ddrperfm support
>       MAINTAINERS: add myself as STM32 DDR PMU maintainer
>       ARM: dts: stm32: add ddrperfm on stm32mp131
>       ARM: dts: stm32: add ddrperfm on stm32mp151
>       arm64: dts: st: add ddrperfm on stm32mp251
>       arm64: dts: st: support ddrperfm on stm32mp257f-dk
>       arm64: dts: st: support ddrperfm on stm32mp257f-ev1
> 
>  Documentation/admin-guide/perf/index.rst           |   1 +
>  Documentation/admin-guide/perf/stm32-ddr-pmu.rst   |  86 ++
>  .../bindings/clock/st,stm32mp25-rcc.yaml           |   7 +
>  .../memory-controllers/ddr/jedec,ddr-channel.yaml  |  53 ++
>  .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml |  87 ++
>  MAINTAINERS                                        |   7 +
>  arch/arm/boot/dts/st/stm32mp131.dtsi               |   7 +
>  arch/arm/boot/dts/st/stm32mp151.dtsi               |   7 +
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             |   8 +
>  arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  12 +
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  10 +
>  drivers/bus/stm32_etzpc.c                          |   3 +-
>  drivers/bus/stm32_firewall.c                       |   3 +-
>  drivers/bus/stm32_rifsc.c                          |   3 +-
>  drivers/clk/stm32/clk-stm32mp25.c                  |  40 +-
>  drivers/perf/Kconfig                               |  11 +
>  drivers/perf/Makefile                              |   1 +
>  drivers/perf/stm32_ddr_pmu.c                       | 910 +++++++++++++++++++++
>  {drivers => include/linux}/bus/stm32_firewall.h    |   0
>  19 files changed, 1249 insertions(+), 7 deletions(-)
> ---
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> change-id: 20250526-ddrperfm-upstream-bf07f57775da
> 
> Best regards,
> --
> Clément Le Goffic <clement.legoffic@foss.st.com>
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
 Base: using specified base-commit d7b8f8e20813f0179d8ef519541a3527e7661d3a

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com:

arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#






