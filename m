Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AFFCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKCIr7pv8D8TBh4vcelM4+FO8jIyRberIJ575gtH0Ys=; b=Uqrivw1wdKlqRtdW4A380Z+qs5
	3/vNhhP7QQz+zeQAz5HTnle8iQOSBYqDtO/2WvN85cew+tBsite8gWyIYDiP9Db7Ee+e7tbYKoYIL
	IvqUNGhbeTN7CkaRWa0YRji9MfANKp4RdTV2NLwWBIFXU2ON7nfm1ixr5z/zYtZ8WNkK3pRP3HHsf
	GP7CaWReGUUe4XR+ZZZ3zWvhV4RsZNB6ZKHJEvA+ewRHgrN6gtgBSrMiiNWFdwAZIi5UZUlYgz3dh
	KHm0Hc+bgHqRkWET98ACyW9H6aWD1aX4PvWhlgiouyYUv0QW5xrY1PzUQtHVkHOh3xmxQqocwkGJl
	8tFJPS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1zp-00000003YAz-3Dza;
	Fri, 15 Aug 2025 21:29:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1pR-00000003XFc-3gJk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 21:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CAB361419;
	Fri, 15 Aug 2025 21:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CF7C4CEEB;
	Fri, 15 Aug 2025 21:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755292752;
	bh=SFuIvMcXySzIx6yuydmTiDrtSS+EI5n+sZ5HoAj+x0k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=phFJpywgeyQwzIyKIk+4Lh/bDlBiKZByUqRnjnYbPYVk3PX00e2+cGH6SyKH9x5Is
	 L4ejGwt/Kgi9F/PAdXPi6kq39L+a6NmqapYkKNXC4lvrZgaRTlVVyXQ9Sn1lPDPxkc
	 BuefW1nj6RUGcTz4yvJkk3VR/V5bv23/iEdTrs6uusRqFU9eyS+2ae5LZQ6dIV9RL5
	 eaLFEQgwYKgNjFXCLNDGuFg/CFbvlwXQrrA7fFZZAlWnDMFxL8VF+M8I/i6xLPGXVQ
	 jtkf6CPdG6AVQaJRZMT1yH6oRaxHi76MJbj5x4fwJOnBx0PnGpNiJApxyPTthU6zWX
	 x4V/MBF2+d+gw==
Date: Fri, 15 Aug 2025 16:19:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Luke Wang <ziniu.wang_1@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joy Zou <joy.zou@nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com>
References: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com>
Message-Id: <175529260128.3212429.5776706257290268748.robh@kernel.org>
Subject: Re: [PATCH 00/13] arm64: dts: imx95: various updates
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


On Fri, 15 Aug 2025 17:03:46 +0800, Peng Fan wrote:
> This patchset is to upstream various downstream changes.
> - Correct edma channel for lpuart7/8
> - Add System Counter, SCMI LMM/CPU, V2X MU, coresight nodes
> - Update alias
> - Add phy supply for netc, pca9632, pf09/pf53 thermal, spidev, cma nodes
>   and etc.
> 
> dtbs_check will report a few failures, such as linux,code, db suffix.
> The failures are not related to this patchset.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Joy Zou (1):
>       arm64: dts: imx95: Correct the lpuart7 and lpuart8 srcid
> 
> Luke Wang (1):
>       arm64: dts: imx95-15x15-evk: Change pinctrl settings for usdhc2
> 
> Peng Fan (10):
>       arm64: dts: imx95: Add System Counter node
>       arm64: dts: imx95: Add LMM/CPU nodes
>       arm64: dts: imx95: Add more V2X MUs
>       arm64: dts: imx95: Add OCOTP node
>       arm64: dts: imx95: Add coresight nodes
>       arm64: dts: imx95-evk: Update alias
>       arm64: dts: imx95-19x19-evk: Add phy supply for netc
>       arm64: dts: imx95-19x19-evk: Add pca9632 node
>       arm64: dts: imx95-19x19-evk: Add pf09 and pf53 thermal zones
>       arm64: dts: imx95-19x19-evk: Add spidev0
> 
> Richard Zhu (1):
>       arm64: dts: imx95-19x19-evk: Add Tsettle delay in m2 regulator
> 
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  29 +++-
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 120 ++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi          | 165 +++++++++++++++++++++-
>  3 files changed, 306 insertions(+), 8 deletions(-)
> ---
> base-commit: ff837884a4642382a24d10fd503acf2c3a472f10
> change-id: 20250813-imx9-dts-664f7ba66ae7
> 
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
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
 Base: base-commit ff837884a4642382a24d10fd503acf2c3a472f10 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250815 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com:

arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: mdio@0,0 (pci1131,ee00): Unevaluated properties are not allowed ('phy-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,enetc-mdio.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: mdio@0,0 (pci1131,ee00): Unevaluated properties are not allowed ('phy-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/fsl,enetc-mdio.yaml#






