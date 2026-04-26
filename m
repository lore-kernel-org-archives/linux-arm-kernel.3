Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84431FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVYUAUD3MtOhd5xJ/8bgt/jc3lNhNlVgEg2Y7JvdCe4=; b=JZRXXCkhn5F5SfDvIVpFOFFu6J
	138tkGmT9QyYv5V3O4DSP7SixMdF1qXm056cK8zgx3B9I8JkNnZ5iBaj70ucRH6QgfJS5+7+Xjar5
	JfNzG+VDFVoEbGaLvBupVoDJP4MBdC3et2ixlthpNKpEunj52SmPzGg80CyUaRFV8hEPfD9GCY4lY
	eoi1foY7ZIXt7QIGBV1g4fuKPZG1Qne67GsPt19PQ+jr+u/T65/3xIEPgdSO2Zxfnl6xh0TtpI4iU
	oijxNE4r4xJktDtsVy0qFIJlJtTr/vPLgtET4F4URMull8F+d1+IwPVNBHFuKdxSpUMv4hCg7Wzmh
	F9VvAVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGtpp-0000000FKXv-08At;
	Sun, 26 Apr 2026 07:23:21 +0000
Received: from mail-m83171.xmail.ntesmail.com ([156.224.83.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGtpl-0000000FKXP-1fwA;
	Sun, 26 Apr 2026 07:23:19 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c2a40191;
	Sun, 26 Apr 2026 15:23:00 +0800 (GMT+08:00)
Message-ID: <35afc21f-74c9-4f52-bdf1-18a34fb58578@rock-chips.com>
Date: Sun, 26 Apr 2026 15:23:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm64: dts: rockchip: Add cooling fan to ROCK 4D
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
 <20260420-rk3576-pwm-v5-6-ae7cfbbe5427@collabora.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260420-rk3576-pwm-v5-6-ae7cfbbe5427@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9dc8ab938e03a3kunm608d0a1f13e627
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ08YSVYZTU1PSUMeSh
	hCHkxWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=eUjhWMrcKnY5LlEG1ShyEX5gpPrTxsDLAiqhKFZuGYIn9YmGbcKOJ9cbbMupRyX0IHZsQ02lJAkUP5ZC3WtabW9h/ra6UnjQjpmj3VzuRn0rqLdsSmTHXj8Gmb0ysUl+tHUSOaVGyn5+pUgzHVTb8NidTbjAnCP+EAcvO7OceX0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=jVYUAUD3MtOhd5xJ/8bgt/jc3lNhNlVgEg2Y7JvdCe4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_002318_018204_E7DE0496 
X-CRM114-Status: GOOD (  15.31  )
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
> The ROCK 4D has a header to connect a small cooling fan. This fan is
> driven by one of the SoC's PWM outputs driving a transistor, that in
> turn controls the fan's power.
> 
> With the introduction of PWM support, add a description of this cooling
> fan, as well as the additional trips and cooling-maps for it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 50 +++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> index 899a84b1fbf9..2d5ede010ad0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> @@ -45,6 +45,14 @@ rfkill {
>   		shutdown-gpios = <&gpio2 RK_PD1 GPIO_ACTIVE_HIGH>;
>   	};
>   
> +	fan: pwm-fan {
> +		compatible = "pwm-fan";
> +		cooling-levels = <0 180 205 230 255>;
> +		fan-supply = <&vcc_5v0_sys>;
> +		pwms = <&pwm2_8ch_5 0 60000 0>;
> +		#cooling-cells = <2>;
> +	};
> +
>   	leds: leds {
>   		compatible = "gpio-leds";
>   		pinctrl-names = "default";
> @@ -711,6 +719,36 @@ rgmii_phy0: ethernet-phy@1 {
>   	};
>   };
>   
> +&package_thermal {
> +	polling-delay = <100>;
> +
> +	trips {
> +		package_fan0: package-fan0 {
> +			temperature = <50000>;
> +			hysteresis = <2000>;
> +			type = "active";
> +		};
> +
> +		package_fan1: package-fan1 {
> +			temperature = <60000>;
> +			hysteresis = <2000>;
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map1 {
> +			trip = <&package_fan0>;
> +			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
> +		};
> +
> +		map2 {
> +			trip = <&package_fan1>;
> +			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};
> +
>   &pcie0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pcie_reset>;
> @@ -720,6 +758,13 @@ &pcie0 {
>   };
>   
>   &pinctrl {
> +	fan {
> +		fan_pwm: fan-pwm {
> +			rockchip,pins =
> +				<4 RK_PC5 14 &pcfg_pull_down_drv_level_5>;
> +		};
> +	};
> +
>   	hym8563 {
>   		hym8563_int: hym8563-int {
>   			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
> @@ -770,6 +815,11 @@ wifi_en_h: wifi-en-h {
>   	};
>   };
>   
> +&pwm2_8ch_5 {
> +	pinctrl-0 = <&fan_pwm>;

May I ask why the pinctrl does not directly use &pwm2m1_ch5?

Is it because the default pin configuration cannot meet the requirements 
of the fan?

> +	status = "okay";
> +};
> +
>   &sai6 {
>   	status = "okay";
>   };
> 

Best regards,
Damon


