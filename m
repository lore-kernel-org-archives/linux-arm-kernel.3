Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09821C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQhevLzq+0JAmAdFdotxiiDPeyGySUZqcPuLyYyEsyI=; b=uW4zyNyvIoVKjLoP+qV5shDOt1
	MKUF33IJZB0a7UioIsstjJ01cg/1aPo70CVZJ6dcXOY/xLvRxcIx99rXWaZ/6FEU6thmACSS2VI8n
	90KoqChuC39R4laqfS+feUC7LyNg8TQXG2UR2LYq8DvInnKsN6IToVgJ68oimVVcb7tHhMh/5RGqR
	ui9TKtZvjceHjWN4QFCfs+12EvE/B67xyviSdqpfWVqcsGcYHurMOzIQ2bvTNG06pnX2FM06xC5bK
	Af/+Nm7lACuTqo+Vijk67oUNZ6NHIhrv8iWSzdYSwDlZ/e3k4rL+J1O6sfhflXY4ieC/bSVVy7yT4
	vNY5RumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpb-0000000DgK7-0Kfe;
	Tue, 06 May 2025 23:36:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMxP-0000000D5qi-3xuk;
	Tue, 06 May 2025 18:23:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9300E4A482;
	Tue,  6 May 2025 18:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50702C4CEE4;
	Tue,  6 May 2025 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555835;
	bh=O7yshzV7ZmJF0pt/p2C4mkBTE5rpLNK0CSOvJGcgwFU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rFFHokenCiTgPO/0Ter9/lREgZWg6qzlfqbwKkqkPlaNNgeYzJUwkwrCm08QWVmPV
	 8uPCl2rdVhfSh+761+yWx5FdABmIAotgxrcByaxJWLaLmSThnfJiek7Z+dWqyKAgsB
	 5MYdZQyrNqpBM/6OlbobWDyNhoXiVEppRXkMhBrktEkgm2ul0AkYHT6aGrQgt/ByB1
	 YcLTjWw4V8ri2uxKij3xO6GInHL02Ka/I6RLT0OkRTl1+SmOMQLragucS8bvfN8E9p
	 tBxnoBMLYNVDabtQGGwzBH4p5OGfDf2V0TYXjQgYWoKKbjQIhzsAm6pSawBwpXM8nC
	 ZccOhvBNT3LHQ==
Date: Tue, 06 May 2025 13:23:54 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Jimmy Hon <honyuenkwun@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, FUKAUMI Naoki <naoki@radxa.com>, 
 Andrew Lunn <andrew@lunn.ch>, Kever Yang <kever.yang@rock-chips.com>, 
 linux-kernel@vger.kernel.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Dragan Simic <dsimic@manjaro.org>, 
 Jianfeng Liu <liujianfeng1994@gmail.com>, 
 Alexey Charkov <alchark@gmail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Conor Dooley <conor+dt@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20250506034347.57-1-kernel@airkyi.com>
References: <20250506034347.57-1-kernel@airkyi.com>
Message-Id: <174655575211.2171051.17738454556851250078.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add support for rk3399 industry evaluation
 board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_112356_054791_B54A779E 
X-CRM114-Status: GOOD (  16.55  )
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


On Tue, 06 May 2025 11:43:45 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> General feature for rk3399 industry evaluation board:
> - Rockchip RK3399
> - 4GB LPDDR4
> - emmc5.1
> - SDIO3.0 compatible TF card
> - 1x HDMI2.0a TX
> - 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
> - 1x type-c DisplayPort
> - 3x USB3.0 Host
> - 1x USB2.0 Host
> - 1x Ethernet / USB3.0 to Ethernet
> 
> Tested with HDMI/GPU/USB2.0/USB3.0/TF card/emmc.
> 
> Changes in v3:
> - Link to V2: https://lore.kernel.org/all/20250430074848.539-1-kernel@airkyi.com/
> - Add i2s
> - Add tsadc
> - Fix devicetree coding style
> 
> Changes in v2:
> - Link to V1: https://lore.kernel.org/all/20250427094211.246-1-kernel@airkyi.com/
> - Remove gmac
> - Add rk809 PMIC
> - Add CPU supply
> - Fix io-domain for sdmmc
> - Enable vopl
> 
> Chaoyi Chen (2):
>   dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
>   arm64: dts: rockchip: Add rk3399-evb-ind board
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3399-evb-ind.dts      | 496 ++++++++++++++++++
>  3 files changed, 502 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> 
> --
> 2.49.0
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
 Base: attempting to guess base-commit...
 Base: tags/v6.15-rc1-23-g0d0947766d87 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250506034347.57-1-kernel@airkyi.com:

arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: regulator@10 (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: regulator@1c (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']






