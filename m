Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3363606AA11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dhjdOlUr;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=LlERGqcA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sKuXSxiqi1dS1S7ydoFnufGpBsXCwFdivhOS6O9PI0Q=; b=dhjdOlUrf55ETP
	4IxsP/t6++8Stu1miGqGUmkqLXYo23bBLAIrx+7c4Dh6Yj9LCHYjt2WdFG6EsjsZu+hLVTDjeCGf/
	UwOT7w3/8c63i5+6znfEEsrtXoEUXVniimEaXdufhk1dCkI1A1dJbLfR3+uVIvt9KcAUsHw1QWC49
	PFLPjdB0WNyudv6vJUlX9uYCIHEZi7P7zHYOQKAIGcojSW9PBobbNZ3M2qRBW4a7ukQPTrhkDIf/G
	0zKAQSMNfwfrfobf7UdxcQDX7LSj7dqzAbRFzQzuIGYTAJowJUsKuv2EbcCDDX33OORxdpg6B5CLj
	5HfYWtCrJEYQLhtAMYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLheG-00000004xkJ-22st;
	Tue, 27 Oct 2026 13:55:32 +0000
Received: from mail-m6024.netease.com ([210.79.60.24])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLheD-00000004xjX-1gUG;
	Tue, 27 Oct 2026 13:55:31 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5287e03cc;
	Tue, 27 Oct 2026 21:55:24 +0800 (GMT+08:00)
Message-ID: <e028ba53-0c69-4ba6-9b16-8648b8a787b2@rock-chips.com>
Date: Tue, 27 Oct 2026 21:55:22 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5
To: Leonard Lausen <leonard@lausen.nl>, Heiko Stuebner <heiko@sntech.de>
References: <20261025205339.14539-2-leonard@lausen.nl>
 <4b7bd146-93fd-41f8-ad3c-88333adc73b4@rock-chips.com>
 <20261026070821.324094-1-leonard@lausen.nl>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261026070821.324094-1-leonard@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17da4f44003a4kunm3406670ee05a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTU9DVk4YTBhKTkhJGU5NTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=LlERGqcAe2bas/HHj75UcJ6kYuXtp/j0l7/rh2iyqk7G2g1/8yVarOz7tD22gByc7xjkOtWLDDS+4EMGxkNI73csTgnliUtpV013dicn+DZ32rh6yHSS/g7GVzF9sGqKu77sBdOlG6MLZg6pxtcinaB3yD27pEXwyMmei+TYBBk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=sKuXSxiqi1dS1S7ydoFnufGpBsXCwFdivhOS6O9PI0Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_065529_735600_21D89DDB 
X-CRM114-Status: GOOD (  21.10  )
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

Hi Leonard,

在 2026/10/26 星期一 15:06, Leonard Lausen 写道:
> The NanoPi M5 has an M.2 E-key slot for SDIO Wi-Fi modules such as the
> RTL8822CS-based AC200. The SDIO controller is disabled and the module's
> power sequence is not described, preventing the card from enumerating.
> 

I suspect RTL8822CS doesn't work as-is, unless you need to apply it[1].
Please double check it.

[1] 
https://lore.kernel.org/linux-mmc/20261027122417.954133-1-rojer@rojer.me/T/#t

> Enable the controller in four-bit SDR104 mode and connect its 3.3 V card
> and 1.8 V I/O supplies. Describe the active-low reset on GPIO1_C2, the
> 200 ms power-on delay used by the vendor device tree, and the external
> 32.768 kHz clock from the HYM8563 RTC. Keep the card powered during
> suspend as required by the rtw88 SDIO driver.
> 
> The SDIO wiring and reset timing are based on FriendlyElec's NanoPi M5
> vendor device tree by jensen <jensenhuang@friendlyarm.com>.
> 
> Link: https://github.com/friendlyarm/kernel-rockchip/commit/6f07f3e0b7ec54be90ae30f097d2a9d5aea80974
> Assisted-by: LLM
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> ---
> Hi Shawn,
> 
>> disable-wp is for sd cards, please drop it.
> 
> Thank you. Dropped it from the SDIO controller in v2.
> This was mistakenly copied from vendor source.
> 
> Changes in v2:
> - Drop disable-wp from the SDIO controller (Shawn Lin).
> - Credit the original vendor source and document AI assistance.
> 
> AI assistance was used to inspect the vendor DTS and schematics, draft
> the DTS changes and commit message, and run build/style checks.
> 
>   .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> index 3a305408fa16c..baf1dea2cfa98 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> @@ -23,6 +23,7 @@ aliases {
>   		ethernet0 = &gmac0;
>   		ethernet1 = &gmac1;
>   		mmc0 = &sdmmc;
> +		mmc1 = &sdio;
>   	};
>   
>   	chosen {
> @@ -212,6 +213,16 @@ vcc_3v3_s0: regulator-vcc-3v3-s0 {
>   		vin-supply = <&vcc_3v3_s3>;
>   	};
>   
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&hym8563>;
> +		clock-names = "ext_clock";
> +		pinctrl-0 = <&wifi_reg_on_h>;
> +		pinctrl-names = "default";
> +		post-power-on-delay-ms = <200>;
> +		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> +	};
> +
>   	sound {
>   		compatible = "simple-audio-card";
>   		pinctrl-names = "default";
> @@ -855,6 +866,12 @@ pcie0_perstn: pcie0-perstn {
>   		};
>   	};
>   
> +	sdio-pwrseq {
> +		wifi_reg_on_h: wifi-reg-on-h {
> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>   	sdmmc {
>   		sdmmc0_pwren_h: sdmmc0-pwren-h {
>   			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;
> @@ -890,6 +907,22 @@ &saradc {
>   	status = "okay";
>   };
>   
> +&sdio {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3_s3>;
> +	vqmmc-supply = <&vcc_1v8_s3>;
> +
> +	status = "okay";
> +};
> +
>   &sdmmc {
>   	bus-width = <4>;
>   	cap-sd-highspeed;
> 
> base-commit: ae965b9856f033145e292b0c29082a26bcc45efd


