Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B9EC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhGgDE7RtrEg0fuIjSLA8VaOwT5Xe6JN/5Ge7585nhc=; b=hnBkadh8w6mXWSbANLUJl0qXEY
	nL9iKZAuWfDSUwnLiLtWCh8oqKCS0kJw+6ehktJUulJfhzd9ta5IXi00LnwE9sR4NMjLXG40fAze6
	c73SVQ0LPjsQYzI2yyB7FDic2reK4beGxed2b5Izbwuq6cudEqDNJsFky7zmcYw8KZNJFdUCH6PA6
	lSy+4KFG5VNUBZjzj+SG9wecshWKG0Hn1lVKVMNTGfphHMNdFTnbUO/oTngLjQdlKbmWvUCjXRZXP
	/0MYJtm9moLX4Th2yCBqAyCVh+FDBQOjoGY5A5QTe+QTwlFrpWsH/uyX4kvihWSl94Ej05K2yxtiA
	fKSE00tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyVM-0000000BRur-0vO0;
	Fri, 31 Jan 2025 21:24:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyU2-0000000BRj9-0Agz;
	Fri, 31 Jan 2025 21:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75C155C5EA1;
	Fri, 31 Jan 2025 21:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A26C4CED1;
	Fri, 31 Jan 2025 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738358605;
	bh=/OS0LJz7wGEUpGR+VvSZsu8R7CgAohC+kmS8JtEiaVI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AMhwrxuneDEerKPohzvNX4q54TznV3ECcDXgGN5gjOaRoDkjbtomCg7/2fV6fPYku
	 VcV4M7zmZmqwqbbfHnZA+OPS+ykMcRQ3tNhmZ30B7Y4lp/4y/6LJTNMxh8ZPm+rqJ8
	 XH5sL2NjUgq1lqPAI0uEQlpxVpeLrQDuo/6tjIg0JtVe3eefQZACbW8FwZImxUwKqA
	 2yBOqp3XfXenCxWvNASz8upaFKPEq3DuMtg4Yr1C8hNfaepa+z0ppYlx1geJDnnVaD
	 kzTvtkelBHO6e7z/yYZULxxLUrZTB+zWM4K0gyKmOo9Lul49qdGTVDAKzHcHav/k9X
	 HPKd01fTMMsww==
Date: Fri, 31 Jan 2025 15:23:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 Karl Chan <exxxxkc@getgoogleoff.me>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Artur Weber <aweber.kernel@gmail.com>
To: Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
Message-Id: <173835855352.46011.13506160179490240246.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add support for Xiaomi Mi TV Stick
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_132326_162703_61329FA5 
X-CRM114-Status: GOOD (  20.82  )
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


On Fri, 31 Jan 2025 20:03:17 +0000, Ferass El Hafidi wrote:
> From: Ferass El Hafidi <funderscore@postmarketos.org>
> 
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
> Ferass El Hafidi (2):
>   dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
>   arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../meson-gxl-s805y-xiaomi-aquaman.dts        | 311 ++++++++++++++++++
>  3 files changed, 313 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> 
> --
> 2.47.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250131200319.19996-1-funderscore@postmarketos.org:

arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: pwm@86c0: clock-names: False schema does not allow ['clkin0']
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml#
arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: leds: led-white:default-state:0: 'heartbeat' is not one of ['on', 'off', 'keep']
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dtb: leds: led-white: Unevaluated properties are not allowed ('default-state' was unexpected)
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#






