Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDB3D0C614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rf4dnOGodwr8GDyRKtweCBFob+L7SLTSeXUKihzWyKk=; b=LPZNfY6X3YSVquO9LfQSOokFoV
	jC2YsRXyBPQ+NPLLf95IV3vXg74cXu4TxUEHALBdoQveti/kkRWXNEqzr8CixdA6MnOAeFveLKTsK
	I3VYVGbwZxVXU2wNARLg26ZmOs8s7V7RcnRa1CLVut/TPwKIsBRTEnHFRFIt3T5/5LL8+93A3Kk1U
	w2oASxO303DBXqjsV7cpAj8oOFSFdWq3uFeOO854rsBKLSVuVYwY/8JTZfMnyqiSsAL9lXonpAwZF
	mdeOydPAi96swo97p/sLFbnYgTYFpCgi4xCX91/oxbn3sdEBdp0snPwHqAoGMTf4X0ctxrQ+CH6qb
	5xJj6nSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kzw-00000003wUg-3ixO;
	Fri, 25 Oct 2024 14:09:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kmh-00000003tVM-1cmT;
	Fri, 25 Oct 2024 13:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDEF6A42F74;
	Fri, 25 Oct 2024 13:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E75C4CEE9;
	Fri, 25 Oct 2024 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729864521;
	bh=FLGB+FcaSbexKSF1euem9Xjilkmzq5io2JyL0qcDAD0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=QR1Fokh1sok6+ciCoB+vRyDBrFoeEZR6//TqQrRqqAdMfU8aEO8Oe1GvwHzGm9QKC
	 CIkC2NaR0ZuzdUEA7NNOR5hbDsZb4tCibFQCSlRUMQdPVf5tfWdOpX93cC562f9s3f
	 w5alda1H/4ELZqqj/8BppnvSXTle2LLnUSXFMdYoNcY5xhlmQYyjDi4jRiBx48fymA
	 SrA6T4nDigLkEWblYAdLbOSsR2JI9ebBY2zXWNevQ8X4FWg60IbdGRwm81XsAApZvu
	 qL/rSCOtq5eoIP2KOdd+VNz/D7tY9/bs+x9alLeINb7bp5jgNnf5V1EZ+G6+L/90W/
	 d7epq2NLB9irw==
Date: Fri, 25 Oct 2024 08:55:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Sean Wang <sean.wang@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241025110111.1321704-1-fshao@chromium.org>
References: <20241025110111.1321704-1-fshao@chromium.org>
Message-Id: <172986441212.1908028.1793967441709561187.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add device tree for MT8188-based Chromebook "Ciri"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_065523_805651_E9FF1026 
X-CRM114-Status: GOOD (  25.75  )
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


