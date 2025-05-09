Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94B8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dphwJ/rUVWfnN9IYO1kO4MjEFaKSXe1+5ErpYhVCuA=; b=mES0gxQ6N1DCbMyLFpruyKlZI9
	YfnkBAieBX1qa43MGcTx31RVmnOtpljk00+vEFExeBy4T1J0vq5OM+q7LgCr5yRAWVw9qzt5+xzn8
	oG/j02YljUwhU7IwbBmKcdDqlc4pml1EszKFa4fbyIo1ZmGDrG8trZYoP6MF3Vgg5jLlgq3eWkMBn
	F4hdBljjkMMcbFJyoV9H8+5NcHwwntk0F4QjcH2OV6AAfEm/mtWr/ym3qgodpxHyOpwwXy9gPReiW
	tZB9q0wPRcRVUFz8VB/pAOEoN9GzOr5ER6qlrYj/+ZFOlFPnzt3sYle5s7NZYW2IDZFFKP0Gmcahg
	AmWphp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQmO-00000004K5u-2uXg;
	Fri, 09 May 2025 16:40:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOXI-00000003v7c-1aFT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6905A5C6428;
	Fri,  9 May 2025 14:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BA1C4CEEB;
	Fri,  9 May 2025 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800231;
	bh=/PIseCcZUdjenlJfiK9ityerZ5vunYK2BIb4xzakXsY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lNRTj5COI1LxN5vFI2zoyMg5fRwlQKKh3fjA8VOUZUu5J+u3dBR8AwnlA2dm7UURL
	 olg1CYEwp94CDD3L6ZEA3Z+ujx98/8FsvRw8+bECKFZSxENdXq0S0RE5PXKxRtnmkr
	 pwbHE5a2PwrTPhEopzFF7hjcGmm52RVloMhH5Fk+ZgQnUH71hJWcH7CcySsLOgWeGP
	 Koj1/JE1dAequF97dxppbTjei2ZLWgxexZ/QP7odwZHvNE9D0FLmP7g+7UQGVUhTa8
	 ciEBi2niTEYug5BbnkyYJJ7JwBI6SuilUO1btJuB/OIIoHuf25RB1gg0rY91i82GL/
	 uOFkan+F91s7w==
Date: Fri, 09 May 2025 09:17:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 linux-arm-kernel@lists.infradead.org, 
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>, arnd@linaro.org, 
 Dan Nica <dan.nica@nxp.com>, linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, dan.carpenter@linaro.org, 
 Andra-Teodora Ilie <andra.ilie@nxp.com>, 
 Xulin Sun <xulin.sun@windriver.com>, larisa.grigore@nxp.com, 
 Sascha Hauer <s.hauer@pengutronix.de>, andrei.stefanescu@nxp.com, 
 Marius Trifu <marius.trifu@nxp.com>, Chester Lin <chester62515@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: James Clark <james.clark@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
Message-Id: <174679985557.3369558.10881468523148413098.robh@kernel.org>
Subject: Re: [PATCH 00/14] spi: spi-fsl-dspi: DSPI support for NXP S32G
 platforms
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_071712_499084_382D186B 
X-CRM114-Status: GOOD (  18.44  )
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


On Fri, 09 May 2025 12:05:47 +0100, James Clark wrote:
> DT and driver changes for DSPI on S32G platforms. First 4 commits add
> new S32G registers and device settings along with restricting userspace
> register access properly for all devices. Then some DMA mode fixes along
> with adding support for target mode, which uses DMA. Followed by some
> other minor bug fixes and then finally add the DT compatibles and
> binding docs.
> 
> ---
> Andra-Teodora Ilie (1):
>       spi: spi-fsl-dspi: Enable modified transfer protocol
> 
> Bogdan-Gabriel Roman (1):
>       spi: spi-fsl-dspi: Halt the module after a new message transfer
> 
> Ciprian Marian Costea (2):
>       dt-bindings: spi: dspi: Add S32G support
>       spi: spi-fsl-dspi: Enable support for S32G platforms
> 
> James Clark (2):
>       spi: spi-fsl-dspi: Define regmaps per device
>       spi: spi-fsl-dspi: Re-use one volatile regmap for both device types
> 
> Larisa Grigore (7):
>       spi: spi-fsl-dspi: restrict register range for regmap access
>       spi: spi-fsl-dspi: Add config and regmaps for S32G platforms
>       spi: spi-fsl-dspi: Avoid setup_accel logic for DMA transfers
>       spi: spi-fsl-dspi: Reset SR flags before sending a new message
>       spi: spi-fsl-dspi: Use DMA for S32G controller in target mode
>       spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G
>       arm64: dts: Add DSPI entries for S32G platforms
> 
> Marius Trifu (1):
>       spi: spi-fsl-dspi: Use spi_alloc_target for target
> 
>  .../devicetree/bindings/spi/fsl,dspi.yaml          |  18 ++
>  arch/arm64/boot/dts/freescale/s32g2.dtsi           |  78 +++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi           |  78 +++++
>  arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |  87 +++++
>  arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |  77 +++++
>  drivers/spi/Kconfig                                |   4 +-
>  drivers/spi/spi-fsl-dspi.c                         | 356 +++++++++++++++------
>  7 files changed, 592 insertions(+), 106 deletions(-)
> ---
> base-commit: 9c69f88849045499e8ad114e5e13dbb3c85f4443
> change-id: 20250325-james-nxp-spi-caf1e2099231
> 
> Best regards,
> --
> James Clark <james.clark@linaro.org>
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
 Base: using specified base-commit 9c69f88849045499e8ad114e5e13dbb3c85f4443

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org:

arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: pinctrl@4009c240 (nxp,s32g2-siul2-pinctrl): 'dspi1_pins', 'dspi5_pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: pinctrl@4009c240 (nxp,s32g2-siul2-pinctrl): 'dspi1_pins', 'dspi5_pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: spidev@0 (rohm,dh2228fv): 'fsl,spi-cs-sck-delay', 'fsl,spi-sck-cs-delay' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: pinctrl@4009c240 (nxp,s32g2-siul2-pinctrl): 'dspi1_pins', 'dspi5_pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#






