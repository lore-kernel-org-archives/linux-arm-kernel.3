Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2B4C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8wM3L8y3ZkfO69CrgimqDumLWjy+MuYPhG5qyC5xmk=; b=v9zClbPVK/R+c707f+iQp9HJvv
	QOlRB4CMtrtemc68DVf0CFwxy8z9H1ATT+jKhOLUABlycScCvRjBjnmvXPWK7Dey5BZ70Z45bf/c3
	413b/MsLVmJTVmZuzYZajSWJqZXKmRxQI29t8Li8VTlmBW4EGhwY6GYI4ibeDmU928ENu29MZabpv
	zZjP5Nx3UATALNztay4o1biIgNhC/Aynxg3DLzsuoN56aMhGA28ul7FUruvHpthJZudd8WfccOh0k
	9xRP9IrVuQIkVcwkWXhyX4ZKK1pEN37QXwPWoSsUzB5jbrJzZTf1VPCQ7byIUnwIqnKJ1jUzY1HkS
	GnZ+CGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVARh-0000000EyDL-1vDM;
	Fri, 27 Jun 2025 14:52:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9ir-0000000ErKM-3i53
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:06:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C8FF5C6A53;
	Fri, 27 Jun 2025 14:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D0DC4CEED;
	Fri, 27 Jun 2025 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751033192;
	bh=cx3cfDqYfml9hV1dbrF3BBDdYHzNauZUQLohSd44LWI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eLwD4NyAv3OzHJZbC3TUTa9zbjGqUYr0wrSJ+Tz/zfIYnIhUNr6bpoWgADe+Q5ZZi
	 DBBgztSpx3jYcQl9m0cUhMhB4be1aLgSYnortrqAS1rH++fKo8+bhlC5LySlZ9GsXt
	 /WdozpPW85WUFjD26uWFt4J5m7IPe9qCjGN1MG79HYauafibsM1EFX4fkytxQEOUdy
	 myFZaDqyVQwEfGFE2PzH+SIICzk9C9W7gAFMxtwv9idi0VyiOVaOSCz4Bo6Tv73iET
	 H3xFuQv9yP35IuZxFDmtvR1x02xNcpfd4EcuOEW7MOmzK/x0LsXIP/VjZ9H9qSUni/
	 j+hBeg+iFzE7g==
Date: Fri, 27 Jun 2025 09:06:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
Message-Id: <175103315202.3220613.9523717145992109827.robh@kernel.org>
Subject: Re: [PATCH v2 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_070634_002394_8EEE970F 
X-CRM114-Status: GOOD (  23.78  )
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


On Fri, 27 Jun 2025 01:43:23 +0530, Kaustabh Chakraborty wrote:
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
> exynosdrm-decon            - https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org
> exynos7870-mipi-phy        A https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
> exynos7870-mipi-phy-fix    - https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
> exynos7870-dsim            - https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org
> panel-samsung-s6e8aa5x01   - https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org
> panel-synaptics-tddi       - https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v2:
> - modified compatible hierarchy to use non-deprecated syntax (krzk)
> - fixed subject prefixes of [v1 2/5], [v1 3/5], [v1 4/5], [v1 5/5] (krzk)
> - removed simplefb nodes instead of disabling it (krzk)
> - added dt-bindings patch to allow mipi-phy node under PMU
> - changed clock names of dsim node
> - Link to v1: https://lore.kernel.org/r/20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org
> 
> ---
> Kaustabh Chakraborty (6):
>       dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
>       dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode
>       arm64: dts: exynos7870: add DSI support
>       arm64: dts: exynos7870-on7xelte: enable display panel support
>       arm64: dts: exynos7870-a2corelte: enable display panel support
>       arm64: dts: exynos7870-j6lte: enable display panel support
> 
>  .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
>  .../soc/samsung/samsung,exynos-sysreg.yaml         |  2 +
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 52 +++++++++----
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 49 ++++++++----
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 51 ++++++++----
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 90 ++++++++++++++++++++++
>  6 files changed, 206 insertions(+), 39 deletions(-)
> ---
> base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
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
 Base: using specified base-commit 1b152eeca84a02bdb648f16b82ef3394007a9dcf

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org:

arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4300-panel']
arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['syna,td4101-panel']
arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/dsi@14800000: failed to match any schema with compatible: ['samsung,exynos7870-mipi-dsi']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: /soc@0/dsi@14800000/panel@0: failed to match any schema with compatible: ['samsung,s6e8aa5x01']
arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb: decon@14830000 (samsung,exynos7870-decon): 'iommus', 'ports' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/samsung/samsung,exynos7-decon.yaml#






