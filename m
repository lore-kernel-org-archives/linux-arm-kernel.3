Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB56C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCAJ/1smKtAmYm+WKYPnozKlTBBJTpkCk5xD4ZLhIP8=; b=fCq2DjZEjNgvD8L4YHpeB7WbZl
	WCzWTB55IBfer9ZJajk8bJFcOqrIDEtBrE9MKWTWYYIKmzOKNQqtBY6Jc5RAJmo8vWZBKkDXmuHY/
	2PZzqPpZppG7a2iOsAYLk4eh4j1NROPtTwCrXtO2tYU/N0y1g8WfUDkjScutwvA8qbW+EM0bJaPlM
	YLJmJ8Hqe6EilDja5f/WhPvmS+K69dygMVeek5xo+jx9O/J1wgIdxAQ3YFY3xWwm+7RPvlsSIQ/Bs
	hM64D2JzqnaDKFKQbl8TBEfGVV9+a2C47uw3bkETpsyw3RAVsyMZoehx+JzdcYBKOoMxtDAOQ725N
	8NsnZSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpwE-00000006bXE-1eRG;
	Mon, 05 May 2025 07:08:30 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpu7-00000006bCn-3BVT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 07:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746428777;
 bh=uCAJ/1smKtAmYm+WKYPnozKlTBBJTpkCk5xD4ZLhIP8=;
 b=eD42vXYe8PlU0LvFmhYw/6V2t/zy6sdCKmCQth9TxwdNxTNOoXhE3N8aQHtLdU92B/dq2zRcs
 gg9yQiPqFzVHO3WlXsCQ44nCYgRbEl2L1AzgVagCo/gHl7cnXLRlQKyza6SwB1Pi/gXWQ3wWaRc
 quy2xN4ypW4wbiIfiwwZeoC7YXDk7F1xIbpVJVAc/T3lBJzV3x1PadGsSrN5lDl3F6xsKzeHl3E
 SMBc23tcha9zJLRW2sZzfUh9dTEeT/Om2PcwJPJu+8PeIq9ADShQ5PewwAgyBc6dQVlQD7dYI+Y
 ahByMwnG6I1M030M+F8G/bI24LhX2y9WCtA1EBxVjn3Q==
X-Forward-Email-ID: 6818635ebaed44ffca19f3f7
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <727f7797-3a0c-426a-8f74-6adfb3215dc7@kwiboo.se>
Date: Mon, 5 May 2025 09:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add I2C controllers for
 RK3528
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417120118.17610-3-ziyao@disroot.org>
 <20250417120118.17610-5-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250417120118.17610-5-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_000620_151727_BCD51C5D 
X-CRM114-Status: GOOD (  12.35  )
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

On 2025-04-17 14:01, Yao Zi wrote:
> Describe I2C controllers shipped by RK3528 in devicetree. For I2C-2,
> I2C-4 and I2C-7 which come with only a set of possible pins, a default
> pin configuration is included.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Reading from the i2c EEPROM on a E20C works with this, so this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 110 +++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 826f9be0be19..2c9780069af9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -24,6 +24,14 @@ aliases {
>  		gpio2 = &gpio2;
>  		gpio3 = &gpio3;
>  		gpio4 = &gpio4;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
>  		serial2 = &uart2;
> @@ -465,6 +473,108 @@ uart7: serial@ffa28000 {
>  			status = "disabled";
>  		};
>  
> +		i2c0: i2c@ffa50000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa50000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@ffa58000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa58000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@ffa60000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa60000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c2m1_xfer>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c@ffa68000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa68000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@ffa70000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa70000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c4_xfer>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c5: i2c@ffa78000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa78000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c6: i2c@ffa80000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa80000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C6>, <&cru PCLK_I2C6>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c@ffa88000 {
> +			compatible = "rockchip,rk3528-i2c",
> +				     "rockchip,rk3399-i2c";
> +			reg = <0x0 0xffa88000 0x0 0x1000>;
> +			clocks = <&cru CLK_I2C7>, <&cru PCLK_I2C7>;
> +			clock-names = "i2c", "pclk";
> +			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c7_xfer>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		saradc: adc@ffae0000 {
>  			compatible = "rockchip,rk3528-saradc";
>  			reg = <0x0 0xffae0000 0x0 0x10000>;


