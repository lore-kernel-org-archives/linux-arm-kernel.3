Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E239E9E30D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxmu4o5Owrd/s+GWT59foXAajtPwkD1n1OFz15Tl5zM=; b=fvNaaeiXTXjBKvJasZD0V5IF6r
	EX8nncR0bUpWxIQXpqjdg7HuLo7ZSiGGNEMkdVt5lD7vq9dmthutPi8eWfYBkYqEyKhfF0KKqvnM+
	PxULEdjAWtGKz9DBmlk8XjRCpMXTBCk/CRC4XVmyt5joDktqVP5rlKT/IBWNPc8vZaPG33KS2yj3j
	5yAzjWffCVPBaSfk/wYYzS7eQxEb0UgA+7sAKnETcY4yCLBFHxTCaPHT4MCyvRz7Uz+/BGdpkP36+
	jLKB5ao2CCttuV4HpyIx9ydqVD0iAwlwps1kTLBOo2au+UEO2f2Y1L4wJcIgAQ+RwGjR7uWAm/eOT
	kauj5OQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBFJ-00000000jXA-1nPR;
	Wed, 11 Feb 2026 14:31:13 +0000
Received: from mail-m3285.qiye.163.com ([220.197.32.85])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBFF-00000000jWX-13Yn;
	Wed, 11 Feb 2026 14:31:11 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33e12f8f4;
	Wed, 11 Feb 2026 22:31:04 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, quentin.schulz@cherry.de,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Make Jaguar PCIe-refclk pin
 use pull-up config
To: Heiko Stuebner <heiko@sntech.de>
References: <20260210080303.680403-1-heiko@sntech.de>
 <20260210080303.680403-5-heiko@sntech.de>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <21f56816-e616-f353-c945-dd49cf34b0cf@rock-chips.com>
Date: Wed, 11 Feb 2026 22:31:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260210080303.680403-5-heiko@sntech.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c4d1ce25909cckunm430335901141a9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhgeH1YeGBpIQ0hITBhMS0pWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Wc4O1Dxp4Am6HwCKvaxUnxCsPZcq7kUgtEBK5kUUS9IKC4eAkZHNw3pePazHGC0zOfw/Ciwy6AIKvjBqHSI5FQTUDlaAZFtIlMJTei4XHQwqBOCeJHFXXIDYD9uy8oTOmimcRT0vWC+/ToBGxHC+tVTI6k7zSjA3dYQAzjqhVsI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hxmu4o5Owrd/s+GWT59foXAajtPwkD1n1OFz15Tl5zM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_063109_832837_072939DA 
X-CRM114-Status: GOOD (  19.92  )
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
> Different to RK3588-Tiger, on RK3588-Jaguar the signal enabling the
> PCIe-refclk generator controls a transistor which in turn controls the
> output-enable input of the PI6C557 and there's no external Pull-Up or
> Pull-Down between the SoC and the transistor gate.
> 
> On Tiger the pin is directly connected to the PDn input which has an
> internal pull up.
> 
> So match that behaviour on Jaguar by changing the pin config to enable
> the SoC's pull-up config.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Fixes: 0ec7e1096332 ("arm64: dts: rockchip: add PCIe3 support on rk3588-jaguar")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> index e21ad7575cb6..5f5d89a33a4a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> @@ -579,7 +579,7 @@ led1_pin: led1-pin {
>   
>   	pcie30x4 {
>   		pcie30x4_clkreqn_m0: pcie30x4-clkreqn-m0 {
> -			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> +			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;

If Jaguar need support L1 substate, I guess it should be changed to
fucntion IO again instead of GPIO. From the refclk design which uses
pcie30x4_clkreqn_m0 as enable control in active low mode , it's fine to
support these low power mode.

Otherwise, fine with me

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

>   		};
>   
>   		pcie30x4_perstn_m0: pcie30x4-perstn-m0 {
> 

