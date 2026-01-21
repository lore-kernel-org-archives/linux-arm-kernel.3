Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C7ED2629F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=px66oAjk4XaqMxJ6LP/bn8wEYOzMSxyTszaBJt3RpgU=; b=iULRWEfJRBVAObmk+VGeEmbN/T
	EzMJn/E5vSoAn+rYH8z65piQjIOScUQd5AgKJuO7WOlfoHKU2f6SAQ2auxTpeQ6laIQIAEwjOfV5Y
	hmxxKfwxRGZ0SxlXtqZOKMUjk/UTp9CP5WXNBSR3ZljN8CxAXNQf6Q7KLRB/8D7G0jTQeyqqC7WX1
	cLccg89GAlpcV6TMO444X23LBM6U50b4Su6gnIeQFj8QeNAKKvePMjiq3S6m5LMcyUlrNFM0rdnLV
	Q7IyxPej2ayKFyK7Asz1eNYl8Z3EmzqWhFm+iuA7BPT/j8865rJ//2qTg//8R1sDkFf1J0ul12IFP
	NkMHnuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNfH-00000004kxJ-29S3;
	Wed, 21 Jan 2026 02:09:47 +0000
Received: from mail-m81244.xmail.ntesmail.com ([156.224.81.244])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNfE-00000004kwn-092x;
	Wed, 21 Jan 2026 02:09:46 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3160079c9;
	Wed, 21 Jan 2026 10:09:36 +0800 (GMT+08:00)
Message-ID: <07082578-f56a-4ad2-9ea0-a4ef20a86cfe@rock-chips.com>
Date: Wed, 21 Jan 2026 10:09:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jonas Karlman <jonas@kwiboo.se>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Hsun Lai <i@chainsx.cn>,
 John Clark <inindev@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>
References: <20260121015357.291-1-kernel@airkyi.com>
 <20260121015357.291-3-kernel@airkyi.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260121015357.291-3-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bde507f6a09cckunm61165221ae686c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ08eHVZCSRlLT01LTUoeSBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=OTnBNxqLyT/ATGNdjWCVeQIbbGmNGD7G2Ag2Ri6UofQbwdtTkPS4Zr3WTt/ADmgt3INO+I0u/ui36nmRIORe5sDY3KtB3nBbGrFJRMP5ssqP23UuNzAa/k/bgDT5u+rIUl+6rHblHuYH/D4F/2Lae628Bq6b6Yo/ynvPGPHzKyE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=px66oAjk4XaqMxJ6LP/bn8wEYOzMSxyTszaBJt3RpgU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_180944_684097_BF6F5521 
X-CRM114-Status: GOOD (  10.29  )
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

在 2026/01/21 星期三 9:53, Chaoyi Chen 写道:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> General features for rk3576 evb2 board:
>      - Rockchip RK3576
>      - LPDDR4/4X
>      - eMMC5.1
>      - RK806-2x2pcs + DiscretePower
>      - 1x HDMI2.1 TX / HDMI2.0 RX
>      - 1x full size DP1.4 TX (Only 2 Lanes)
>      - 2x 10/100/1000M Ethernet
>      - 5x SATA3.0 7Pin Slot
>      - 2x USB3.2 Gen1 Host
>      - 3x USB2.0 Host
>      - WIFI/BT
>      - ...
> 
> Tested with eMMC/SDMMC/HDMI/USB/Ethernet/WIFI/BT module.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Reviewed-by: Alexey Charkov <alchark@gmail.com>
> ---

---8<----

> +
> +&sdio {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	disable-wp;

disable-wp is not used for SDIO case, could be removed.


> +	keep-power-in-suspend;
> +	max-frequency = <150000000>;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	no-sd;
> +	no-mmc;
> +	non-removable;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc1m0_bus4 &sdmmc1m0_clk &sdmmc1m0_cmd>;
> +	sd-uhs-sdr104;
> +	status = "okay";
> +
> +	brcmf: wifi@1 {
> +		compatible = "brcm,bcm4329-fmac";
> +		reg = <1>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "host-wake";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_host_wake>;
> +	};
> +};
> +
> +&sdhci {
> +	bus-width = <8>;
> +	full-pwr-cycle-in-suspend;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	no-sdio;
> +	no-mmc;
> +	sd-uhs-sdr104;
> +	vqmmc-supply = <&vccio_sd_s0>;

Should use vmmc-supply to contrl the power, the same as EVB1[1].

[1] 
https://lore.kernel.org/linux-rockchip/1768524932-163929-5-git-send-email-shawn.lin@rock-chips.com/T/#u

> +	status = "okay";
> +};
> +
> +&u2phy0 {
> +	status = "okay";
> +};
> +



