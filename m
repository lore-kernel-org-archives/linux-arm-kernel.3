Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50915CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogTDAKycyeYau6M5ybIvF06Ijn8EFAb3yYrnyAb0SxU=; b=J/+iRaI6JRh7NwbXjBmGjGHCbc
	l188Kd1tNhvn4oYUNynKoRSxO/83BLFiQRcVsWgLpDHLkeHH8gQjQTCJaw1ur2UQfpM26k3xK4EjP
	qb9ABPVz317xZgfBZRdUE73e0/Mj6g6gj/wRsS8dL6HDgkPjTy+BZwqhxVn/3RRac1okLOcNVOyjS
	uCmdjuPNsITW2CCG9uQl1z0kZUSAfBbogizfF2yMmJFDDeApYG+r2w2bgpCRTKtpv51Dm6rWeMA5d
	2Bfe1H7YMjDy5c5WNa+XzCYxIcm80Lx9Z87lph7P5GiyB+wpBqNAdWj9jLtKKbwCRQGgmzZ5AEXqm
	fGo29Pww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFxq-00000000D0r-0vgp;
	Thu, 18 Sep 2025 14:50:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFxl-00000000Cye-1Klv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBF6444BFB;
	Thu, 18 Sep 2025 14:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F47FC4CEFC;
	Thu, 18 Sep 2025 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758207020;
	bh=EGsvc6/poxlYGOmwfkAkyjwqmGrwabohfckBDBt6qLU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=o+bu+FpcUsRQwpcYC/zXQMrb6yV0rewAe5nv6bCJ8jvkcQwdCwQkV7mQh9lhMXcPd
	 +wc+TLvcaWSi63IPrP0Vfv58sODRhE2ECtkvnqkAl1hV2A4LMWZfyhfrE388/dk63j
	 Sp7Igzr0wWoRS+5Dgp46WQYJJFO8SnaQjyQY7GcUbiLGpzgaifQqjcP2ubIfURyVRG
	 LhhlY36oyZNgifNpCzj2j+2M/RJUo7Jpxc/MYIB5WI6vz/SzLuk7mJFNxenBuM4kUE
	 CMIc2K31xXUaiCzMOZgXbBswj6svMZZRhOEZ+/JJjBuZZWKAt1ioJX8s7Z8Xg6KM8l
	 MW94YzqGNOSkQ==
Date: Thu, 18 Sep 2025 09:50:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, David Jander <david@protonic.nl>, 
 Lucas Stach <l.stach@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>, 
 linux-sound@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org
To: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
Message-Id: <175820686555.1653903.2952526182667328137.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Mainline Protonic PRT8ML board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_075021_399929_89A471CD 
X-CRM114-Status: GOOD (  17.93  )
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


On Thu, 18 Sep 2025 14:19:43 +0200, Jonas Rebmann wrote:
> This series adds the Protonic PRT8ML device tree as well as some minor
> corrections to the devicetree bindings used.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
> Changes in v2:
> - Dropped "ASoC: dt-bindings: asahi-kasei,ak4458: Reference common DAI
>   properties", applied to broonie/sound for-next (Thanks, Mark)
> - Updated description of the reset-gpios property in sja1105 binding to
>   address the issues of connecting this pin to GPIO (Thanks, Vladimir)
> - Added the fec, switch and phy for RJ45 onboard ethernet after
>   successful testing
> - Consistently use interrupts-extended
> - Link to v1: https://lore.kernel.org/r/20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de
> 
> ---
> Jonas Rebmann (3):
>       dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios property
>       dt-bindings: arm: fsl: Add Protonic PRT8ML
>       arm64: dts: add Protonic PRT8ML board
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>  .../devicetree/bindings/net/dsa/nxp,sja1105.yaml   |   9 +
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts    | 500 +++++++++++++++++++++
>  4 files changed, 511 insertions(+)
> ---
> base-commit: ea21fa34164c9ea0a2a5b8714c7e36f54c7fb46e
> change-id: 20250701-imx8mp-prt8ml-01be34684659
> 
> Best regards,
> --
> Jonas Rebmann <jre@pengutronix.de>
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
 Base: using specified base-commit ea21fa34164c9ea0a2a5b8714c7e36f54c7fb46e

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de:

arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: codec@11 (asahi-kasei,ak4458): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#
arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 1]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[77, 6], [77, 4]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#






