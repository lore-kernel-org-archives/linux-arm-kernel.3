Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF52C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 21:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6mVc2F17QEJBHK1fhZDepaSGxODcDU0cKVXx0iYDDg=; b=kGL71b/Nv7k+hIPYWMuNbsVWW3
	UvVwZ2bW5TyIXu7hrNjiaws9UxipCkOHXnLI/381iVM/WZn4IwSWH2bRpeKrQjo+ZC60M9Zb5wCTj
	PBPThMfiVSPy4TO46CvhITnCAeWAJhItmhzL6N2YD2NAKbWkI4fMiJT4hF+k2I9x9bAIrewnl+aFY
	hHz9e2LaAdzDe6Bo30HsYQ3dZkKFRrRyOJibdmC3IweLY+kFtqY2s3vHa/450H7+1m3+HBmZxv0iD
	C6oK2Kq+WQb+hZ9Swy4vLtmztyP8vsWH8JDszp/N6XGATPjHtsq1ZsWxLpgBRYsyr92vwvMJgClpP
	GtrzVkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC2x9-00000008Yx8-3ncm;
	Mon, 05 May 2025 21:02:19 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC2vB-00000008YhQ-2TlT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 21:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746478817;
 bh=D6mVc2F17QEJBHK1fhZDepaSGxODcDU0cKVXx0iYDDg=;
 b=vnmPvCcLKVOn9uWHOAyqDKmalT9REFzQV0/h5E1JqF3VOL0ADgK2pPPOReCr1ihGb4+R3o2sy
 Fwvg39MaFfvDt2MjjTUib/bm1Bs6AbMbZJgsM6xOMLlHOfhmNFgCqVgJaE3NJ5HD6R3LfAtxxfQ
 tHOd3qe3tgI9PvNhh9sGPXDawMOxaDjz1LV6YWxc3smcUNTUPjAr1noHFoSP+UPXn8BfKGwORWP
 3q7bgpWe/Er6/n6R/UZa29Mi7LLiyGO0PTfmPlnwUTExhk0rriOtZplcqIWbBDYbRHCh6dPakFA
 Z0oW4vES1kW6lM+MaruZda5+LSgt73iPxzbxrq5O+TLg==
X-Forward-Email-ID: 681926d746c37f8647c203a8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <f19f11f7-c020-44a3-84fa-eb9ca48ed11f@kwiboo.se>
Date: Mon, 5 May 2025 23:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250417143647.43860-1-ziyao@disroot.org>
 <20250417144005.43927-1-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250417144005.43927-1-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_140017_676556_FED1E0A6 
X-CRM114-Status: GOOD (  12.48  )
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

On 2025-04-17 16:40, Yao Zi wrote:
> SD-card is available on Radxa E20C board.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

SD-card is detected and working on my E20C, and this also seem to match
the schematics for E20C:

  mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
  mmc_host mmc1: Bus speed (slot 0) = 148500000Hz (slot req 150000000Hz, actual 148500000HZ div = 0)
  dwmmc_rockchip ffc30000.mmc: Successfully tuned phase to 215
  mmc1: new UHS-I speed SDR104 SDHC card at address 59b4
  mmcblk1: mmc1:59b4 USD00 29.5 GiB
   mmcblk1: p1

  $ cat /sys/kernel/debug/mmc1/ios
  lock:           150000000 Hz
  actual clock:   148500000 Hz
  vdd:            21 (3.3 ~ 3.4 V)
  bus mode:       2 (push-pull)
  chip select:    0 (don't care)
  power mode:     2 (on)
  bus width:      2 (4 bits)
  timing spec:    6 (sd uhs SDR104)
  signal voltage: 1 (1.80 V)
  driver type:    0 (driver type B)

So this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> ---
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> index 57a446b5cbd6..09d917a0acc5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> @@ -17,6 +17,7 @@ / {
>  
>  	aliases {
>  		mmc0 = &sdhci;
> +		mmc1 = &sdmmc;
>  	};
>  
>  	chosen {
> @@ -108,6 +109,18 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
>  	};
> +
> +	vccio_sd: regulator-vccio-sd {
> +		compatible = "regulator-gpio";
> +		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
> +		regulator-name = "vccio_sd";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		states = <1800000 0x0>, <3300000 0x1>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
>  };
>  
>  &pinctrl {
> @@ -130,6 +143,12 @@ wan_led_g: wan-led-g {
>  			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
> +
> +	sdmmc {
> +		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
> +			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
>  };
>  
>  &saradc {
> @@ -148,6 +167,17 @@ &sdhci {
>  	status = "okay";
>  };
>  
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vccio_sd>;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0m0_xfer>;


