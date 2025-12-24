Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E0E75448
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/X96wez+QJLSUFa8Ti/phbtTKSRxMVMOGXkBSmbnwuY=; b=biUA9TTTR+Rq7Af9+Jfp4w1ZPF
	koYmNAxpDJ5EOwa3MCow61K1po62xDWCgyve7jUJh/4GGYQZj/6kOV5mxP1lRevz0J0hmhcFSb2Ag
	TUdmGXikUBbLrl65h6vSE7czxfQVhLIqMsRFwiUqLlqLuLkGoAWrD9PeLq0axe2mhqMa2zbuPJtL7
	F+K8C1wFllceS2EwIae2Sw+Q3YkxPrzVlovOyhU/zdzLXx8wAu46v1k3qusmp3BWh1YjxxBnnf2B+
	jl/lKEq9U88PD+FJAVxvth/CgQHnskfidVfW4Kp9zsRK51ySsGh1LzafgfZHPsgjZB6frxDPFdNDX
	dkDkp5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNWv-0000000GmF9-3AZt;
	Wed, 24 Dec 2025 11:59:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNWr-0000000GmEc-2sLR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:59:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F028339;
	Wed, 24 Dec 2025 03:59:37 -0800 (PST)
Received: from [10.57.11.204] (unknown [10.57.11.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07F833F5A1;
	Wed, 24 Dec 2025 03:59:42 -0800 (PST)
Message-ID: <161e78f7-1c87-4bd8-9184-f2044e7383a8@arm.com>
Date: Wed, 24 Dec 2025 11:59:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: arm: Use lowercase hex
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251223152457.155392-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223152457.155392-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20251223152457.155392-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_035945_879263_5ED38483 
X-CRM114-Status: GOOD (  11.27  )
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



On 23/12/2025 15:24, Krzysztof Kozlowski wrote:
> The DTS code coding style expects lowercase hex for values and unit
> addresses.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  arch/arm/boot/dts/arm/arm-realview-eb.dtsi    | 2 +-
>  arch/arm/boot/dts/arm/arm-realview-pb1176.dts | 2 +-
>  arch/arm/boot/dts/arm/arm-realview-pb11mp.dts | 2 +-
>  arch/arm/boot/dts/arm/arm-realview-pbx.dtsi   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
> index 16f784da5a55..ae370d4eb9d8 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
> +++ b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
> @@ -234,7 +234,7 @@ oscclk0: clock-controller@c {
>  				reg = <0x0c 0x04>;
>  				#clock-cells = <0>;
>  				lock-offset = <0x20>;
> -				vco-offset = <0x0C>;
> +				vco-offset = <0x0c>;
>  				clocks = <&xtal24mhz>;
>  			};
>  			oscclk1: clock-controller@10 {
> diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
> index b9b10cbd65aa..a75d8b107fe1 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
> +++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
> @@ -260,7 +260,7 @@ oscclk0: clock-controller@c {
>  				reg = <0x0c 0x04>;
>  				#clock-cells = <0>;
>  				lock-offset = <0x20>;
> -				vco-offset = <0x0C>;
> +				vco-offset = <0x0c>;
>  				clocks = <&xtal24mhz>;
>  			};
>  			oscclk1: clock-controller@10 {
> diff --git a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
> index db1b6793cd2c..59c78def83f2 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
> +++ b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
> @@ -343,7 +343,7 @@ oscclk0: clock-controller@c {
>  				reg = <0x0c 0x04>;
>  				#clock-cells = <0>;
>  				lock-offset = <0x20>;
> -				vco-offset = <0x0C>;
> +				vco-offset = <0x0c>;
>  				clocks = <&xtal24mhz>;
>  			};
>  			oscclk1: clock-controller@10 {
> diff --git a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
> index e625403a9456..0d3d96ffa6e6 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
> +++ b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
> @@ -256,7 +256,7 @@ oscclk0: clock-controller@c {
>  				reg = <0x0c 0x04>;
>  				#clock-cells = <0>;
>  				lock-offset = <0x20>;
> -				vco-offset = <0x0C>;
> +				vco-offset = <0x0c>;
>  				clocks = <&xtal24mhz>;
>  			};
>  			oscclk1: clock-controller@10 {

-- 
Regards,
Vincenzo


