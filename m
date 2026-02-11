Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C7FE9E310
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cbYuRDQwymK6OOU58iBAkyi1AjdH/qPbmtobJhA14U=; b=1MT+sl93G8vkX7xceMkgEhp/v9
	Vl7Tn4Gwsod/ynzG+FDhNyY6t4aK4Ac9ADTcNMed2HdBMMMV2i8gHumjn5vnHrSluNMTLJDjtRiOi
	xIBJvWR+3113knLe8FTeNANqYXF4KJVMo6nx8F9tgEnP2geuTRc5l0TupMvrR+CN0TrWLVhQWGqzZ
	IJTwP/YauFskfxaqaNY0i+Tq7NIgpMUgAFAoBfZMGeeyaHtUyX2nM0PcEO8ILV7dUL/B+JnPti6l7
	D5PxOGAa3A+ZLkV8g31iLFW4q++zTswz7fgWk6u5edHx+PEXcSkCiVqt9ssLAX68TlRP9X59loO18
	+aJeyXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB9F-00000000jFD-16MN;
	Wed, 11 Feb 2026 14:24:57 +0000
Received: from mail-m49238.qiye.163.com ([45.254.49.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqB9C-00000000jET-1Gfn;
	Wed, 11 Feb 2026 14:24:55 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33e12f735;
	Wed, 11 Feb 2026 22:24:51 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, quentin.schulz@cherry.de,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: use gated-fixed-clock for
 pcie-refclk on rk3588-tiger
To: Heiko Stuebner <heiko@sntech.de>
References: <20260210080303.680403-1-heiko@sntech.de>
 <20260210080303.680403-3-heiko@sntech.de>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <e82bd097-3f66-ea31-9dce-77e806174763@rock-chips.com>
Date: Wed, 11 Feb 2026 22:24:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260210080303.680403-3-heiko@sntech.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c4d172f9709cckunm937070351137e9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxlCS1ZPHksdS0pJSElOTElWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XXEaKLkWVXFuigclxFWuBXetqB9jU7Iis9D+Z2ZK2gvCJLZCcyAcRUZoH4jIvMhWqEzslLTkTVkWBdU8HuJHHg+8Y3No4gustF4ZZY/bWMoSnz+GcSPg1ItD0/sQWj8cSv3K1CK7V9j4vuLGzAE9lE9HrVSG5aH7RIlNV1AIIz0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=1cbYuRDQwymK6OOU58iBAkyi1AjdH/qPbmtobJhA14U=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_062454_534400_4551D6DB 
X-CRM114-Status: GOOD (  20.06  )
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

在 2026/02/10 星期二 16:03, Heiko Stuebner 写道:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Using a combination of fixed clock and gpio-gate clock works but does
> not describe the actual hardware. Use the gated-fixed-clock binding
> to describe this in a nicer way.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   .../arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
> index 27269b7b08aa..b4b8f305935f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
> @@ -47,23 +47,14 @@ led-1 {
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
>   		enable-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* PCIE30X4_CLKREQN_M1_L */

The change itself looks fine , so
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

However, if it's designed as active high, I would say Tiger is against
the the PCIe spec about how L1 substate work. Perhaps you could check
PCIe spec v7.0, Figure 5-16 Example: L1.2 Waveforms Illustrating
Upstream Port Initiated Exit.. When in L1.2, clkreq# should be released
by both ends, and the pull-up register by whatevery way will make it
into high, and thus refclk is gated automatically.


> +		vdd-supply = <&vcca_3v3_s0>;
>   	};
>   
>   	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> 

