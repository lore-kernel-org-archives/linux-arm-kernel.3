Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF6EC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHHPd1ro8iADnAWUL5QzffNz8eOjElZ+QHGtSyc8BcU=; b=ozQtoQc9wtPBX6xf7d9UxYiKo6
	T+08qEUtuV3uJSm77xvY4kPyX947hp/pWAuLNgpsxfvRcKXlPZFLFiLRjIk+JeQ1hrxx3bAGF1VfL
	BFDOO1WKgDFJ5jRxnAIAnv8aY/2aQq0br2REE/iWHnHM+0PxBTEfBxpyl+NfPO6KtDoxbBGBEa3OE
	vWTJP07ZdmHXftLjYEs70OuGzp3qQb8v3DLowHGEPwktLnBgrbFCNfZdDxUc7gEM6kZldphq+il3O
	rGQfFuFAwILXf1VfPam9Ck+nGf6WxZ+ePi5iaREzeMepv6rvqJZN2QdkITsLdK//+NAYDMNjoYRi+
	4Lk5AW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcyk-00000002557-3Ddg;
	Mon, 23 Jun 2025 08:56:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTceB-0000000217q-0Jve;
	Mon, 23 Jun 2025 08:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667721;
	bh=47EqE7bU1EPZXo/pjpY2FIwSnKhw6fXy7NDRDFk7+i8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cDPA0C7Fwu1zSbSbKN6+YeyJ4ftsnw094NVThPnQOfnjq0UHZHC6wSM/Xl+jk7uct
	 upVXYPCwrYn4q/AlcmHCYvJPHZs9QgIMvjnq1hXuXUStPv5Ot0OMw+RrGWQixzP6m1
	 UvRv6+iiT5rCMw7RiDDLiIxqBOPDV/CbW28cLAUNzK5+iZr1KtzPRWHQgdB1T0iF1s
	 5IiUEiE2v1JVo21plMvLDw5KIHgpG/+wNjuXe9H2hS9cFmM+kdd/KSKhxg9IE4/dEz
	 wPodhUPTHknLwzQcWPuHXBfoqIfagzS2nPp/L/N23jxpc6sTkzmi6EJxGAtDLttVMF
	 pmi48CZbLnNPA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C25AF17E159C;
	Mon, 23 Jun 2025 10:35:20 +0200 (CEST)
Message-ID: <94fd71e6-0f09-42d0-94ef-1ff111daac9f@collabora.com>
Date: Mon, 23 Jun 2025 10:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] ARM: dts: mediatek: add basic support for MT6572
 SoC
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-9-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-9-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013523_277533_234E1874 
X-CRM114-Status: GOOD (  16.79  )
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

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add basic support for the MediaTek MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>   arch/arm/boot/dts/mediatek/mt6572.dtsi | 105 +++++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..dd12231ca745be7455e99391abd2d708f2f1a8a9
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Max Shevchenko <wctrl@proton.me>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "mediatek,mt6572";
> +	interrupt-parent = <&sysirq>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		enable-method = "mediatek,mt6589-smp";
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +		};
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x1>;
> +		};
> +	};
> +
> +	system_clk: dummy13m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <13000000>;
> +		#clock-cells = <0>;
> +	};
> +
> +	rtc_clk: dummy32k {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32000>;
> +		#clock-cells = <0>;
> +	};
> +
> +	uart_clk: dummy26m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <26000000>;
> +		#clock-cells = <0>;
> +	};
> +

Anything that has an MMIO address shall be child of "soc".

soc {
	watchdog@....

	timer@....

	etc.
};

> +	watchdog: watchdog@10007000 {
> +		compatible = "mediatek,mt6572-wdt",
> +			     "mediatek,mt6589-wdt";

those fit in one line:

compatible = "mediatek,mt6572-wdt", "mediatek,mt6589-wdt";

> +		reg = <0x10007000 0x100>;
> +		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
> +		timeout-sec = <15>;
> +		#reset-cells = <1>;
> +	};
> +
> +	timer: timer@10008000 {
> +		compatible = "mediatek,mt6572-timer",
> +			     "mediatek,mt6577-timer";

same

> +		reg = <0x10008000 0x80>;
> +		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&system_clk>, <&rtc_clk>;
> +		clock-names = "system-clk", "rtc-clk";
> +	};
> +
> +	sysirq: interrupt-controller@10200100 {
> +		compatible = "mediatek,mt6572-sysirq",
> +			     "mediatek,mt6577-sysirq";

same; and reg goes after compatible.

> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&gic>;

are you sure that interrupt-parent is gic?

> +		reg = <0x10200100 0x1c>;
> +	};
> +
> +	gic: interrupt-controller@10211000 {
> +		compatible = "arm,cortex-a7-gic";

reg here.


> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&gic>;

are you sure that the interrupt parent isn't sysirq here? :-)

> +		reg = <0x10211000 0x1000>,
> +		      <0x10212000 0x2000>,
> +		      <0x10214000 0x2000>,
> +		      <0x10216000 0x2000>;
> +	};
> +
> +	uart0: serial@11005000 {
> +		compatible = "mediatek,mt6572-uart",
> +			     "mediatek,mt6577-uart";

fits in one line

> +		reg = <0x11005000 0x400>;
> +		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&uart_clk>;

clock-names = .....

> +		status = "disabled";
> +	};
> +
> +	uart1: serial@11006000 {
> +		compatible = "mediatek,mt6572-uart",

...again.

> +			     "mediatek,mt6577-uart";
> +		reg = <0x11006000 0x400>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&uart_clk>;
> +		status = "disabled";
> +	};
> +};
> 

Cheers,
Angelo

