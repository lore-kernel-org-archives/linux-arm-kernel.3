Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28B9C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2j215NHv63uSAIdtLy0VipkXsG5drO3e1lMpaEIG58=; b=ASx4A1IcwqSeglnJyX9i3u9hxH
	l2zNyQMe6NTvdB8oFdiYSC/uXYoXdvehK5DSwSWXst/7SUft5I/YDB91SFAvCmy7dSbEDc4dKbDp5
	w3YWn6/NCktdSHmteXAKK89yPvkBBPyACd9fi93FRIqbBSyqw76ff+xyl3YO0JakElTxdosc17zwo
	ZpQU5FyjAmOL7oTeeQeE6nsn5ysQqWJZCwHfM4957yO9D18oRNMR/U0dIIL3wpsUlJeUxGpwRt2wv
	Qp9LiVAPQ2DGyLtW2E7py9n5r52I+PqZlcpzUO/8kZvvtdbj7h6ymG8NHa/Ksii8Lsi2NuLAuWp6j
	HJ2Nwr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYZ2z-00000000yOr-3JdW;
	Sun, 06 Jul 2025 23:45:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYwd-00000000xvK-3Ib7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 23:38:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 687E71E8D;
	Sun,  6 Jul 2025 16:38:38 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84A623F694;
	Sun,  6 Jul 2025 16:38:49 -0700 (PDT)
Date: Mon, 7 Jul 2025 00:37:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: a523: Add power controller
 device nodes
Message-ID: <20250707003710.1d4a3ed0@minigeek.lan>
In-Reply-To: <20250627152918.2606728-5-wens@kernel.org>
References: <20250627152918.2606728-1-wens@kernel.org>
	<20250627152918.2606728-5-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_163851_871751_F5D0E19C 
X-CRM114-Status: GOOD (  15.71  )
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

On Fri, 27 Jun 2025 23:29:18 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The A523 SoC family has two power controllers, one based on the existing
> PPU, and one newer one based on ARM's PCK-600.
> 
> Add device nodes for both of them.

Compared against the manual, that matches up. Might be worth to mention
the reliance on your RST_BUS_R_PPU0 patch, otherwise some bots might
scream.

> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 6f62201fd739..255e0ef98219 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -7,6 +7,8 @@
>  #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
> +#include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
> +#include <dt-bindings/power/allwinner,sun55i-a523-pck600.h>
>  
>  / {
>  	interrupt-parent = <&gic>;
> @@ -576,6 +578,14 @@ mdio0: mdio {
>  			};
>  		};
>  
> +		ppu: power-controller@7001400 {
> +			compatible = "allwinner,sun55i-a523-ppu";
> +			reg = <0x07001400 0x400>;
> +			clocks = <&r_ccu CLK_BUS_R_PPU1>;
> +			resets = <&r_ccu RST_BUS_R_PPU1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		r_ccu: clock-controller@7010000 {
>  			compatible = "allwinner,sun55i-a523-r-ccu";
>  			reg = <0x7010000 0x250>;
> @@ -622,6 +632,14 @@ r_i2c_pins: r-i2c-pins {
>  			};
>  		};
>  
> +		pck600: power-controller@7060000 {
> +			compatible = "allwinner,sun55i-a523-pck-600";
> +			reg = <0x07060000 0x8000>;
> +			clocks = <&r_ccu CLK_BUS_R_PPU0>;
> +			resets = <&r_ccu RST_BUS_R_PPU0>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		r_i2c0: i2c@7081400 {
>  			compatible = "allwinner,sun55i-a523-i2c",
>  				     "allwinner,sun8i-v536-i2c",


