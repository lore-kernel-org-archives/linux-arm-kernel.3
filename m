Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB689C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Hh74WA275nhjvf6vpcBlmtIv4z7B5mF/cfHtzS9MlE=; b=Nyhz5wILRVnvJboAi69JPuJJTe
	p5+l2/9J01rED2tknNwVw5w8EbRtHwFPMDspk0Axz36ZlMsXX7Kc+V9IwiRRC77H9g1R3u59J8OQw
	H+Eq2kgir9M3C/1FVflitrKhEwRPn8Xc6joMYFuvan3gx9ta+U5mCa1oHunooU227NR+GoUvyz1dZ
	OhlhRjMl9gwsnJAZ/FKtsi6dlTThjaYMzzSFSiV/tlqQjmlQ0PdO/ntyBfKwvr8R/UgXrjT7CifK+
	fYeQxmmIrAI0S8z8JlVvXLdv5JqGjANCbM4SenpEz96+LvZlwoXUnbejRBNY49xgckGY6fxWikiX2
	YTttAYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyYA-0000000Ftr5-17VI;
	Mon, 03 Feb 2025 15:39:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyVa-0000000FtSX-1aYW;
	Mon, 03 Feb 2025 15:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D957A414F4;
	Mon,  3 Feb 2025 15:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DD6C4CEEA;
	Mon,  3 Feb 2025 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738597029;
	bh=sfylPJubRQa0RsghaJs13B2uvS7uCwVTb+ajboSxtWM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YCK/gJmVBhifud6DyjAyqCdAxRrF7cHgL4t8K3otG7aGJNb8BezDkPAWV52oWm96i
	 NP8kEmTjdvlHphyAE9zaUzZxdaUbb8mfZTwrhkexfx1qF30I5RqPZKJVPYwSIxLo/G
	 MO5HSCjKAINSSNM3R1jICWiHJeR9Imgy6rb3JVdcUc1wIjgrpI0DiZeIIXEqe0D9Wu
	 PQQ4GvxWrz1oFigbTwmeLKJPB6qYUKyIMdUJHtpyzcJJruHcYvyymBnjb0EP00jC/6
	 3VyaWDBUPXzeCILbG5vlhI9FDggngsZWP9QSbQARAZ/J92MHKBZCNUakrRuGTeVRrW
	 LodTL9/akGChg==
Date: Mon, 03 Feb 2025 09:37:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christian Hewitt <christianshewitt@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, Artur Weber <aweber.kernel@gmail.com>, 
 Karl Chan <exxxxkc@getgoogleoff.me>, devicetree@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20250203091453.15751-1-funderscore@postmarketos.org>
References: <20250203091453.15751-1-funderscore@postmarketos.org>
Message-Id: <173859694815.2601688.2854626525832601939.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add support for Xiaomi Mi TV Stick
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_073710_555079_AEECDAAC 
X-CRM114-Status: GOOD (  23.20  )
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


On Mon, 03 Feb 2025 09:14:51 +0000, Ferass El Hafidi wrote:
> This patch series aims to add initial support for the Xiaomi Mi TV
> Stick.
> 
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in
> 2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
> u-boot, ...)
> Its specifications are as follows:
>  * Amlogic S805Y SoC (believed to be mostly identical to S805X)
>  * 8 GB eMMC
>  * 1 GB of RAM
>  * Android TV 9, upgradable to Android TV 10
> 
> There are multiple variants:
>  * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully
>    labeled on the board)
>  * 2. Blue PCB, not much documentation about it, presumably manufactured
>    between 2021 and 2023
>  * 3. Green PCB, manufactured in 2023, known UART pinout, some layout
>    changes compared to the 2020 variant
> 
> Among these variants, there are many boards using multiple different
> Wi-Fi chips.  Supporting all of them is out of scope for this patch
> series.
> 
> As of the time of writing this has only been tested on the 3rd variant.
> It is believed that software-wise all three work mostly the same (if we
> don't count Wi-Fi), but testing on the other variants would still be
> appreciated.
> 
> The devicetree is based on the Amlogic P241 DTS.
> 
> Changes since v2 [1]:
>  * fix SoB/From mismatch
> 
> Changes since v1 [2]:
>  * remove useless nodes: cvbs-connector, ethmac, internal_phy, ir
>  * add `amlogic,s805y` DT binding section
>  * add S805Y dtsi: meson-gxl-s805y.dtsi
>  * adjust DT `model` to "Xiaomi Mi TV Stick (Aquaman)"
>  * explain the changes being done a bit more in the commit message for
>    the DT patch
>  * drop `clocks` and `clock-names` from pwm_ef (background: [3])
>  * change sound `model` to "XIAOMI-AQUAMAN"
> 
> [1]: https://lore.kernel.org/all/20250201193044.28856-1-funderscore@postmarketos.org/
> [2]: https://lore.kernel.org/all/20250131200319.19996-1-funderscore@postmarketos.org/
> [3]: https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/
> 
> Ferass El Hafidi (2):
>   dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
>   arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |   7 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s805y-xiaomi-aquaman.dts        | 288 ++++++++++++++++++
>  .../boot/dts/amlogic/meson-gxl-s805y.dtsi     |  10 +
>  4 files changed, 306 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi
> 
> --
> 2.47.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250203091453.15751-1-funderscore@postmarketos.org:

arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: phy@78000: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/amlogic,meson-gxl-usb2-phy.yaml#






