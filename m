Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD64C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrgmGOqT4SYp6oYqC9q8SeHubNvt4veSSI8b49RyuaU=; b=VOVT0tclcgdmhKFlCcXB257XOp
	wrEAy/E0XXPi8jNcnKoQx//aRNkE3WQztdh15DdjU0lycPa0opdZgGChgQwhL7i776+nlV0l52b5O
	KcIRAJGR+4vwvI7wN7Un70r/hThKlCYB80WCVUZLyxn5Ef/mVq80Yv1o4EZBe2/DRtMBEOelCVG1d
	6QuEKvX+d5jNwjnd4lMiHjWtw5jZi3ZckFAQL4UFMF+GQuevtt7GI6xCuzRiI/JT9i8INsWF5lx8W
	DhvpH7jiNPCBSPa4FHeKE0neYcv/wg8iprd+0aFoJvwI/ZcNaRANc+veKfcPU9r0Qalq5OjEsIp+2
	Y2rn15Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2pU-0000000ASLy-0DhE;
	Wed, 19 Mar 2025 23:28:08 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2nm-0000000ARuw-3gHV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 23:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742426781;
 bh=YrgmGOqT4SYp6oYqC9q8SeHubNvt4veSSI8b49RyuaU=;
 b=Htlfh8ndxv72DrbXARpyX/+zi/yA9S7LZSJ16/rEFpr5aRG+7PBo+Uz63JFhdm+uJFOM42hzI
 qbHNwIktllZzFsGUFCDCoqW4canshAJzqxTHl/HrouBjNWXfOeJ+kqvgrejdf/+igSig34lpJZC
 DY28/iSmQaxOw6AMvA9ZBH/7kh6aZ1Sv88w1EnRrd4WMx1aoZMXbt1/FGNwoUhzJxsrzjX5cApo
 81DczL2nR3VaSIGooiNeEZR3/xs3DVxVwMJtNjhpFF1e8oeDKq2CwNZOidCoI0vdEFkNZxjD4a3
 KQlZoRUQObHBBCI8wYWSyFFhrnaBcZ/BOCffzt7Y1/rg==
X-Forward-Email-ID: 67db529a27ee59b783a86f48
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <0d638134-0c0d-4918-af47-e23d2ead3bf3@kwiboo.se>
Date: Thu, 20 Mar 2025 00:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Add pwm nodes for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250318120003.2340652-1-amadeus@jmu.edu.cn>
 <20250318120003.2340652-2-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250318120003.2340652-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_162623_020593_C5B37E73 
X-CRM114-Status: GOOD (  16.64  )
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

Hi Chukun,

On 2025-03-18 13:00, Chukun Pan wrote:
> Add pwm nodes for RK3528. The PWM core on RK3528 is the same as
> RK3328, but the driver does not support interrupts yet.

The device tree should describe the hardware, not what the driver
support, so interrupts should probably be included.

However, looking closer at TRM for i.e. RK3328, RK3568 and RK3588 it
look like the following description is not a true description of the
hardware.

Each PWM controller seem to support 4 channels, here (and for older RK
SoCs) we instead describe each channel and not the controller.

Maybe something like following would better represent the hardware:

	pwm0: pwm@ffa90000 {
		compatible = "rockchip,rk3528-pwm";
		reg = <0x0 0xffa90000 0x0 0x10000>;
		clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
		clock-names = "pwm", "pclk";
		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
	};

	pwm1: pwm@ffa98000 {
		compatible = "rockchip,rk3528-pwm";
		reg = <0x0 0xffa98000 0x0 0x10000>;
		clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
		clock-names = "pwm", "pclk";
		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
	};

Regards,
Jonas

> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 80 ++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 1af0d036cf32..621fc19ac0b3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -465,6 +465,86 @@ uart7: serial@ffa28000 {
>  			status = "disabled";
>  		};
>  
> +		pwm0: pwm@ffa90000 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa90000 0x0 0x10>;
> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm1: pwm@ffa90010 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa90010 0x0 0x10>;
> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2: pwm@ffa90020 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa90020 0x0 0x10>;
> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm3: pwm@ffa90030 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa90030 0x0 0x10>;
> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm4: pwm@ffa98000 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa98000 0x0 0x10>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm5: pwm@ffa98010 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa98010 0x0 0x10>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm6: pwm@ffa98020 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa98020 0x0 0x10>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm7: pwm@ffa98030 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa98030 0x0 0x10>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		saradc: adc@ffae0000 {
>  			compatible = "rockchip,rk3528-saradc";
>  			reg = <0x0 0xffae0000 0x0 0x10000>;


