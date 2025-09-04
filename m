Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C9CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uF4m/pRRU4rgRt7tXnCtpn8VYgPl9axTqJo4BB655os=; b=VGHbtz+HUFdDUVBh8enoFYr1Xz
	jwMWsLb+S8GugA8idMoFnDRi/bVur0OuUk+TI+Y/OZfNoi8JNT7ruNOQ5gLr3PhPRaAxi2PnXKdRl
	AlBW3Kh8dhR7kHRkzb0z1hdLNXqIIu+JLVs8qGOPo8iNAgF84AHOZip4gNlGCuYW4Ul7HR8z3w+0W
	u+dM+g6Ir925aNxNeScQkdcTqTRXIb+wyFEt5aZkAlWvWbh0iU7PDyJGLUAbkIpHG0RzFRowA6b8p
	AlNgnop9csRbfopdNtjyfh5uKIUu2L5td/2aEG/OGvb5NmlXU+NhKS6zLD2wHMJFhiOGyA2UHoJN7
	+yWP7mfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6r2-0000000Al5y-0nfy;
	Thu, 04 Sep 2025 10:06:08 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5mb-0000000AOdW-2iKs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:57:31 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5848vKau3472912;
	Thu, 4 Sep 2025 03:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756976240;
	bh=uF4m/pRRU4rgRt7tXnCtpn8VYgPl9axTqJo4BB655os=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JZxGE2UBN40dWWYuDmfX2FMeRszsL4a7bvGt7TEhMXmCCHwYjN8WkLUZC0Nl8do7C
	 vkSvHNg5bkVnCHd/DMKtwrMrLFq3xXWEnWD+Emu44QX7Cro4DUhm7eNrSVVNFg8K3m
	 GOzORqTCUFmXIrpiXg1HAODHPx4WgDrzpblcQdt0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5848vKSn749886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 03:57:20 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 03:57:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 03:57:20 -0500
Received: from [172.24.20.139] (lt5cd2489kgj.dhcp.ti.com [172.24.20.139])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5848vFWj3006227;
	Thu, 4 Sep 2025 03:57:15 -0500
Message-ID: <b946af38-abf9-4b34-bf44-3ba9bc64bff7@ti.com>
Date: Thu, 4 Sep 2025 14:27:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: k3-pinctrl: Add the remaining
 macros
To: Akashdeep Kaur <a-kaur@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>
References: <20250902071917.1616729-1-a-kaur@ti.com>
 <20250902071917.1616729-4-a-kaur@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250902071917.1616729-4-a-kaur@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_015729_779551_F7A53B80 
X-CRM114-Status: GOOD (  19.48  )
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

Hello Akashdeep,

On 9/2/2025 12:49 PM, Akashdeep Kaur wrote:
> Add the drive stregth, schmitt trigger enable macros to pinctrl file.
> Add the missing macros for DeepSleep configuration control referenced
> from "Table 14-6172. Description Of The Pad Configuration Register Bits"
> in AM625 TRM[0].
> Add some DeepSleep macros to provide combinations that can be used
> directly in device tree files example PIN_DS_OUTPUT_LOW that
> configures pin to be output and also sets its value to 0.
>
> [0] https://www.ti.com/lit/ug/spruiv7b/spruiv7b.pdf
>
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-pinctrl.h | 55 +++++++++++++++++++++++++++--
>   1 file changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index c0f09be8d3f9..39aad59075d1 100644
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

referring to above TRM mentioned in commit message

Bit 20-19 are for DRV_STR, and description says

0 - Default
1 - Reserved
2 - Reserved
3 - Reserved

Not sure, is there some additional document to be referred for 
PIN_DRIVE_STRENGTH


> +#define DS_ISO_OVERRIDE_SHIFT   (22)
> +#define DS_ISO_BYPASS_EN_SHIFT  (23)

Please follow same convention as for rest of bit fields

DS_ISO_OVERRIDE_SHIFT  to ISO_OVR_SHIFT and
DS_ISO_BYPASS_EN_SHIFT to ISO_BYP_SHIFT



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
> @@ -33,6 +39,26 @@
>   #define INPUT_EN		(1 << RXACTIVE_SHIFT)
>   #define INPUT_DISABLE		(0 << RXACTIVE_SHIFT)
>   
> +#define DS_PULL_DISABLE         (1 << DS_PULLUD_EN_SHIFT)
> +#define DS_PULL_ENABLE          (0 << DS_PULLUD_EN_SHIFT)

