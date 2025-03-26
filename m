Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DB3C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 19:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UOS4KdAPvi0833zMfNh3LkXtMGpVwfyjX04bEiIIlI=; b=1ucWTXFTEIJYkX5bKDIdZtQYJD
	8En9hMKlE4EahFuIiekOT895Xcg9ULBjIrFYXXQWBaz574Z6Wez7EgRIIuw3Wk6nmzcN0k8g1udRD
	Hx8pRV0opkJScctflI9IbWnnQ7am8zDQzMtgDIJEyqudzNbG4flQmYvtBvrhBcV1NJBGJ1WazkJOo
	qHHqfXCLeP1GB6CHy2WBa6XxIM1UFE1R1ERaMqeIJyIdyoooN2mKYa+05v3rBFMDvemkCDhC8Qyxi
	Bp5fxNxr53yQacZd5/jJmFsBFivrz3WHSqABXNKvB0LRHrNydeD3bmuMDTsrMhyOwnN6RLn0j+YhX
	8CluFoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWFF-00000009Qam-0dGd;
	Wed, 26 Mar 2025 19:16:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWAA-00000009PzC-1L6D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 19:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2A3CA41728;
	Wed, 26 Mar 2025 19:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA41C4CEE2;
	Wed, 26 Mar 2025 19:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743016301;
	bh=tiIHJY8jNW8iHHlx7HjUM7neSuSrJDoWYqoOqUsSgQI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=shmojelXhieqvx6v56JlmhIbQ10KhC8Qo7WbeRMLiz3PNR1FYZ0hJFniTyUqEucDC
	 ZfGKVQsxd+W9RyRZtboSTkdY64U3e3jH/fx4DWRqRQE6i7d1eNt4ikNFM/Qd3RjIFX
	 LkY2xyn6z4tZscvrfaYagaY+/Wp1YLD9QcN4xKHkP5SDFOV4Fo9+bGg6OeoiAlIOLo
	 uEniG8xzsOsTPZFQXZ270yXsJZUa70gvHwLrTY5Zb7oBaWXBaqSoBtGcZb35I++s2Z
	 nhJoOSAMkjKkMkGos+W1DDh7BXq71T+f+rxsHTZNGbbU/nwIqAlzN30zDGi27t30s7
	 NfGbQNH1POCHQ==
Date: Wed, 26 Mar 2025 14:11:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
To: Lukasz Majewski <lukma@denx.de>
In-Reply-To: <20250326173400.2697684-1-lukma@denx.de>
References: <20250326173400.2697684-1-lukma@denx.de>
Message-Id: <174301524047.2716455.5622365569020191274.robh@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: Update common LWE file for XEA and BTT3
 boards
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_121142_484359_185988FA 
X-CRM114-Status: GOOD (  14.90  )
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


On Wed, 26 Mar 2025 18:33:59 +0100, Lukasz Majewski wrote:
> During development it has turned out that the spidev node needs to be
> defined.
> 
> Moreover, some crucial for the systems operation, regulator properties
> were missing.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
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
 Base: tags/next-20250326 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250326173400.2697684-1-lukma@denx.de:

arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/interrupt-controller@80000000: failed to match any schema with compatible: ['fsl,imx28-icoll', 'fsl,icoll']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/interrupt-controller@80000000: failed to match any schema with compatible: ['fsl,imx28-icoll', 'fsl,icoll']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: nand-controller@8000c000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: nand-controller@8000c000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: spi@80010000: $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: spi@80010000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'clocks', 'non-removable', 'vmmc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: spi@80012000: Unevaluated properties are not allowed ('clocks' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/spi@80012000/spidev0@0: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/spi@80012000/spidev2@2: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: spi@80014000: Unevaluated properties are not allowed ('clocks' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbh-bus@80000000/interrupt-controller@80000000: failed to match any schema with compatible: ['fsl,imx28-icoll', 'fsl,icoll']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbh-bus@80000000/interrupt-controller@80000000: failed to match any schema with compatible: ['fsl,imx28-icoll', 'fsl,icoll']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/spi@80014000/spidev1@1: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: nand-controller@8000c000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/spi@80014000/spidev2@2: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: spi@80016000: Unevaluated properties are not allowed ('clocks' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: nand-controller@8000c000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: spi@80010000: $nodename:0: 'spi@80010000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: spi@80010000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'clocks', 'non-removable', 'vmmc-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: spi@80014000: Unevaluated properties are not allowed ('clocks' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbh-bus@80000000/spi@80014000/spidev1@1: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbh-bus@80000000/spi@80014000/spidev2@2: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: spi@80016000: Unevaluated properties are not allowed ('clocks' was unexpected)
	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/spi@80016000/spidev2@2: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/spi@80016000/spidev1@1: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: pinctrl@80018000: compatible: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: pinctrl@80018000: 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'hog@1', 'hog@2', 'hog@3', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: /apb@80000000/apbh-bus@80000000/spi@80016000/spidev2@2: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: /apb@80000000/apbh-bus@80000000/spi@80016000/spidev2@2: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000000/spi@80016000/spidev2@2: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbh-bus@80000000/spi@80016000/spidev2@2: failed to match any schema with compatible: ['lwn,btt']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: pinctrl@80018000: compatible: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: pinctrl@80018000: 'auart0-2pins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'duart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'hog@1', 'hog@2', 'hog@3', 'i2c0@0', 'i2c0@1', 'i2c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'saif0@0', 'saif0@1', 'saif1@0', 'spi2@0', 'spi3@0', 'spi3@1', 'usb0@0', 'usb0@1', 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx28-digctl', 'fsl,imx23-digctl']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx28-digctl', 'fsl,imx23-digctl']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx28-digctl', 'fsl,imx23-digctl']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx28-digctl', 'fsl,imx23-digctl']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbx-bus@80040000/lradc@80050000: failed to match any schema with compatible: ['fsl,imx28-lradc']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbx-bus@80040000/lradc@80050000: failed to match any schema with compatible: ['fsl,imx28-lradc']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbx-bus@80040000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timrot', 'fsl,timrot']
arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dtb: /apb@80000000/apbx-bus@80040000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timrot', 'fsl,timrot']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbx-bus@80040000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timrot', 'fsl,timrot']
arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dtb: /apb@80000000/apbx-bus@80040000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timrot', 'fsl,timrot']






