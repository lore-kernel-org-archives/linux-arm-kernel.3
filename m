Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A87D0C603
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 12:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiEbeXrF1xLa07UyUPfrEoMrHTfNNUY8ubPAgOBPaBM=; b=SbrVPko9R08tbh/OoMm4luOYmz
	4yINko8lr42bwxerUQMeuBL4xLHLPLQX6v3mbJ5bURdsa7Uwx98lHxvlMGpaOqQI9hjcqNHvAXQnZ
	Pe0QulZcKUcGgNJMCpXfIchsFmQlYxERxYaRGBV9VkQL30a7pqdGwSpPHAIBlJYx2JWE+fT9qUMdN
	KjuW43qmEAPbvv8kHiRLOWw8syQWasHCXEykodQHKTQohr9McVCGCqfG/fSVqLgbMxSX9FH4DZUHZ
	wvdOYr9n8YI7jt3vHSOTuJjaw4sVPz5BG+pcxEy6gSNgrJHmTUK3W2xUminOEeCyQbH8JqMLhhtYc
	SxCoti7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JRX-00000003eUM-2xN5;
	Fri, 25 Oct 2024 12:29:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JPw-00000003eGN-1Sb9;
	Fri, 25 Oct 2024 12:27:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AF6C339;
	Fri, 25 Oct 2024 05:28:17 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADC9A3F71E;
	Fri, 25 Oct 2024 05:27:42 -0700 (PDT)
Date: Fri, 25 Oct 2024 13:27:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Parthiban <parthiban@linumiz.com>, Yangtao
 Li <frank@allwinnertech.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Vinod Koul <vkoul@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Shuosheng Huang <huangshuosheng@allwinnertech.com>
Subject: Re: [PATCH 13/13] arm64: dts: allwinner: a100: Add CPU Operating
 Performance Points table
Message-ID: <20241025132739.3d0f116d@donnerap.manchester.arm.com>
In-Reply-To: <20241024170540.2721307-14-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
	<20241024170540.2721307-14-masterr3c0rd@epochal.quest>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_052748_535059_0DBCF661 
X-CRM114-Status: GOOD (  19.70  )
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

On Thu, 24 Oct 2024 14:05:31 -0300
Cody Eksal <masterr3c0rd@epochal.quest> wrote:

