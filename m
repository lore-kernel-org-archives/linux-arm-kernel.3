Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A37C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvZxQf7r0Ldqt6jT9g7h2kbKG8J3BmN1RPg8gH1bD4k=; b=azcsf/jIsr6leEQyErk9SI0EJ/
	2tPP+ZPBTmXbzJ8jzxw282pBMmQN7uk7g+Jh+x1PH3yw3ZznC9XItYFPjklSKFlMnLCIhIHCKdA+g
	1as6OtQMa2cBFGDjhDbRisN/sy6KVBC3fyAm/9qkD+JMgBILfAyXWwSarj4SsTvFJTLN5pl4F3uA3
	LcWo1rMNZ6O0T/Lfq4i/++g//qqT+Hm9Mf5NpYMcESLL3BOwwQuSuLsCQDiB5z4AUlmhMjmQjBxW+
	otMoHIiasKZysw6ncnrR0g+NJD2OZbQJaz8ZwtTsn/CbEImXv/GxIPvGPWSHfiHoG9pG5wWCXnWVI
	hn9AwuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNv6-00000003nQt-1kCw;
	Fri, 09 May 2025 13:37:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDN0d-00000003c9F-3xuz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 517FE629E2;
	Fri,  9 May 2025 12:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B1EC4CEE4;
	Fri,  9 May 2025 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746794363;
	bh=cUmOxOaE52FoEMZHnlv9RgRXtpWQx9C474WJO5+AbhI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aoVtvlTuC0s5AXOpQUKBtQ6yf+hLFn13+wVmG4Ziw/fDORTVFrT/C0zYquWy85qIp
	 B4xH6BwW9XjV9rRSfHEIQ3eoW8fFcCii/0OKUSW+bNWabOHJKMksHNH6wj/hNF6SY8
	 PEA0Kr4Wsd5kwW+N32yuKFiIdfWkcI1qQp/C5lCqqY9BqhqdcNfGHQ6riC1ZSkjgrH
	 a5YUXYTpR4/X6ZN8CyCOpiN2yUkfsBq1V+IIg+eZ7Wkw/SpiBuRD5tHOszn6PhHN3v
	 WL46kn7Xr6u8dwz3LtWzJfhhGcuFIJotbut+F3z6rPpKqbLTtX90JZlPycF/yRfBw2
	 iFNTlW20BHNRA==
Date: Fri, 09 May 2025 07:39:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Teresa Remmet <t.remmet@phytec.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Yashwanth Varakala <y.varakala@phytec.de>, linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Benjamin Hahn <b.hahn@phytec.de>, upstream@lists.phytec.de, 
 Jan Remmet <j.remmet@phytec.de>, imx@lists.linux.dev, 
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
References: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
Message-Id: <174679427817.2814201.3015231739636256872.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add new imx imx95-libra-rdk-fpsc SBC
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


On Wed, 07 May 2025 15:13:11 +0200, Yannic Moog wrote:
> The Libra i.MX 95 is a SBC that consists of the Libra base board
> and the phyCORE i.MX 95 FPSC SoM.
> This series adds its binding and device trees.
> 
> ---
> Yannic Moog (2):
>       dt-bindings: add imx95-libra-rdk-fpsc
>       arm64: dts: add imx95-libra-rdk-fpsc board
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 327 ++++++++++
>  .../boot/dts/freescale/imx95-phycore-fpsc.dtsi     | 656 +++++++++++++++++++++
>  4 files changed, 991 insertions(+)
> ---
> base-commit: 9bfe32fed9a8c17000f7cd6bc59ce8348aefe5e9
> change-id: 20250415-wip-y-moog-phytec-de-imx95-libra-27c9ce555b91
> 
> Best regards,
> --
> Yannic Moog <y.moog@phytec.de>
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
 Base: using specified base-commit 9bfe32fed9a8c17000f7cd6bc59ce8348aefe5e9

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de:

arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usb@4c200000 (fsl,imx95-usb): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb'] is too long
	'fsl,imx95-usb' is not one of ['fsl,imx27-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx23-usb', 'fsl,imx25-usb', 'fsl,imx28-usb', 'fsl,imx35-usb', 'fsl,imx50-usb', 'fsl,imx51-usb', 'fsl,imx53-usb', 'fsl,imx6q-usb', 'fsl,imx6sl-usb', 'fsl,imx6sx-usb', 'fsl,imx6ul-usb', 'fsl,imx7d-usb', 'fsl,vf610-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8dxl-usb', 'fsl,imx8ulp-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8mm-usb', 'fsl,imx8mn-usb', 'fsl,imx93-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx6sll-usb', 'fsl,imx7ulp-usb']
	'fsl,imx27-usb' was expected
	'fsl,imx7ulp-usb' was expected
	'fsl,imx6ul-usb' was expected
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usb@4c200000 (fsl,imx95-usb): interrupts: [[0, 176, 4], [0, 174, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /soc/usb@4c200000: failed to match any schema with compatible: ['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb']
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc'] is too long
	'fsl,imx95-usbmisc' is not one of ['fsl,imx25-usbmisc', 'fsl,imx27-usbmisc', 'fsl,imx35-usbmisc', 'fsl,imx51-usbmisc', 'fsl,imx53-usbmisc', 'fsl,imx6q-usbmisc', 'fsl,vf610-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx6ul-usbmisc', 'fsl,imx6sl-usbmisc', 'fsl,imx6sx-usbmisc', 'fsl,imx7d-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx7ulp-usbmisc', 'fsl,imx8mm-usbmisc', 'fsl,imx8mn-usbmisc', 'fsl,imx8ulp-usbmisc']
	'fsl,imx6sll-usbmisc' was expected
	'fsl,imx6q-usbmisc' was expected
	'fsl,imx6ul-usbmisc' was expected
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): reg: [[0, 1277166080, 0, 512], [0, 1275133972, 0, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /soc/usbmisc@4c200200: failed to match any schema with compatible: ['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc']






