Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6031CC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYG/CKdEwZd4z+5HT0saAb9hX99QRa83/13o7p8wk6U=; b=glVref9gvmlCF/xK5BRLtHGe3T
	8EU675ARr12LnuXdOYgI8RHTZWZD73xTTegIHHaygRAh1rypDPQhzd911QNXYQ0TaXCcncnRFm1bQ
	hznEgUUvfpxiciZ6K7LLEFEA5sRnXI2RqnbZ/bsQYsH4StiM246QA+FTSocIbFPwT0rDaj7/fD05q
	OB5qvlgeFyXpC4g1Xm/9vbfvubup1CXb5BzCFd1du/z24knU/bF5eX24Sl3nl/GW6iK0ifYVdxrYk
	aJc8dbuElsAUKtIJTOz4SFfvTQQ9QPADgtapIAozFYaNrezKm4pUxkjvcyKXLS4PNzdRofrcztqsT
	xZq3m1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5eK-00000000sH6-0LaK;
	Mon, 03 Mar 2025 13:16:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5cl-00000000rzg-2Zz6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 13:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34F5F61190;
	Mon,  3 Mar 2025 13:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C876C4CED6;
	Mon,  3 Mar 2025 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741007662;
	bh=G1uZpetOhbHY9bpzj+SkAW4l9OHZnpwWUgprbajQf+4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jAIT05GXn7yxRhRLvLdFqbZwM88rIEzp9VkwLrCcLRGjM+RJsPJhHB9unwTNOhfXs
	 kAyzTLYIn2MbD86d34TTk+hzLP1LKaWVL5huvpQUBbNPxKWA8cTtYoULDt6oA0eKI9
	 xExWzr2DXx6ajZBNho2wyZxZrWEol3jLutehR2lghiZA975diAfjB8ll7wt/wcHsV7
	 RF/Z8A3L2Z2/4ATFrxuyDPY3xCq+IKq1LJXDzk0XKRffU5JwJZ+5wos15nu5bKLZkG
	 g4c/sGJqZ47An5cSxCunJFXQtLkJEilcoJ2FlO4jGQrCFJY/EFsi1A/ioU3HbGpYjl
	 yRKnFFRgbu5AQ==
Date: Mon, 03 Mar 2025 07:14:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Tony Luck <tony.luck@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-kernel@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-hardening@vger.kernel.org
To: Kaustabh Chakraborty <kauschluss@disroot.org>
In-Reply-To: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
References: <20250301-exynos7870-v4-0-2925537f9b2a@disroot.org>
Message-Id: <174100756283.1496281.12555971793250210333.robh@kernel.org>
Subject: Re: [PATCH v4 0/7] Add support for the Exynos7870 SoC, along with
 three devices
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


