Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E2FC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cR7V8tdp1JiFaqa4CurIg+Y74l5p4ap4GzC31HJp3Bs=; b=aV4/i/aMxhWdVTOJnxmqt7NWC9
	WCwUDi6dbYCpVzRqhldDMf4pWhA1KLQID7XU3+jBzvvVKT/UxI6Pfjojxp+f2vcJvxyvOomMptpq9
	1ke4pd6WHhArXQD9Nan0Q3n6HNo5sSwQAhFGPDDewvl6d33rTdY1kXuUBzdN+Rk/1Ap4nbv0zP6F9
	+kZ+zpmGC80xUCiMnI3SHKEk1j5TbKYqzCf+g3sUGIq4Q+Dyxhb9wiNCPJJL1Um3VeYd0d8b4FuX0
	CoNd2Sjq5vFNf4NuD76g+2e7ZEaU58bWaZ91e/GYoVvMQr7umIhHTuM8AdTjyVrRbd3iSkTmC6tRQ
	CNpxUKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Lpa-000000097NV-2HPa;
	Thu, 03 Apr 2025 14:46:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LfO-000000095fp-0Ctv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:35:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65B81A432BD;
	Thu,  3 Apr 2025 14:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37D8C4CEEB;
	Thu,  3 Apr 2025 14:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743690937;
	bh=UYZcrSoIukyNWFqG5RqeZgTW5DKkSSPFrREL7EXhL7A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=f25Mxn7sTE5uXYsLGJO6y9vJRVcdxdMTTjs995bdwPmwAWxtZUhuWmAtVPyYG4GsD
	 xdzO74ybVodnmOEuOn91FigvsAw5u8Ohe1C8ldk+ZOvgQTt3qm07mc+u2ASB/fcHiS
	 Kwb0Ty4JcDtqx6arTnkBZu2kJtTO4s331wYU0O+nJa9XRd0zu6mpHgXHK/9BwxRMKj
	 RcEDf+XsiRwZKawYl1zyC5CEDuSm89kB750I3vspRA+T319KMGlrHnR/1d/Fzxe0qF
	 WP1HB05/+4XrPEnwuhoMtyYBI8dKPBRtqRy52tg1EAWBjaoc78RZNlphdnYyqUhvNJ
	 ci20RAzxULz9Q==
Date: Thu, 03 Apr 2025 09:35:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Yashwanth Varakala <y.varakala@phytec.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Fabio Estevam <festevam@gmail.com>, Jan Remmet <j.remmet@phytec.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, upstream@lists.phytec.de, 
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
 Benjamin Hahn <b.hahn@phytec.de>, imx@lists.linux.dev, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Teresa Remmet <t.remmet@phytec.de>
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
References: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
Message-Id: <174369066563.2789714.13229546252082031365.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add new imx imx8mp-libra-rdk-fpsc SBC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_073538_219459_DAF4BBA0 
X-CRM114-Status: GOOD (  17.70  )
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


On Thu, 03 Apr 2025 13:29:26 +0200, Yannic Moog wrote:
> The Libra i.MX 8M Plus is a SBC that consists of the Libra base board
> and the phyCORE i.MX 8M Plus FPSC SoM.
> This series adds its binding and device trees.
> In addition add an overlay for an LVDS display that may optionally be
> connected to the Libra board.
> 
> ---
> Changes in v2:
> - reorder device tree nodes of SoM and board device trees according to https://github.com/lznuaa/dt-format
> - fix typo in reg: regulator-12v0 -> regulator-vdd-12v0
> - add to binding commit description the difference between phycore-som and phycore-fpsc
> - Link to v1: https://lore.kernel.org/r/20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-0-28324c7f81fa@phytec.de
> 
> ---
> Yannic Moog (3):
>       dt-bindings: add imx8mp-libra-rdk-fpsc
>       arm64: dts: add imx8mp-libra-rdk-fpsc board
>       arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
>  arch/arm64/boot/dts/freescale/Makefile             |   3 +
>  .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |  44 ++
>  .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 290 ++++++++
>  .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
>  5 files changed, 1140 insertions(+)
> ---
> base-commit: 90453dc4dee29b96b9162895f45776bc25526e07
> change-id: 20241210-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-c273025682f2
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
 Base: using specified base-commit 90453dc4dee29b96b9162895f45776bc25526e07

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de:

arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clock-names: ['ahb', 'sai1', 'sai2', 'sai3', 'sai5', 'sai6', 'sai7', 'axi'] is too long
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: clock-controller@30e20000: clocks: [[2, 284], [2, 123], [2, 124], [2, 125], [2, 127], [2, 128], [2, 182], [2, 321]] is too long
	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#






