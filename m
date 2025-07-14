Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E93BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Al6fqtSQPJCgl/DrzrTyyt6KZz2u9O5jMUOZ6XFYIdc=; b=lJ6nXzj8ia2XswevGBxL2LDG+B
	YvcSPonGi3D8I2BMMYA9H9PBU0RfvA4816kgdGjdeOLI1tHnzC2io8/fSPLk5FXL4gO5wERKuWlqu
	Ie36aVLYMCg8Fo9Ke57L0cNtrOE6Q0u8HuLtI7hUKsnBeDz4UbqMfm8mjmjoPz3UpfoMH5V84eLI8
	XVwg3SALtt/2sLD+gO40mxEaL9uic2U8eoy7pz4yydEAbWGwByW3lScAZ0qHn+qq0RhRfD06HGup6
	BNAAE59f92d5NAVDsILsxxv2ruHnOqY7LEjqrsmcitbYIXaQ4fZv+RGV6g05vddBRiRz9JLi0EzUf
	mhYiJa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFR-00000003421-330T;
	Mon, 14 Jul 2025 18:49:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL2f-00000002enj-0WmO;
	Mon, 14 Jul 2025 15:24:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8029361464;
	Mon, 14 Jul 2025 15:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18C9C4CEED;
	Mon, 14 Jul 2025 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506671;
	bh=jmQpWZpxE51V1zI7ZcpOFojkr0HJooLaU1IlITgogwg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MnMay5B4uXIGs9rEPEG9MmjC8izp0qe6VSr0AYMqAyVGTPCSbzaeyAIqyFDtjLjv7
	 6CwdDSiz4MVPmRU/Ts8Zhhy5J4a0Us+MYQ7fSCwl1o2UZzHR1WgjBARS+4bxQ1VDQ5
	 V9mTpDUbegvQsbExfgMRDM+cmTwQxR7b6jSf/ClNtHPvndvmAxQsMaKNgosMNOe9+C
	 LKKZobXq7YScJ7vS9qmSHFiLa6m0b/xHEc0lHamc1oH6bA9ZOUBKXqadhjKgw3zvNY
	 kYqcQun9vGNEvaOEikOSX8Ph/ZioOGEK0xtNmUOsN765cMbN1MedZnTxSg6tH0iZll
	 4vSKhHMVm5jVg==
Date: Mon, 14 Jul 2025 10:24:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: s.hauer@pengutronix.de, conor+dt@kernel.org, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, 
 angelogioacchino.delregno@collabora.com, rafal@milecki.pl, 
 rafael@kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, matthias.bgg@gmail.com, rui.zhang@intel.com, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 lukasz.luba@arm.com
To: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20250712195904.6988-1-olek2@wp.pl>
References: <20250712195904.6988-1-olek2@wp.pl>
Message-Id: <175250104102.2052726.927170028799402599.robh@kernel.org>
Subject: Re: [PATCH v4 0/2] Add thermal sensors support for MT7981
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


On Sat, 12 Jul 2025 21:59:02 +0200, Aleksander Jan Bajkowski wrote:
> This patch adds support for the temperature sensor in the MT7981 SoC.
> This sensor is exactly the same as the one in the MT7986.
> 
> Changes in v4:
>  - sorted bindings by fallback names
>  - dropped accepted patch
> 
> Changes in v3:
>  - added fallback in bindings
> 
> Changes in v2:
>  - added fallback to an existing compatible string
>  - removed second patch as obsolete
> 
> Aleksander Jan Bajkowski (2):
>   dt-bindings: thermal: mediatek: add falback compatible string for
>     MT7981 and MT8516
>   arm64: dts: mediatek: add thermal sensor support on mt7981
> 
>  .../bindings/thermal/mediatek,thermal.yaml    | 27 ++++++++++------
>  arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 31 ++++++++++++++++++-
>  2 files changed, 47 insertions(+), 11 deletions(-)
> 
> --
> 2.39.5
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
 Base: tags/v6.16-rc1-8-g95a042a0c8ec (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250712195904.6988-1-olek2@wp.pl:

arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc'] is too long
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
	'mediatek,mt2701-auxadc' was expected
	'mediatek,mt8173-auxadc' was expected
	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: /soc/adc@1100d000: failed to match any schema with compatible: ['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc']
arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc'] is too long
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
	'mediatek,mt2701-auxadc' was expected
	'mediatek,mt8173-auxadc' was expected
	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: /soc/adc@1100d000: failed to match any schema with compatible: ['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc']
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@15520000 (mediatek,mt8188-imgsys-wpe2): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-clock.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc'] is too long
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt2701-auxadc', 'mediatek,mt2712-auxadc', 'mediatek,mt6765-auxadc', 'mediatek,mt7622-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt8173-auxadc']
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
	'mediatek,mt2701-auxadc' was expected
	'mediatek,mt8173-auxadc' was expected
	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: /soc/adc@1100d000: failed to match any schema with compatible: ['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc']






