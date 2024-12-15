Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FE3E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R8EIh7YecGagzC0jU7hcfHeDbHCAnsmyLpcoGh/spE=; b=JP3WYulOvxOu+IMDpDskPIH9AI
	d3JzJL9xYDAqjRvSHI30w6xPwvTcd6sPus5k1vLNVChCwl2KxOocUzKWx3ru3J6qv4AshBAIWU9QL
	00ZOmtOwG9zpYr51TlDkQDTg6H+h/QjAnozYAjiGFMT/icWBRVKr736ZeiK4xPFRlwvd9HYkshuQ1
	iY4Q5EF4HRJbJ5tB6Ca1I1fRY6tZuallisY1ZAgYh+FiaH98agTk5Izvn3MT59L3uUVZWnq7VVwds
	Bbjw456ObDjHLq+9eiF4j7OldKsFVAa1g68Hbs4B0rcYSYdZ2cr4UGoN2fUmP4YqbjtTZ1WnRPilv
	0wyf4G0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMjZG-00000007b2f-0HHc;
	Sun, 15 Dec 2024 08:01:34 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMjY9-00000007ato-03qT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 08:00:27 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1734249623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0R8EIh7YecGagzC0jU7hcfHeDbHCAnsmyLpcoGh/spE=;
	b=usvhsaruCnQOl5a6bXeyrJjTSK6+nYbPULuzwwZlQlaISsImaAw/6i/Q3INNxxLQPYO5c6
	aOe+jNjeWmfR+AVEX7I1V3kRQi7Henw72ms3HlLy0l8dvOaMpSNlyRZtW+36jPyxHQRVdo
	oIo1C/lJa1ldyX5C/JMlRhRHkwh/U+IonlHMoDUUyryjgFxOz5L6b04vqJI0Nmu+UdoLz0
	iyhGYz4HyQ5kTWZ/f1s1lHz4qR6hP6i/GpJ+BQz/bZ077ZB625is1CEv5fefaBpnCUHAif
	rh7eQApz3Y74iw09XQi8nWqSXo+8xmIzJO0XDtzTb9veeOjH8YLHzSFYdDn7ow==
Date: Sun, 15 Dec 2024 09:00:23 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek
 <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: a64: explicitly assign clock
 parent for TCON0
In-Reply-To: <20241215053639.738890-3-anarsoul@gmail.com>
References: <20241215053639.738890-1-anarsoul@gmail.com>
 <20241215053639.738890-3-anarsoul@gmail.com>
Message-ID: <bab2e7c53385da06a44b449077c7241a@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_000025_366895_BF70B3E5 
X-CRM114-Status: GOOD (  19.87  )
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

Hello Vasily,

On 2024-12-15 06:34, Vasily Khoruzhick wrote:
> TCON0 seems to need a different clock parent depending on output type.
> For RGB it has to be PLL-VIDEO0-2X, while for DSI it has to be PLL-MIPI
> 
> Video output doesn't work if incorrect clock is assigned.
> 
> On my Pinebook I manually configured PLL-VIDEO0-2X and PLL-MIPI to the 
> same
> rate, and while video output works fine with PLL-VIDEO0-2X, it doesn't
> work at all (as in no picture) with PLL-MIPI.
> 
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in 
> TCON0 mux")
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Thanks for fixing this issue!  I've been banging my head for a while
about how to fix it without introducing new DT properties, and I hope
that the maintainers will like your approach.

I'd suggest that the patch description is improved further a bit, by
incorporating some parts of the good description of the issue that's
already in the cover letter.  With that addressed, please feel free
to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts | 2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  | 2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> index 379c2c8466f5..86d44349e095 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> @@ -390,6 +390,8 @@ &sound {
>  &tcon0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&lcd_rgb666_pins>;
> +	assigned-clocks = <&ccu CLK_TCON0>;
> +	assigned-clock-parents = <&ccu CLK_PLL_VIDEO0_2X>;
> 
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> index b407e1dd08a7..ec055510af8b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> @@ -369,6 +369,8 @@ &sound {
>  &tcon0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&lcd_rgb666_pins>;
> +	assigned-clocks = <&ccu CLK_TCON0>;
> +	assigned-clock-parents = <&ccu CLK_PLL_VIDEO0_2X>;
> 
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index a5c3920e0f04..0fecf0abb204 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -445,6 +445,8 @@ tcon0: lcd-controller@1c0c000 {
>  			clock-names = "ahb", "tcon-ch0";
>  			clock-output-names = "tcon-data-clock";
>  			#clock-cells = <0>;
> +			assigned-clocks = <&ccu CLK_TCON0>;
> +			assigned-clock-parents = <&ccu CLK_PLL_MIPI>;
>  			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
>  			reset-names = "lcd", "lvds";

