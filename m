Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C35C369B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK++uFEzmsaNkl8pp7fjHCTue8YGj+tDVXVxx2BqsuE=; b=B4cOx8mGJZZ3duQdWGbriWhNIt
	gHai4bY4vTVC6xLH3ZWGBSXtmtwoI8r8xVtAJX/V1OoR0GB7RPxT1aGyql/3cQpjWvaPbfXrtN0uU
	NNrYycWwsTFdglk57AqQiCOzzr2XfnTRguYp2fdf0Z8G30P7h0z4eL8p7UWIezB2BAwtoQNYUb+pN
	fOsI/oZTGXorZ756bgChUAkT74OQh2OBN/Xnmv22CFyIVWLVVJDUmzcje7enlWW2x9U+oXMYMLdvx
	pszfXYZy9gB/35ZBIgrDjqqNV1r3K8kfIBCe1c4mbdc8rE4Sk9RwJAJUeG4G7nbjEgU9xOR8JsdH1
	CO5gv7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ESB-0000000DvDz-29XE;
	Fri, 11 Apr 2025 13:29:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EA3-0000000Drdr-2HA7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:11:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2ED96845E;
	Fri, 11 Apr 2025 13:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B3FC4CEE2;
	Fri, 11 Apr 2025 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744377070;
	bh=MBtfZeK+L5SE/OxjFO69UjaSHdP7HcfrXWtfD3sjoH8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VxMo4+0QAlI/GkifjcZ/vaw/RotkBJdzAJp584XF0DPGrw+EsQPckShtD93kFLJqR
	 tYozVFnWXStZbsw6AOE7IlSZlaQOoh++SopMULCzvGElP4vCpQEpkhIADBNCCHTfjt
	 nnXYbHOlYCSbweing5+XYCbqggIlKdH+rzp/To0jdoFSbdKB73IYRxFr8BLIrmopXj
	 mhUh6yd+matkw0MgbU86sLpmUe6iBJkHbMw6//pyglkaqaX4HQ+Z32z4LhbHYRT0dE
	 hW/XTkSk9vhaPlMS/JxTX0JtclG2MyZ/2ugUi/P/AYb0zetDTfhVQ307gm8au3AvlT
	 VEDmEp1tIy7zg==
Date: Fri, 11 Apr 2025 08:11:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Andre Przywara <andre.przywara@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Zhang Rui <rui.zhang@intel.com>, linux-kernel@vger.kernel.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org, 
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Yangtao Li <tiny.windzz@gmail.com>, Samuel Holland <samuel@sholland.org>, 
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, 
 Philipp Zabel <p.zabel@pengutronix.de>
To: iuncuim <iuncuim@gmail.com>
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
Message-Id: <174437699652.3021610.12549809682925096974.robh@kernel.org>
Subject: Re: [PATCH 0/6] Add support for A523 Thermal system
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


On Fri, 11 Apr 2025 08:38:20 +0800, iuncuim wrote:
> This patch series adds temperature sensor support for the Allwinner A523
> family of processors (same die with H728/A527/T527)
> 
> Mikhail Kalashnikov (6):
>   thermal/drivers/sun8i: add gpadc clock
>   thermal/drivers/sun8i: replace devm_reset_control_get to shared
>   thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
>   arm64: dts: allwinner: A523: Add SID controller node
>   arm64: dts: allwinner: A523: Add thermal sensors and zones
>   dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
> 
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     |   5 +
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 145 +++++++++++++++++
>  drivers/thermal/sun8i_thermal.c               | 154 +++++++++++++++++-
>  3 files changed, 300 insertions(+), 4 deletions(-)
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
 Base: tags/next-20250411 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/allwinner/' for 20250411003827.782544-1-iuncuim@gmail.com:

arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-cc.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h3-it.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5-devboard.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dtb: efuse@3006000 (allwinner,sun50i-a523-sid): compatible: 'oneOf' conditional failed, one must be fixed:
	['allwinner,sun50i-a523-sid', 'allwinner,sun50i-a64-sid'] is too long
	'allwinner,sun4i-a10-sid' was expected
	'allwinner,sun7i-a20-sid' was expected
	'allwinner,sun8i-a83t-sid' was expected
	'allwinner,sun8i-h3-sid' was expected
	'allwinner,sun20i-d1-sid' was expected
	'allwinner,sun50i-a64-sid' was expected
	'allwinner,sun50i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
	'allwinner,sun50i-h5-sid' was expected
	'allwinner,sun50i-h6-sid' was expected
	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dtb: efuse@3006000 (allwinner,sun50i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun50i-a523-sid', 'allwinner,sun50i-a64-sid']
arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.2.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab-early-adopter.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: efuse@3006000 (allwinner,sun50i-a523-sid): compatible: 'oneOf' conditional failed, one must be fixed:
	['allwinner,sun50i-a523-sid', 'allwinner,sun50i-a64-sid'] is too long
	'allwinner,sun4i-a10-sid' was expected
	'allwinner,sun7i-a20-sid' was expected
	'allwinner,sun8i-a83t-sid' was expected
	'allwinner,sun8i-h3-sid' was expected
	'allwinner,sun20i-d1-sid' was expected
	'allwinner,sun50i-a64-sid' was expected
	'allwinner,sun50i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
	'allwinner,sun50i-h5-sid' was expected
	'allwinner,sun50i-h6-sid' was expected
	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: efuse@3006000 (allwinner,sun50i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun50i-a523-sid', 'allwinner,sun50i-a64-sid']
arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-prime.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-libretech-all-h5-cc.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: efuse@3006000 (allwinner,sun50i-a523-sid): compatible: 'oneOf' conditional failed, one must be fixed:
	['allwinner,sun50i-a523-sid', 'allwinner,sun50i-a64-sid'] is too long
	'allwinner,sun4i-a10-sid' was expected
	'allwinner,sun7i-a20-sid' was expected
	'allwinner,sun8i-a83t-sid' was expected
	'allwinner,sun8i-h3-sid' was expected
	'allwinner,sun20i-d1-sid' was expected
	'allwinner,sun50i-a64-sid' was expected
	'allwinner,sun50i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
	'allwinner,sun50i-h5-sid' was expected
	'allwinner,sun50i-h6-sid' was expected
	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: efuse@3006000 (allwinner,sun50i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun50i-a523-sid', 'allwinner,sun50i-a64-sid']
arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dtb: thermal-sensor@1c25000 (allwinner,sun50i-a64-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dtb: thermal-sensor@1c25000 (allwinner,sun50i-h5-ths): clock-names:1: 'gpadc' was expected
	from schema $id: http://devicetree.org/schemas/thermal/allwinner,sun8i-a83t-ths.yaml#