what is purpose of shifting zero,


> +
> +#define DS_PULL_UP              (1 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
> +#define DS_PULL_DOWN            (0 << DS_PULLTYPE_SEL_SHIFT | DS_PULL_ENABLE)
> +
> +#define DS_INPUT_EN             (1 << DS_OUT_DIS_SHIFT)
> +#define DS_INPUT_DISABLE        (0 << DS_OUT_DIS_SHIFT)
> +
> +#define DS_OUT_VALUE_ZERO       (0 << DS_OUT_VAL_SHIFT)
> +#define DS_OUT_VALUE_ONE        (1 << DS_OUT_VAL_SHIFT)
> +
> +#define WKUP_ENABLE             (1 << WKUP_EN_SHIFT)
> +#define WKUP_ON_LEVEL           (1 << WKUP_LVL_EN_SHIFT)
> +#define WKUP_ON_EDGE            (0 << WKUP_LVL_EN_SHIFT)
> +#define WKUP_LEVEL_LOW          (0 << WKUP_LVL_POL_SHIFT)
> +#define WKUP_LEVEL_HIGH         (1 << WKUP_LVL_POL_SHIFT)
> +
> +#define WKUP_DISABLE            (0 << WKUP_EN_SHIFT)
> +
>   /* Only these macros are expected be used directly in device tree files */
>   #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
>   #define PIN_OUTPUT_PULLUP	(INPUT_DISABLE | PULL_UP)
> @@ -53,18 +79,41 @@
>   #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
>   #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
>   
> +#define PIN_DRIVE_STRENGTH_NOMINAL      (0 << DRV_STR_SHIFT)
> +#define PIN_DRIVE_STRENGTH_SLOW         (1 << DRV_STR_SHIFT)
> +#define PIN_DRIVE_STRENGTH_FAST         (2 << DRV_STR_SHIFT)
> +
> +#define PIN_SCHMITT_TRIGGER_DISABLE	(0 << ST_EN_SHIFT)
> +#define PIN_SCHMITT_TRIGGER_ENABLE	(1 << ST_EN_SHIFT)
> +
>   #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
>   #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
>   #define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
>   #define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
> -#define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
> -#define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
> +#define PIN_DS_OUT_ENABLE		DS_INPUT_DISABLE
> +#define PIN_DS_OUT_DISABLE		DS_INPUT_EN
>   #define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)
>   #define PIN_DS_OUT_VALUE_ONE		(1 << DS_OUT_VAL_SHIFT)
>   #define PIN_DS_PULLUD_ENABLE		(0 << DS_PULLUD_EN_SHIFT)
>   #define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
>   #define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
>   #define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
> +#define PIN_DS_ISO_BYPASS               (1 << DS_ISO_BYPASS_EN_SHIFT)
> +#define PIN_DS_ISO_BYPASS_DISABLE       (0 << DS_ISO_BYPASS_EN_SHIFT)
> +
> +#define DS_STATE_VAL                    (1 << DS_EN_SHIFT)
> +#define ACTIVE_STATE_VAL                (0 << DS_EN_SHIFT)
> +

Please do not mix PIN_x #define with other internal defines


> +#define PIN_DS_OUTPUT_LOW               (DS_STATE_VAL | DS_INPUT_DISABLE | DS_OUT_VALUE_ZERO)
> +#define PIN_DS_OUTPUT_HIGH              (DS_STATE_VAL | DS_INPUT_DISABLE | DS_OUT_VALUE_ONE)
> +#define PIN_DS_INPUT                    (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_DISABLE)
> +#define PIN_DS_INPUT_PULLUP             (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_UP)
> +#define PIN_DS_INPUT_PULLDOWN           (DS_STATE_VAL | DS_INPUT_EN | DS_PULL_DOWN)
> +
> +#define PIN_WKUP_EN_EDGE                (WKUP_ENABLE | WKUP_ON_EDGE)
> +#define PIN_WKUP_EN_LEVEL_LOW           (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_LOW)
> +#define PIN_WKUP_EN_LEVEL_HIGH          (WKUP_ENABLE | WKUP_ON_LEVEL | WKUP_LEVEL_HIGH)
> +#define PIN_WKUP_EN                     WKUP_EN_EDGE

what is difference between PIN_WKUP_EN_EDGE and PIN_WKUP_EN


>   
>   /* Default mux configuration for gpio-ranges to use with pinctrl */
>   #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)

