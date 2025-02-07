Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CFEC02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/T0xWBuXVRxU1P7IMQd29/h9SUwW7qNaqLQlXla6a0=; b=I2m93kqUBYcWcDTX6RJnWXkjBa
	0izg865qt7MOcscXZ+3dPmgVDhKaqhkUt9ju+zxuyKTwu34ZhOqkNKvKsNxON75GCz9DAp0GN9Yp8
	c39oojbMPrIyL2aSpaki87wQNfAVTn1IbeYboQ5x2LjtnVdVVDURHkkRsFXf8YTNVHHOlScRfmlKh
	yLWn4W8Aw0Ys1cURGc3HA2XSEutoYuqlz5gIwGKiRgxpwfuPOycsGYjOAEfHI51co0PfmMcSgddVc
	iiBPKJQenkh24JCIflYQp6ZQ79yuLhFnYobpByc78RJuz9cd8OApL0KBEw5tDUDLTRGm7vSa7TspI
	YAPY5oJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQPV-0000000A6OO-3qJi;
	Fri, 07 Feb 2025 15:36:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQAl-0000000A2oE-2c4k;
	Fri, 07 Feb 2025 15:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF516A43692;
	Fri,  7 Feb 2025 15:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54999C4CEE7;
	Fri,  7 Feb 2025 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738941698;
	bh=BcaIGD1WwgtYK/3UX6TqGEgv5jNlncxbn2IW0AxOsfo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WNirZF3Uc/QsUCNhuzr9RMbWlPSjcImb9wTl6ZQ2stdTTSAmakYsbMZj5itB0GC1o
	 4h5m0tLmMggkNXSSI+SZ5GFtDqnb1LcO7TW/uNlbkMvg/n74J3E56DZS/71GXpaaVO
	 uBuhCJtpnfCTzgqeNiMNaSA+D/kf+SCjuiP1WKcp8UDklRWKWxXb15KMv5rSFzjz9Y
	 wJjGmbI5AXOlRI+xHN48Zc+NpJtr4ZeJJ7wkmWXJzHgqLP3IHVR87VL3jD0HGn8O/B
	 lzxvzwRnXoexFWgE37+Sxdd4UU/jc1O2oLzPgj39ScQ/RuUaqhiZbdS75tUiwkDeUD
	 g6GeTxYfB2cdg==
Date: Fri, 07 Feb 2025 09:21:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, kernel@collabora.com
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
In-Reply-To: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
References: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
Message-Id: <173894150906.331293.4896725763364735044.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] Add support for Mediatek Genio 510 EVK board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_072139_801015_E68AFF0F 
X-CRM114-Status: GOOD (  22.23  )
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


On Thu, 06 Feb 2025 11:38:07 +0100, Louis-Alexis Eyraud wrote:
> This patchset adds the basic support of the Mediatek Genio 510 EVK
> board, based on the Mediatek MT8370 SoC.
> 
> It adds a device-tree file for the board (mt8370-genio-510-evk.dtb)
> and an include file for the SoC (mt8370.dtsi), in order to be able to
> boot. As the board is very close to the Genio 700 EVK board, an include file
> (mt8390-genio-common.dtsi) is also created to factorize the common
> definitions.
> 
> The Genio 510 EVK has following features:
> - MT8370 SoC
> - MT6365 PMIC
> - MT6319 Buck IC
> - 4GB LPDDR4X
> - 64GB eMMC 5.1
> - 12V DC Jack
> - Micro SD card slot
> - Push Button x 4 (Power, Reset, Download and Home Key)
> - LED x 4 (Power, Reset, System on and Charging Status)
> - USB Device Port x 1 (Micro USB Connector)
> - USB Host Port x 1 (Type-C USB Connector)
> - 3.5mm Earphone Jack x 1 (with Microphone Input)
> - 3.5mm Line Out Audio Jack x 1
> - Analog Microphone x 1
> - Digital Microphone x 2
> - Gigabit Ethernet with RJ45 connector
> - HDMI 2.0 TX port with Type A HDMI connector
> - eDP port
> - 3x UART with serial-to-usb converters and micro USB connectors
> - M.2 Slot x 2
> - I2C Capacitive Touch Pad
> - 4-Lane DSI x 2
> - 4-Data Lane CSI x 2
> - I2S Pin header
> - 40-Pin 2.54mm Pin Header x 1
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Changes in v3:
> - Reword commit messages to use imperative mood
> - Add missing code-review trailers in commit messages
> - Link to v2: https://lore.kernel.org/r/20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com
> 
> Changes in v2:
> - Reword "dt-bindings: arm: mediatek: add mt8370-evk board" commit
>   message to add details on MT8370 SoC and links to MT8188 and MT8390
> - Add note about gpu support in "arm64: dts: mediatek: add support for
>   MT8370 SoC" commit message
> - Split "arm64: dts: mediatek: add device-tree for Genio 510 EVK board"
>   commit in two, as requested by AngeloGioacchino Del Regno
> - Link to v1: https://lore.kernel.org/r/20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com
> 
> ---
> Louis-Alexis Eyraud (4):
>       dt-bindings: arm: mediatek: add mt8370-evk board
>       arm64: dts: mediatek: add support for MT8370 SoC
>       arm64: dts: mediatek: mt8390-genio-700-evk: Move common parts to dtsi
>       arm64: dts: mediatek: add device-tree for Genio 510 EVK board
> 
>  .../devicetree/bindings/arm/mediatek.yaml          |    5 +
>  arch/arm64/boot/dts/mediatek/Makefile              |    1 +
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    8 +-
>  .../boot/dts/mediatek/mt8370-genio-510-evk.dts     |   19 +
>  arch/arm64/boot/dts/mediatek/mt8370.dtsi           |   64 ++
>  .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 1033 +------------------
>  .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 1040 ++++++++++++++++++++
>  7 files changed, 1134 insertions(+), 1036 deletions(-)
> ---
> base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
> change-id: 20250113-dts_mt8370-genio-510-3560b8010ba9
> 
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com:

arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#






