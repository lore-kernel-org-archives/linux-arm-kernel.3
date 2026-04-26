Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1029EFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvKBY+c+iYjGsEpoYL9NRwD1uu5gqclMVNxmGMDvE7c=; b=3mgxvs+O0Z7vwOK9gAArr9jG/0
	dpgViu8YfV0TTvGpRb5aPLuj8A+FGn6ijJMNtnkgr3hN7iS1BOFRiDJmZYekGN41QuzzGGDTC6mmn
	TJfrVx5NwTGMv7tWYSre4LMqglJrmd+lHngr2wvP7ZsoezN/y7JK7aOfs+oanXTohEzMiLGLT3TZN
	aqNzIyRZFU8OktsphGiTvGTIgrTudDk6ZqoDtqwm3LaE3CRelysN7hpKhUVuvjTjVW4iNJ4jvselZ
	HjmzHZXmkGOXg97c64vSa4FIjmYE8MGvkI6pQHFFK5RnIPO3PfJGHxFVyY0spjexEOzM9q1EQ+Wu+
	zRhj7WMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGtwy-0000000FKoH-2vCW;
	Sun, 26 Apr 2026 07:30:44 +0000
Received: from mail-m2485.xmail.ntesmail.com ([45.195.24.85])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGtwt-0000000FKnj-3nt2;
	Sun, 26 Apr 2026 07:30:42 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c2a404a3;
	Sun, 26 Apr 2026 15:30:35 +0800 (GMT+08:00)
Message-ID: <7e55f270-5422-4696-987d-e2a2ab16240b@rock-chips.com>
Date: Sun, 26 Apr 2026 15:30:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: rockchip: add PWM nodes to RK3576 SoC
 dtsi
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>
Cc: kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260420-rk3576-pwm-v5-5-ae7cfbbe5427@collabora.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260420-rk3576-pwm-v5-5-ae7cfbbe5427@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9dc8b282f103a3kunm5e5a610713ec55
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUIdH1ZIGUlJQ0pPSx
	8dQh9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IbFrEF5AZwgTn9ILKm7PdjZuml/51hPqi9yF563W+xC4TVPGo4y99OxqEX1Wj8x7+IPz6bTT46VYGLM/kXqYcO94cJ3wBGZC+kPSmMjJj1pQuka2tuZf0pWSwRRgjIlXUSjZgIzhsWZhvL66UGkXrQI9oNIAm+fa3tg0gtFiq2k=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=cvKBY+c+iYjGsEpoYL9NRwD1uu5gqclMVNxmGMDvE7c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_003041_297838_6D514CB3 
X-CRM114-Status: GOOD (  11.66  )
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

Hi Nicolas,

On 4/20/2026 9:52 PM, Nicolas Frattaroli wrote:
> The RK3576 SoC features three distinct PWM controllers, with variable
> numbers of channels. Add each channel as a separate node to the SoC's
> device tree, as they don't really overlap in register ranges.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3576.dtsi | 208 +++++++++++++++++++++++++++++++
>   1 file changed, 208 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index e12a2a0cfb89..55d6b103c329 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1032,6 +1032,32 @@ uart1: serial@27310000 {
>   			status = "disabled";
>   		};
>   
> +		pwm0_2ch_0: pwm@27330000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x27330000 0x0 0x1000>;
> +			clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>,
> +				 <&cru CLK_PMU1PWM_OSC>, <&cru CLK_PMU1PWM_RC>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm0m0_ch0>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm0_2ch_1: pwm@27331000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x27331000 0x0 0x1000>;
> +			clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>,
> +				 <&cru CLK_PMU1PWM_OSC>, <&cru CLK_PMU1PWM_RC>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm0m0_ch1>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>   		pmu: power-management@27380000 {
>   			compatible = "rockchip,rk3576-pmu", "syscon", "simple-mfd";
>   			reg = <0x0 0x27380000 0x0 0x800>;
> @@ -2630,6 +2656,188 @@ uart9: serial@2adc0000 {
>   			status = "disabled";
>   		};
>   
> +		pwm1_6ch_0: pwm@2add0000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2add0000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
> +				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm1m0_ch0>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm1_6ch_1: pwm@2add1000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2add1000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
> +				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm1m0_ch1>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm1_6ch_2: pwm@2add2000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2add2000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
> +				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm1m0_ch2>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm1_6ch_3: pwm@2add3000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2add3000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
> +				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm1m0_ch3>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm1_6ch_4: pwm@2add4000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2add4000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
> +				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm1m0_ch4>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm1_6ch_5: pwm@2add5000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2add5000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
> +				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm1m0_ch5>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2_8ch_0: pwm@2ade0000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2ade0000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
> +				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm2m0_ch0>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2_8ch_1: pwm@2ade1000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2ade1000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
> +				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm2m0_ch1>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2_8ch_2: pwm@2ade2000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2ade2000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
> +				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm2m0_ch2>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2_8ch_3: pwm@2ade3000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2ade3000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
> +				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm2m0_ch3>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2_8ch_4: pwm@2ade4000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2ade4000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
> +				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm2m0_ch4>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2_8ch_5: pwm@2ade5000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2ade5000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
> +				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm2m0_ch5>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2_8ch_6: pwm@2ade6000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2ade6000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
> +				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm2m0_ch6>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2_8ch_7: pwm@2ade7000 {
> +			compatible = "rockchip,rk3576-pwm";
> +			reg = <0x0 0x2ade7000 0x0 0x1000>;
> +			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
> +				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
> +			clock-names = "pwm", "pclk", "osc", "rc";
> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pwm2m0_ch7>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>   		saradc: adc@2ae00000 {
>   			compatible = "rockchip,rk3576-saradc", "rockchip,rk3588-saradc";
>   			reg = <0x0 0x2ae00000 0x0 0x10000>;
> 

According to the RK3576 TRM, the register base address, clocks and 
interrupt configuration of the PWM node are all correct

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


