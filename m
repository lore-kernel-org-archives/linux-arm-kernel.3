Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F6FC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 13:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmaFFODYA4WuOEa/iNjU9jKKl50ZOOB2lPxVLsHk9Ts=; b=MyztZmcuYx4ABy2u5bEy4WrjGJ
	sz8A/XW0T7DBVqQ2EgnIWBkS9YdaIUiFmrsfPNdXBWjWpgZD+mdnijOKPnAKLzWOY3On4QLMVIrdz
	tGPoACU3+t/LK7pG84OBHJ844xyJgR2LFFdlr4xD7n79e714iC/LdOMMD/YyRqPJ0gPl7K4nYN2S4
	j7TdrY3TgpZ4xG4vVjvIHpuxG/wI4pf5OARIPgANozbwtoErSPiNscI+6zzM+5Xv8HwZ/nugyvmFu
	nxAYMmeTLF0l1i+vXDkQf/W36JmtuFyXvbAetX7UravMHXA5cPuQIUaOn0/w/miqFVka/JyU1hZPG
	EX8gmS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGHSs-00000005k7p-0kFC;
	Sat, 17 May 2025 13:20:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGHQq-00000005jn1-1ICW;
	Sat, 17 May 2025 13:18:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19C91437FD;
	Sat, 17 May 2025 13:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33D6C4CEE3;
	Sat, 17 May 2025 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747487906;
	bh=cR6ux1cRzEhA5LhXUkm5DYutXCMT68lq6F2Uh63Yabk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=b14pDGxBDD2eyfJWePBsv+ZfurVz+xE3Du6uzuBxPP0voFHaXx6cFDvkm1iF6tFG7
	 RJk3EOT7KxurgzIbJgbKs89K+U56YylqkUsZTOBCxsG7t81t0PTBKm0cZln/MQn9+j
	 v2yIX5i5kbeMR/Qddzd2U7rJJEw9JUjNHsF79LS4+0pKiYGwXIBNNMlOE2Oly4cVI3
	 oacSlpCTtp0czQM2Bf/vYlaAKriJNSH63EkIS+e/emlmX34juR+5Z4OQWdBvkXTMsD
	 y6aGoFQkS+xlBGiVTf7of+DHv4stOkD6X0xsVskCo25qppV0AguNLj/lbTvKZpzkKC
	 okV0o0JyhAf1A==
Date: Sat, 17 May 2025 08:18:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: sfr@canb.auug.org.au, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
To: Hsun Lai <i@chainsx.cn>
In-Reply-To: <20250516012402.580468-1-i@chainsx.cn>
References: <20250516012402.580468-1-i@chainsx.cn>
Message-Id: <174748776864.930436.6066844378633879191.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add support for Firefly
 Station-M3/ROC-RK3588S-PC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_061828_368793_039C07D7 
X-CRM114-Status: GOOD (  17.87  )
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


On Fri, 16 May 2025 09:24:00 +0800, Hsun Lai wrote:
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> 
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
> 
> Changes in v3:
> - Update the name of leds
> - Add more cpu nodes
> - Update mdio compatible
> - Fix the order in the node
> - Add the default serial port(uart2)
> 
> Changes in v2:
> - Fix rgmii delays
> 
> Changes in v1:
> - Add support for Firefly ROC-RK3588S-PC
> 
> Hsun Lai (2):
>   dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
>   arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 926 ++++++++++++++++++
>  3 files changed, 932 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> 
> --
> 2.34.1
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
 Base: remotes/arm-soc/rockchip/dt64-31-ge463625af7f9 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250516012402.580468-1-i@chainsx.cn:

arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /edp@fdec0000: failed to match any schema with compatible: ['rockchip,rk3588-edp']






