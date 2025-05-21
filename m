Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96C7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H96BLN/2cMynO44DKmuuYdOxm54BTS99rDgK4f8wtxg=; b=JPSr2o80FQHomKsNQ5ejctFoo9
	fhu08tUl52hnNJsmee7KQ+PjmZ6m/mdVksXisbqTuWBUOlPCS5u0RR3t6ZgYMZl8rb8nzzwAZv3kG
	yhXtphDE//cz4KrhPk6TxWzWMu+kDNeEqHyjKpmomCJkyTXs8o0TcRC8U9bhkSa9eCKCXJSpnXXfV
	x38Nerpj2djZRlQeH/LlCrZuwaptB+jl86Mpi4J3W5bLOM8o/aDTGgvggeJzPhuAr3kdZdxf0iJ3K
	dRVruFI1PZ3gqS20/VFEUsPMorxjYDpiaN6oRRVVPn9/bVY1wgtISKWwL44o7zkK/6nt3nDd+TDfO
	MLxd6uBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjRJ-0000000FvnC-2FP9;
	Wed, 21 May 2025 13:24:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHizZ-0000000Fqi4-3NaA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E08675C5A26;
	Wed, 21 May 2025 12:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D65C4CEE7;
	Wed, 21 May 2025 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747832175;
	bh=COLlQbBjihbwrGoCTuNX+CjfY62lIbRWheQQID6EbaA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KmMyMwQEhWdZwGo2yXWu8YsO7BgEJ+AjR2fTEU6zAA9pJLD3q4Aw43KMayJt3XxI3
	 /9vgDGnu8DQeKYU0CkVQAaY/th3pLTEFsA/7XwAKmAd7X9OZLhAGHOIeXMTiIDScLc
	 o7T3nCqw5uTjtCB/e1SAzi411291Kjr4Rw6lRGBeuzmdjaWQj2yjNlCfm3nsehLBxi
	 Kdgs0gs92xI7ud6qF1N7vC9VF/RfZhh7SGYFuTHPo06vsFHvcIAd4TB0aXdOUCPJ21
	 /QJ1kYpu0N48GBxrOHE0nGtC47kaEYPCxXKaA3+CM8+VaqFnffagjyAtvphLkF13xk
	 TJwvRTEa/aS2Q==
Date: Wed, 21 May 2025 07:56:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>, 
 Max Merchel <Max.Merchel@ew.tq-group.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Fabio Estevam <festevam@denx.de>, Heiko Schocher <hs@denx.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org, 
 michael@amarulasolutions.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
Message-Id: <174783212340.3233254.8471978099095548477.robh@kernel.org>
Subject: Re: [PATCH 0/3] Support i.MX28 Amarula rmm board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055617_930540_844449F3 
X-CRM114-Status: GOOD (  15.13  )
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


On Wed, 21 May 2025 11:28:19 +0200, Dario Binacchi wrote:
> The series adds support for i.MX28 Amarula rmm board.
> 
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 256 Mbytes SRAM
>  - LCD-TFT controller
>  - CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
> 
> 
> Dario Binacchi (3):
>   ARM: dts: imx28: add pwm7 muxing options
>   dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
>   ARM: dts: mxs: support i.MX28 Amarula rmm board
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   1 +
>  arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
>  .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 302 ++++++++++++++++++
>  arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
>  4 files changed, 314 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> 
> --
> 2.43.0
> 
> base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
> branch: imx28-amarula-rmm
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
 Base: using specified base-commit 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250521092826.1035448-1-dario.binacchi@amarulasolutions.com:

arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@80000000/interrupt-controller@80000000: failed to match any schema with compatible: ['fsl,imx28-icoll', 'fsl,icoll']
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@80000000/interrupt-controller@80000000: failed to match any schema with compatible: ['fsl,imx28-icoll', 'fsl,icoll']
arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: spi@80010000 (fsl,imx28-mmc): $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-spi.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0-phy-int@0', 'mac0-phy-reset@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'qca7000@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^p
 inctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: nand-controller@8000c000 (fsl,imx28-gpmi-nand): #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: nand-controller@8000c000 (fsl,imx28-gpmi-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: nand-controller@8000c000 (fsl,imx28-gpmi-nand): #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-10056-pullup@0', 'lcdif-10056@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0-10037@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2-cfa10056@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb-10037@0', 'usb0@0', 'us
 b0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: spi@80010000 (fsl,imx28-mmc): $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: spi@80010000 (fsl,imx28-mmc): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'broken-cd', 'bus-width', 'clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'edt-ft5x06-0', 'edt-ft5x06-wake-0', 'fec-3v3-enable-0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog-0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds-0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0-vbus-enable-0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1-vbus-enable-0', 'usb1@0'
 , 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): compatible: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'hog@1', 'hog@2', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0-10037@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb-10037@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not ma
 tch any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-apx4@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit-apx4@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg-apx4@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl
 -[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'hog@1', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'keypad-bttc@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-bttc@0', 'lcdif-bttc@1', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssp1-sdio@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1', 'wifi-en-pin@0' do not match an
 y of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi-gpiogrp@0', 'spi2@0', 'spi3@0', 'spi3@1', 'tx28-edt-ft5x06-pins@0', 'tx28-flexcan-xcvr-pins@0', 'tx28-lcdif-23bit@0', 'tx28-lcdif-ctrl@0', 'tx28-mac0-gpio-pins@0', 'tx28-pca9554-pins@0', 'tx28-tsc
 2007-pins@0', 'tx28-usbphy0-pins@0', 'tx28-usbphy1-pins@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx28-digctl', 'fsl,imx23-digctl']
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx28-digctl', 'fsl,imx23-digctl']
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@80040000/lradc@80050000: failed to match any schema with compatible: ['fsl,imx28-lradc']
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@80040000/i2c@80058000/edt-ft5x06@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@80040000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timrot', 'fsl,timrot']
arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dtb: /apb@80000000/apbx-bus@80040000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timrot', 'fsl,timrot']
arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'enocean-button@0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0-phy-int@0', 'mac0-phy-reset@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the r
 egexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinct
 rl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-apf28.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0-phy-reset@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-10058@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb-10058@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not m
 atch any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'hog@1', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'keypad-bttc@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-bttc@0', 'lcdif-bttc@1', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssp1-sdio@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1', 'wifi-en-pin@0' do not match an
 y of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx283lc.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpio-button-sw3-mbmx28lc@0', 'gpio-button-sw4-mbmx28lc@0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog-cpuimx283@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcd-3v3-mbmx28lc@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-mbmx28lc@0', 'lcdif-sync@0', 'led-d6-mbmx28lc@0', 'led-d7-mbmx28lc@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'reg-usb0-vbus-mbmx28lc@0', 'reg-usb1-vbus-mbmx28lc@0', 'saif0@0', '
 saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-sps1.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog-gpios@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-apf28dev@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'otg-apf28dev@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+
 $'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-10055-pullup@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-evk@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0-10037@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2-cfa10055@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb-10037@0', 'usb0@0', 'usb0
 @1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-evk@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb-10057@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not mat
 ch any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'hog@1', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'keypad-bttc@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-bttc@0', 'lcdif-bttc@1', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssp1-sdio@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1', 'wifi-en-pin@0' do not match an
 y of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-evk.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand-evk@0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-evk@0', 'lcdif-sync@0', 'led_gpio3_5@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpi
 o@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0-phy-int@0', 'mac0-phy-reset@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 
 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'i2cmux-10049@0', 'lcdif-10049-pullup@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-evk@0', 'lcdif-sync@0', 'leds-10036@0', 'mac0-10049@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'mmc_pwr_cfa10036@0', 'otg-10036@0', 'pca-10049@0', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'rotary-10049@0', 'rotary-btn-10049@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2-cfa10049@0', 'spi2@
 0', 'spi3-cfa10049@0', 'spi3@0', 'spi3@1', 'ssd1306-10036@0', 'usb-10049@0', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-ts4600.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'en-sd-pwr@0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-m28@0', 'lcdif-sync@0', 'leds-m28@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-m28@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'leds@0', 'mac0-phy-int@0', 'mac0-phy-reset@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+
 $', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx287lc.dtb: pinctrl@80018000 (fsl,imx28-pinctrl): 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpio-button-sw3-mbmx28lc@0', 'gpio-button-sw4-mbmx28lc@0', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog-cpuimx283@0', 'hog-cpuimx287@0', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcd-3v3-mbmx28lc@0', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-mbmx28lc@0', 'lcdif-sync@0', 'led-d6-mbmx28lc@0', 'led-d7-mbmx28lc@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'pwm7@0', 'reg-usb0-vbus-mbmx28lc@0', 'reg-usb1-vbus-mbmx28
 lc@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: '^pinctrl-[0-9]+$', 'gpio@[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: /ahb/flash@20020000: failed to match any schema with compatible: ['nxp,lpc3220-slc']






