Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442B2D711BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFxd+34gtPKYwO9Uag/vVG3JJfD1hSCCapyyxz7Hi5s=; b=FTx9NestYS/adhZRLc7+RkcCAT
	dyLwVAJDJSPqlDJeBDqEwKLsHUPlHQb74AZHQ0bjOk3wyh0m2TrHWPG78LY+w4Uth2Jb0oKfMJg0v
	nnrlY+EIOetu/evxSjrm756wOTfngN9Me6PFVSQRdwcHrcqyiOKD4DPwAA1NhLxJuXJWlM80A7krK
	5Yn8yVWfuOA9AKw8hqAz/sgVgIMdGb4/1AaeaQMPf3fippE943lRUJBepCCO278JzxP9o+Dth0JTE
	1UAJ1nbl0u/Yf65a/ETcu85jSdbsZkI9uqrHjLMefvT9cgBPdhMD2L4q58gAjjezWYjRxT4GxLc4c
	DL9yjcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnBC-0000000FlO6-2VZN;
	Wed, 20 Nov 2024 16:03:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnAF-0000000Fl9K-0yRq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 16:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 935EC5C5D35;
	Wed, 20 Nov 2024 16:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CA3C4AF09;
	Wed, 20 Nov 2024 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732118566;
	bh=P/vnb+Nr34kWtE18wQ+8aAGDYW1lN43eC/nTy0Zff3c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oVE5U1/3u0nTTxlWof5ZfzuSpBSABXhmx902ZQ35mMdmt/sUxMisc1MnKS9awYxwn
	 T1sFfJ+U5Wc77BHyojJ8i6bJgfAJ7kT5U5KESrcAwA1STxNpZIojsaeD8w8gfT4N9v
	 FKBqC1/15Gj3M201zdDWlS3mYihs4GBrfHX9QttLzcqO67TR4Mq02dZwgpIz8hZpsY
	 SRMxuZYoIQLpwWhdGTaUnV5XSd6j7IUNqiIVWFSkNiWbXIZpN6umL/3290sT2VcGL3
	 zvntfaUxRfbQVdJ4rDPTVVyVHmTeNIKaI41Zn/9+Ghyc4tsdzKuGZJXTIGrDfJlm/7
	 wrLEw1KhRrp6w==
