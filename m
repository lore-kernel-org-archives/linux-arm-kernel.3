Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB0ECCA471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LQxvsKSEhhKUpiTxRP+z8BCsbr2RI3QOGorpVML808=; b=d+ncQx9905Qw0wLb/NnO5vFOBx
	bQTkG+drwyIpMbT9ZAwshCiNqz4wxLRfpqNcQZdR3hFanDwQJzKNJYteNrCUUXGoBSgGoqAX+32i0
	MRt8zPE2/bkfHUhPP21lo5c9uGqoeaNi4VPl+EzQL4mMQlp2/hkubMtcze41svhzwT2FUBrjVQg+7
	LzXk33BhnZocNOnSa9BC9QlHuxBxj/cQnc3rNk72D6WiwfQsxsicNxJaXdLhhliW/1GYK/hP839mZ
	mtpn+MmIUaJem+S2ANB1w6mnCf0bWRDLRziXB/rpiv/JB+1PKSzu2hV+pUPQVfIM+BeygVk6JhSc5
	4ujaD+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bWI-00000005WRU-1eGB;
	Tue, 30 Sep 2025 14:39:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bWF-00000005WQR-0Ubm;
	Tue, 30 Sep 2025 14:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5625844BA6;
	Tue, 30 Sep 2025 14:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168AEC113D0;
	Tue, 30 Sep 2025 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759243193;
	bh=9SE2KEAKijrBS96OOPfZTS3b5qqN02DuPyJ8e63F/6o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Lj9IjFqoFazTFnsi/bS5qfrL70o48qeM2oCEa8G7VKTZF9TzP0eEzb1Ri4fnlnL/8
	 9Np1PxY/pxArTl7lj8IzjMitjSB6cicesgvrw3f7nWO8efzPsdn+XeYOXsg+qcQ1p1
	 vX14wK0nUy9mwURZhnB/Mu2TaVm3Hww7BbvSm4UrX6hPHV/7Vb8vhtZefgapKrM6Vc
	 WfxlFMXnOhb+TYu/KlSK52LZm0MMKjPWU6yJzUc98cuiUCbl5PwXkvMN3Bs6DVeE9X
	 FBEEMhy5hP/BLr8BoYZKAEdeId/3hDIQXR8UwPDtS6tKthgAW0biPqfbo56SlSEx2x
	 i2G8ljMDQR0Pg==
Date: Tue, 30 Sep 2025 09:39:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
Message-Id: <175924309248.2873967.7183764824867817305.robh@kernel.org>
Subject: Re: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for
 A4 and A5 SoCs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_073955_205629_D210BBA8 
X-CRM114-Status: GOOD (  25.45  )
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


On Tue, 30 Sep 2025 17:37:13 +0800, Chuan Liu wrote:
> This patch series includes changes related to the PLL and peripheral
> clocks for both the A4 and A5 SoCs.
> 
> The patches for A5 were previously submitted up to V3 by Xianwei.
> https://lore.kernel.org/all/20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com/
> After friendly coordination, I’ve taken over and continued the
> submission as part of this series. The dt-bindings patch retains Rob's
> original "Reviewed-by" tag, and I hope this hasn’t caused any
> additional confusion.
> 
> Both A4 and A5 belong to the Audio series. Judging by their names, one
> might assume that A5 is an upgrade to A4, but in fact, A5 was released
> a year earlier than A4.
> 
> Since there are differences in the PLLs and peripheral clocks between
> the A4 and A5 SoCs (especially the PLL), and taking into account factors
> such as memory footprint and maintainability, this series does not
> attempt to merge the two into a shared driver as was done for
> G12A/G12B/SM1.
> 
> This patch series includes all related dt-bindings, driver, and dts
> changes for the PLLs and peripheral clocks. Following our past convention
> for clock-related submissions, the dts changes are placed at the end
> and submitted separately. If this ordering makes it harder for
> maintainers to review or pick patches, please feel free to point it out.
> 
> Co-developed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Chuan Liu (19):
>       dt-bindings: clock: Add Amlogic A4 SCMI clock controller
>       dt-bindings: clock: Add Amlogic A4 PLL clock controller
>       dt-bindings: clock: Add Amlogic A4 peripherals clock controller
>       clk: amlogic: Optimize PLL enable timing
>       clk: amlogic: Correct l_detect bit control
>       clk: amlogic: Fix out-of-range PLL frequency setting
>       clk: amlogic: Add A4 PLL clock controller driver
>       clk: amlogic: Add A4 clock peripherals controller driver
>       arm64: dts: amlogic: A4: Add scmi-clk node
>       arm64: dts: amlogic: A4: Add PLL controller node
>       arm64: dts: amlogic: A4: Add peripherals clock controller node
>       dt-bindings: clock: Add Amlogic A5 SCMI clock controller support
>       dt-bindings: clock: Add Amlogic A5 PLL clock controller
>       dt-bindings: clock: Add Amlogic A5 peripherals clock controller
>       clk: amlogic: Add A5 PLL clock controller driver
>       clk: amlogic: Add A5 clock peripherals controller driver
>       arm64: dts: amlogic: A5: Add scmi-clk node
>       arm64: dts: amlogic: A5: Add PLL controller node
>       arm64: dts: amlogic: A5: Add peripheral clock controller node
> 
>  .../clock/amlogic,a4-peripherals-clkc.yaml         | 122 +++
>  .../bindings/clock/amlogic,a4-pll-clkc.yaml        |  61 ++
>  .../clock/amlogic,a5-peripherals-clkc.yaml         | 134 ++++
>  .../bindings/clock/amlogic,a5-pll-clkc.yaml        |  63 ++
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  80 ++
>  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  87 ++
>  drivers/clk/meson/Kconfig                          |  53 ++
>  drivers/clk/meson/Makefile                         |   4 +
>  drivers/clk/meson/a1-pll.c                         |   1 +
>  drivers/clk/meson/a4-peripherals.c                 | 764 ++++++++++++++++++
>  drivers/clk/meson/a4-pll.c                         | 242 ++++++
>  drivers/clk/meson/a5-peripherals.c                 | 883 +++++++++++++++++++++
>  drivers/clk/meson/a5-pll.c                         | 476 +++++++++++
>  drivers/clk/meson/clk-pll.c                        |  76 +-
>  drivers/clk/meson/clk-pll.h                        |   2 +
>  .../clock/amlogic,a4-peripherals-clkc.h            | 129 +++
>  include/dt-bindings/clock/amlogic,a4-pll-clkc.h    |  15 +
>  include/dt-bindings/clock/amlogic,a4-scmi-clkc.h   |  42 +
>  .../clock/amlogic,a5-peripherals-clkc.h            | 132 +++
>  include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |  24 +
>  include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |  44 +
>  21 files changed, 3406 insertions(+), 28 deletions(-)
> ---
> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
> change-id: 20250928-a4_a5_add_clock_driver-2b7c9d695633
> 
> Best regards,
> --
> Chuan Liu <chuan.liu@amlogic.com>
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
 Base: using specified base-commit 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com:

