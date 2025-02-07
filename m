Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B946C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Qvwf1guqeRULGqgBr7yvZ2W7EJYOZFk/gUId+/g8oM=; b=4S/7A3NATVFL0Rbqu2ghwfuUs8
	qOQxGwWymhaFaP7/gejK1FfggLp4nJAub7klMF/FQNshr4HNZUHeZJ1lZ9go2HdClVENoA8uJhrCf
	FlGaGDFODuOsMAtn4HpumfHVZ8WlG5yOVABpyspmMLoBJlRapWZUEKzYkJDIoN0K/S+jBT6jzP5f4
	U+7UJ17jQAny3HwKOUATuNf0zQmilJuJbA9zE5FkcBUC7LpQIinAG7dMWU55U9cUMpdjwDOxn/2o4
	g7pOBO8SUnYzcV8HvY+wOBOEi9LEIXHsvLEp0ELzVwLEFwZrsO/AwbNdd12qQwpWbN6RFsin68Rfn
	Jb0Lh75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQMp-0000000A60d-2TSt;
	Fri, 07 Feb 2025 15:34:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQAf-0000000A2jv-0SVm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:21:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60171A43676;
	Fri,  7 Feb 2025 15:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FF2C4CEDF;
	Fri,  7 Feb 2025 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738941692;
	bh=yCywyCvmmAZbWHiGvWpcFa1ywJvGn1bqilunL8XHMqM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=A800cHhpOmGzb0NkAxQm5wuE8IJ+Qgmm5pX3QYF9ACwfZUs8xnR9wCHSGlq9P4hAi
	 n2jXNmLF4y5K5sPyUc02ORy2DEMs6M9B92C5gsyLVp3cZSBKRmJbK7WYkSN6xmRR4j
	 DQC3Lmf81Y4aUw4TvF+qruS2MaH1y4atrYAimL22ja0G4iDkp2uMryoMzKx6DHQvGa
	 HKFiFI5s9GwyZujRsJcNIfHZC3GpsmI7btMRIiHiG3BikwdYoWRrvEzFalVdQje/68
	 AQO94MuvgcLXBndNMXvgIVrvYRnN/Sj05rxp+kOAxkGt+81RM28j6I85PmhOGy+uch
	 jXoU/G3bEd2qg==
Date: Fri, 07 Feb 2025 09:21:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 alim.akhtar@samsung.com, krzk@kernel.org, 
 linux-arm-kernel@lists.infradead.org
To: Denzeel Oliva <wachiturroxd150@gmail.com>
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
Message-Id: <173894150599.330679.9502300326719327262.robh@kernel.org>
Subject: Re: [PATCH v1 0/9] Add PERIC0/1 support for Exynos 990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_072133_285003_B3BA25B5 
X-CRM114-Status: GOOD (  20.86  )
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


On Wed, 05 Feb 2025 22:22:14 +0000, Denzeel Oliva wrote:
> This patch series introduces support for
> the PERIC0 and PERIC1 blocks in the Exynos 990 SoC.
> It includes devicetree bindings, clock definitions,
> and driver support for the following components:
> 
> - Universal Serial Interface (USI):
>   - Adds samsung,exynos990-usi compatible
>     for defining USI nodes in PERIC0/1.
>   - Supports UART, SPI, and I2C modes.
>   - Defines all 18 USI nodes in the Exynos 990 device tree.
> 
> - SPI (Serial Peripheral Interface):
>   - Adds `samsung,exynos990-spi` compatible.
>   - Implements SPI port configuration data.
>   - Some controllers (SPI 8, 9, and 10) use a 256 bytes FIFO depth
>     instead of the usual 64 bytes.
> 
> - HSI2C (High-Speed I2C):
>   - Adds `samsung,exynos990-hsi2c` compatible for Exynos 990.
> 
> - Clock Management Unit (CMU) for PERIC0/1:
>   - Adds clock definitions for USI and I2C peripherals.
>   - CMU_PERIC0/1 clocks are not marked as critical.
> 
> This has been tested on the Samsung Galaxy S20 FE (r8s),
> where USI and SPI interfaces are confirmed to be functional.
> 
> Denzeel Oliva (9):
>   dt-bindings: clock: samsung,exynos990-clock: add PERIC0 / 1 clock
>     management unit
>   dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
>   dt-bindings: serial: samsung: add Exynos990 compatible
>   dt-bindings: samsung: usi: add exynos990-usi compatible
>   spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
>   dt-bindings: soc: samsung: exynos-sysreg: add compatibles peric0/1
>     sysreg for Exynos990
>   clk: samsung: exynos990: add support for CMU_PERIC0/1
>   spi: s3c64xx: add support exynos990-spi to new port config data
>   arm64: dts: exynos990: define all PERIC USI nodes
> 
>  .../clock/samsung,exynos990-clock.yaml        |   24 +
>  .../devicetree/bindings/i2c/i2c-exynos5.yaml  |    1 +
>  .../bindings/serial/samsung_uart.yaml         |    6 +
>  .../bindings/soc/samsung/exynos-usi.yaml      |    1 +
>  .../soc/samsung/samsung,exynos-sysreg.yaml    |    2 +
>  .../devicetree/bindings/spi/samsung,spi.yaml  |    1 +
>  arch/arm64/boot/dts/exynos/exynos990.dtsi     | 1711 +++++++++++++++++
>  drivers/clk/samsung/clk-exynos990.c           | 1079 +++++++++++
>  drivers/spi/spi-s3c64xx.c                     |   16 +
>  include/dt-bindings/clock/samsung,exynos990.h |  178 +-
>  10 files changed, 3018 insertions(+), 1 deletion(-)
> 
> --
> 2.47.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250205222223.613-1-wachiturroxd150@gmail.com:

Error: arch/arm64/boot/dts/exynos/exynos990.dtsi:225.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos990-x1slte.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos990-x1slte.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/exynos990.dtsi:225.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos990-r8s.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos990-r8s.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos990-r8s.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/exynos990.dtsi:225.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos990-c1s.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos990-c1s.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos990-c1s.dtb] Error 2
Error: arch/arm64/boot/dts/exynos/exynos990.dtsi:225.20-21 syntax error
FATAL ERROR: Unable to parse input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/exynos/exynos990-x1s.dtb] Error 1
make[2]: *** [scripts/Makefile.build:465: arch/arm64/boot/dts/exynos] Error 2
make[2]: Target 'arch/arm64/boot/dts/exynos/exynos990-x1s.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1464: exynos/exynos990-x1s.dtb] Error 2
make: *** [Makefile:251: __sub-make] Error 2
make: Target 'exynos/exynos8895-dreamlte.dtb' not remade because of errors.
make: Target 'exynos/exynos850-e850-96.dtb' not remade because of errors.
make: Target 'exynos/exynos7885-jackpotlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1slte.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2.dtb' not remade because of errors.
make: Target 'exynos/exynos990-r8s.dtb' not remade because of errors.
make: Target 'exynos/exynos7-espresso.dtb' not remade because of errors.
make: Target 'exynos/google/gs101-oriole.dtb' not remade because of errors.
make: Target 'exynos/exynosautov920-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynosautov9-sadk.dtb' not remade because of errors.
make: Target 'exynos/exynos990-c1s.dtb' not remade because of errors.
make: Target 'exynos/exynos9810-starlte.dtb' not remade because of errors.
make: Target 'exynos/exynos990-x1s.dtb' not remade because of errors.
make: Target 'exynos/exynos5433-tm2e.dtb' not remade because of errors.






