Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FE4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haf0qmSyrhLVsKjdMgPxImS4Aw0qzcWAx31UOE4mIDU=; b=NFRQBfHHu9CJjCWVXsO8OU91Dy
	eJ3//wwbHToRoTBJh8U66lBcsVsczHkIkfnrvA+StH2Zxd0LRpUb++MjYSQACMIlq9fJm6MDU+xm1
	NldD1r9MqM/Rnyl9ULfNFYUFlURXALScIDDnIXnuk3vQt4d+Fou7ucDYUYO6V6VkodSvQClgD4CG5
	t8/4TKF04uNc+UtoZwRB0iF421MGU/yraZxrw4ZMP9oPCFUcQQLNvSDQ8H5IRy4w7ptA2hmOjPXr/
	bDh45wPjXBkZ5Dlk9XXUoE7rehoofg/b3f3KrPyoVBj4QBULpUKMiE6gCBkC/ijTqpq+YDty4dmRu
	BoS3zpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVT9P-00000007x4P-2e2o;
	Wed, 08 Jan 2025 10:18:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSsY-00000007tkN-28NL;
	Wed, 08 Jan 2025 10:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=haf0qmSyrhLVsKjdMgPxImS4Aw0qzcWAx31UOE4mIDU=; b=cQ+xelv0EXXpYwUIN56Ns4pU9T
	o3++o3Wo3sicI2WdZ7pmo0RAztn0ebpn+DC3b1wm3IcVyVt6BBfMrbJkTYtDxaXvgdaI+0s3SkZlz
	GXAVhCMxYzy7jAoiE+xBq5bCdIv3tOuaJCSGl56XtRb2l2djzaQMN2K0qRtHr2qLHZ4v2++OqbtCC
	uHNNKqtJq1SYX58L1K6y0RnBJaq1+idfLAla9oZkZ6Un+05JIZOa0aE79OsOnAGPL9Nvk+JysosWN
	rHYxdpqiz7cZO7pJ9Nex5m7PMRJsczeCGU1VPRel3eZxv9HUKdy9Q9NrBmbiNhy6L8Y8hoxjG3wWk
	ejvOvmmw==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVSsV-0004XV-3D; Wed, 08 Jan 2025 11:01:31 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add SPDIF nodes to RK3588(s) device
 trees
Date: Wed, 08 Jan 2025 11:01:30 +0100
Message-ID: <1950286.IobQ9Gjlxr@diego>
In-Reply-To: <20250108-rk3588-h96-max-v58-v2-2-522301b905d6@gmail.com>
References: <20250108-rk3588-h96-max-v58-v2-0-522301b905d6@gmail.com>
 <20250108-rk3588-h96-max-v58-v2-2-522301b905d6@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_020134_720654_8A9B084E 
X-CRM114-Status: GOOD (  20.09  )
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

Hi Alexey,

Am Mittwoch, 8. Januar 2025, 10:09:07 CET schrieb Alexey Charkov:
> RK3588s has four SPDIF transmitters, and the full RK3588 has six.
> They are fully compatible to RK3568 ones. Add respective nodes
> to .dtsi files.

While it may seem that way, we still want soc-specific compatibles,
to future-proof this.

I.e. going the the
	compatible = "rockchip,rk3588-spdif", "rockchip,rk3568-spdif";
way, so that now things can just match against the rk3568, but if some
fault emerges later on the code can be fixed with the DT staying just
compatible.

The spdif also has an example already for all the spdif variants that are
compatible to the rk3066 [3], so it'd need another "items" block for things
being compatible with the rk3568.


Heiko


