Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC22C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYf/S9xtt01/l1c14cB1l1e58lU7oORyVWQF3hvnGxk=; b=iI4iV7GsQgE3DkuinIa/zHSKgY
	pLJtIwM3boX+UqnlZ4pRHe9hw5xQOFqMtrG/uSxVNVzYzQjZfhrY57dPXfm0pp5ulIHSXMUtFSD6u
	FTvZea1EXpH6K7jz6Xe+LD6duvDGZ/Jkksc2dQpKmgy/LFoBtP33gNivQH8YsA4XJDmaQ+7MRonxg
	Oc1hutjYZ0r47wXj0gqk2ey3Lhb0tnDnCuUa7612Q2ulHYM5l248cFXwzLfTI0hmxUYB1u9RH1mlD
	jDJ1Hfgroe1CU97AhbuOkS1jUwRvhwQymVhMhtYLIRpmejOMXdRuiV5D/BGJRM2yMUaNjL1dJgTDB
	qS9Z9TqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM32-0000000BrXq-0tuV;
	Thu, 03 Jul 2025 15:40:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKCK-0000000BX1A-1gCL;
	Thu, 03 Jul 2025 13:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59F43A53819;
	Thu,  3 Jul 2025 13:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8872C4CEE3;
	Thu,  3 Jul 2025 13:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751550115;
	bh=AzCyOeLYvvkd8ESz+bYjZcDSyDUTK6UgemqQUMKPmC8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=O3EaC7pG9AYMtZ1GnmxlMDAujjKd2jjjy8oV9NgoYzH33twFw/sto/xm7oA/kF4wm
	 QKXDolNstpowlpxlrxtFoYSELRJCAvHsmAyB9bIO4x0OOcS3jLkwCJPhzS/Xh5rqgz
	 hk1vVueopNKfKZwerZQwRC1wTfPrEKXOhzdgvICHl5lxnT3QGCcSpRVfZwU2Yvpf2P
	 gwlN76MM4FZmH3RjfneQUsu52PA9EtUPDjDJyOSwwjbtj7GzYI4Hl0r3FlkazbeZzQ
	 YrlMpFfSPcWldPwJK0mnkJCRlSXQFfqiCuJbJ6NKbsa+4YwMgk3ttTtcbZ6Kkg8s4G
	 1KS1rB+xP+p8w==
Date: Thu, 03 Jul 2025 08:41:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, nuno.sa@analog.com, conor+dt@kernel.org, 
 zhiyong.tao@mediatek.com, matthias.bgg@gmail.com, linux-iio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, andy@kernel.org, 
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
 dlechner@baylibre.com, jic23@kernel.org
To: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20250702214830.255898-1-olek2@wp.pl>
References: <20250702214830.255898-1-olek2@wp.pl>
Message-Id: <175155007600.1164337.2694125057173487421.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add thermal sensors support for MT7981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_064156_583676_B54466B8 
X-CRM114-Status: GOOD (  17.10  )
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


On Wed, 02 Jul 2025 23:48:28 +0200, Aleksander Jan Bajkowski wrote:
> This patch adds support for the temperature sensor in the MT7981 SoC.
> This sensor is exactly the same as the one in the MT7986.
> 
> Changes in v2:
>  - added fallback to an existing compatible string
>  - removed second patch as obsolete
> 
> Aleksander Jan Bajkowski (2):
>   dt-bindings: iio: adc: Add support for MT7981
>   arm64: dts: mediatek: add thermal sensor support on mt7981
> 
>  .../iio/adc/mediatek,mt2701-auxadc.yaml       |  1 +
>  arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 32 ++++++++++++++++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
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
 Base: tags/next-20250702 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250702214830.255898-1-olek2@wp.pl:

arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: thermal@1100c800 (mediatek,mt7981-thermal): compatible: ['mediatek,mt7981-thermal', 'mediatek,mt7986-thermal'] is too long
	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: thermal@1100c800 (mediatek,mt7981-thermal): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
	'mediatek,mt2701-auxadc' was expected
	'mediatek,mt8173-auxadc' was expected
	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: thermal@1100c800 (mediatek,mt7981-thermal): compatible: ['mediatek,mt7981-thermal', 'mediatek,mt7986-thermal'] is too long
	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: thermal@1100c800 (mediatek,mt7981-thermal): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
	'mediatek,mt2701-auxadc' was expected
	'mediatek,mt8173-auxadc' was expected
	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: thermal@1100c800 (mediatek,mt7981-thermal): compatible: ['mediatek,mt7981-thermal', 'mediatek,mt7986-thermal'] is too long
	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: thermal@1100c800 (mediatek,mt7981-thermal): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dtb: adc@1100d000 (mediatek,mt7981-auxadc): compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt7981-auxadc', 'mediatek,mt7986-auxadc', 'mediatek,mt7622-auxadc'] is too long
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt7623-auxadc']
	'mediatek,mt7981-auxadc' is not one of ['mediatek,mt6893-auxadc', 'mediatek,mt8183-auxadc', 'mediatek,mt8186-auxadc', 'mediatek,mt8188-auxadc', 'mediatek,mt8195-auxadc', 'mediatek,mt8516-auxadc']
	'mediatek,mt2701-auxadc' was expected
	'mediatek,mt8173-auxadc' was expected
	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt2701-auxadc.yaml#






