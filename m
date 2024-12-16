Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C76CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZP9/4+CM5OFXixqoj9JtwSy782vp1Z2y+cgLYsuTByU=; b=KiFT6FKZXHz4p9OW/hLRJ9Tc9U
	Tyc27A6Fxaeg3Z2Yfm7lgdqXFxL2JP2eYVm9UpZ2+SGgusc031kvNiKotc9auSadrsxSLcvjQyWGE
	R7phSO4xk5MtQefPS2GxTovJXKVqOfTMqPGzQDx4j5dxAFF03b3SPOunzQaa+4827bEP/oGHr8e/B
	OT6OevLiMk02AXEW585TzBPL62guILjP87n7z8K0XQktxqdeC6pTRgSGygmntMSr3LioNz9y0ov95
	GeuXhUf9nBMcGkh1seV9hqx/uQlXkEQGXuQ4Vrxbuxgb77gyQZJ5cy9uhzlvgW+VZZlceUG0Qj3jI
	lV0M99AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNE0O-0000000AbV3-1soF;
	Mon, 16 Dec 2024 16:31:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDyF-0000000Ab00-32Ms;
	Mon, 16 Dec 2024 16:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7E35A41875;
	Mon, 16 Dec 2024 16:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01627C4CED4;
	Mon, 16 Dec 2024 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734366562;
	bh=EH/ufdT5EDnouKnjjdGAMRabPTfJmALbDN0nfMT7ml4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rrtCSjKhQyNdd9mpknLtAP4kBqJbnxw5r+4pSydUFfCnyaaeVrOIZLIwLkZvdxNgY
	 NFTPjBZca0lbeQXdkmx+w5SPcmnXa21FW6x4Px+LP5NcKXwy6EnPBl38Lq1eNYLrIQ
	 YJpg1rGy4b7X2O9sNp1hSsQ62Hxd1yftj/QvktYmyXwNN3V/MzAt9L24haWHuJ6RbY
	 DpDSL8xg6Cg14s+3W9/xD3ClsY2s3FdU33XGcGYbgUPnb+uZ0r8r/5hrrNTD5XIbbb
	 9Kj2ONWn4hfQwtLT0a7+dtM9o/7gnmCfTKZ3a81mzL/V3v4hagmIPqQMfpj3tldNlx
	 K6kPADVCFuR4A==
Date: Mon, 16 Dec 2024 10:29:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, heiko@sntech.de
To: Shimrra Shai <shimrrashai@gmail.com>
In-Reply-To: <20241215032507.4739-1-shimrrashai@gmail.com>
References: <20241215032507.4739-1-shimrrashai@gmail.com>
Message-Id: <173436598341.265396.5585546641509709958.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: Add Firefly ITX-3588J
 Board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_082923_896532_2EA417CC 
X-CRM114-Status: GOOD (  16.12  )
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


On Sat, 14 Dec 2024 21:24:52 -0600, Shimrra Shai wrote:
> This is the 3rd draft of the device tree proposal for the Firefly ITX-3588J
> board. The same functionality issues as before are still outstanding;
> however I have cleaned up the style and structure as per the comments by
> Heiko Stübner on version 2. Of particular note is the splitting of the
> device tree source into two files because this platform actually consists
> of two boards: the ITX-3588J baseboard and a single Core-3588J compute
> module stuck in a slot on it.
> 
>  - Shimrra Shai.
> 
> Shimrra Shai (3):
>   arm64: dts: rockchip: add DTs for Firefly ITX-3588J and its Core-3588J
>     SoM
>   dt-bindings: pinctrl: add header for PCA9555 GPIO extender bindings on
>     some Rockchip-based devices
>   dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   7 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../rockchip/rk3588-firefly-core-3588j.dtsi   | 453 +++++++++++
>  .../dts/rockchip/rk3588-firefly-itx-3588j.dts | 712 ++++++++++++++++++
>  .../dt-bindings/pinctrl/rockchip-pca9555.h    |  31 +
>  5 files changed, 1204 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
>  create mode 100644 include/dt-bindings/pinctrl/rockchip-pca9555.h
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3588-firefly-itx-3588j.dtb' for 20241215032507.4739-1-shimrrashai@gmail.com:

arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:355.39-358.4: Warning (clocks_property): /display-subsystem: Missing property '#clock-cells' in node /phy@fed60000 or bad phandle (referred from clocks[0])
  also defined at arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:292.20-295.3
arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: display-subsystem: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-drm.yaml#
arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: pmic@0: Unevaluated properties are not allowed ('rk806_dvs1_pwrdn' was unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: pcie@fe170000: Unevaluated properties are not allowed ('rockchip,skip-scan-in-resume' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#






