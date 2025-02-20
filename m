Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D225C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArJSQCwmKknC1fmRX2qqGlt1VXkmNypYrhTTR5w9dOc=; b=p4ja9YBHTbXH44g9FLjKHhr73J
	CNTIEXoLnIMNBRrUAC2oevYx/XtXJfxRE/8KOopa7klRNjujq8SSHkiFWkRzEH80NmxYVom4oThPf
	g6YvHXjFlSJ5cnsA8EUiSlhaW2S/Cw/PjmydA+/7DzxbxwRAenyYRqBoat1Os5REl3vZ1wLAhIKgZ
	ECt0zGIO1axSAFTvkeByL/CftKHwL9fRQ8CVvzXj24fBzmgGC3tusCQGwn3kZOe7oa+Jmi3tRSlfY
	7bSd68i6bT8JYriI1rLKaCwXgR8N35U6Cecyl+379X9JX3M7Dz6+TJQhlgLO2YkNa057NAv9Sx/Rg
	hWWuc9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEEF-00000002z5X-42P7;
	Thu, 20 Feb 2025 21:37:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE6m-00000002xDB-2eRw;
	Thu, 20 Feb 2025 21:29:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6147768301;
	Thu, 20 Feb 2025 21:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8E1C4CED1;
	Thu, 20 Feb 2025 21:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740086963;
	bh=cPMXfJ5EEJSFIc6bQSSqwz/jzpiRbId88b5OIXw7akI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WCETpwfuWJO0JWuzIGZRF7sywIRaqSi8e4WpC6+MQMO4xknZ5pLQgbxGDP9+o0I50
	 0R1myaQWgX2sy4QgviPM15qOeoc8s/lRu4+LK+KZsrDJoQFOrp0Tr3Y5aP2DoIhxQW
	 IOgax0/wXj9l4oYTD170yWmsniSod59ztndBZYgi1mrT/Wk0m07vx5Y10j9Kw4+WmI
	 aajGDGqdE/I2TYy/8uRorPwWQHSw5Y3PhcfsV8GvRraFJaw476eCd7j6EL+reXmbJX
	 4jXTaGQvwbwlqZlwak86fcxhfnVkZGK9PsZsHb1vy5gKnsB9pZyUnTzsOte6E8gqWm
	 38VW7E2NpUOzw==
Date: Thu, 20 Feb 2025 15:29:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 stable@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
To: Quentin Schulz <foss+kernel@0leil.net>
In-Reply-To: <20250220-ringneck-dtbos-v1-0-25c97f2385e6@cherry.de>
References: <20250220-ringneck-dtbos-v1-0-25c97f2385e6@cherry.de>
Message-Id: <174008661935.4046882.3221866764998287397.robh@kernel.org>
Subject: Re: [PATCH 0/5] arm64: dts: rockchip: pinmux fixes and support for
 2 adapters for Theobroma boards
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


On Thu, 20 Feb 2025 13:20:09 +0100, Quentin Schulz wrote:
> This is based on top of
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v6.15-armsoc/dts64
> 6ee0b9ad3995 ("arm64: dts: rockchip: Add rng node to RK3588") as it
> depends on the (merged) series from
> https://lore.kernel.org/all/20250211-pre-ict-jaguar-v6-0-4484b0f88cfc@cherry.de/
> 
> Patches for Haikou Video Demo adapter for PX30 Ringneck and RK3399 Puma
> (patches 4 and 5) also depend on the following patch series:
> https://lore.kernel.org/linux-devicetree/20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de/
> 
> This fixes incorrect pinmux on UART0 and UART5 for PX30 Ringneck on
> Haikou.
> 
> This adds support for the HAIKOU-LVDS-9904379 adapter for PX30 Ringneck
> fitted on a Haikou carrierboard.
> 
> Additionally, this adds support for Haikou Video Demo adapter on PX30
> Ringneck and RK3399 Puma fitted on a Haikou carrierboard. Notably
> missing from the overlay is the OV5675 camera module which expects
> 19.2MHz which we cannot exactly feed right now. Modifications to the
> OV5675 drivers will be made so it's more flexible and then support for
> the camera module will be added. This adapter has a 720x1280 DSI display
> with a GT911 touchscreen, a GPIO-controllable LED and an I2C GPIO
> expander. Support for this adapter on RK3588 Tiger is being added in a
> separate patch series[1].
> 
> Note that the DSI panel currently is glitchy on both PX30 Ringneck and
> RK3399 Puma but this is being tackled in another series[2]. Since this
> will not be fixed through DT properties for the panel, adding the DT
> nodes for the DSI panel even if not perfect right now seems acceptable
> to me.
> 
> [1] https://lore.kernel.org/linux-rockchip/20241127143719.660658-1-heiko@sntech.de/
> [2] https://lore.kernel.org/r/20240626084722.832763-1-heiko@sntech.de
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (5):
>       arm64: dts: rockchip: fix pinmux of UART0 for PX30 Ringneck on Haikou
>       arm64: dts: rockchip: fix pinmux of UART5 for PX30 Ringneck on Haikou
>       arm64: dts: rockchip: add support for HAIKOU-LVDS-9904379 adapter for PX30 Ringneck
>       arm64: dts: rockchip: add overlay for PX30 Ringneck Haikou Video Demo adapter
>       arm64: dts: rockchip: add overlay for RK3399 Puma Haikou Video Demo adapter
> 
>  arch/arm64/boot/dts/rockchip/Makefile              |  15 ++
>  .../px30-ringneck-haikou-lvds-9904379.dtso         | 130 ++++++++++++++
>  .../rockchip/px30-ringneck-haikou-video-demo.dtso  | 190 +++++++++++++++++++++
>  .../boot/dts/rockchip/px30-ringneck-haikou.dts     |  10 +-
>  .../rockchip/rk3399-puma-haikou-video-demo.dtso    | 166 ++++++++++++++++++
>  5 files changed, 510 insertions(+), 1 deletion(-)
> ---
> base-commit: 6ee0b9ad3995ee5fa229035c69013b7dd0d3634b
> change-id: 20250128-ringneck-dtbos-98064839355e
> prerequisite-change-id: 20250219-pca976x-reset-driver-c9aa95869426:v1
> prerequisite-patch-id: 24af74693654b4a456aca0a1399ec8509e141c01
> prerequisite-patch-id: df17910ec117317f2f456f679a77ed60e9168fa3
> 
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250220-ringneck-dtbos-v1-0-25c97f2385e6@cherry.de:

arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dtb: uart: uart5-rts-gpio: {'rockchip,pins': [[0, 13, 0, 147]], 'phandle': 70} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#






