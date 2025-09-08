Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80504CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6jA0maJ2/cbrQIjQjmb6P8Q2JEEnLmcjnUmsx4PEvs=; b=BtXcrgPh5c3ygJrlyap+p9cJRp
	s3SCnzrG3JYW6gKlVdlFLeG7SOtMIBm0xjkKPrS+Qgy6oTcniRsVwW+H7dZceCqpT9N8JUNa/Z422
	EfpU62vnEhfEzyxsecPQGDyooD2iKL1U9dwXvEfuaLZi/6/WfsrTjLbrGsHm+9G9/M/BmYj4g5D5j
	++TuZ2/slSI9OG3Y4FI/qBxJm7zG8TPEWmaueO6uj0Y69/16QgGEvuWWilwqinP8PqikuW82GvR76
	NqXZ7V5YDdFljMlUzAnKsdI42o2YqF5l1u71sW/VnpI61v4W1l9T6yvPt1cmeTFkPkY26cRg/6/s/
	OYBE6+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsE9-00000004sJ7-2ntY;
	Tue, 09 Sep 2025 06:53:17 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlNP-00000002yuI-3z8k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:34:25 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588NYKXA155036;
	Mon, 8 Sep 2025 18:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757374460;
	bh=f6jA0maJ2/cbrQIjQjmb6P8Q2JEEnLmcjnUmsx4PEvs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tRH5BmqremEApuhcHphQXzGzMOlMusbJ9G5UFMNuS+NOVnkwZsj9lltL2Z7UgvSz6
	 B8Vefl1L+hDK2V3JCL8C0SnhXuPttDwaI1T2E2X9G43eYXrfZBv8YhXvUNQsRaZytv
	 v53AHuyZ5EcGlXzbac72dQ8xkUb6dMmiqflwcd8w=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588NYKmx3294758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 18:34:20 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 18:34:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 18:34:19 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588NYJ5I1364923;
	Mon, 8 Sep 2025 18:34:19 -0500
Message-ID: <a89f9e4f-5306-4943-a70f-f6a60a4537d3@ti.com>
Date: Mon, 8 Sep 2025 18:34:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: ti: k3-pinctrl: Add the remaining
 macros
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <u-kumar1@ti.com>,
        <sebin.francis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250905051448.2836237-1-a-kaur@ti.com>
 <20250905051448.2836237-4-a-kaur@ti.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250905051448.2836237-4-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_163424_091365_B4843AFE 
X-CRM114-Status: GOOD (  21.96  )
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

On 9/5/25 00:14, Akashdeep Kaur wrote:
> Add the drive strength, schmitt trigger enable macros to pinctrl file.
> Add the missing macros for DeepSleep configuration control referenced
> from "Table 14-6172. Description Of The Pad Configuration Register Bits"

The Table number should be 14-8769 for the AM62P TRM.

> in AM625 TRM[0].

You should reference both the AM62X and AM62P TRMs because in the AM62P 
TRM the ISO_OVERRIDE_EN bit is reserved, whereas in the AM62X TRM it is 
defined.

> Add some DeepSleep macros to provide combinations that can be used
> directly in device tree files example PIN_DS_OUTPUT_LOW that
> configures pin to be output and also sets its value to 0.
> 
> [0] https://www.ti.com/lit/pdf/SPRUJ83
> 
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-pinctrl.h | 47 ++++++++++++++++++++++++++++-
>   1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index c0f09be8d3f9..8ce37ace94c9 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -3,15 +3,20 @@
>    * This header provides constants for pinctrl bindings for TI's K3 SoC
>    * family.
>    *
> - * Copyright (C) 2018-2024 Texas Instruments Incorporated - https://www.ti.com/
> + * Copyright (C) 2018-2025 Texas Instruments Incorporated - https://www.ti.com/
>    */
>   #ifndef DTS_ARM64_TI_K3_PINCTRL_H
>   #define DTS_ARM64_TI_K3_PINCTRL_H
>   
> +#define WKUP_LVL_EN_SHIFT       (7)
> +#define WKUP_LVL_POL_SHIFT      (8)
>   #define ST_EN_SHIFT		(14)
>   #define PULLUDEN_SHIFT		(16)
>   #define PULLTYPESEL_SHIFT	(17)
>   #define RXACTIVE_SHIFT		(18)
> +#define DRV_STR_SHIFT           (19)
> +#define ISO_OVERRIDE_EN_SHIFT   (22)
> +#define ISO_BYPASS_EN_SHIFT     (23)
>   #define DEBOUNCE_SHIFT		(11)
>   #define FORCE_DS_EN_SHIFT	(15)
>   #define DS_EN_SHIFT		(24)
> @@ -19,6 +24,7 @@
>   #define DS_OUT_VAL_SHIFT	(26)
>   #define DS_PULLUD_EN_SHIFT	(27)
>   #define DS_PULLTYPE_SEL_SHIFT	(28)
> +#define WKUP_EN_SHIFT           (29)
>   
>   /* Schmitt trigger configuration */
>   #define ST_DISABLE		(0 << ST_EN_SHIFT)
> @@ -33,6 +39,29 @@
>   #define INPUT_EN		(1 << RXACTIVE_SHIFT)
>   #define INPUT_DISABLE		(0 << RXACTIVE_SHIFT)
>   
> +#define DS_PULL_DISABLE         (1 << DS_PULLUD_EN_SHIFT)
> +#define DS_PULL_ENABLE          (0 << DS_PULLUD_EN_SHIFT)