Error: arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:119.19-20 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb] Error 1
make[2]: *** [scripts/Makefile.build:556: arch/arm64/boot/dts/amlogic] Error 2
make[2]: Target 'arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1480: amlogic/amlogic-a4-a113l2-ba400.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'amlogic/meson-gxl-s905x-hwacom-amazetv.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-sml5442tw.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-phicomm-n1.dtb' not remade because of errors.
make: Target 'amlogic/meson-s4-s805x2-aq222.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905w-p281.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-s912-libretech-pc.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-sei510.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-q200.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-khadas-vim.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxlx-s905l-p271.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-mecool-kiii-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-vega-s96.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-fbx8am.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-bananapi-cm4-cm4io.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-c3-c308l-aw419.dtb' not remade because of errors.
make: Target 'amlogic/meson-axg-s400.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-nexbox-a1.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-dreambox-one.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-khadas-vim2.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-wetek-core2.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-radxa-zero.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-vega-s95-telos.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-libretech-cc-v2.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-a311d-khadas-vim3.dtb' not remade because of errors.
make: Target 'amlogic/meson-axg-jethome-jethub-j100.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-gsking-x.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-vega-s95-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-q201.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-p230.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-a311d-bananapi-m2s.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-wetek-play2.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-mecool-kii-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-odroidc2.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-s7d-s905x5m-bm202.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-gt1-ultimate.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-x96-max.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-libretech-pc.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-p231.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-ugoos-am3.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-x96-air.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-vero4k.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-vega-s95-meta.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905w-tx3-mini.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-minix-neo-u9h.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s805x-libretech-ac.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-a95xf3-air-gbit.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-khadas-vim3l.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905d-vero4k-plus.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-h96-max.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-p212.dtb' not remade because of errors.
make: Target 'amlogic/meson-a1-ad401.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-odroid-go-ultra.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-radxa-zero2.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-x96-air-gbit.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-dreambox-two.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-bananapi-m5.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12a-u200.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxm-rbox-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-p201.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-a95xf3-air.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-a4-a113l2-ba400.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-bananapi-m2-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-p200.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-odroid-c4.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-s922x-bananapi-m2s.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-sei610.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-odroid-hc4.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-odroid-n2l.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-libretech-cc.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-c3-c302x-aw409.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905x-nexbox-a95x.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-a311d-libretech-cc.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-t7-a311d2-khadas-vim4.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb' not remade because of errors.
make: Target 'amlogic/meson-sm1-s905d3-libretech-cc.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-a5-a113x2-av400.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-wetek-hub.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-s922x-khadas-vim3.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-s6-s905x5-bl209.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-t7-a311d2-an400.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-kii-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-odroid-n2.dtb' not remade because of errors.
make: Target 'amlogic/meson-a1-ad402.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-nexbox-a95x.dtb' not remade because of errors.
make: Target 'amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb' not remade because of errors.
make: Target 'amlogic/amlogic-s7-s805x3-bp201.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-odroid-n2-plus.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-gtking-pro.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-ugoos-am6.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxl-s805x-p241.dtb' not remade because of errors.
make: Target 'amlogic/meson-g12b-gtking.dtb' not remade because of errors.
make: Target 'amlogic/meson-gxbb-nanopi-k2.dtb' not remade because of errors.






