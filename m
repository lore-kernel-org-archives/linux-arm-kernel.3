Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A70C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGKHKuy0wZOgz0HbyXMuRn0klz19TtljWy4YOz6/4PI=; b=AwfdqXB+PD38mXGlW+QNX2syv0
	ju7+s3OQC2LZ9YzXKqhrL17s/xaIT387dtv/seZrNmmBS7B+zwWdGoddllCHoYodSPYcFL0NCF5cP
	1LrM2ue+ZpvBhLPFMcQRZQyzJ5OlrYB0ldeLKp7h+OvW8dynFyltB99THXSG3Pl7oKSZm/z96yzwo
	ez/2cZ6egb1pZGRkpdhaW60EOUXS+SfPcY1Mt4x3fsXn6nFp+ScIiXoPtIHNWypslqEwwBNCjH1O4
	13WMfxnA2fDhSNQY7bsWG0tiMzzbpXez8x7cOJVd9E9oKWcLjBb+bqmmIYUzgzkmipOmRbuhHXj6y
	v8+k4aWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQce-00000004I4Y-2mPN;
	Fri, 09 May 2025 16:30:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOX7-00000003v40-0i4Z;
	Fri, 09 May 2025 14:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A8EF6111F;
	Fri,  9 May 2025 14:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D74C4CEEB;
	Fri,  9 May 2025 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800220;
	bh=ESz1GNUULayHykHNVsPHqqtOkerGF8/b4C3SuIOTQ8I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kQLZtBRALHAvtEsHr/KEQlQ9wQCdYj6paMyy/rENs1LHGCwgueMv31iE063RTy3fH
	 e8StGEkrl+vS+RYJ71N5xx0ztoytFoQjzaeGkKcuNOxCb0kfH0VO/WT8AfaBeu6YXR
	 ROWrJ5p2zEvVVl1Weat51E3zSceCknUDnLRWej/u1mKZy9C/bwXSBZ72/h+2GPZ2Or
	 jdGlVeJWWdONPDxtfL1MH6Cph/k9Zr2ghM7/W3vww1B7tHNg8mIjjfPK0fFvrxalyb
	 p4JtEu8lJ6sNeIzfhLg2Repm8I6+0/TiLzBi+x4BQQh5SCo0qL0Gz8EdUlITWt4BrZ
	 2YgPskyj/oBrg==
Date: Fri, 09 May 2025 09:16:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de, 
 krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20250508150955.1897702-1-heiko@sntech.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
Message-Id: <174679984943.3368422.9645324507043955723.robh@kernel.org>
Subject: Re: [PATCH 0/6] Add two board-families from Theobroma-Systems
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


On Thu, 08 May 2025 17:09:49 +0200, Heiko Stuebner wrote:
> Both the Cobra and PP1516 boards are based around the PX30 SoC and can be
> found with a variety of display options.
> 
> As new boards should not use the deprecated snps,reset-* properties
> in the gmac node, I also added a core mdio-node for the gmac and
> converted the Theobroma Ringneck board over.
> 
> Testing with the new node both before and after converting Ringneck
> showed the board finding its network both when booting locally and
> from the tftp/nfs.
> 
> 
> Heiko Stuebner (6):
>   arm64: dts: rockchip: add basic mdio node to px30
>   arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
>   dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma
>     Systems
>   arm64: dts: rockchip: add px30-cobra base dtsi and board variants
>   dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma
>     Systems
>   arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |  18 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   6 +
>  .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
>  .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
>  .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
>  .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  58 ++
>  arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 570 +++++++++++++++++
>  .../rockchip/px30-pp1516-ltk050h3146w-a2.dts  |  39 ++
>  .../dts/rockchip/px30-pp1516-ltk050h3148w.dts |  39 ++
>  arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 601 ++++++++++++++++++
>  .../boot/dts/rockchip/px30-ringneck.dtsi      |  22 +-
>  arch/arm64/boot/dts/rockchip/px30.dtsi        |   6 +
>  12 files changed, 1473 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
> 
> --
> 2.47.2
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
 Base: tags/v6.15-rc1-1-g59529bbe642d (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250508150955.1897702-1-heiko@sntech.de:

arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: panel@0 (leadtek,ltk500hd1829): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk500hd1829.yaml#
arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dtb: panel@0 (leadtek,ltk050h3148w): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dtb: panel@0 (leadtek,ltk050h3148w): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: panel@0 (leadtek,ltk050h3146w): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: panel@0 (leadtek,ltk050h3146w-a2): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: panel@0 (leadtek,ltk050h3146w-a2): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#






