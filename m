Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1568C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 03:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UrXXMjriOA1lot5xzmZCM0ICKBpgtR3WlNbc1EolkY=; b=APJA5oMewAZu6NzxGumvBjSDkg
	7drdz62/pkn7mIafP06OgKYyIVW/7BV10zGqaD7EoANupRiHbEYvFfw7kll0YztLFPKOC6uXix8JV
	PteULDtAKTt7PXBoOb5tNoezXPyA8M0/v1Or9v27NHtGeDbvTLs3y773Y3Yoxc85yWLH7CVMXP2Py
	WOfV7u9UpiI/23cP/Ggm4RAK8avncG/EJkjPph+UDzeBajLNp2ZRtpPlzfPtqmdOApx8ghF6APQL3
	dz3DCtdle6RmKBypVBy1TpuECDXwyzrO55Hp5pfGw5xeomdUuj2jhkrG5xjKOrjMtD8oiR4v0oEa0
	r1WtkZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twumc-00000004kNN-0NN9;
	Tue, 25 Mar 2025 03:16:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twujC-00000004jsY-3p5j;
	Tue, 25 Mar 2025 03:13:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24CB744BB2;
	Tue, 25 Mar 2025 03:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30809C4CEDD;
	Tue, 25 Mar 2025 03:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742872402;
	bh=E7hVehIeYXHEFzo2cwihH0hixCMqgRhmdfHFRgEeypc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZJ/8rdmgejL5ITSuOME+enjRg5eUU+Nk4/jaCfVmLOZdqVbUIHzu3UUpdIiIh0wFV
	 crk+JWcbsM9tidy0Rj0wpAiKiQwCoTV6jLxecNH2LqUt4ph2Im88XI601JjfyoXOjg
	 CNay8ntkC/3jAEtnWf+sB2edz89pd7FVSqHzSO/r5UYyHLfSc9zHOCQO5B+Hqx34jd
	 nZTrg4igkAFmj0fxQbn2kLQpbFvhsSig3T1RDFmmfayXF46Ul1FjUlitv5Kdd+VogW
	 x3VSfKpNA5ObqmwFJiPLkh/uvMxI9iz2RQwAtD8sQXsrEiPOwFinmVjDSO2vACyw7g
	 iauhapHA3WZEg==
Date: Mon, 24 Mar 2025 22:13:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
In-Reply-To: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
References: <20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org>
Message-Id: <174287236051.1618248.4100886448951731382.robh@kernel.org>
Subject: Re: [PATCH 0/5] arm64: dts: rockchip: add ROCK 5B+ support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_201322_993003_7390E748 
X-CRM114-Status: GOOD (  17.27  )
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


On Mon, 24 Mar 2025 18:04:21 +0100, Sebastian Reichel wrote:
> This series adds support for the ROCK 5B+, which (as the name suggests)
> is an improved version of the ROCK 5B. It also adds initial USB-C
> support for both the ROCK 5B and the 5B+.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Sebastian Reichel (5):
>       arm64: dts: rockchip: move rock 5b to include file
>       arm64: dts: rockchip: move rock 5b to include file
>       dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
>       arm64: dts: rockchip: add Rock 5B+
>       arm64: dts: rockchip: add USB-C support for ROCK 5B and 5B+
> 
>  .../devicetree/bindings/arm/rockchip.yaml          |    5 +
>  arch/arm64/boot/dts/rockchip/Makefile              |    1 +
>  .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  117 +++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  952 +----------------
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1087 ++++++++++++++++++++
>  5 files changed, 1220 insertions(+), 942 deletions(-)
> ---
> base-commit: 76728fe54f547950f73c9dc446beb2e31604abd7
> change-id: 20250324-rock5bp-for-upstream-fd85b00b593b
> 
> Best regards,
> --
> Sebastian Reichel <sre@kernel.org>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org:

arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: power-controller: power-domain@12: Unevaluated properties are not allowed ('domain-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/power/rockchip,power-controller.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
	'rockchip,rk3066-spdif' was expected
	'rockchip,rk3228-spdif' was expected
	'rockchip,rk3328-spdif' was expected
	'rockchip,rk3366-spdif' was expected
	'rockchip,rk3368-spdif' was expected
	'rockchip,rk3399-spdif' was expected
	'rockchip,rk3568-spdif' was expected
	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /spdif-tx@fddb0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: spdif-tx@fdde0000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
	'rockchip,rk3066-spdif' was expected
	'rockchip,rk3228-spdif' was expected
	'rockchip,rk3328-spdif' was expected
	'rockchip,rk3366-spdif' was expected
	'rockchip,rk3368-spdif' was expected
	'rockchip,rk3399-spdif' was expected
	'rockchip,rk3568-spdif' was expected
	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /spdif-tx@fdde0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /rng@fe378000: failed to match any schema with compatible: ['rockchip,rk3588-rng']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: spdif-tx@fe4e0000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
	'rockchip,rk3066-spdif' was expected
	'rockchip,rk3228-spdif' was expected
	'rockchip,rk3328-spdif' was expected
	'rockchip,rk3366-spdif' was expected
	'rockchip,rk3368-spdif' was expected
	'rockchip,rk3399-spdif' was expected
	'rockchip,rk3568-spdif' was expected
	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /spdif-tx@fe4e0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: spdif-tx@fe4f0000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
	'rockchip,rk3066-spdif' was expected
	'rockchip,rk3228-spdif' was expected
	'rockchip,rk3328-spdif' was expected
	'rockchip,rk3366-spdif' was expected
	'rockchip,rk3368-spdif' was expected
	'rockchip,rk3399-spdif' was expected
	'rockchip,rk3568-spdif' was expected
	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /spdif-tx@fe4f0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: spdif-tx@fddb8000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
	'rockchip,rk3066-spdif' was expected
	'rockchip,rk3228-spdif' was expected
	'rockchip,rk3328-spdif' was expected
	'rockchip,rk3366-spdif' was expected
	'rockchip,rk3368-spdif' was expected
	'rockchip,rk3399-spdif' was expected
	'rockchip,rk3568-spdif' was expected
	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /spdif-tx@fddb8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: spdif-tx@fdde8000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
	'rockchip,rk3066-spdif' was expected
	'rockchip,rk3228-spdif' was expected
	'rockchip,rk3328-spdif' was expected
	'rockchip,rk3366-spdif' was expected
	'rockchip,rk3368-spdif' was expected
	'rockchip,rk3399-spdif' was expected
	'rockchip,rk3568-spdif' was expected
	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /spdif-tx@fdde8000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /hdmi_receiver@fdee0000: failed to match any schema with compatible: ['rockchip,rk3588-hdmirx-ctrler', 'snps,dw-hdmi-rx']
arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: vop@fdd90000: clocks: [[33, 605], [33, 604], [33, 609], [33, 610], [33, 611], [33, 612], [33, 603], [107], [108]] is too long
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#