Date: Wed, 20 Nov 2024 10:02:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: cristian.birsan@microchip.com
In-Reply-To: <20241119160107.598411-1-cristian.birsan@microchip.com>
References: <20241119160107.598411-1-cristian.birsan@microchip.com>
Message-Id: <173211839995.1123874.16146391934927637121.robh@kernel.org>
Subject: Re: [PATCH 0/2] ARM: dts: microchip: Add no-1-8-v property to
 sdmmc0 node
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_080247_359324_3632969F 
X-CRM114-Status: GOOD (  15.08  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 19 Nov 2024 18:01:05 +0200, cristian.birsan@microchip.com wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> Add no-1-8-v property to sdmmc0 node to keep VDDSDMMC power rail at 3.3V.
> This property will stop the LDO regulator from switching to 1.8V when the
> MMC core detects an UHS SD Card. VDDSDMMC power rail is used by all the
> SDMMC interface pins in GPIO mode (PA0 - PA13).
> 
> PA6 and PA10 GPIOs are used to enable the power switch controlling USB
> Vbus for the USB Host.
> 
> Cristian Birsan (2):
>   ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to
>     sdmmc0 node
>   ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to
>     sdmmc0 node
> 
>  arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts | 1 +
>  arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 1 +
>  2 files changed, 2 insertions(+)
> 
> 
> base-commit: 158f238aa69d91ad74e535c73f552bd4b025109c
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y microchip/at91-sama5d27_wlsom1_ek.dtb microchip/at91-sama5d29_curiosity.dtb' for 20241119160107.598411-1-cristian.birsan@microchip.com:

arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: etm@73c000: 'cpu' is a required property
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/gadget@300000: failed to match any schema with compatible: ['atmel,sama5d3-udc']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: ohci@400000: compatible: 'oneOf' conditional failed, one must be fixed:
	['atmel,at91rm9200-ohci', 'usb-ohci'] is too long
	'atmel,at91rm9200-ohci' is not one of ['allwinner,sun4i-a10-ohci', 'allwinner,sun50i-a100-ohci', 'allwinner,sun50i-a64-ohci', 'allwinner,sun50i-h6-ohci', 'allwinner,sun50i-h616-ohci', 'allwinner,sun55i-a523-ohci', 'allwinner,sun5i-a13-ohci', 'allwinner,sun6i-a31-ohci', 'allwinner,sun7i-a20-ohci', 'allwinner,sun8i-a23-ohci', 'allwinner,sun8i-a83t-ohci', 'allwinner,sun8i-h3-ohci', 'allwinner,sun8i-r40-ohci', 'allwinner,sun8i-v3s-ohci', 'allwinner,sun9i-a80-ohci', 'allwinner,sun20i-d1-ohci', 'brcm,bcm3384-ohci', 'brcm,bcm63268-ohci', 'brcm,bcm6328-ohci', 'brcm,bcm6358-ohci', 'brcm,bcm6362-ohci', 'brcm,bcm6368-ohci', 'brcm,bcm7125-ohci', 'brcm,bcm7346-ohci', 'brcm,bcm7358-ohci', 'brcm,bcm7360-ohci', 'brcm,bcm7362-ohci', 'brcm,bcm7420-ohci', 'brcm,bcm7425-ohci', 'brcm,bcm7435-ohci', 'hpe,gxp-ohci', 'ibm,476gtr-ohci', 'ingenic,jz4740-ohci', 'rockchip,rk3588-ohci', 'snps,hsdk-v1.0-ohci']
	'atmel,at91rm9200-ohci' is not one of ['generic-ohci', 'ti,ohci-omap3']
	'atmel,at91rm9200-ohci' is not one of ['cavium,octeon-6335-ohci', 'nintendo,hollywood-usb-ohci', 'nxp,ohci-nxp', 'st,spear600-ohci']
	'generic-ohci' was expected
	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: ohci@400000: $nodename:0: 'ohci@400000' does not match '^usb(@.*)?'
	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: ohci@400000: Unevaluated properties are not allowed ('atmel,vbus-gpio', 'clock-names', 'compatible' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/ohci@400000: failed to match any schema with compatible: ['atmel,at91rm9200-ohci', 'usb-ohci']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: ehci@500000: $nodename:0: 'ehci@500000' does not match '^usb(@.*)?'
	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names', 'phy_type' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: nand-controller: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: nand-controller: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'no-1-8-v' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'mmc-pwrseq', 'no-1-8-v', 'non-removable', 'wifi@0' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: flash@0: Unevaluated properties are not allowed ('spi-cs-setup-ns' was unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/hsmc@f8014000/ecc-engine@f8014070: failed to match any schema with compatible: ['atmel,sama5d2-pmecc']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: pwm@f802c000: Unevaluated properties are not allowed ('clocks', 'interrupts' were unexpected)
	from schema $id: http://devicetree.org/schemas/pwm/atmel,at91sam-pwm.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/sfr@f8030000: failed to match any schema with compatible: ['atmel,sama5d2-sfr', 'syscon']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/timer@f8048030: failed to match any schema with compatible: ['atmel,at91sam9260-pit']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: watchdog@f8048040: Unevaluated properties are not allowed ('clocks' was unexpected)
	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: etm@73c000: 'cpu' is a required property
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/pinctrl@fc038000: failed to match any schema with compatible: ['atmel,sama5d2-pinctrl']
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/secumod@fc040000: failed to match any schema with compatible: ['atmel,sama5d2-secumod', 'syscon']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/gadget@300000: failed to match any schema with compatible: ['atmel,sama5d3-udc']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: ohci@400000: compatible: 'oneOf' conditional failed, one must be fixed:
	['atmel,at91rm9200-ohci', 'usb-ohci'] is too long
	'atmel,at91rm9200-ohci' is not one of ['allwinner,sun4i-a10-ohci', 'allwinner,sun50i-a100-ohci', 'allwinner,sun50i-a64-ohci', 'allwinner,sun50i-h6-ohci', 'allwinner,sun50i-h616-ohci', 'allwinner,sun55i-a523-ohci', 'allwinner,sun5i-a13-ohci', 'allwinner,sun6i-a31-ohci', 'allwinner,sun7i-a20-ohci', 'allwinner,sun8i-a23-ohci', 'allwinner,sun8i-a83t-ohci', 'allwinner,sun8i-h3-ohci', 'allwinner,sun8i-r40-ohci', 'allwinner,sun8i-v3s-ohci', 'allwinner,sun9i-a80-ohci', 'allwinner,sun20i-d1-ohci', 'brcm,bcm3384-ohci', 'brcm,bcm63268-ohci', 'brcm,bcm6328-ohci', 'brcm,bcm6358-ohci', 'brcm,bcm6362-ohci', 'brcm,bcm6368-ohci', 'brcm,bcm7125-ohci', 'brcm,bcm7346-ohci', 'brcm,bcm7358-ohci', 'brcm,bcm7360-ohci', 'brcm,bcm7362-ohci', 'brcm,bcm7420-ohci', 'brcm,bcm7425-ohci', 'brcm,bcm7435-ohci', 'hpe,gxp-ohci', 'ibm,476gtr-ohci', 'ingenic,jz4740-ohci', 'rockchip,rk3588-ohci', 'snps,hsdk-v1.0-ohci']
	'atmel,at91rm9200-ohci' is not one of ['generic-ohci', 'ti,ohci-omap3']
	'atmel,at91rm9200-ohci' is not one of ['cavium,octeon-6335-ohci', 'nintendo,hollywood-usb-ohci', 'nxp,ohci-nxp', 'st,spear600-ohci']
	'generic-ohci' was expected
	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: ohci@400000: $nodename:0: 'ohci@400000' does not match '^usb(@.*)?'
	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: ohci@400000: Unevaluated properties are not allowed ('atmel,vbus-gpio', 'clock-names', 'compatible' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/ohci@400000: failed to match any schema with compatible: ['atmel,at91rm9200-ohci', 'usb-ohci']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: ehci@500000: $nodename:0: 'ehci@500000' does not match '^usb(@.*)?'
	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dtb: /ahb/apb/chipid@fc069000: failed to match any schema with compatible: ['atmel,sama5d2-chipid']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: ehci@500000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/ebi@10000000: failed to match any schema with compatible: ['atmel,sama5d3-ebi']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: nand-controller: #address-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: nand-controller: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/ebi@10000000/nand-controller: failed to match any schema with compatible: ['atmel,sama5d3-nand-controller']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000: $nodename:0: 'sdio-host@a0000000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@a0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp', 'no-1-8-v' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: $nodename:0: 'sdio-host@b0000000' does not match '^mmc(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: sdio-host@b0000000: Unevaluated properties are not allowed ('bus-width', 'disable-wp' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/atmel,sama5d2-sdhci.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: hlcdc@f0000000: 'hlcdc-display-controller', 'hlcdc-pwm' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/ramc@f000c000: failed to match any schema with compatible: ['atmel,sama5d3-ddramc']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/dma-controller@f0010000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/dma-controller@f0004000: failed to match any schema with compatible: ['atmel,sama5d4-dma']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/ssc@f8004000: failed to match any schema with compatible: ['atmel,at91sam9g45-ssc']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/hsmc@f8014000: failed to match any schema with compatible: ['atmel,sama5d2-smc', 'syscon', 'simple-mfd']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/hsmc@f8014000/ecc-engine@f8014070: failed to match any schema with compatible: ['atmel,sama5d2-pmecc']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: pwm@f802c000: Unevaluated properties are not allowed ('clocks', 'interrupts' were unexpected)
	from schema $id: http://devicetree.org/schemas/pwm/atmel,at91sam-pwm.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/sfr@f8030000: failed to match any schema with compatible: ['atmel,sama5d2-sfr', 'syscon']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/timer@f8048030: failed to match any schema with compatible: ['atmel,at91sam9260-pit']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: watchdog@f8048040: Unevaluated properties are not allowed ('clocks' was unexpected)
	from schema $id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/pinctrl@fc038000: failed to match any schema with compatible: ['atmel,sama5d2-pinctrl']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/secumod@fc040000: failed to match any schema with compatible: ['atmel,sama5d2-secumod', 'syscon']
arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dtb: /ahb/apb/chipid@fc069000: failed to match any schema with compatible: ['atmel,sama5d2-chipid']






