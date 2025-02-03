Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F91C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgA946wy0V8u3nthaM+WRWBiCEG8bEUqAucO6JVYmZU=; b=Btpya+WknjnuQ90VnQDs97X5J5
	plu2ZJHIZzPhlRibmrzSZ62IG2sXvE1Ytyg2mCUY/lu3xDu+x3AVyVU6hryBl9u9jaKRGZn9iEELr
	DQgl+HyL0jio28NiquAISinMwh7buQekeFLsB/ezRlBYfYP+FLmxcjIxmDtGfpnjdDNDrq7Uja4bl
	mNabGwK/h3tSFGhbqPMWOYO16sjLKU9brKHlBdOHuRTiUpZdw4B8+5ya9WDwWs5MYRAqw8Ec+3crT
	vwC8ZyqCorlokVyTONqc5B5arLqXn+DcDvJ7cdujF29IPYuY2pTWXi6Ujz5r3WwH+rYONuK7i7L4m
	YDWBM3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teza2-0000000G2Yh-128w;
	Mon, 03 Feb 2025 16:45:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyVX-0000000FtRr-2jp3;
	Mon, 03 Feb 2025 15:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6529FA414E7;
	Mon,  3 Feb 2025 15:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A999C4CED2;
	Mon,  3 Feb 2025 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738597026;
	bh=io2jOiAYZgNPcYe++cli+V+FY1fGXApzfdK6XF5tjp0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eGzyDH2Y86s92rWyDtvP8hZxFLJ+cZGw9ftTxnO7NxJEKpZpf2435DcsVMEFOm2dU
	 3z8jQmwU/UvrL49IRy1PA6c6tzqebmnzQYdN+Zgabmp3e4jTCMTBsX8DRmiFQyaWvE
	 6eOUSmeVg6ZtFvwKirZCqlrTrB+W5s61cWOaIIS4exjoRsZyd8pUOI4I9rpqOLxAfU
	 yIxuXT1CPpw/QWJXf7AU7QfMaD7wYdpIz0PZJgbkBehTaDgRpawm7DTOdOYApkr7zc
	 peSUsXcJ90EArpqRWF2ZpD/MQ8HzLggZqB9sODgBvvTq6o9ZIhNykq+khzzO5yZyVf
	 wbeZN0S5/2kcg==
Date: Mon, 03 Feb 2025 09:37:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
In-Reply-To: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
References: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
Message-Id: <173859694682.2601632.260969145001463720.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: Introduce more nodes to EN7581 SoC
 evaluation board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_073707_822308_D65519A8 
X-CRM114-Status: GOOD (  11.24  )
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


On Sat, 01 Feb 2025 15:39:48 +0100, Lorenzo Bianconi wrote:
> Add the following nodes to EN7581 SoC and EN7581 evaluation board:
> - clock controller
> - rng controller
> - pinctrl
> - i2c controllers
> - spi nand controller
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  arch/arm64/boot/dts/airoha/en7581-evb.dts |  8 +++
>  arch/arm64/boot/dts/airoha/en7581.dtsi    | 90 +++++++++++++++++++++++++++++++
>  2 files changed, 98 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/airoha/' for 20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org:

arch/arm64/boot/dts/airoha/en7581-evb.dtb: soc: i2cclock@0: 'anyOf' conditional failed, one must be fixed:
	'reg' is a required property
	'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/airoha/en7581-evb.dtb: system-controller@1fbf0200: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/airoha/en7581-evb.dtb: i2cclock@0: clock-frequency: 20000000 is greater than the maximum of 5000000
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
arch/arm64/boot/dts/airoha/en7581-evb.dtb: i2c0@1fbf8000: 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/i2c/mediatek,mt7621-i2c.yaml#
arch/arm64/boot/dts/airoha/en7581-evb.dtb: i2c1@1fbf8100: 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/i2c/mediatek,mt7621-i2c.yaml#
arch/arm64/boot/dts/airoha/en7581-evb.dtb: i2c1@1fbf8100: status: 'oneOf' conditional failed, one must be fixed:
	['disable'] is not of type 'object'
	'disable' is not one of ['okay', 'disabled', 'reserved', 'fail', 'fail-needs-probe']
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#






