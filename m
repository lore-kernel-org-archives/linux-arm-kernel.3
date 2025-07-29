Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD26BC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BddgZihFUFAjsrCi2y4RE93LpDykX88yB4HjnBosqY=; b=iUaewNQdgK5vXOTYquMgdaNBnh
	HCfxBYJ39FYp8EkwAzIiuyprT2u1t6CMLfWdOPpomojCxJDXUFibO8mpcTr/eyF1Qelbvs9qw+yU5
	9Xa5Is+sX2Lm3IVJ3CAF/LZAmS02N3OwM5vjtjJCrNAeuG2DyvK0u9tRi01Rd6ZpFFZ835ZNhiupG
	ek6ygGd+56sOGGiq7VyxUAgbwbFTu909H5sDCyKBh1axGnok7f8yWWpkf5wbfaq9JKTS+0QbRbl8U
	RbdZNZeMcqbN5rW3+4KUjAS1Qb75oHEsn1/FZjTB0dS4W+LUPEO8Jy+aNk8YQsES+61Bgdjh9o3Kq
	d4M72elQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpmm-0000000HXaR-3kES;
	Tue, 29 Jul 2025 19:14:52 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpiO-0000000HXFJ-3kes;
	Tue, 29 Jul 2025 19:10:22 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1753816216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7BddgZihFUFAjsrCi2y4RE93LpDykX88yB4HjnBosqY=;
	b=LCQ0Lvu1ttFZ5yJFAlgeHXqd0KrgYOWBtaoOltBY1vy8HCJa4TsO26JiMfZzcpfYRefy5J
	pGlnvO1Jt6RftJdu/6AMaj+7lx/5GImaZvTRZs2jBzDSSfJVUjYSfR5L5ChK3J8JtsSRZc
	6RH+3/QTM3v+EI+NJkZSKxUl1y7giKPxVoZw05mI/BRu0MY0k+FjqkPPZWROlirfX4BF7M
	XzfYD3VHjO3+thnRy1YyHXXNAHTbp9hA8aNoC3ZY3ZevWVsD+y0yEgJ2ZMrcsY8SWECWpF
	KvE74JpfHpG03XcijKMhJWy0G5Wub+LWlMY1ewwLFvqhW39rL37whxJsy6iLbQ==
Date: Tue, 29 Jul 2025 21:10:16 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Pinebook Pro: Update WiFi
In-Reply-To: <20250729185827.144547-1-pbrobinson@gmail.com>
References: <20250729185827.144547-1-pbrobinson@gmail.com>
Message-ID: <6948463c8ca90bd9c72fb34178ddb029@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_121021_154442_73D98E73 
X-CRM114-Status: GOOD (  14.96  )
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

Hello Peter,

On 2025-07-29 20:58, Peter Robinson wrote:
> Update the WiFi configuration to include the wake-up
> pin and add an ethernet alias to allow assignment of
> a mac-address from the firmware.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3399-pinebook-pro.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index 5a8551d9ffe47..05c48cb09df6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -19,6 +19,7 @@ / {
>  	chassis-type = "laptop";
> 
>  	aliases {
> +		ethernet0 = &brcmf;

I'm sorry, but this alias isn't acceptable.  In a few words, this
simply isn't an Ethernet interface.

We're already stretching a bit the dynamic nature of, well, everything
with the aliases in the Rockchip DT files, and an alias like this one
would be stretching the whole thing beyond the breaking point.

>  		mmc0 = &sdio0;
>  		mmc1 = &sdmmc;
>  		mmc2 = &sdhci;
> @@ -883,6 +884,12 @@ vcc5v0_host_en_pin: vcc5v0-host-en-pin {
>  		};
>  	};
> 
> +	wifi {
> +		wifi_host_wake_l: wifi-host-wake-l {
> +			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	wireless-bluetooth {
>  		bt_wake_pin: bt-wake-pin {
>  			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
> @@ -940,7 +947,19 @@ &sdio0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
>  	sd-uhs-sdr104;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  	status = "okay";
> +
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm4329-fmac";
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "host-wake";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_host_wake_l>;
> +	};
>  };
> 
>  &sdhci {