> From: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> 
> Add an Operating Performance Points table for the CPU cores to
> enable Dynamic Voltage & Frequency Scaling on the A100.
> 
> Signed-off-by: Shuosheng Huang <huangshuosheng@allwinnertech.com>
> [masterr3c0rd@epochal.quest: fix typos in -cpu-opp, use compatible]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  .../allwinner/sun50i-a100-allwinner-perf1.dts |  5 ++
>  .../dts/allwinner/sun50i-a100-cpu-opp.dtsi    | 90 +++++++++++++++++++
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  8 ++
>  3 files changed, 103 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> index 29e9d24da8b6..99b1b2f7b92a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include "sun50i-a100.dtsi"
> +#include "sun50i-a100-cpu-opp.dtsi"
>  
>  #include <dt-bindings/gpio/gpio.h>
>  
> @@ -67,6 +68,10 @@ &usb_otg {
>  	status = "okay";
>  };
>  
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
>  &pio {
>  	vcc-pb-supply = <&reg_dcdc1>;
>  	vcc-pc-supply = <&reg_eldo1>;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi
> new file mode 100644
> index 000000000000..eeb8d20f3fb4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2020 Yangtao Li <frank@allwinnertech.com>
> +// Copyright (c) 2020 ShuoSheng Huang <huangshuosheng@allwinnertech.com>
> +
> +/ {
> +	cpu_opp_table: cpu-opp-table {
> +		compatible = "allwinner,sun50i-a100-operating-points";
> +		nvmem-cells = <&cpu_speed_grade>;
> +		opp-shared;
> +
> +		opp@408000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-hz = /bits/ 64 <408000000>;
> +
> +			opp-microvolt-speed0 = <900000 900000 1200000>;
> +			opp-microvolt-speed1 = <900000 900000 1200000>;
> +			opp-microvolt-speed2 = <900000 900000 1200000>;

Is there actually an advantage when using the three cells version?
I wonder if we should go with just the target voltage (the first cell
here), as done for the H616.

Apart from that it looks fine to me.

Cheers,
Andre.

> +		};
> +
> +		opp@600000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-hz = /bits/ 64 <600000000>;
> +
> +			opp-microvolt-speed0 = <900000 900000 1200000>;
> +			opp-microvolt-speed1 = <900000 900000 1200000>;
> +			opp-microvolt-speed2 = <900000 900000 1200000>;
> +		};
> +
> +		opp@816000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-hz = /bits/ 64 <816000000>;
> +
> +			opp-microvolt-speed0 = <940000 940000 1200000>;
> +			opp-microvolt-speed1 = <900000 900000 1200000>;
> +			opp-microvolt-speed2 = <900000 900000 1200000>;
> +		};
> +
> +		opp@1080000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-hz = /bits/ 64 <1080000000>;
> +
> +			opp-microvolt-speed0 = <1020000 1020000 1200000>;
> +			opp-microvolt-speed1 = <980000 980000 1200000>;
> +			opp-microvolt-speed2 = <950000 950000 1200000>;
> +		};
> +
> +		opp@1200000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-hz = /bits/ 64 <1200000000>;
> +
> +			opp-microvolt-speed0 = <1100000 1100000 1200000>;
> +			opp-microvolt-speed1 = <1020000 1020000 1200000>;
> +			opp-microvolt-speed2 = <1000000 1000000 1200000>;
> +		};
> +
> +		opp@1320000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-hz = /bits/ 64 <1320000000>;
> +
> +			opp-microvolt-speed0 = <1160000 1160000 1200000>;
> +			opp-microvolt-speed1 = <1060000 1060000 1200000>;
> +			opp-microvolt-speed2 = <1030000 1030000 1200000>;
> +		};
> +
> +		opp@1464000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +			opp-hz = /bits/ 64 <1464000000>;
> +
> +			opp-microvolt-speed0 = <1180000 1180000 1200000>;
> +			opp-microvolt-speed1 = <1180000 1180000 1200000>;
> +			opp-microvolt-speed2 = <1130000 1130000 1200000>;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&cpu1 {
> +	operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&cpu2 {
> +	operating-points-v2 = <&cpu_opp_table>;
> +};
> +
> +&cpu3 {
> +	operating-points-v2 = <&cpu_opp_table>;
> +};
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index 6dca766ea222..747a0292ef98 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -23,6 +23,7 @@ cpu0: cpu@0 {
>  			device_type = "cpu";
>  			reg = <0x0>;
>  			enable-method = "psci";
> +			clocks = <&ccu CLK_CPUX>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -30,6 +31,7 @@ cpu1: cpu@1 {
>  			device_type = "cpu";
>  			reg = <0x1>;
>  			enable-method = "psci";
> +			clocks = <&ccu CLK_CPUX>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -37,6 +39,7 @@ cpu2: cpu@2 {
>  			device_type = "cpu";
>  			reg = <0x2>;
>  			enable-method = "psci";
> +			clocks = <&ccu CLK_CPUX>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -44,6 +47,7 @@ cpu3: cpu@3 {
>  			device_type = "cpu";
>  			reg = <0x3>;
>  			enable-method = "psci";
> +			clocks = <&ccu CLK_CPUX>;
>  		};
>  	};
>  
> @@ -142,6 +146,10 @@ efuse@3006000 {
>  			ths_calibration: calib@14 {
>  				reg = <0x14 8>;
>  			};
> +
> +			cpu_speed_grade: cpu-speed-grade@1c {
> +				reg = <0x1c 0x2>;
> +			};
>  		};
>  
>  		watchdog@30090a0 {


