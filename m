Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29687D1D480
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XPT4kyKYWC9XCoQvOsKcAG5FlkifczPZ175KiALfnE=; b=BJbqM8pKJLa5PR58mapZ8iB/jd
	ElznvBwl5iDrh2ZZeblWQgqhLajgd+SJzOjCj/MFc7gj/5sg2PM3h+7yph58oWPQIHdFlavVmCK1O
	JSOFL9C07IGVk+KTvc9tPaE3qCQWd6P3nYhho3o3BD6qMzxuSP+InvOtXJyeZwSNmybo7TP5KaXop
	g8OC52LQ4qDhA9UuxbfC4O+7QYiHaHYFNpWDDPGOyHxVP2WC6XA1nFSMLPjccbZGbiAk4sILYAxi5
	wxI1nhK1dPcNIQ4HdRDrEcV7cEDAaJhjLQS0HYhkvJEBE1Sf4MJUME5AgnpRafPTLKsKrIbTOOWRG
	+McUGbqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdse7-000000004zx-1nvA;
	Thu, 08 Jan 2026 16:13:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdse5-000000004yu-2ofp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:13:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB6B460147;
	Thu,  8 Jan 2026 16:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9442CC116D0;
	Thu,  8 Jan 2026 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767888836;
	bh=yO7nRgy8tI+sRMJz6/yC4t4URWFzwpDFIL9yzGc2m44=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=RQC8fbYRNJVwcWjV4up2h8TBUcYNAHrg9X5SJzMk92vqtljEo2xVRz1Xv7zO//6u/
	 NCun1aOW2ZAyFx1FdRhdHPN3T/j3cKeN9GgX0yNWPte80TXuye396bUqbpqgolkH8c
	 aWglifRM2QIP57vy88IlYjE7AU3zr52mtb6IuKwQYTyOOO1pQiWTbhtPq9xvCUm3nC
	 7Zik2bNxfB5KGXdZi57GkFlU9sFCbgCu3+8ZFJ0Zi3+QrQ5VCM5gho8d9JkKpslLCH
	 K949RluPRgwY/zztYuJJWGUm1nSGRWBNeSk3gg7wqiutc++FBLmO5j1v8kVEi2qrGk
	 sGlM6qNsbOz3A==
From: Rob Herring <robh@kernel.org>
Date: Thu, 08 Jan 2026 10:13:55 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org, 
 Gunho Lee <gunho.lee@lge.com>, Kael D'Alcamo <dev@kael-k.io>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chanho Min <chanho.min@lge.com>
In-Reply-To: <20260108082213.6545-1-chanho.min@lge.com>
References: <20260108082213.6545-1-chanho.min@lge.com>
Message-Id: <176788870880.376475.13308764226546768133.robh@kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: Initial support for LG1215 TV SoC
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


On Thu, 08 Jan 2026 17:22:10 +0900, Chanho Min wrote:
> This patch series adds initial device tree support for the LG1215
> TV SoC and its reference board.
> 
> Series overview:
>   1/3 - dt-bindings: vendor-prefixes: Add 'lge' prefix for LG Electronics
>   2/3 - dt-bindings: arm: lge: Add compatible for LG1215 SoC and ref board
>   3/3 - arm64: dts: lg: Initial support for LG1215 SoC and reference board
> 
>  .../devicetree/bindings/arm/lge.yaml          |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/lg/Makefile               |   1 +
>  arch/arm64/boot/dts/lg/lg1215-ref.dts         |  51 +++
>  arch/arm64/boot/dts/lg/lg1215.dtsi            | 304 ++++++++++++++++++
>  5 files changed, 363 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/lg/lg1215-ref.dts
>  create mode 100644 arch/arm64/boot/dts/lg/lg1215.dtsi
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
 Base: tags/next-20260108 (best guess, 2/3 blobs matched)
 Base: tags/next-20260108 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/lg/' for 20260108082213.6545-1-chanho.min@lge.com:

arch/arm64/boot/dts/lg/lg1215-ref.dtb: / (lge,lg1215-ref): opp_table@0: 'anyOf' conditional failed, one must be fixed:
	'reg' is a required property
	'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: cpu@0 (arm,cortex-a78): Unevaluated properties are not allowed ('l2-cache@0' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: cpu@100 (arm,cortex-a78): Unevaluated properties are not allowed ('l2-cache@100' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: cpu@200 (arm,cortex-a78): Unevaluated properties are not allowed ('l2-cache@200' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: cpu@300 (arm,cortex-a78): Unevaluated properties are not allowed ('l2-cache@300' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: opp_table@0 (operating-points-v2): $nodename:0: 'opp_table@0' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: opp_table@0 (operating-points-v2): Unevaluated properties are not allowed ('opp-default', 'opp-shared' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: clk-bus (fixed-factor-clock): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/fixed-factor-clock.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: soc (simple-bus): dwmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: amba (simple-bus): $nodename:0: 'amba' does not match '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: watchdog@fd200000 (arm,sp805): clock-names:0: 'wdog_clk' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: watchdog@fd200000 (arm,sp805): clock-names: ['apb_pclk'] is too short
	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: watchdog@fd200000 (arm,sp805): clocks: [[13]] is too short
	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: dma@ff200000 (arm,pl080): '#dma-cells' is a required property
	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: dma@ff200000 (arm,pl080): $nodename:0: 'dma@ff200000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml
arch/arm64/boot/dts/lg/lg1215-ref.dtb: dma@ff200000 (arm,pl080): '#dma-cells' is a required property
	from schema $id: http://devicetree.org/schemas/dma/arm-pl08x.yaml






