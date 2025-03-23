Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37944C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kdDEqFsGGIe5/LOChdFvMjVPWd6p1qWvu1crnxu6WE=; b=AxBF9qtGs0MZGXW1niIvRzSJTW
	zSEHS5YcP8Gq6b9c101mAfdvJ4cDepFypWhovuQPMxkMY+mufBmut8Qdkk7L9jXurhJI5hVN2SK9R
	PKsqVBW52gH8wgSYxx01vDzl6+nvtZVQDnatC826k2564v+pF4yg7jUwpxXzJYMdXsFgYstGPDeFr
	fE1owxQzqINJIh9t8us9D98yQ+TbxIsNyBmwj2eLEl16BoALdVEIfbpE/s/9fL7a9rukcCuFaPpe+
	b63ANTE6HJOwHzY2PL72S4UOl/nCoIc3CuDwf2D2cov07lp5hfIafTc63VT5HpKPhJ+2+qwt5w/JK
	IxurWmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twSik-00000001k33-3pmJ;
	Sun, 23 Mar 2025 21:19:02 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twSh3-00000001jt1-2A6f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 21:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742764636;
 bh=6kdDEqFsGGIe5/LOChdFvMjVPWd6p1qWvu1crnxu6WE=;
 b=mgysPT3+dpaRa7uwewS23nPTgmvsJIQ/NFWd+S5ef3ikM3vUZ1JNMuH7ukjKw1AkXvm7tQ4K/
 rkUpQOxzoi0um5YyodMBh7IrGuJDf9eALDDTXDWIfuBIBaP6tKNa3+M8ia6b/9EsEK+HyeOAli8
 3h97DgD8EGYpiCIhAiPtlPWIHmnDkrUqkOPtCPxKoTupmQiUOLZbFVrFjzTmH1BonXx45B5ASRs
 VxOZbpQHLO/PMggMyEJnIHRqTxsHaiFr+KJIDoNvHB9jMozgIRQovUNekwwtc/Qh1ppysMqpvW8
 AggpjNcDhfPBTiMguJetyHUeRBTDiKKlxFtkpN8sCDwg==
X-Forward-Email-ID: 67e07a56bd529871d5f807f9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <432b6705-4d97-4d47-bbc2-196f9b84da05@kwiboo.se>
Date: Sun, 23 Mar 2025 22:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Enable regulators for Radxa
 E20C
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Yao Zi <ziyao@disroot.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250318120003.2340652-1-amadeus@jmu.edu.cn>
 <20250318120003.2340652-3-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250318120003.2340652-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_141717_655149_29D23F3F 
X-CRM114-Status: GOOD (  15.29  )
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

Hi Chukun,

On 2025-03-18 13:00, Chukun Pan wrote:
> Enable pwm and fixed regulators for Radxa E20C. The pwm regulator is
> used to power the CPU and GPU. Note that the LPDDR4 voltage is 1.1V.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> index 57a446b5cbd6..159b55aa970d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> @@ -100,6 +100,16 @@ vcc_3v3: regulator-3v3-vcc {
>  		vin-supply = <&vcc5v0_sys>;
>  	};
>  
> +	vcc_ddr: regulator-vcc-ddr {

Since we know the voltage for this regulator please name the node
regulator-1v1-vcc-ddr and place it above the regulator-1v8 to keep node
order by node name (not label name).

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_ddr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
>  	vcc5v0_sys: regulator-5v0-vcc-sys {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc5v0_sys";
> @@ -108,6 +118,56 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
>  	};
> +
> +	vdd_0v9: regulator-0v9-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_0v9";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <900000>;
> +		regulator-max-microvolt = <900000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};

This node is out of node name order, please place it before the
regulator-1v1-vcc-ddr node.

> +
> +	vdd_arm: regulator-vdd-arm {
> +		compatible = "pwm-regulator";

Suggest we add the pinctrl props here instead:

 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm1m0_pins>;

> +		pwms = <&pwm1 0 5000 1>;

This should use the PWM_POLARITY_INVERTED flag not 1.

Will require include of dt-bindings/pwm/pwm.h.

> +		pwm-supply = <&vcc5v0_sys>;
> +		regulator-name = "vdd_arm";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <746000>;
> +		regulator-max-microvolt = <1201000>;
> +		regulator-settling-time-up-us = <250>;
> +	};
> +
> +	vdd_logic: regulator-vdd-logic {
> +		compatible = "pwm-regulator";

Same here, suggest we add the pinctrl props here instead:

 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm2m0_pins>;

> +		pwms = <&pwm2 0 5000 1>;

Same here, this should use the PWM_POLARITY_INVERTED flag not 1.

> +		pwm-supply = <&vcc5v0_sys>;
> +		regulator-name = "vdd_logic";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <705000>;
> +		regulator-max-microvolt = <1006000>;
> +		regulator-settling-time-up-us = <250>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vdd_arm>;
>  };
>  
>  &pinctrl {
> @@ -132,6 +192,18 @@ wan_led_g: wan-led-g {
>  	};
>  };
>  
> +&pwm1 {
> +	pinctrl-0 = <&pwm1m0_pins>;
> +	pinctrl-names = "default";

For consistency please put the pinctrl-names before the pinctrl-X props.
And as stated above, I suggest we move this to the regulator node.

> +	status = "okay";
> +};
> +
> +&pwm2 {
> +	pinctrl-0 = <&pwm2m0_pins>;
> +	pinctrl-names = "default";

Same here.

Regards,
Jonas

> +	status = "okay";
> +};
> +
>  &saradc {
>  	vref-supply = <&vcc_1v8>;
>  	status = "okay";


