Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEE8C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIdsr5gXWtNVLZz3IikMxQb7g1mtsbNnKsbDKILDn2s=; b=YH0L1vN76oXAWCaKOaWNHd0zmm
	gHnlV9nUCEhEbY1Mo25pCbATFM/9H4t6eOqSxNFOeZ6DjwE5mepq9UEIXyW+F0bTF8Q+MrRa8k4rY
	SEx+7LcbBe1OnjimPQMChrrd6pHb0sCpdyV4EJsXMmrO6EKMW/mfCMNcATgTPmfwpx2evaKVZjDIm
	vPOGWRpQeEJnvg0MGI8dEr+sWfZHSqeyLRWmGuO5GiKocEo9V3mdY2uZ+0ubhie06MCeLzuYllf/A
	6dG34gYB9GyQfgaAh8XJfUdplJ9MRHNTwvnYQczu0lxSUiQ//xSegMERvwa696/cKi51UqDZGtCrr
	Q12yNbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjO-0000000AAXK-3Okv;
	Wed, 09 Jul 2025 22:57:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcGT-00000009u6K-1VQP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 21:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8ED45C4815;
	Wed,  9 Jul 2025 21:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BA6C4CEEF;
	Wed,  9 Jul 2025 21:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752096220;
	bh=iCSfrE/TrVxc40nJx3JknRKRMdnt/HKs/yUc5oeLvDM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=K0oGw1LVnTlhK/zhMAXC0oVNJhwIUbPRBfJVwTX38u2orLbrEXKGBAFnwSSd7rpZ/
	 pxpJBb+G/EQ7zVa4E+r8I4U0sUQ5oXqxJ1SAGdcaX/XD82Sl8gJ7b13tPlsbaVbEqI
	 63TKIs1vrIQBwaIFfDkafCs6AfMeNYRuzgn0G+orhvB0Y0ep9VvxL6N5KBxHlKM641
	 JK6PQZmlfG+d0uwbxkOGQi2VV8iiS+Wn3/xJzFdPPfYop+rIXrQdjwmsWJBzxBCFG6
	 Dl+ttzPmmStjbCSfx5uxzylt4YLROlJfNm5zbhgSKJOyCOs965+y23W2HhFIdONIf5
	 oxR948zhqhLbQ==
Date: Wed, 09 Jul 2025 16:23:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Ulf Hansson <ulf.hansson@linaro.org>, Samuel Holland <samuel@sholland.org>, 
 Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
In-Reply-To: <20250709155343.3765227-1-wens@kernel.org>
References: <20250709155343.3765227-1-wens@kernel.org>
Message-Id: <175209617694.3636022.5179038032273986646.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] allwinner: a523: Add power controllers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_142341_478088_E61408DD 
X-CRM114-Status: GOOD (  26.83  )
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


On Wed, 09 Jul 2025 23:53:39 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi folks,
> 
> This is v2 of my A523 power controllers series.
> 
> Changes since v1:
> - Re-order compatible string entries
> - Fix name of header file to match compatible string
> - Link to v1:
>   https://lore.kernel.org/all/20250627152918.2606728-1-wens@kernel.org/
> 
> This series adds the power controllers found in the Allwinner A523
> family of SoCs. There are two power controllers. One is the same type
> as those found in the D1 SoC, just with a different number of valid
> power domains. The second is (I assume) a unit based on ARM's PCK-600
> power controller. Some of the registers and values match up, but there
> are extra registers for delay controls in the PCK-600's reserved
> register range.
> 
> Patch 1 adds new compatible string entries for both of these
> controllers.
> 
> Patch 2 adds support for the A523 PPU to the existing D1 PPU driver.
> 
> Patch 3 adds a new driver of the PCK-600 unit in the A523 SoC.
> 
> Patch 4 adds device nodes for both of these controllers.
> 
> 
> Please have a look. The power controllers are critical for enabling more
> peripherals, such as display output, camera input, video codecs, the NPU,
> and a second DWMAC-compatible ethernet interface.
> 
> 
> Thanks
> ChenYu
> 
> 
> Chen-Yu Tsai (4):
>   dt-bindings: power: Add A523 PPU and PCK600 power controllers
>   pmdomain: sunxi: sun20i-ppu: add A523 support
>   pmdomain: sunxi: add driver for Allwinner A523's PCK-600 power
>     controller
>   arm64: dts: allwinner: a523: Add power controller device nodes
> 
>  .../power/allwinner,sun20i-d1-ppu.yaml        |   4 +-
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 ++
>  drivers/pmdomain/sunxi/Kconfig                |   8 +
>  drivers/pmdomain/sunxi/Makefile               |   1 +
>  drivers/pmdomain/sunxi/sun20i-ppu.c           |  17 ++
>  drivers/pmdomain/sunxi/sun55i-pck600.c        | 225 ++++++++++++++++++
>  .../power/allwinner,sun55i-a523-pck-600.h     |  15 ++
>  .../power/allwinner,sun55i-a523-ppu.h         |  12 +
>  8 files changed, 299 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pmdomain/sunxi/sun55i-pck600.c
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
> 
> --
> 2.39.5
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
 Base: tags/next-20250709 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/allwinner/' for 20250709155343.3765227-1-wens@kernel.org:

In file included from arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts:8:
arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:11:10: fatal error: dt-bindings/power/allwinner,sun55i-a523-pck600.h: No such file or directory
   11 | #include <dt-bindings/power/allwinner,sun55i-a523-pck600.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb] Error 1
make[2]: *** [scripts/Makefile.build:554: arch/arm64/boot/dts/allwinner] Error 2
make[2]: Target 'arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: allwinner/sun55i-t527-orangepi-4a.dtb] Error 2
In file included from arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts:6:
arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:11:10: fatal error: dt-bindings/power/allwinner,sun55i-a523-pck600.h: No such file or directory
   11 | #include <dt-bindings/power/allwinner,sun55i-a523-pck600.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb] Error 1
make[2]: *** [scripts/Makefile.build:554: arch/arm64/boot/dts/allwinner] Error 2
make[2]: Target 'arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: allwinner/sun55i-h728-x96qpro+.dtb] Error 2
In file included from arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts:6:
arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:11:10: fatal error: dt-bindings/power/allwinner,sun55i-a523-pck600.h: No such file or directory
   11 | #include <dt-bindings/power/allwinner,sun55i-a523-pck600.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb] Error 1
make[2]: *** [scripts/Makefile.build:554: arch/arm64/boot/dts/allwinner] Error 2
make[2]: Target 'arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: allwinner/sun55i-a527-cubie-a5e.dtb] Error 2
In file included from arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts:6:
arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:11:10: fatal error: dt-bindings/power/allwinner,sun55i-a523-pck600.h: No such file or directory
   11 | #include <dt-bindings/power/allwinner,sun55i-a523-pck600.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb] Error 1
make[2]: *** [scripts/Makefile.build:554: arch/arm64/boot/dts/allwinner] Error 2
make[2]: Target 'arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1478: allwinner/sun55i-t527-avaota-a1.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-libretech-all-h3-it.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h6-tanix-tx6.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h616-x96-mate.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-orangepi-pc2.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-libretech-all-h3-cc.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-orangepi-zero-plus2.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-pinephone-1.1.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h618-orangepi-zero2w.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h618-longanpi-3h.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h6-pine-h64.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h616-orangepi-zero2.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-olinuxino-emmc.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-sopine-baseboard.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-emlid-neutis-n5-devboard.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h6-beelink-gs1.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h616-bigtreetech-pi.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a100-allwinner-perf1.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-orangepi-win.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-pinephone-1.2.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h700-anbernic-rg35xx-h.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-pine64.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-pinetab-early-adopter.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-nanopi-neo-plus2.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h618-yuzukihd-chameleon.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h6-orangepi-3.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-amarula-relic.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-pine64-lts.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-bananapi-m2-plus.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-bananapi-m64.dtb' not remade because of errors.
make: Target 'allwinner/sun55i-t527-orangepi-4a.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-orangepi-zero-plus.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-olinuxino.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-pinebook.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-oceanic-5205-5inmfd.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-pine64-plus.dtb' not remade because of errors.
make: Target 'allwinner/sun55i-h728-x96qpro+.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-teres-i.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-pinetab.dtb' not remade because of errors.
make: Target 'allwinner/sun55i-a527-cubie-a5e.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h6-pine-h64-model-b.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-orangepi-prime.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-nanopi-a64.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h618-transpeed-8k618-t.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-libretech-all-h5-cc.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a64-pinephone-1.0.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h6-orangepi-lite2.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h6-tanix-tx6-mini.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h618-orangepi-zero3.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-nanopi-r1s-h5.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h64-remix-mini-pc.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-a133-liontron-h-a133l.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h5-nanopi-neo2.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h313-tanix-tx1.dtb' not remade because of errors.
make: Target 'allwinner/sun55i-t527-avaota-a1.dtb' not remade because of errors.
make: Target 'allwinner/sun50i-h6-orangepi-one-plus.dtb' not remade because of errors.






