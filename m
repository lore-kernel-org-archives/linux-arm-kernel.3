Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F213C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 00:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3p+bZ/M4JJHtXC/TSg1Xxy4DBKjfgL5pRL8Yf7X8z0=; b=gv9Xp8NDou+59pi1e7TEy9Xz1a
	xnjaJ58g0+BzlSY+aBG6RlOy4Fu5A6r/ciAsL74kueHWvABGowPB51XSdIBQmJHetfpz2H5YC/pZ9
	4q98ajn5lSoWl8zXbIsa6dImDICyFEc9lKnRUFz483nYHJ8LMSvR+GrBSWmw1VfAYBNNQP0kllzip
	0IbL4/rHDpbRNhzr5s7jzb4imyuuCENYNsO0Rp+/p0iG3FMudbIM/amAh0bquaw9P5+TO1Wg3hoCf
	4c/Gg6xI6qXxcVpOR0OQmLmM8gHwZmvb1sQqFnyQ2DZaipYS8aukf9xa1B/TzZ7P/+MsbyRK9ifON
	LpRWw+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYEi-0000000AOk7-3AJp;
	Wed, 19 Feb 2025 00:46:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYAN-0000000ANlc-2zXU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 00:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDB795C62C3;
	Wed, 19 Feb 2025 00:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F67C4CEE6;
	Wed, 19 Feb 2025 00:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925738;
	bh=zG+3d+jK2sUhaf8drQjlMDVNhtlQCiLoKQFWapDKXGA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kg5wj8at0QfyxVSxM5v0s37Toag4HrP7YhdZGI4jyeTWCytxNB+gLfkwGHou8Iu/7
	 /1nkDrJ3uMvZXZDHubtlZS6VxK1SGBALtfzmA3cJIMx7xsBMmbQHrVX+kwI4wS6Nkz
	 jwm2qsTyPdnhFQyjFJCUCHWKk7xcsjk3itb9fz0cTkPGKKj54faHYW8RjTZRZkMLUz
	 xZweDRxsQ74XODQUx1EQulOdLuGy/hUPlXlomXX4Q0QrhQSPbEGSmhfX8dMlCabEWv
	 zOYJF0WyprOtCZ6DScEOvg0owrlwsm3DinhDAtKZaLDxaQjYF1ZQzeDsFwOLRJpJJB
	 AqF0cWswNDBRg==
Date: Tue, 18 Feb 2025 18:42:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
Message-Id: <173992515772.2065079.17786828935224873560.robh@kernel.org>
Subject: Re: [PATCH v1 0/3] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_164219_876351_62917947 
X-CRM114-Status: GOOD (  25.55  )
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


On Sat, 15 Feb 2025 15:04:57 +0200, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds device tree files for Exynos 2200 and Samsung
> Galaxy S22+.
> 
> Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
> (r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
> including psci, pmu, chipid, architecture timer and mct, pinctrl,
> clocks and usb.
> 
> The devices using this SoC suffer from an issue caused by the stock
> Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
> needed to hardcode the adequate frequency in the timer node,
> otherwise the kernel panics.
> 
> Another issue is that cpu2 and cpu3 fail to come up consistently, which
> leads to a hang later in the boot process. As A510 cores are clustered
> by two, it makes sense for both of these cpus to fail if there is a
> power issue. Disable them until the problem is figured out.
> 
> Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
> 2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
> 1080x2340 Dynamic AMOLED display.
> 
> Further platform support will be added over time.
> 
> I expect [1], [2], [3], [4], [5], [6] to be merged before this patchset
> because it relies on the aforementioned series for drivers and device
> tree bindings.
> 
> [1] https://lore.kernel.org/all/20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com/
> [2] https://lore.kernel.org/all/20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com/
> [3] https://lore.kernel.org/all/20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com/
> [4] https://lore.kernel.org/all/20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com/
> [5] https://lore.kernel.org/all/20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com/
> [6] https://lore.kernel.org/all/20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com/
> 
> Best regards,
> Ivaylo
> 
> Ivaylo Ivanov (3):
>   dt-bindings: arm: samsung: document g0s board binding
>   arm64: dts: exynos: add initial support for exynos2200 SoC
>   arm64: dts: exynos: add initial support for Samsung Galaxy S22+
> 
>  .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
>  arch/arm64/boot/dts/exynos/Makefile           |    1 +
>  arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  178 ++
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  560 ++++++
>  5 files changed, 2510 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com:

In file included from arch/arm64/boot/dts/exynos/exynos2200-g0s.dts:9:
arch/arm64/boot/dts/exynos/exynos2200.dtsi:8:10: fatal error: dt-bindings/clock/samsung,exynos2200.h: No such file or directory
    8 | #include <dt-bindings/clock/samsung,exynos2200.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos2200-g0s.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos2200-g0s.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-oriole.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-raven.dtb' not remade because of errors.
make: Target 'exynos/exynosautov920-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynosautov9-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynos990-c1s.dtb' not remade because of errors.
make: Target 'exynos/exynos9810-starlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1s.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.