On Sat, 01 Mar 2025 01:16:48 +0530, Kaustabh Chakraborty wrote:
> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
> announced in 2016. The chipset was found in several popular mid-range to
> low-end Samsung phones, released within 2016 to 2019.
> 
> This patch series aims to add support for Exynos 7870, starting with the
> most basic yet essential components such as CPU, GPU, clock controllers,
> PMIC, pin controllers, etc.
> 
> Moreover, the series also adds support for three Exynos 7870 devices via
> devicetree. The devices are:
>  * Samsung Galaxy J7 Prime	- released 2016, codename on7xelte
>  * Samsung Galaxy J6		- released 2018, codename j6lte
>  * Samsung Galaxy A2 Core	- released 2019, codename a2corelte
> 
> Additional features implemented in this series include:
>  * I2C	- touchscreen, IIO sensors, etc.
>  * UART	- bluetooth and serial debugging
>  * MMC	- eMMC, Wi-Fi SDIO, SDCard
>  * USB	- micro-USB 2.0 interface
> 
> Build dependencies are in these sub-series:
>  * bootmode	  	- https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
>  * pmu-clocks		- https://lore.kernel.org/all/20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org/
> 
> Other related sub-series:
>  * gpu			R https://lore.kernel.org/all/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org/
>  * i2c	      		A https://lore.kernel.org/all/20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org/
>  * mmc			- https://lore.kernel.org/all/20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org/
>  * pinctrl	  	- https://lore.kernel.org/all/20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org/
>  * pmic-regulators	- https://lore.kernel.org/all/20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org/
>  * uart			R https://lore.kernel.org/all/20250219-exynos7870-uart-v2-1-c8c67f3a936c@disroot.org/
>  * usb			- https://lore.kernel.org/all/20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org/
>  * usbphy		- https://lore.kernel.org/all/20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org/
> (Legend: [R]eviewed, [A]pplied)
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v4:
> - Drop merged [PATCH v3 1/7].
> - Explicitly mention sub-series having build dependencies.
> - Include the following patch from the pmu-clocks series:
>   - dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
> - Adjust clock header file name to match changes in pmu-clocks.
> - Change regulator node names to match changes in pmic-regulators.
> - Remove non-removable flag for the SDCard's mmc node.
> - Link to v3: https://lore.kernel.org/r/20250219-exynos7870-v3-0-e384fb610cad@disroot.org
> 
> Changes in v3:
> - Added patches from https://lore.kernel.org/all/20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org/
> - Fix devicetree formatting according to the devicetree style guide.
> - Take over ownership of patches by the co-author, upon their request.
> - Link to v2: https://lore.kernel.org/r/20250204-exynos7870-v2-0-56313165ef0c@disroot.org
> 
> Changes in v2:
> - Redo a few commit descriptions.
> - Split patchsets into multiple sub-series, subsystem-wise.
> - Link to v1: https://lore.kernel.org/r/20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org
> 
> ---
> Kaustabh Chakraborty (7):
>       dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
>       dt-bindings: arm: samsung: add compatibles for exynos7870 devices
>       soc: samsung: exynos-chipid: add support for exynos7870
>       arm64: dts: exynos: add initial devicetree support for exynos7870
>       arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
>       arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
>       arm64: dts: exynos: add initial support for Samsung Galaxy J6
> 
>  .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
>  .../bindings/soc/samsung/exynos-pmu.yaml           |    1 +
>  arch/arm64/boot/dts/exynos/Makefile                |    3 +
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  628 ++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  616 ++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  664 +++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1022 ++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  714 ++++++++++++++
>  drivers/soc/samsung/exynos-chipid.c                |    1 +
>  9 files changed, 3657 insertions(+)
> ---
> base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
> change-id: 20250201-exynos7870-049587e4b7df
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250301-exynos7870-v4-0-2925537f9b2a@disroot.org:

In file included from arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts:10:
arch/arm64/boot/dts/exynos/exynos7870.dtsi:9:10: fatal error: dt-bindings/clock/samsung,exynos7870-cmu.h: No such file or directory
    9 | #include <dt-bindings/clock/samsung,exynos7870-cmu.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1462: exynos/exynos7870-on7xelte.dtb] Error 2
In file included from arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts:10:
arch/arm64/boot/dts/exynos/exynos7870.dtsi:9:10: fatal error: dt-bindings/clock/samsung,exynos7870-cmu.h: No such file or directory
    9 | #include <dt-bindings/clock/samsung,exynos7870-cmu.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1462: exynos/exynos7870-a2corelte.dtb] Error 2
In file included from arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts:10:
arch/arm64/boot/dts/exynos/exynos7870.dtsi:9:10: fatal error: dt-bindings/clock/samsung,exynos7870-cmu.h: No such file or directory
    9 | #include <dt-bindings/clock/samsung,exynos7870-cmu.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos7870-j6lte.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1462: exynos/exynos7870-j6lte.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-on7xelte.dtb' not remade because of errors.
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
make: Target 'exynos/exynos7870-a2corelte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.
make: Target 'exynos/exynos7870-j6lte.dtb' not remade because of errors.






