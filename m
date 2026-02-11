Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C9AE9E310
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AutWd/q6ZaqPhu5uFw1JelIb15wNEG20TmOwXpnuti8=; b=xDrUTPgcdWpG+6MM7gcqF62VFK
	zOwYlpenGFHByqM5NCzgRGSFikRdAhn8zvZy8a8lgEW0S0AXIxJoS1uAfpa52B54ungEeTA61PDlR
	gKhvWqdOpylK3of+JrpQYrH4eC4LImR46I/UMIPvawzFMfXTMdDM2UC5aXV48lIxrLAEGiVbtFL/C
	rvyic8gS+YDp9p0fVZqYGBHlUaUdeiJBfTEiNDDrqaLQ2+btKAANTalCYXJ+uUavOWSBDst9idtmu
	P6J0nACQ6UJ/K28CUJDsaDMglyetlZXG2zozdRlJGxBBjDH6Va2b49kVoqsBoOW/H/o+8UsTCZ2/7
	3pesXxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB5B-00000000ire-3Vfz;
	Wed, 11 Feb 2026 14:20:45 +0000
Received: from mail-m155100.qiye.163.com ([101.71.155.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB57-00000000iqr-2sj8;
	Wed, 11 Feb 2026 14:20:44 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33e0ed73f;
	Wed, 11 Feb 2026 22:20:36 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, quentin.schulz@cherry.de,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 1/4] arm64: dts: rockchip: use gated-fixed-clock for
 pcie-refclk on rk3588-jaguar
To: Heiko Stuebner <heiko@sntech.de>
References: <20260210080303.680403-1-heiko@sntech.de>
 <20260210080303.680403-2-heiko@sntech.de>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <35e97a41-b88b-f526-351f-d4c5f70ee4e9@rock-chips.com>
Date: Wed, 11 Feb 2026 22:20:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260210080303.680403-2-heiko@sntech.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c4d134d3309cckunm6558f76d1130b4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9MH1YfT09OHk5PTEtOQ0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Jd/D6SqqvQ/D2crUTb0SspbNzDIKFiut0E+3WDbA/abOzfoUi9CbOdqOOIJbwKw6vfJUSXZQ38LibqNUbdgvQBdoZQdCWiDXH4agJO9R3b6QO90bSoYksEH3U3qdC0lpopMq++iBnFNaRR0kfPmQTxH2zmipkJyvNkYqCozK6/o=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=AutWd/q6ZaqPhu5uFw1JelIb15wNEG20TmOwXpnuti8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_062043_104627_B936B669 
X-CRM114-Status: GOOD (  18.47  )
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

Hi Heiko

在 2026/02/10 星期二 16:02, Heiko Stuebner 写道:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Using a combination of fixed clock and gpio-gate clock works but does
> not describe the actual hardware. Use the gated-fixed-clock binding
> to describe this in a nicer way.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> index 952affaf455c..e21ad7575cb6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> @@ -86,25 +86,16 @@ led-1 {
>   		};
>   	};
>   
> -	/*
> -	 * 100MHz reference clock for PCIe peripherals from PI6C557-05BLE
> -	 * clock generator.
> -	 * The clock output is gated via the OE pin on the clock generator.
> -	 * This is modeled as a fixed-clock plus a gpio-gate-clock.
> -	 */
> -	pcie_refclk_gen: pcie-refclk-gen-clock {
> -		compatible = "fixed-clock";
> +	/* 100MHz PCIe reference clock from PI6C557-05BLE */
> +	pcie_refclk: pcie-clock-generator {
> +		compatible = "gated-fixed-clock";
>   		#clock-cells = <0>;
>   		clock-frequency = <100000000>;
> -	};
> -
> -	pcie_refclk: pcie-refclk-clock {
> -		compatible = "gpio-gate-clock";
> -		clocks = <&pcie_refclk_gen>;
> -		#clock-cells = <0>;
> +		clock-output-names = "pcie-refclk-clock";
>   		enable-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_LOW>; /* PCIE30X4_CLKREQN_M0 */
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pcie30x4_clkreqn_m0>;

This looks fine,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>


> +		vdd-supply = <&vcca_3v3_s0>;
>   	};
>   
>   	pps {
> 

