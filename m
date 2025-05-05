Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB11BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 04:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4rp0/SxPnRxOKd8Baxv0WdngnSWxD3d0vtqD/ab/C8=; b=lLVzn+3fUVvCKvNpZpRdpJn/Wa
	hG+vS4kSWQjh6NlCpFQp8SaSopQ8I+79iLbQY6udQHNFZz9uK/JEAZ07qJcXiyiME3sIZJ7dS9LjM
	Pn84Vn15flt17JuXWKV9s4gUVDVRQOytQiLDPyi2MXZtUk9XmbId+4UgU93FhqZ28c84HGX3BwPJ/
	A95T2knBz4dIx+yDgsKjeOkZMSniXry7wdF8do2EwihMOEpjhr+gbEV8+UxLAT1DVV17mQG8PDGsw
	m5yOM2raFsKPNDDYgvcG+4wngJRAFSnD+UjmhuwTUYDx1gAUT3obuXz1ACEbq4XuOFCRQQRpzTFRi
	Kc5cFoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9aY-0000000A8YK-3gQ5;
	Tue, 06 May 2025 04:07:26 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4zF-00000008z1g-0oBN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746486755;
 bh=l4rp0/SxPnRxOKd8Baxv0WdngnSWxD3d0vtqD/ab/C8=;
 b=wedhzYrzbkh70a/oFfoYjJT/BX04p4ojymoailevpYZa5n3y7cceqVssizi/9zHBTow6tPAbg
 pgYcGoTuv8LHY9nKxWKPmFLQHscSUI8/s9T0BjPkEzU7jXGNZG/6yICmrsLVekeGolgPgPguYlD
 NDT1WM6n+dT/K16kXwgaEBJgCzT3LxWLc/A5P9BFa9Im9G7PyZD+eIAIWY/+6SBlSEWcZatXgCd
 uM6xy9RcaQwLH3/iXUxNUA6N4v4SREPRLTnLKfz19jhEU6yYfZDdeHsEt7NXQ78nVIfwNmqDKnC
 t8QFdIkvbYVCIhzsGpXD3VDz0hACXf+2uac9KNUdWCsA==
X-Forward-Email-ID: 681945da46c37f8647c22e2a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <4e00a764-23df-4bd9-85d3-f32cb153a9b6@kwiboo.se>
Date: Tue, 6 May 2025 01:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: rockchip: Add pwm nodes for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250401120020.976343-1-amadeus@jmu.edu.cn>
 <20250401120020.976343-2-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250401120020.976343-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_161237_594106_3AECDB7C 
X-CRM114-Status: GOOD (  13.91  )
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

On 2025-04-01 14:00, Chukun Pan wrote:
> Add pwm nodes for RK3528. The PWM core on RK3528 is the same as
> RK3328, but the driver does not support interrupts yet.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

pwm0-pwm2 has been verified working on my rk3528 boards and remaining
seem to be correct, I have also dropped my prior attempt of looking into
multi-channel handling as mentioned in v2, so this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 80 ++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 35704d0be37a..47d4f63f11d3 100644
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


