Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB15FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mCWNbcP5IQDd/FsJf4daDu5xuhSLsVfWH9gMluMv00=; b=xs/yKN5fbN+k1jO2w1zRgr4oaU
	V2iq2z/WG8RlwzEKunT+Bjq5+Xg1wa/TLffaQ/oHGnqXxqDJbud9AoXAJ0Nyhf5bkjZI535WKi8T6
	9xzC4k/y2S+bg6dcDjVFMEV0LopoCaeMRkM4OXFiz5enocoOLZNrylwFR0xAcJykeG68vkiSI+/17
	iFdEqGrzzztumGWUVoZqNHhQTlrT1/V4mMum7USiABSENKzZjgbFbvldbEvLsjM1MDtUEneCvuRaa
	Mnl5WD5LiU4/ShQTSD3b0mFACkP7JLWiuT5L0hnuIa9wsgUZca2uZmvEloGFO3t+kOIm3v/KkhfaC
	uPt3ga7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toMuc-0000000EKPQ-0Ygt;
	Sat, 01 Mar 2025 13:29:50 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toMSy-0000000DyF9-0oRu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 13:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1740834074;
 bh=9mCWNbcP5IQDd/FsJf4daDu5xuhSLsVfWH9gMluMv00=;
 b=weLrExoWL72K9p5bFJMPXLySLvsElVRUL8wrMkRaK145pcKTjerJ8zh35bHgoMnwl95XfueXR
 kAu7w+4oOgnS7WIc9LTo/mOQ54pv3uN6wC7vSnfZsPjTKOrhCbTvs/FB7/fpQETIYWGMib7Yrq2
 swV784/9lRimUWZJH/zs7jP+x2urWi2hJ/12gYh5MERvcEKP9MvNWCvwHBcJ9UVR/K8RfyV/QzZ
 vO1hunvAh/my8QD75BoMLohjg//hS/g/Tul4eBI7CC73fvRmYhza2bRs9v97vwKGZ4cBs17xe21
 aETKriUDC0dTTVAJyLnYfPox2V2X8xdeNqUvbW5S2HJQ==
X-Forward-Email-ID: 67c3051690cf55d47dbe9027
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <0aefd292-7980-434d-9c18-4ab9f6a0b40e@kwiboo.se>
Date: Sat, 1 Mar 2025 14:01:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
To: Yao Zi <ziyao@disroot.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Frank Wang <frank.wang@rock-chips.com>,
 Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104835.36439-1-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250301104835.36439-1-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_050116_333083_95225BBD 
X-CRM114-Status: GOOD (  14.44  )
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

Hi,

On 2025-03-01 11:48, Yao Zi wrote:
> SD-card is available on Radxa E20C board.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> index d2cdb63d4a9d..473065aa4228 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> @@ -12,6 +12,10 @@ / {
>  	model = "Radxa E20C";
>  	compatible = "radxa,e20c", "rockchip,rk3528";
>  
> +	aliases {
> +		mmc0 = &sdmmc;

Suggest using mmc1 for sd-card because the e20c typically have onboard
emmc, compared to removable sd-card.

> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:1500000n8";
>  	};
> @@ -20,3 +24,13 @@ chosen {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	rockchip,default-sample-phase = <90>;
> +	sd-uhs-sdr104;

Are you sure uhs-sdr104 works as is should? Vendor kernel use a
different "v2" tuning and this is also missing the vccio_sd vqmmc-supply
to switch between 3v3 and 1v8.

You could add following regulator for sdmmc:

	vccio_sd: regulator-vccio-sd {
		compatible = "regulator-gpio";
		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
		pinctrl-names = "default";
		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
		regulator-name = "vccio_sd";
		regulator-min-microvolt = <1800000>;
		regulator-max-microvolt = <3300000>;
		states = <1800000 0x0>, <3300000 0x1>;
	};

and following pinctrl:

	sdmmc {
		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
		};
	};

add then the power supplies to the sdmmc node:

	vmmc-supply = <&vcc_3v3>;
	vqmmc-supply = <&vccio_sd>;

That matches the schematics for e20c, and works when testing non-uhs modes.

Regards,
Jonas

> +	status = "okay";
> +};


