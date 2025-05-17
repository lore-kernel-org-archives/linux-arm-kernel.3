Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE0C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=au07Yxh29mFdGJ4992cSBGlfR4ttHBZ96sP+uNIW2Ng=; b=IBmUkuD3NrxZqTanxHcai4ulZn
	wF5ejd3cc+TwuGAzHOkF2zZKcI10ux51KY35I3gllhG3jPp+666IMxq1vnkmjqfeD4AcFTy1Z4FQd
	ndESq6/3eR/ckgSF6Prj1asCvGPZAoJUMx8x6k1jJJAyDE6nsEDzc6w/DoyGGDxWOitYVHlmg8eWo
	ShjGwpAYhgaD+waOHwrG6Iyo0XrnzkGmyFpCJAv8709RmUQ6V/cqo+idVME29XkYygbM/wrPMytli
	cXrJWIfJSn+4tfVsvc1f8HlhwvrMu533JlLNfuThWc5X4S/+ePD6Y6Z9jbTh+3yf4YMQmy6KRO+7q
	xjYalnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGHWv-00000005kZc-2kTk;
	Sat, 17 May 2025 13:24:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGHQv-00000005joX-0I2x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 May 2025 13:18:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 960274A80E;
	Sat, 17 May 2025 13:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555EDC4CEF7;
	Sat, 17 May 2025 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747487910;
	bh=NbZtW3nJkC0Cc1S1g/4r3o+UYSK2RiqZsQ/Gi9W9yfA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qYrzaIagwi12Nya6M52n1XYjxyVUpmlzyHQJR+o+UCSIP5bNibR5/uEDktwIa886a
	 NWn5qc8cUNXK3BCl/agNqEgiYOIkqXfJy6G3kj1pxatIpsx7HePWPY2gckyEOr58Rm
	 cfXHBZOqylQ5HcJkY17LgokCP3Z6tARlWEzPKhs51GMrLwLZcomYt2pGQofSebL1xa
	 JZq+urAsdwXgCgvrzfcmnmiNdErg++NVCFYqZYRLFL0RsfgIx36W3qaGtPoni0gFc4
	 ZrLOABwy1CEOZHYWvKaBWnof3j1EmIEXgX6FbWfxRgEkls3Yxtj9Sri52IittKcq5Z
	 KI8NwH/J+IWPQ==
Date: Sat, 17 May 2025 08:18:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, linus.walleij@linaro.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, 
 Stefan Agner <stefan@agner.ch>
To: Haibo Chen <haibo.chen@nxp.com>
In-Reply-To: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
References: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
Message-Id: <174748777048.930520.16549852892199093776.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_061833_153750_A676B6BD 
X-CRM114-Status: GOOD (  16.82  )
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


On Fri, 16 May 2025 18:58:49 +0800, Haibo Chen wrote:
> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"), vf610
> gpio driver no more use the static number 32 for gc->ngpio, user has a
> chance to config it through device tree for each port.
> 
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
> 
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi     | 4 ++++
>  arch/arm/boot/dts/nxp/vf/vfxxx.dtsi        | 5 +++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 3 +++
>  arch/arm64/boot/dts/freescale/imx93.dtsi   | 4 ++++
>  arch/arm64/boot/dts/freescale/imx94.dtsi   | 7 +++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi   | 5 +++++
>  6 files changed, 28 insertions(+)
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
 Base: using specified base-commit 484803582c77061b470ac64a634f25f89715be3f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com:

arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-cosmic.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf500-colibri-eval-v3.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-colibri-eval-v3.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@40049000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@4004a000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@4004b000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@4004c000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dtb: gpio@4004d000 (fsl,vf610-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: gpio@40ae0000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: gpio@40af0000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: gpio@40b00000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dtb: gpio@40b10000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: gpio@40ae0000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: gpio@40af0000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: gpio@40b00000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#
arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: gpio@40b10000 (fsl,imx7ulp-gpio): 'ngpios' does not match any of the regexes: '^.+-hog(-[0-9]+)?$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml#