On Fri, 25 Oct 2024 18:59:34 +0800, Fei Shao wrote:
> Hi maintainers,
> 
> This series introduces the device trees for Ciri, a MT8188-based
> Chromebook, commercially known as the Lenovo Chromebook Duet (11", 9).
> 
> Ciri is a detachable device based on the ChromeOS Geralt reference
> design, where Geralt is the codename for the MT8188 platform. Ciri has 8
> SKUs to accommodate the combinations of second-source components,
> including audio codecs, speaker amplifiers, and MIPI-DSI panels.
> 
> The Geralt design is not used in any actual products, so its device tree
> is not included.
> 
> The device trees are taken from the ChromeOS downstream v6.1 kernel,
> ported to the mainline kernel and with cleanups. This series aims to
> provide a basic device tree with the enabled components and features.
> Additional support will be added in the future after validation with
> the mainline kernel.
> 
> This series has been tested on top of the next-20241018 branch.
> 
> Patch 1 adds entries for Ciri in the MediaTek DT binding.
> Patch 2 adds the dtsi files for Geralt and Ciri, followed by 8 dts files
> for all the available Ciri SKUs at this moment.
> 
> Note that there are some known dtbs_check warnings, depending on binding
> fix or driver support:
> - sound: Unevaluated 'xxx-dai-link' properties: sent patch[1]
> - amplifier '#sound-dai-cells' and other errors: sent patch[1]
> - dp-tx '#sound-dai-cells' error: sent patch[2]
> - failed to match 'himax,hx83102j': depend on HX83102J support[3]
> 
> [1]:
> https://lore.kernel.org/all/20241025104548.1220076-1-fshao@chromium.org/
> [2]:
> https://lore.kernel.org/all/20241025104310.1210946-1-fshao@chromium.org/
> [3]:
> https://lore.kernel.org/all/TY0PR06MB561105A3386E9D76F429110D9E0F2@TY0PR06MB5611.apcprd06.prod.outlook.com/
> 
> Regards,
> Fei
> 
> 
> Fei Shao (2):
>   dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
>   arm64: dts: mediatek: Introduce MT8188 Geralt platform based Ciri
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   13 +
>  arch/arm64/boot/dts/mediatek/Makefile         |    8 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   11 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   63 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   54 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   20 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   43 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   76 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   67 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   52 +
>  .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  413 +++++
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1497 +++++++++++++++++
>  12 files changed, 2317 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> 
> --
> 2.47.0.163.g1226f6d8fa-goog
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8188-geralt-ciri-sku0.dtb mediatek/mt8188-geralt-ciri-sku1.dtb mediatek/mt8188-geralt-ciri-sku2.dtb mediatek/mt8188-geralt-ciri-sku3.dtb mediatek/mt8188-geralt-ciri-sku4.dtb mediatek/mt8188-geralt-ciri-sku5.dtb mediatek/mt8188-geralt-ciri-sku6.dtb mediatek/mt8188-geralt-ciri-sku7.dtb' for 20241025110111.1321704-1-fshao@chromium.org:

arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: sound: Unevaluated properties are not allowed ('displayport-dai-link', 'hs-capture-dai-link', 'hs-playback-dai-link', 'mediatek,adsp', 'mediatek,dai-link', 'mm-dai-link', 'spk-playback-dai-link' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: sound: Unevaluated properties are not allowed ('displayport-dai-link', 'hs-capture-dai-link', 'hs-playback-dai-link', 'mediatek,adsp', 'mediatek,dai-link', 'mm-dai-link', 'spk-playback-dai-link' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: sound: Unevaluated properties are not allowed ('displayport-dai-link', 'hs-capture-dai-link', 'hs-playback-dai-link', 'mediatek,adsp', 'mediatek,dai-link', 'mm-dai-link', 'spk-playback-dai-link' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: sound: Unevaluated properties are not allowed ('displayport-dai-link', 'hs-capture-dai-link', 'hs-playback-dai-link', 'mediatek,adsp', 'mediatek,dai-link', 'mm-dai-link', 'spk-playback-dai-link' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: sound: Unevaluated properties are not allowed ('displayport-dai-link', 'hs-capture-dai-link', 'hs-playback-dai-link', 'mediatek,adsp', 'mediatek,dai-link', 'mm-dai-link', 'spk-playback-dai-link' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: sound: Unevaluated properties are not allowed ('displayport-dai-link', 'hs-capture-dai-link', 'hs-playback-dai-link', 'mediatek,adsp', 'mediatek,dai-link', 'mm-dai-link', 'spk-playback-dai-link' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: sound: Unevaluated properties are not allowed ('displayport-dai-link', 'hs-capture-dai-link', 'hs-playback-dai-link', 'mediatek,adsp', 'mediatek,dai-link', 'mm-dai-link', 'spk-playback-dai-link' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: sound: Unevaluated properties are not allowed ('displayport-dai-link', 'hs-capture-dai-link', 'hs-playback-dai-link', 'mediatek,adsp', 'mediatek,dai-link', 'mm-dai-link', 'spk-playback-dai-link' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic: 'adc', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic: 'adc', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic: 'adc', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic: 'adc', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic: regulators: 'compatible' is a required property
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic: 'adc', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: syscon@10006000: power-controller:power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: power-controller: power-domain@15:power-domain@16:power-domain@29:power-domain@30: Unevaluated properties are not allowed ('power-domain@31', 'power-domain@32' were unexpected)
	from schema $id: http://devicetree.org/schemas/power/mediatek,power-controller.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic: 'adc', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/spi@11010000/touchscreen@0: failed to match any schema with compatible: ['himax,hx83102j']
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/spi@11010000/touchscreen@0: failed to match any schema with compatible: ['himax,hx83102j']
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: regulators: 'compatible' is a required property
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic: 'adc', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: amplifier@38: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: amplifier@39: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: amplifier@38: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: amplifier@39: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic: 'adc', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/spi@11010000/touchscreen@0: failed to match any schema with compatible: ['himax,hx83102j']
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: gpu@13000000: 'volt-bin-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/spi@11010000/touchscreen@0: failed to match any schema with compatible: ['himax,hx83102j']
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: gpu@13000000: 'volt-bin-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/spi@11010000/touchscreen@0: failed to match any schema with compatible: ['himax,hx83102j']
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/spi@11010000/touchscreen@0: failed to match any schema with compatible: ['himax,hx83102j']
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: jpeg-decoder@1a040000: iommus: [[142, 685], [142, 686], [142, 690], [142, 691], [142, 692], [142, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: jpeg-decoder@1a040000: iommus: [[142, 685], [142, 686], [142, 690], [142, 691], [142, 692], [142, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: amplifier@38: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: amplifier@39: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[69, 16]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/spi@11010000/touchscreen@0: failed to match any schema with compatible: ['himax,hx83102j']
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: gpu@13000000: 'volt-bin-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[69, 16]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/spi@11010000/touchscreen@0: failed to match any schema with compatible: ['himax,hx83102j']
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: gpu@13000000: 'volt-bin-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[69, 17]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[69, 17]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: amplifier@38: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: gpu@13000000: 'volt-bin-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: amplifier@39: '#sound-dai-cells', 'maxim,dsm_param_name', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: jpeg-decoder@1a040000: iommus: [[140, 685], [140, 686], [140, 690], [140, 691], [140, 692], [140, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: gpu@13000000: 'volt-bin-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[68, 16]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: jpeg-decoder@1a040000: iommus: [[140, 685], [140, 686], [140, 690], [140, 691], [140, 692], [140, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: audio-codec@19: 'interrupts-extended' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: jpeg-decoder@1a040000: iommus: [[140, 685], [140, 686], [140, 690], [140, 691], [140, 692], [140, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[68, 16]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: gpu@13000000: 'volt-bin-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[68, 16]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: jpeg-decoder@1a040000: iommus: [[142, 685], [142, 686], [142, 690], [142, 691], [142, 692], [142, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[68, 17]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: gpu@13000000: 'volt-bin-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[69, 16]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[68, 17]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[68, 17]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: jpeg-decoder@1a040000: iommus: [[142, 685], [142, 686], [142, 690], [142, 691], [142, 692], [142, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[69, 17]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: jpeg-decoder@1a040000: iommus: [[140, 685], [140, 686], [140, 690], [140, 691], [140, 692], [140, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[69, 16]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dp-intf@1c015000: power-domains: False schema does not allow [[68, 16]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[69, 17]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dp-intf@1c113000: power-domains: False schema does not allow [[68, 17]]
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dp-tx@1c600000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#






