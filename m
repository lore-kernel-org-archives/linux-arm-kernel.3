Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C99C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fhjx6pxvag6i+ct5LgrY68O1Q0Fj9xs6220lz64mf6E=; b=SKqOkbeIdU3WEhJ2GhY4hG4cMG
	2v9z7OBDZFjF7HNfoXFLsnIJayMFRn2BwtkRlRi833Hx5I0HJbn9nlaaTi8eDYFBApbpodgYZ9idx
	GMg6ETnmGaSOqnexeOVxzRV+Y2stRqLtOrUJpWj6XmfrgCJvyC5ARrmzEMZpqvRU4Ok/YResa4cej
	1JsdVW9ZIJkWSPDcxtNmVFCb3xwV6EFF+uSqqKr69q1cA7c/8cl/5obe/RT0yb0jGLh3zE2BhpErz
	g5EmtI3TkAPWwbzBMpA8u7vytZSI7GrG8H7I+rNqi6zgGdzMDin58PG7FeaFSOmM8kG8BjV2D/4Hd
	KCgYycjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqh3d-0000000FnLM-0D4s;
	Fri, 07 Mar 2025 23:24:45 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqh1z-0000000Fn1X-0fYz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 23:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741389781;
 bh=Fhjx6pxvag6i+ct5LgrY68O1Q0Fj9xs6220lz64mf6E=;
 b=ur8yO4HbFD/sPXeKXNW5cEH7I57uMF9amQliaKNfq13n9hQiQEl0EiR8/th+SuxDxkyduIeUY
 LDubE+MOtQRZ4C9HCN4DHqntr0yGfvClnhVMDLU8OFLOvYAr1sEncyrab/i69xgTE0uy+j9Ckp8
 GUUUzxY5Dl5KXC/GrAwMVMx9+q0/+n7BG8CnQwwd6uO+4/m6Pn4TgbJIu+86efow4CCFCmAlMpt
 V5Y95bdkWotbZtNZDdtAavlWlVKktbEAw3RTAHK5kALHTo9yQMZaosvjnBaN3hw5MJDSF0Lk/di
 j7PYyYMCCPgzg0Uqne1qhablgG6Dx/cdmZFnm+5XWkiA==
X-Forward-Email-ID: 67cb7fcd789af4fdcbb0e87f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <56181131-3e48-4c76-87c7-2388a9964727@kwiboo.se>
Date: Sat, 8 Mar 2025 00:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: rockchip: Add SDMMC/SDIO controllers
 for RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250305194217.47052-1-ziyao@disroot.org>
 <20250305194612.47171-1-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250305194612.47171-1-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_152303_603783_146C7F8C 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Yao Zi,

On 2025-03-05 20:46, Yao Zi wrote:
> RK3528 features two SDIO controllers and one SD/MMC controller, describe
> them in devicetree. Since their sample and drive clocks are located in
> the VO and VPU GRFs, corresponding syscons are added to make these
> clocks available.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 70 ++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index d3e2a64ff2d5..363023314e9c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -130,6 +130,16 @@ gic: interrupt-controller@fed01000 {
>  			#interrupt-cells = <3>;
>  		};
>  
> +		vpu_grf: syscon@ff340000 {
> +			compatible = "rockchip,rk3528-vpu-grf", "syscon";
> +			reg = <0x0 0xff340000 0x0 0x8000>;
> +		};
> +
> +		vo_grf: syscon@ff360000 {
> +			compatible = "rockchip,rk3528-vo-grf", "syscon";
> +			reg = <0x0 0xff360000 0x0 0x10000>;
> +		};
> +
>  		cru: clock-controller@ff4a0000 {
>  			compatible = "rockchip,rk3528-cru";
>  			reg = <0x0 0xff4a0000 0x0 0x30000>;
> @@ -274,6 +284,66 @@ saradc: adc@ffae0000 {
>  			resets = <&cru SRST_P_SARADC>;
>  			reset-names = "saradc-apb";
>  			#io-channel-cells = <1>;
> +		};

Look like this patch accidentally drops status = "disabled" from the
adc@ffae0000 node.

Regards,
Jonas

> +
> +		sdio0: mmc@ffc10000 {
> +			compatible = "rockchip,rk3528-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xffc10000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDIO0>,
> +				 <&cru CCLK_SRC_SDIO0>,
> +				 <&cru SCLK_SDIO0_DRV>,
> +				 <&cru SCLK_SDIO0_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <150000000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>,
> +				    <&sdio0_det>, <&sdio0_pwren>;
> +			resets = <&cru SRST_H_SDIO0>;
> +			reset-names = "reset";
> +			status = "disabled";
> +		};
> +
> +		sdio1: mmc@ffc20000 {
> +			compatible = "rockchip,rk3528-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xffc20000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDIO1>,
> +				 <&cru CCLK_SRC_SDIO1>,
> +				 <&cru SCLK_SDIO1_DRV>,
> +				 <&cru SCLK_SDIO1_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <150000000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sdio1_bus4>, <&sdio1_clk>, <&sdio1_cmd>,
> +				    <&sdio1_det>, <&sdio1_pwren>;
> +			resets = <&cru SRST_H_SDIO1>;
> +			reset-names = "reset";
> +			status = "disabled";
> +		};
> +
> +		sdmmc: mmc@ffc30000 {
> +			compatible = "rockchip,rk3528-dw-mshc",
> +				     "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0xffc30000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDMMC0>,
> +				 <&cru CCLK_SRC_SDMMC0>,
> +				 <&cru SCLK_SDMMC_DRV>,
> +				 <&cru SCLK_SDMMC_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <150000000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sdmmc_bus4>, <&sdmmc_clk>, <&sdmmc_cmd>,
> +				    <&sdmmc_det>;
> +			resets = <&cru SRST_H_SDMMC0>;
> +			reset-names = "reset";
> +			rockchip,default-sample-phase = <90>;
>  			status = "disabled";
>  		};
>  


