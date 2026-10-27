Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27049606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2b4BNsRU;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ejPHUn6R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kgs6DMIElefIDmmG0Lqe7pZUKcoCtWm8n8LIAs8gWNY=; b=2b4BNsRUcpDaYY
	LV6Es9nW0K1K+ebuhQI5EiJb4t3UFcGNLATfgxfGIRAvpceuzrpOo2ROqBeDTKQXn/fJYwzpWRl2I
	njdE+OvqGnynNsAEmR/Ui7oqB0Gy3fwd9IvlyHNJ4mK9ZwJNtA50nO0YlcjPzYrG6k/LNpkvFiLRU
	ryiNA8rzheSUi1Pq93w0swaZpkBeaT79f8qcDZgXRsL2RgbFkNCNSYWTu0ByB3AvnJsZiCrjf+RK8
	PAoFhOjnIu+chltc+Np7QXqjdljJCqkVrMRlNzD7N7YoCuE1OPyIX3IC9cn/GeQm1aff2sqlaaZb2
	AF+GEFkr9db6a7g/M6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhgw-00000004y3H-07B5;
	Tue, 27 Oct 2026 13:58:18 +0000
Received: from mail-m83249.xmail.ntesmail.com ([156.224.83.249])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhgr-00000004y21-4AI1;
	Tue, 27 Oct 2026 13:58:16 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5287e04b6;
	Tue, 27 Oct 2026 21:58:09 +0800 (GMT+08:00)
Message-ID: <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
Date: Tue, 27 Oct 2026 21:58:07 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sergey Bostandzhyan <jin@mediatomb.cc>,
 Jensen Huang <jensenhuang@friendlyarm.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S
 Plus
To: Deomid rojer Ryabkov <rojer@rojer.me>, Heiko Stuebner <heiko@sntech.de>
References: <20261023235959.2988087-1-rojer@rojer.me>
 <20261023235959.2988087-3-rojer@rojer.me>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261023235959.2988087-3-rojer@rojer.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17da7790103a4kunmcef2bd90e493
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkpCVktPHk1NTksZTUNNH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ejPHUn6RV6C6gpkCiecTD0LdymLzVdtND/i7tW+egwUwmUnVzgwg1PuoPjdEnE2WzH7LaBj1GyIIUE4DDgWf3rNIFIKLdN6tvHEb3Z+LKLFSWVwyWiCt/civ7J17a+XQ7mdCOCGie+xdPZJ8Pzv6aMTpvJfEauBvYDDLli8VQyI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=kgs6DMIElefIDmmG0Lqe7pZUKcoCtWm8n8LIAs8gWNY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_065814_326279_5B963267 
X-CRM114-Status: GOOD (  19.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Deomid

在 2026/10/24 星期六 7:59, Deomid rojer Ryabkov 写道:
> The NanoPi R2S Plus has an M.2 E-key slot wired to the sdmmc_ext
> controller in 4-bit SDIO mode, where FriendlyElec fit an optional
> Fn-Link 6222B-SRC (Realtek RTL8822CS) module:
> 
>    - SDIO signalling at a fixed 1.8V (VCC_18)
>    - WIFI_REG_ON on GPIO3_B0, 32kHz sleep clock from the RK805 CLKOUT2
> 
> Enable the controller and add the power sequence. The SDIO pins need
> 8mA drive strength for SDR104 tuning to succeed, as in the vendor
> device tree [1]; with the SoC default of 4mA no sample phase works.
> 
> On boards without the module the controller gives up after about 0.2s
> ("mmc2: Failed to initialize a non-removable card"); nothing else is
> affected.
> 
> With the mmc core change for the module's CMD11 handling at a fixed
> 1.8V [2], the module is tuned to SDR104 at 150 MHz and works with the
> rtw88_8822cs driver; without it, it runs in high-speed mode at 50 MHz.
> 
> [1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835bba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-rev24.dts#L144-L172
> [2] https://lore.kernel.org/linux-mmc/20261023232813.2983368-1-rojer@rojer.me/
> Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
> ---
>   .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> index 6ba4a74cb1f..db19a18ae45 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> @@ -17,6 +17,15 @@ / {
>   	aliases {
>   		mmc1 = &emmc;
>   	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rk805 1>;
> +		clock-names = "ext_clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_reg_on_h>;
> +		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> +	};
>   };
>   
>   &emmc {
> @@ -34,3 +43,50 @@ &io_domains {
>   	vccio4-supply = <&vcc_io_33>;
>   	vccio6-supply = <&vcc_18>;
>   };
> +
> +&pinctrl {
> +	wifi {
> +		wifi_reg_on_h: wifi-reg-on-h {
> +			rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +/*
> + * SDR104 tuning fails with the default 4mA drive strength, use 8mA like the
> + * vendor device tree.
> + */
> +&sdmmc0ext_bus4 {
> +	rockchip,pins =
> +		<3 RK_PA4 3 &pcfg_pull_up_8ma>,
> +		<3 RK_PA5 3 &pcfg_pull_up_8ma>,
> +		<3 RK_PA6 3 &pcfg_pull_up_8ma>,
> +		<3 RK_PA7 3 &pcfg_pull_up_8ma>;
> +};
> +
> +&sdmmc0ext_clk {
> +	rockchip,pins = <3 RK_PA2 3 &pcfg_pull_none_8ma>;
> +};
> +
> +&sdmmc0ext_cmd {
> +	rockchip,pins = <3 RK_PA0 3 &pcfg_pull_up_8ma>;
> +};
> +
> +/* Optional M.2 E-key SDIO Wi-Fi module (Fn-Link 6222B-SRC, RTL8822CS) */
> +&sdmmc_ext {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	disable-wp;

Drop disable-wp.

Otherwise,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc0ext_clk &sdmmc0ext_cmd &sdmmc0ext_bus4>;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_io_33>;
> +	vqmmc-supply = <&vcc_18>;
> +	status = "okay";
> +};


