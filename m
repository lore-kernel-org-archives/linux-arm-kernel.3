Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045F9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jH8n5W9FtQCucqwn7kk9UM2XjlBjxjzZZRg7DH4uLLE=; b=GZwrJxbwi6kIZPGs75GeBY5l6V
	xcbEocUCayc+Ult7LGb2JmXAmPkaOlNUBNpZ8YbYIESF9fCoVdwyyZJ3fIaSTUsdLiCaRBJHnMccV
	e+8L+EYziRyBg8o/ShY1B83FLw8CxTfMEAs25vpvm4JnOgECRhmXYLDURpeGy/6s6Hwo/wQbYxmI0
	oAa09v0sb+qiUlC0r5lvKqCEBhkgnz3YIvhY2z1rKOanW33CZWJh5cfJ2+gBtvNKPm2xrPVL3MqkS
	mwOSGxj0421z3CjGC5MgleS4f3Z8CrxodGrjXsQzctyFsuEvOHCKhSuvW76WZfkJY5jjhlIDUK4zK
	CmXABgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F4v-00000005Hap-17Ot;
	Tue, 08 Apr 2025 19:57:49 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dmq-0000000581Z-42BK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1744137304;
 bh=jH8n5W9FtQCucqwn7kk9UM2XjlBjxjzZZRg7DH4uLLE=;
 b=RRKCebzvsbPX9fHfzNTftIi9IH9dwcTc+BkdQP6UTOO2H7D1dRHjomDNCOlH9kaG5/9QRfhkZ
 uRUjXaAPYHwxrLuYf+lUEctidfsjHVGNTj2danpqXLbiPrhnEF+Atq1ln85w90tLdn4003W9tKn
 aS4pWb6CDMqr0oHgHtn9InC5ejK2ETZ2weC1UhntdHAxIm4ed3GVAXsy+DdmyvoXnHX+6nIhAfF
 sqaOSU5zmX7QzThZTUpV0gKGsw5oQ2A3QBBiSFKpEG4fhwbzV5G99p4T0lrycxWuKaPfFFYeEhS
 67BG4ElgJo5liZgPP6CslGx6aH8broHFSzwHlgBJO8IQ==
X-Forward-Email-ID: 67f56c38b078e0f2662e7659
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.1
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <c73a32b0-cc58-4d07-a0e5-719e5434adc3@kwiboo.se>
Date: Tue, 8 Apr 2025 20:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Niklas Cassel <cassel@kernel.org>, Alexey Charkov <alchark@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
 <20250325213303.826925-7-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250325213303.826925-7-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_113505_040729_4FA757AC 
X-CRM114-Status: GOOD (  15.09  )
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

Hi Detlev,

On 2025-03-25 22:22, Detlev Casanova wrote:
> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index c3abdfb04f8f4..636c287b94e0a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1237,6 +1237,70 @@ vepu121_3_mmu: iommu@fdbac800 {
>  		#iommu-cells = <0>;
>  	};
>  
> +	vdec0: video-decoder@fdc38000 {

All other Rockchip decoder/encoder nodes use the video-codec nodename,
e.g. see the av1d related node below. Is there any special reason why
this cannot follow that pattern for nodename consistency?

This was something I tried to bring up in v3 [1], however only the reg
range part was addressed in v4.

My main concern is that I want to send an updated U-Boot RK3582 support
series [2][3] that will need to mark one or both of the two rkvdec cores
as status=fail depending on a value in OTP. This is done in a DT fixup
and uses the nodename for simplicity.

[1] https://lore.kernel.org/r/311770c3-d3ea-4650-ae11-7c278e043d0a@kwiboo.se/
[2] https://patchwork.ozlabs.org/patch/2020972/
[3] https://github.com/Kwiboo/u-boot-rockchip/commit/0d748524aa67ce0debdb87c6e4a0df0f041b1618

> +		compatible = "rockchip,rk3588-vdec";
> +		reg = <0x0 0xfdc38000 0x0 0x100>,
> +		      <0x0 0xfdc38100 0x0 0x500>,
> +		      <0x0 0xfdc38600 0x0 0x100>;
> +		reg-names = "link", "function", "cache";
> +		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
> +			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
> +				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
> +		assigned-clock-rates = <800000000>, <600000000>,
> +				       <600000000>, <1000000000>;
> +		iommus = <&vdec0_mmu>;
> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> +		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDEC0_CA>,
> +			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
> +		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		sram = <&vdec0_sram>;
> +	};
> +
> +	vdec0_mmu: iommu@fdc38700 {
> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdc38700 0x0 0x40>, <0x0 0xfdc38740 0x0 0x40>;
> +		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
> +		clock-names = "aclk", "iface";
> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> +		#iommu-cells = <0>;
> +	};
> +
> +	vdec1: video-decoder@fdc40000 {

Same here :)

Regards,
Jonas

> +		compatible = "rockchip,rk3588-vdec";
> +		reg = <0x0 0xfdc40000 0x0 0x100>,
> +		      <0x0 0xfdc40100 0x0 0x500>,
> +		      <0x0 0xfdc40600 0x0 0x100>;
> +		reg-names = "link", "function", "cache";
> +		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
> +			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;
> +		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru CLK_RKVDEC1_CORE>,
> +				  <&cru CLK_RKVDEC1_CA>, <&cru CLK_RKVDEC1_HEVC_CA>;
> +		assigned-clock-rates = <800000000>, <600000000>,
> +				       <600000000>, <1000000000>;
> +		iommus = <&vdec1_mmu>;
> +		power-domains = <&power RK3588_PD_RKVDEC1>;
> +		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, <&cru SRST_RKVDEC1_CA>,
> +			 <&cru SRST_RKVDEC1_CORE>, <&cru SRST_RKVDEC1_HEVC_CA>;
> +		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
> +		sram = <&vdec1_sram>;
> +	};
> +
> +	vdec1_mmu: iommu@fdc40700 {
> +		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg = <0x0 0xfdc40700 0x0 0x40>, <0x0 0xfdc40740 0x0 0x40>;
> +		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
> +		clock-names = "aclk", "iface";
> +		power-domains = <&power RK3588_PD_RKVDEC0>;
> +		#iommu-cells = <0>;
> +	};
> +
>  	av1d: video-codec@fdc70000 {
>  		compatible = "rockchip,rk3588-av1-vpu";
>  		reg = <0x0 0xfdc70000 0x0 0x800>;
> @@ -2883,6 +2947,16 @@ system_sram2: sram@ff001000 {
>  		ranges = <0x0 0x0 0xff001000 0xef000>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> +
> +		vdec0_sram: codec-sram@0 {
> +			reg = <0x0 0x78000>;
> +			pool;
> +		};
> +
> +		vdec1_sram: codec-sram@78000 {
> +			reg = <0x78000 0x77000>;
> +			pool;
> +		};
>  	};
>  
>  	pinctrl: pinctrl {


