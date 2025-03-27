Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB994C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRtZO6wuLOPQctwr1yKCbUFg+imQsaO3YOeOPkk65Go=; b=rSZGsd566fFvzZv+TNz5Fk6BAn
	jdP9uGtCRVjyi3WVXLFjmMGSSZrSt6JUi7HEzADrwhUQ/W8mL34Sgk98eLNWePQczpjLJ6s/jq1gq
	EEJ5hFFZXnZrv5u1151sAxKyo8pDWGOlzLmIz+2iYdg/jQdubnFOlglWlVGReZBFHdzLJNF+HHJhv
	DFqO2P76Y7wXP5yOihXsf1mxrffAN3avTmm2RJ/ZOD57T3hsuBMNnbYxrz33Y6SRxXVORGF5KRq8+
	Fl4E/IlW+1UmLYwgnq5SVyq4VBZVwCByLvQQoDCqKZ8C+sSiTweET5FSMIBwdhi7jfME9PweLXb2e
	bZ7z5mjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnr9-0000000B9Ny-2Lhr;
	Thu, 27 Mar 2025 14:05:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnpR-0000000B99z-2f5m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:03:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBFB8614B1;
	Thu, 27 Mar 2025 14:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A695C4CEDD;
	Thu, 27 Mar 2025 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743084208;
	bh=r2nebabuKIAEpNzA037xHqghzQDApSKNTfnGOqwEwN8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=munLR9BXsDWJrcnjMNzaDqeLN+axN0GePf7D1fsqRI2yT+YQ343M7qm0RSjtDUKcm
	 K/GOsPxuGqTy6zorIYUUtuGiTVin6EAzVxItq7XwQqC+2KDFaeCasiV9G9uKbyhaUY
	 SGx3TGMUsqd+3B7AS4tqoDiUqg6CQDb0Ct6QRnGCmkSEOBi3XuuTPAuXRKqvvEPinr
	 86IjOI1vMPaWGSKRBlVKXWbzGjXReY7Bdz1zc/8hPkpZpVYG9aSjsIHDX5RTa9acGq
	 QHa9Sn1RHgqwrfOnnqX3r9XJsIXLNJieyjGF8yHOkU5h4ta2+HSExFnOrRzSBR7CQ8
	 ZfX9USQFBYs8Q==
Date: Thu, 27 Mar 2025 09:03:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 kernel@collabora.com, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Martyn Welch <martyn.welch@collabora.com>
In-Reply-To: <20250327123907.542132-1-martyn.welch@collabora.com>
References: <20250327123907.542132-1-martyn.welch@collabora.com>
Message-Id: <174308402878.604918.5811022747265232650.robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add device tree for Nitrogen8M
 Plus ENC Carrier Board
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


On Thu, 27 Mar 2025 12:39:02 +0000, Martyn Welch wrote:
> Add support for Boundary Devices/Ezurio Nitrogen8M Plus ENC Carrier
> Board and it's SOM. Supported interfaces:
> 
>  - Serial Console
>  - EQoS Ethernet
>  - USB
>  - eMMC
>  - HDMI
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> ---
> 
> Changes in v2:
>  - Add missing entries to binding documents.
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../imx8mp-nitrogen-enc-carrier-board.dts     | 478 ++++++++++++++++++
>  .../dts/freescale/imx8mp-nitrogen-som.dtsi    | 415 +++++++++++++++
>  4 files changed, 900 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250327123907.542132-1-martyn.welch@collabora.com:

arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: pinctrl@30330000: 'usdhc1grp-100mhz', 'usdhc1grp-200mhz', 'usdhc1grp-gpio' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/fsl,imx8m-pinctrl.yaml#
arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: pinctrl@30330000: usdhc1grp-gpio: {'fsl,pins': [[184, 792, 0, 5, 0, 452]], 'phandle': 71} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: pmic@25: regulators:BUCK2: Unevaluated properties are not allowed ('regulator-limit-microvolt' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/nxp,pca9450-regulator.yaml#
arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: i2cmux9546@70: Unevaluated properties are not allowed ('i2c2@0', 'i2c2@1', 'i2c2@2', 'i2c2@3' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: usb-phy@381f0040: Unevaluated properties are not allowed ('fsl,phy-tx-preemp-amp-tune' was unexpected)
	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: usb-phy@382f0040: Unevaluated properties are not allowed ('fsl,phy-tx-preemp-amp-tune' was unexpected)
	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#






