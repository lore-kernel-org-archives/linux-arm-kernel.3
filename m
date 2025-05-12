Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350CDC3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYh5TVZQQG+/+7nQTC1N3BVdRc2GxfHXhUg/YqyosXU=; b=M56ww56qymFggDyvfjflcJYZWz
	acvywQDONEBJ0nkTgqfoLqM60NZJkkXujy+ohx/AkXuAJ7yFIcalYHtXy1zSHFE0rOSk6MidJ0Uvr
	lEFF2kFQew1FMWmbUsdfExYuUgIixV5B0zS1F/kgzu1ASg4RRpLpuerRYAbdaH6s5yoLJCK/BclZg
	YXfaPmsE4xH+/Z/vSPnvVeoo1tqJAZSAWR9WQBbn4scuo65XyrSIJ60lQ5F3u5KCbkVHEddj5mQ8e
	NNEP4eJHBfILXanBPGqe7tWyVvaAQjiEJrOpRbmtBNCFaCcTgMOnihzQ2xffn30+7MLzGJ7WKd49I
	MYWYw0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETMq-00000009aUD-0PR9;
	Mon, 12 May 2025 13:38:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESb9-00000009R9r-1ZEr;
	Mon, 12 May 2025 12:49:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B3D35C6499;
	Mon, 12 May 2025 12:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBA6C4CEEF;
	Mon, 12 May 2025 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747054174;
	bh=4sCnrLt5+b/Nr3tQwYV/v/pzsN34z6tW/1DRdvCDkkA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SpbNPEA5z2pRB9FzsA6AnqW+zN1ldKwwTpP1A7QSf77pwNFLFkdRLIJLeRXYFNa29
	 lNBVHW6g4Nw3RXEtLg41fUKZgxCD3lCXQlNGeRA4joxIhxtMDEo5jQu8c53P52Q4B8
	 QWIHV/bg2JS7mI+PbHNrELnmcsV+9ddogQ3IbL1xhDjcRliNubkvTTNde2rR6aZhha
	 fc3ZLcpvyxc3ldWXcMos1NNdgBml3Kj/OHj+Qw+emSAFv/+sRGu3uxtQmOUy7g0oBd
	 6flbpqUUip/84Hnz2wF8kb4c467bWnODW1+T+O8//ZA6Mx3e2QH0aAd8zZLp6BX2qT
	 iFdd88Oqrb+iw==
Date: Mon, 12 May 2025 07:49:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, Nicholas Roth <nicholas@rothemail.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Ondrej Jirman <megi@xff.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Dragan Simic <dsimic@manjaro.org>, Conor Dooley <conor+dt@kernel.org>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
References: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
Message-Id: <174705404383.2941320.1978376350297662131.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] Describe the cameras in the PinePhone Pro dts
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_054935_501346_AD26E805 
X-CRM114-Status: GOOD (  21.98  )
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


On Fri, 09 May 2025 23:51:36 +0200, Olivier Benjamin wrote:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
> 
> I have tested these changes on my PinePhone Pro and am able to take
> photos from both cameras using libcamera's cam.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
> Changes in v3:
> - Fixed new DTB warnings reported by Rob Herring's bot
> - Link to v2: https://lore.kernel.org/r/20250302-camera-v2-0-312b44b4a89c@bootlin.com
> 
> Changes in v2:
> - Rebase on mainline
> - Change patch subject to arm64: dts: rockchip
> - Rename new regulators to fit preferred form for fixed regulators
> - Link to v1: https://lore.kernel.org/r/20250228-camera-v1-0-c51869f94e97@bootlin.com
> 
> ---
> Olivier Benjamin (4):
>       dt-bindings: media: ov8858: inherit video-interface-devices properties
>       dt-bindings: media: imx258: inherit video-interface-devices properties
>       arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
>       arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro
> 
>  .../devicetree/bindings/media/i2c/ovti,ov8858.yaml |   4 +-
>  .../devicetree/bindings/media/i2c/sony,imx258.yaml |   4 +-
>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 139 +++++++++++++++++++++
>  3 files changed, 145 insertions(+), 2 deletions(-)
> ---
> --
> Olivier Benjamin <olivier.benjamin@bootlin.com>
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
 Base: tags/v6.15-rc1-102-g2332d042e9b2 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250509-camera-v3-0-dab2772d229a@bootlin.com:

arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@1a (sony,imx258): Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#






