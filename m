Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BA2C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0kV+LP6F/u1+R8EaS8B14VwEW/IGDvbboxxcr8/3pc=; b=JCjRfad+/XX73txDWDLU+8/Fhf
	YwAZwceaDopIe2hUsBS26j+9HHYMuxCjnMLk5+6MTwNhzPUyeRwfLh86BFhvHMABC8iK7XpAtLuLd
	g4Z3ltFgIK0Gr8RMUQWQ2xhnFXNWYCxvcE1oEjfxBKr7IA9wmq2RiQvragqdETkyU0z+CVlNl8Tma
	WZ023Eio/Ln3YxeWWvavG/gNPZd+ZCU2Dj7/BOV8lugTzJuY9VCAJNGESP2sSUKWfiqiFcGtM1AU6
	ycFVtr+02Ywhi8hFIwA4oJNN7icFhGbvAE4nT0Usqk86vfiZOGte6nwCbIcaPNWe8ZPa0Fk/hqdFo
	iyCe7DjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMqH-00000005kiB-2gnQ;
	Mon, 13 Jan 2025 15:59:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMKO-00000005ciz-17E1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D93C05C5659;
	Mon, 13 Jan 2025 15:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505FDC4CEE8;
	Mon, 13 Jan 2025 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781967;
	bh=PDn7b4rZVG80Mpecsub3/9L/gDd/HzzWKwGdflNiHpo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Y6sd3x9EfE9NDXbhAt1sPTUbu89mP9g32MfuibLmihWDWTwIFgLAMcqC6Mf0CptFr
	 AGmbffW31KHAo84ukeBA0bWtSpzOCmcxl8pYc01OL/Xpmu8Z0aTeipFyXpeLHZIE/3
	 58pF0MwEvqwfAfE5zeKhC2dhtCRVMTsFeo+1EomeLXI+XrOOJKkyMC5wQ3a4NXk1Pz
	 B0dmrvD20MLFxZl5yVRdA4nQVj942FzdrDQIhYCsMSSlPKYZ8Zr/rkGjR2XjkASluM
	 Lh6cI1xcfNRmJ4oSBgoHe8Iwg+K/PRyu94VAxvqhvq8ymeuI+qfCT5tv7EwiHHz2bU
	 r06z1Kgls05cg==
Date: Mon, 13 Jan 2025 09:26:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@denx.de>, conor+dt@kernel.org, 
 kernel@pengutronix.de, devicetree@vger.kernel.org, shawnguo@kernel.org, 
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250112152745.1079880-1-festevam@gmail.com>
References: <20250112152745.1079880-1-festevam@gmail.com>
Message-Id: <173678159965.2153204.13999632845078780464.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx5: Fix the CCM interrupts
 description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_072608_397110_5B1A98DB 
X-CRM114-Status: GOOD (  15.36  )
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


On Sun, 12 Jan 2025 12:27:44 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX5 chips the peripheral interrupts are represented directly only
> by their interrupt numbers.
> 
> The CCM nodes are not following this format and cause the following
> dt-schema warnings:
> 
> ccm@73fd4000: interrupts: [[0], [71], [4], [0], [72], [4]] is too long
> 
> Fix it by passing only the two interrupt numbers.
> 
> Run-time tested in on an imx53-qsb board.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Use interrupts = <71>, <72>;
> 
>  arch/arm/boot/dts/nxp/imx/imx50.dtsi | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250112152745.1079880-1-festevam@gmail.com:

arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dtb: pinctrl@80018000: compatible: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: sram@20000000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
arch/arm/boot/dts/nxp/imx/imx6dl-colibri-iris-v2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dtb: gpio-keys: 'power' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#






