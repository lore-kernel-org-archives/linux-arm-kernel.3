Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF5CC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJWm3NP+vpnciP1NvxKQQbWXtp+Wn0NpsFPTJIDeEeQ=; b=WtJstFaYYX77y2D/vrDSA1ViuG
	w00KKdVn731mzkYMB6aribRf9zUevG1BvBua3YhgjL+CHx2pImwOAJi81qV6neuyEfCxJBc0x5Csx
	9jP02G+uibR5fF8hiTJjSDW6Um4hKwhd/RyDi4HlZbd6YBO7xEj/p+RTy8pBA7nQ3z22NIC+NVJ1f
	yojnUxm4XcqfQe7WvOVn91alxJQpSLUU+CndWbtQs48n56h5EcHNGYMcxDTEoGsz8klRpxcv1dtSM
	hiQpBDuvTssZP42fBo9ucYTA53j0gYtsEpct7x/yggr7O0c5jk3dekYv7igJ/K98jaANrUNDgQutK
	bZ1EggfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScHn-0000000Fnqt-0ZEw;
	Fri, 20 Jun 2025 14:00:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScCc-0000000Fmro-2bSc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:54:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9170416F2;
	Fri, 20 Jun 2025 06:54:25 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 691343F58B;
	Fri, 20 Jun 2025 06:54:43 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:54:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: allwinner: a523: Move mmc nodes to
 correct position
Message-ID: <20250620145440.047e933b@donnerap.manchester.arm.com>
In-Reply-To: <20250619173007.3367034-3-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
	<20250619173007.3367034-3-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_065446_758420_2BE74F36 
X-CRM114-Status: GOOD (  14.79  )
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

On Fri, 20 Jun 2025 01:30:04 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> When the mmc nodes were added to the dtsi file, they were inserted in
> the incorrect position.
> 
> Move them to the correct place.

Yes, they were indeed wrongly ordered! Now "grep @ ... | sort -c" is happy.

> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 126 +++++++++---------
>  1 file changed, 63 insertions(+), 63 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 8b7cbc2e78f5..458d7ecedacd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -181,69 +181,6 @@ ccu: clock-controller@2001000 {
>  			#reset-cells = <1>;
>  		};
>  
> -		mmc0: mmc@4020000 {
> -			compatible = "allwinner,sun55i-a523-mmc",
> -				     "allwinner,sun20i-d1-mmc";
> -			reg = <0x04020000 0x1000>;
> -			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> -			clock-names = "ahb", "mmc";
> -			resets = <&ccu RST_BUS_MMC0>;
> -			reset-names = "ahb";
> -			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&mmc0_pins>;
> -			status = "disabled";
> -
> -			max-frequency = <150000000>;
> -			cap-sd-highspeed;
> -			cap-mmc-highspeed;
> -			cap-sdio-irq;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
> -		mmc1: mmc@4021000 {
> -			compatible = "allwinner,sun55i-a523-mmc",
> -				     "allwinner,sun20i-d1-mmc";
> -			reg = <0x04021000 0x1000>;
> -			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> -			clock-names = "ahb", "mmc";
> -			resets = <&ccu RST_BUS_MMC1>;
> -			reset-names = "ahb";
> -			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&mmc1_pins>;
> -			status = "disabled";
> -
> -			max-frequency = <150000000>;
> -			cap-sd-highspeed;
> -			cap-mmc-highspeed;
> -			cap-sdio-irq;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
> -		mmc2: mmc@4022000 {
> -			compatible = "allwinner,sun55i-a523-mmc",
> -				     "allwinner,sun20i-d1-mmc";
> -			reg = <0x04022000 0x1000>;
> -			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> -			clock-names = "ahb", "mmc";
> -			resets = <&ccu RST_BUS_MMC2>;
> -			reset-names = "ahb";
> -			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&mmc2_pins>;
> -			status = "disabled";
> -
> -			max-frequency = <150000000>;
> -			cap-sd-highspeed;
> -			cap-mmc-highspeed;
> -			cap-sdio-irq;
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -		};
> -
>  		wdt: watchdog@2050000 {
>  			compatible = "allwinner,sun55i-a523-wdt";
>  			reg = <0x2050000 0x20>;
> @@ -449,6 +386,69 @@ its: msi-controller@3440000 {
>  			};
>  		};
>  
> +		mmc0: mmc@4020000 {
> +			compatible = "allwinner,sun55i-a523-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04020000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";
> +			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc0_pins>;
> +			status = "disabled";
> +
> +			max-frequency = <150000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			cap-sdio-irq;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		mmc1: mmc@4021000 {
> +			compatible = "allwinner,sun55i-a523-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04021000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC1>;
> +			reset-names = "ahb";
> +			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc1_pins>;
> +			status = "disabled";
> +
> +			max-frequency = <150000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			cap-sdio-irq;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		mmc2: mmc@4022000 {
> +			compatible = "allwinner,sun55i-a523-mmc",
> +				     "allwinner,sun20i-d1-mmc";
> +			reg = <0x04022000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC2>;
> +			reset-names = "ahb";
> +			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc2_pins>;
> +			status = "disabled";
> +
> +			max-frequency = <150000000>;
> +			cap-sd-highspeed;
> +			cap-mmc-highspeed;
> +			cap-sdio-irq;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
>  		usb_otg: usb@4100000 {
>  			compatible = "allwinner,sun55i-a523-musb",
>  				     "allwinner,sun8i-a33-musb";


