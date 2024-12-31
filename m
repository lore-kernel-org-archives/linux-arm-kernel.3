Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10196E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJ1QWhlbizbgkqrMxNODDh/86hU/7KB0rVD9Z3ckQRI=; b=OdcCuKppPysY9nO2nKjWxgIFVA
	zbR0RC2Ywb4a7rYLJELPZCwTTqh/F1yyhMXnhE65wpiMvUDG6aIhVLacR4pajZE3IRpj+kD1OZ9UR
	eE4CLdN8/nGaGuG054ycgeGogK1UXi6sXLRxmJJHQ0gCwkJbzk3oC5NdXgpd8h2kU2LCurwZKo1Zr
	JhVBMYFg5ln9OzjJYnbErcBbB5zA7OGxeUPKl8ZQkOua0n/RiWg9CRAOpUFsrm6cgVZe9BpWfVeCx
	ASFleZahbEeQR+6rg9rxNL/KfFXY4cI2uB3nOFM7HmPENFdZ6v/8s2zH5vSgKUpbd2eR7XyNojYyC
	kV9akfSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSbpU-00000007DNy-3I0r;
	Tue, 31 Dec 2024 12:58:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSboK-00000007D7V-3I3F;
	Tue, 31 Dec 2024 12:57:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A17235C5C76;
	Tue, 31 Dec 2024 12:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7502DC4CED2;
	Tue, 31 Dec 2024 12:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735649843;
	bh=DaJywbsTA8NGdYwIFXUSu9T2zpzn+s7K/k0e2i6sSeQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Dj8dUZsuOn8uA2TksktkcC1mV4tZ6+oxYppAnFUZlWONHYtst6GKGAT+WeZ8Fb0Tu
	 kxrnoBtRXPC4SKNu05FUYkl55iFgkfpp+SpwE7bpAy7ocYI5zTaGvsVd7G+ck3Kn6u
	 xjwoNKaOrtOYiTNP+bZzQhG8aq2eiKc0JeYKri2qh0WcKDd8G4AvqcZftJQwEy8lzX
	 tZkqTrkYzCN67Kq6C2wP8ZQsfWjJ2serUjBZ5adtdQRF18qSkEhoREWQxvTJqvvnkS
	 /gl02vWbI3uOL7642Z9p9n2DhBd/kljU4EK4Fl1D6w3QLHKkAOtidou/JRmNxRz/zG
	 CVP0BW3X9lMBg==
Date: Tue, 31 Dec 2024 06:57:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, detlev.casanova@collabora.com, 
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org
To: Andy Yan <andyshrk@163.com>
In-Reply-To: <20241231095728.253943-1-andyshrk@163.com>
References: <20241231095728.253943-1-andyshrk@163.com>
Message-Id: <173564980410.21979.2947276365464229762.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Add display subsystem dt node on rk3576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_045724_946725_E7B411EC 
X-CRM114-Status: GOOD (  13.33  )
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


On Tue, 31 Dec 2024 17:57:17 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> As the VOP[0] and HDMI[1] driver have already been submitted for review.
> This series enable hdmi display on sige5 board.
> 
> [0] https://lore.kernel.org/linux-rockchip/20241231090802.251787-1-andyshrk@163.com/T/#t
> [1] https://lore.kernel.org/linux-rockchip/20241231094425.253398-1-andyshrk@163.com/T/#t
> 
> Changes in v3:
> - Split from https://lore.kernel.org/linux-rockchip/3330586.aeNJFYEL58@diego/T/#t
> 
> Andy Yan (3):
>   arm64: dts: rockchip: Add vop for rk3576
>   arm64: dts: rockchip: Add hdmi for rk3576
>   arm64: dts: rockchip: Enable hdmi display on sige5
> 
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts |  47 +++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 126 ++++++++++++++++++
>  2 files changed, 173 insertions(+)
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3576-armsom-sige5.dtb' for 20241231095728.253943-1-andyshrk@163.com:

arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/syscon@26032000: failed to match any schema with compatible: ['rockchip,rk3576-hdptxphy-grf', 'syscon']
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: iommu@27d07e00: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-iommu', 'rockchip,rk3568-iommu'] is too long
	'rockchip,rk3576-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
	'rockchip,rk3576-iommu' is not one of ['rockchip,rk3588-iommu']
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/iommu@27d07e00: failed to match any schema with compatible: ['rockchip,rk3576-iommu', 'rockchip,rk3568-iommu']
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/hdmi@27da0000: failed to match any schema with compatible: ['rockchip,rk3576-dw-hdmi-qp']
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: compatible:0: 'rockchip,rk3576-hdptx-phy' is not one of ['rockchip,rk3588-hdptx-phy']
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy'] is too long
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: resets: [[17, 428], [17, 450], [17, 451], [17, 452]] is too short
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:0: 'phy' was expected
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:1: 'apb' was expected
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:2: 'init' was expected
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:3: 'cmn' was expected
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names: ['apb', 'init', 'cmn', 'lane'] is too short
	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/hdmiphy@2b000000: failed to match any schema with compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy']