nit: IMO either keep the format of these macros to ENABLE or EN unless 
there is a good reason to change the format.

> +
> +#define DS_PULL_UP              (1 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
> +#define DS_PULL_DOWN            (0 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
> +
> +#define DS_STATE_EN             (1 << DS_EN_SHIFT)
> +#define DS_STATE_DISABLE        (0 << DS_EN_SHIFT)

nit: Is there anyway this could be more descriptive? Like 
DS_IO_OVERRIDE_EN or DS_OVERRIDE_CTRL. It is hard to tell what these 
bits do unless you look at the TRM, whereas the other macros are easier 
to deduce their function.

> +
> +#define DS_INPUT_EN             (1 << DS_OUT_DIS_SHIFT | DS_STATE_EN)
> +#define DS_INPUT_DISABLE        (0 << DS_OUT_DIS_SHIFT | DS_STATE_EN)

By looking at the TRM it looks like this disables or enables output, not 
input. Shifting a 1 to DS_OUT_DIS_SHIFT should disable output.

> +
> +#define DS_OUT_VALUE_ZERO       (0 << DS_OUT_VAL_SHIFT)
> +#define DS_OUT_VALUE_ONE        (1 << DS_OUT_VAL_SHIFT)
> +
> +/* Configuration to enable wake-up on pin activity */
> +#define WKUP_ENABLE             (1 << WKUP_EN_SHIFT)
> +#define WKUP_DISABLE            (0 << WKUP_EN_SHIFT)
> +#define WKUP_ON_LEVEL           (1 << WKUP_LVL_EN_SHIFT)
> +#define WKUP_ON_EDGE            (0 << WKUP_LVL_EN_SHIFT)
> +#define WKUP_LEVEL_LOW          (0 << WKUP_LVL_POL_SHIFT)
> +#define WKUP_LEVEL_HIGH         (1 << WKUP_LVL_POL_SHIFT)
> +
>   /* Only these macros are expected be used directly in device tree files */
>   #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
>   #define PIN_OUTPUT_PULLUP	(INPUT_DISABLE | PULL_UP)
> @@ -53,6 +82,10 @@
>   #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
>   #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
>   
> +#define PIN_DRIVE_STRENGTH_NOMINAL      (0 << DRV_STR_SHIFT)
> +#define PIN_DRIVE_STRENGTH_SLOW         (1 << DRV_STR_SHIFT)

DRV_STR value of 1 is reserved in both AM62X and AM62P TRMs

> +#define PIN_DRIVE_STRENGTH_FAST         (2 << DRV_STR_SHIFT)
> +
>   #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
>   #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
>   #define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
> @@ -65,6 +98,18 @@
>   #define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
>   #define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
>   #define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
> +#define PIN_DS_ISO_BYPASS               (1 << ISO_BYPASS_EN_SHIFT)
> +#define PIN_DS_ISO_BYPASS_DISABLE       (0 << ISO_BYPASS_EN_SHIFT)
> +
> +#define PIN_DS_OUTPUT_LOW               (DS_INPUT_DISABLE | DS_OUT_VALUE_ZERO)
> +#define PIN_DS_OUTPUT_HIGH              (DS_INPUT_DISABLE | DS_OUT_VALUE_ONE)
> +#define PIN_DS_INPUT                    (DS_INPUT_EN | DS_PULL_DISABLE)
> +#define PIN_DS_INPUT_PULLUP             (DS_INPUT_EN | DS_PULL_UP)
> +#define PIN_DS_INPUT_PULLDOWN           (DS_INPUT_EN | DS_PULL_DOWN)
> +
> +#define PIN_WKUP_EN_LEVEL_LOW           (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_LOW)
> +#define PIN_WKUP_EN_LEVEL_HIGH          (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
> +#define PIN_WKUP_EN                     (WKUP_ENABLE | WKUP_ON_EDGE)
>   
>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>   #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)

Best,
Kendall


