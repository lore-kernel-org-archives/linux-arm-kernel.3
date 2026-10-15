Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA614CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 02:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Q9/yr+TPrZ6trPCN3xo/GTUlhJ2HoDaO0szPFT8tS0=; b=HFhLIeS08CqctQZyKWQ25OSCvx
	zFMNIQtW1WIihRogfulAeCpvT04v8/Yj8+8KL4xOgrT58/ozSKc7EB698mfKoD8MI0ic2ymrEKXKe
	pK2Xu+M8eKrGQFPERqKFtVdCVAkxN79PiwV0PnMgkaOWuYrO8udF5focUfDT3I+76G9uc2xyfcOfB
	WeUk8WEVv4ZTjzSzoQYhmy8MiNNYoqD7qQL3oaaVfbU2WWkoKars3IsruoRxZ62bdsxIUPtuyW3V4
	lPw7BVZekvAxq+Q2fnFeZGyTRHnwsNNptMoynpVpi9D84szcbM1/D3uJrlx27+gvbgjTTu6U0NY2A
	S6ozxG6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBGs-0000000GfuV-1BHz;
	Thu, 15 Oct 2026 02:32:42 +0000
Received: from mail-m6022.netease.com ([210.79.60.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBGp-0000000Gftu-1mVy;
	Thu, 15 Oct 2026 02:32:41 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5119304ec;
	Thu, 15 Oct 2026 10:32:35 +0800 (GMT+08:00)
Message-ID: <d18f064d-ea3f-45f5-bc86-9318b01f2c92@rock-chips.com>
Date: Thu, 15 Oct 2026 10:32:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Diederik de Haas <diederik@cknow-tech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 5/9] arm64: dts: rockchip: rk3588s-nanopi: rename sd power
 pin
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-5-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-5-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d67807003a4kunme8fbb20b3a2d11
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkMfVhlLQ0IdSkNLS0xKQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Kc+EvEOdkG3sp/Iyjk30XHZnUqUXMQ2l8FGE01zFv08pi04kby72Zsf9lhf0w5gQc5lL6ESz7unzSqAsfC+rYC2Aho9VQF6+p5zgKR6zpz5kiwm1gNVUR3dSolVnQ/exu7p/y1rTSm+flZ21jxPA98QG/SwnOyJd+HCBM+zhU1w=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=4Q9/yr+TPrZ6trPCN3xo/GTUlhJ2HoDaO0szPFT8tS0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_193239_718248_7108314D 
X-CRM114-Status: GOOD (  11.61  )
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

在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> sdmmc_pwren matches the signal name in the schematics, which simplifies
> cross-referencing.
> 

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index a99e2e60c5f7..1d37862edb5b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -66,7 +66,7 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
>   		enable-active-high;
>   		gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
> -		pinctrl-0 = <&sd_s0_pwr>;
> +		pinctrl-0 = <&sdmmc_pwren>;
>   		regulator-name = "vcc_3v3_sd_s0";
>   		regulator-boot-on;
>   		regulator-max-microvolt = <3300000>;
> @@ -334,7 +334,7 @@ sdmmc_det_pin: sdmmc-det-pin {
>   			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
>   		};
>   
> -		sd_s0_pwr: sd-s0-pwr {
> +		sdmmc_pwren: sdmmc-pwren {
>   			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
>   		};
>   	};
> 


