Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AECCC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qv+ZzkT8wiOt/Jb449id+th5lYD4svWIp5pF/e792HA=; b=h2iwNLn6jhjsbeEk+f2n6pWrAJ
	xus5sS+N+gKtfeQiy7q3ZZ2xWmCO7tJR1TO65yBliyVvgPMPc5+39l8jcgEenMXdCnarcl8N0F8k2
	VjTluUol8oV57eWJVQcRTCZcssI8fL9PSP9iYQ5pNgFwIxhTODyCxevUlYiF5ZyBs1WwDTNuRPK8r
	HhhyErmaFmUAQ7mxOXvKf/ZYUdpKiigGvPZGsvOfnsMk9rPeZAcc6U5Z2cFmfC1Hi0I+ev1QEPMyW
	ddBKB0T4YOHpWUrEUqJ2FvnYk12xnDrxrJ5sBEh5SmRAOSMzGc2Q/0ONLQo4ldSjMwYVNPkArsAvi
	AmnUBM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k9Q-00000006ZvY-2Rh9;
	Tue, 15 Apr 2025 17:32:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jp3-00000006WXg-2RdQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27E0EA4A51E;
	Tue, 15 Apr 2025 17:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2027C4CEEB;
	Tue, 15 Apr 2025 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744737104;
	bh=4+BEleAxCA1h8yglvPaLoYfzczV5ax1MbrOkRurw+MY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=k0jU74qy0xMb3SOYEjXWLSZQ5D7TqJ9mMdJIgma3+21RPrdjfat0wcauC8QmKJZVC
	 jhY2DQrLJAmM5Y0wRjYBD6Ccu9S3Sbj/f7GJWvk2zRas0Mpqdl9chgkrSJ8UosQxEj
	 269qFRwPTvKYwrWNF9Fen0Ez/IQhxL4tX2tKfvcsV6QNHAMyZUL3YtxT3ZFDsbsY02
	 coPDCT3X+DFEHzcyXhpjeE+JXE8oG6fphdrz40PjYg+TwLMvmruFlJTx4aUNY5nRhy
	 +gsOVT4WakyfRADOdbFTs7kGlTACXJkfBq7nwnjaUIyI6uwhBlrAiPZ0gKdfKVM6Ix
	 w+/Q4V7utNo6Q==
Date: Tue, 15 Apr 2025 12:11:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
To: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
Message-Id: <174473699503.763716.6096044459854517599.robh@kernel.org>
Subject: Re: [PATCH v5 0/8] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_101145_751757_CDCE4E57 
X-CRM114-Status: GOOD (  28.61  )
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


On Tue, 15 Apr 2025 08:54:23 +0200, Maud Spierings wrote:
> Add inital support for 2 variants of the Moduline Display controller.
> This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
> features an imx8mp SoC.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> Changes in v5:
> - Merge the makefile patch into the two dtso patches
> - Fix references to the root node in the dtso patches
> - Enable the USB bus going to the adapter board in the mainboard dts
> - Fix some formatting issues in the mainboard dts
> - Fix some formatting issues in the COM dts
> - Change a clock as suggested in the COM dts
> - Fix the maintainers entries, remove devicetree list and imx list
> - Rebase on latest linux-next
> - Link to v4: https://lore.kernel.org/r/20250402-initial_display-v4-0-9f898838a864@gocontroll.com
> 
> Changes in v4:
> - Add imx mailing list to ka-ro tx8p maintainer entry
> - Fix several small indentation and ordering issues in devicetrees
> - Change the two display adapter boards to overlays
> - Add the missing patch for the Makefile to actually be able to build
>   the new devicetrees
> - Link to v3: https://lore.kernel.org/r/20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com
> 
> Changes in v3:
> - Set regulator-boot-on and always-on on LDO5 of the pmic, after 20 ish
>   seconds it auto disabled this LDO causing weird behaviour like
>   ethernet droping out, wifi not working anymore. This LDO can control
>   the IO voltage level of certain pins, just let it keep the u-boot
>   value.
> - Fix the comment style in imx8mp-pinfunc.h
> - Rebase on newest next tag
> - Link to v2: https://lore.kernel.org/r/20250226-initial_display-v2-0-23fafa130817@gocontroll.com
> 
> Changes in v2:
> - Dropped the trivial-devices patch
> - Added a patch with bindings for the gocontroll,moduline-module-slot
> - Added a patch to spidev.c to enable the spidev driver for the module
>   slot
> - Added a missing usb-c connector in the av101hdt-a10 variant dts
> - Switched to the new bindings for the module slots in the base dts
> - Fixed some commit typos
> - Link to v1: https://lore.kernel.org/r/20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com
> 
> ---
> Maud Spierings (8):
>       dt-bindings: arm: fsl: Add GOcontroll Moduline Display
>       arm64: dts: imx8mp: Add pinctrl config definitions
>       MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
>       MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
>       arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
>       arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
>       arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
>       arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>  MAINTAINERS                                        |  12 +
>  arch/arm64/boot/dts/freescale/Makefile             |   8 +
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  33 ++
>  ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  94 ++++
>  ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 ++++++
>  .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 525 ++++++++++++++++++++
>  .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++++++++++
>  8 files changed, 1360 insertions(+)
> ---
> base-commit: fb44e19e78df2950877a9f7b4f24b58db790d293
> change-id: 20250224-initial_display-fa82218e06e5
> 
> Best regards,
> --
> Maud Spierings <maudspierings@gocontroll.com>
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
 Base: base-commit fb44e19e78df2950877a9f7b4f24b58db790d293 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250415 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250415-initial_display-v5-0-f309f8d71499@gocontroll.com:

arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: / (gocontroll,moduline-display): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#