[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml

> Adapted from vendor sources at [1] and [2], respectively
> 
> [1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> [2] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3588.dtsi
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi  | 64 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 30 ++++++++++++
>  2 files changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 8cfa30837ce72581d0b513a8274ab0177eb5ae15..ff0c9191737b34979a408067df1a664dbe87395f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1318,6 +1318,21 @@ vop_mmu: iommu@fdd97e00 {
>  		status = "disabled";
>  	};
>  
> +	spdif_tx2: spdif-tx@fddb0000 {
> +		compatible = "rockchip,rk3568-spdif";
> +		reg = <0x0 0xfddb0000 0x0 0x1000>;
> +		assigned-clock-parents = <&cru PLL_AUPLL>;
> +		assigned-clocks = <&cru CLK_SPDIF2_DP0_SRC>;
> +		clock-names = "mclk", "hclk";
> +		clocks = <&cru MCLK_SPDIF2>, <&cru HCLK_SPDIF2_DP0>;
> +		dma-names = "tx";
> +		dmas = <&dmac1 6>;
> +		interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
> +		power-domains = <&power RK3588_PD_VO0>;
> +		#sound-dai-cells = <0>;
> +		status = "disabled";
> +	};
> +
>  	i2s4_8ch: i2s@fddc0000 {
>  		compatible = "rockchip,rk3588-i2s-tdm";
>  		reg = <0x0 0xfddc0000 0x0 0x1000>;
> @@ -1335,6 +1350,21 @@ i2s4_8ch: i2s@fddc0000 {
>  		status = "disabled";
>  	};
>  
> +	spdif_tx3: spdif-tx@fdde0000 {
> +		compatible = "rockchip,rk3568-spdif";
> +		reg = <0x0 0xfdde0000 0x0 0x1000>;
> +		assigned-clock-parents = <&cru PLL_AUPLL>;
> +		assigned-clocks = <&cru CLK_SPDIF3_SRC>;
> +		clock-names = "mclk", "hclk";
> +		clocks = <&cru MCLK_SPDIF3>, <&cru HCLK_SPDIF3>;
> +		dma-names = "tx";
> +		dmas = <&dmac1 7>;
> +		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
> +		power-domains = <&power RK3588_PD_VO1>;
> +		#sound-dai-cells = <0>;
> +		status = "disabled";
> +	};
> +
>  	i2s5_8ch: i2s@fddf0000 {
>  		compatible = "rockchip,rk3588-i2s-tdm";
>  		reg = <0x0 0xfddf0000 0x0 0x1000>;
> @@ -2016,6 +2046,40 @@ &i2s3_sdi
>  		status = "disabled";
>  	};
>  
> +	spdif_tx0: spdif-tx@fe4e0000 {
> +		compatible = "rockchip,rk3568-spdif";
> +		reg = <0x0 0xfe4e0000 0x0 0x1000>;
> +		assigned-clock-parents = <&cru PLL_AUPLL>;
> +		assigned-clocks = <&cru CLK_SPDIF0_SRC>;
> +		clock-names = "mclk", "hclk";
> +		clocks = <&cru MCLK_SPDIF0>, <&cru HCLK_SPDIF0>;
> +		dma-names = "tx";
> +		dmas = <&dmac0 5>;
> +		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
> +		pinctrl-0 = <&spdif0m0_tx>;
> +		pinctrl-names = "default";
> +		power-domains = <&power RK3588_PD_AUDIO>;
> +		#sound-dai-cells = <0>;
> +		status = "disabled";
> +	};
> +
> +	spdif_tx1: spdif-tx@fe4f0000 {
> +		compatible = "rockchip,rk3568-spdif";
> +		reg = <0x0 0xfe4f0000 0x0 0x1000>;
> +		assigned-clock-parents = <&cru PLL_AUPLL>;
> +		assigned-clocks = <&cru CLK_SPDIF1_SRC>;
> +		clock-names = "mclk", "hclk";
> +		clocks = <&cru MCLK_SPDIF1>, <&cru HCLK_SPDIF1>;
> +		dma-names = "tx";
> +		dmas = <&dmac1 5>;
> +		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
> +		pinctrl-0 = <&spdif1m0_tx>;
> +		pinctrl-names = "default";
> +		power-domains = <&power RK3588_PD_AUDIO>;
> +		#sound-dai-cells = <0>;
> +		status = "disabled";
> +	};
> +
>  	gic: interrupt-controller@fe600000 {
>  		compatible = "arm,gic-v3";
>  		reg = <0x0 0xfe600000 0 0x10000>, /* GICD */
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> index 4a950907ea6f51c1d4123d52b73b726226db37bc..ba1bcd12c558847680aaaa2377d6d0a84fdaa1db 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -67,6 +67,21 @@ u2phy1_otg: otg-port {
>  		};
>  	};
>  
> +	spdif_tx5: spdif-tx@fddb8000 {
> +		compatible = "rockchip,rk3568-spdif";
> +		reg = <0x0 0xfddb8000 0x0 0x1000>;
> +		assigned-clock-parents = <&cru PLL_AUPLL>;
> +		assigned-clocks = <&cru CLK_SPDIF5_DP1_SRC>;
> +		clock-names = "mclk", "hclk";
> +		clocks = <&cru MCLK_SPDIF5>, <&cru HCLK_SPDIF5_DP1>;
> +		dma-names = "tx";
> +		dmas = <&dmac1 22>;
> +		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>;
> +		power-domains = <&power RK3588_PD_VO0>;
> +		#sound-dai-cells = <0>;
> +		status = "disabled";
> +	};
> +
>  	i2s8_8ch: i2s@fddc8000 {
>  		compatible = "rockchip,rk3588-i2s-tdm";
>  		reg = <0x0 0xfddc8000 0x0 0x1000>;
> @@ -84,6 +99,21 @@ i2s8_8ch: i2s@fddc8000 {
>  		status = "disabled";
>  	};
>  
> +	spdif_tx4: spdif-tx@fdde8000 {
> +		compatible = "rockchip,rk3568-spdif";
> +		reg = <0x0 0xfdde8000 0x0 0x1000>;
> +		assigned-clock-parents = <&cru PLL_AUPLL>;
> +		assigned-clocks = <&cru CLK_SPDIF4_SRC>;
> +		clock-names = "mclk", "hclk";
> +		clocks = <&cru MCLK_SPDIF4>, <&cru HCLK_SPDIF4>;
> +		dma-names = "tx";
> +		dmas = <&dmac1 8>;
> +		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH 0>;
> +		power-domains = <&power RK3588_PD_VO1>;
> +		#sound-dai-cells = <0>;
> +		status = "disabled";
> +	};
> +
>  	i2s6_8ch: i2s@fddf4000 {
>  		compatible = "rockchip,rk3588-i2s-tdm";
>  		reg = <0x0 0xfddf4000 0x0 0x1000>;
> 
> 





