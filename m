Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E82C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxCfzt0IyKcWsvhryWfiqWJy5Murn2xHrXnifltAL0U=; b=YoB2f/UlINtpaL5AeymvSzIgJE
	UwS1qbX15A4dwpsDAlbufFTmY9syo87AbCOAChebG6v0pI9Xlz9akNOEg2n3xIJL1qhtQoBtNC96g
	sW7nzbXERB0iZ5SGJL10w47a7B4dTgosBsJDLw85aBOfGiI5YHyh2AhwN/uCV6gAbjxzYqbDgBWJJ
	/T3ExybkyzQNKkWBIeOtU+wFhXzqB97IzArFtyQP+R/zCEyHiaTenG6ukWHfgnRpRVtXzypgNc1C3
	LvahvuyHc4zrWD6hgPWSPHHx1pTInHFAMm5le/KZJVoHx18YbLhwVQ7twoEKriV5dVuRMQHAmeYfH
	OWTzJLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOZM-00000001MB9-3Eto;
	Tue, 04 Feb 2025 19:26:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOLw-00000001KUL-2Hqr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:12:58 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7129B25A3E;
	Tue,  4 Feb 2025 20:12:53 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lB-3S3gQlaZ0; Tue,  4 Feb 2025 20:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738696369; bh=FCIkZ0zHX1EVPvEVggmjenYOAR1uVCfUxfqVrxA7GlQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jq6MlJpZr8ft6w8g/+vvrwXEZuTgbHJNoelhxvy2jRHZBaxB/RriKpGrZGYciN+lB
	 4kptKc8R7mBa0eu+SANMw1Ws3ko/kEErBqqQCNiiafl3wsFpSgZFq2+sr4F5tJuxTL
	 AjYmZsaFUE2qHmmR+FlfmQRHqERU82uOUiONH5pExNbXlqFctIiHW+FD2pSWzGgQOV
	 +3gCqtlAFxfDe29JcAXdPm8Q94XFial1JGh5y5lGE1OE4sSM7Bf7kUGiQ6WmnhRq5B
	 VHGh59zuo8PJ8LedxF02Ew/7R2TqRyscloKMlf7gwYgHpwfLukJtkiT10i4ZHhvP7C
	 Po9P8WFmeqIeg==
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 19:12:48 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Kees
 Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Sergey Lisov <sleirsgoevy@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Kaustabh Chakraborty
 <kauschluss@disroot.org>
Subject: Re: [PATCH v2 2/5] arm64: dts: exynos: add initial devicetree support
 for exynos7870
In-Reply-To: <00aa901b-5de9-4b72-a157-c54ad29df458@gmail.com>
References: <20250204-exynos7870-v2-0-56313165ef0c@disroot.org>
 <20250204-exynos7870-v2-2-56313165ef0c@disroot.org>
 <00aa901b-5de9-4b72-a157-c54ad29df458@gmail.com>
Message-ID: <199646ca71487cd6d2593c9b8bd7fa69@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_111257_015393_A19A2B3F 
X-CRM114-Status: GOOD (  17.80  )
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

On 2025-02-04 18:22, Ivaylo Ivanov wrote:
> On 2/3/25 22:46, Kaustabh Chakraborty wrote:
>> Exynos7870 is an arm64 SoC manufactured by Samsung and announced in
>> 2016. It is present in multiple mid-range Samsung phones and tablets.
>>
>> Add basic devicetree support for the SoC, which includes CMUs, pin
>> controllers, I2C, UART, DW-MMC, and USB-DRD.
>>
>> Co-developed-by: Sergey Lisov <sleirsgoevy@gmail.com>
>> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1035 ++++++++++++++++++++
>>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  722 ++++++++++++++
>>  2 files changed, 1757 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..28ff409c4fdc5f766d92617ea2df7be2112c28d1
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
>> @@ -0,0 +1,1035 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Samsung Exynos7870 SoC pin-mux and pin-config device tree source
>> + *
>> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include "exynos-pinctrl.h"
>> +
>> +&pinctrl0 {
> 
> I haven't had enough time to look deeper, but these are my 2 cents:
> 
> 
> Can you label them according to their block name rather than numbers?
> For example, pinctrl_abox (make sure to keep them alphabetically sorted
> as well).

Can do. The rationale behind keeping it numeric was that the names were
kind of misleading in some cases.

> 
>> +	etc0: etc0-gpio-bank {
>> +		gpio-controller;

...

>> diff --git a/arch/arm64/boot/dts/exynos/exynos7870.dtsi b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..11129e37fc86ebaee01684ed6841c932dd6cbc8a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/exynos/exynos7870.dtsi
>> @@ -0,0 +1,722 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Samsung Exynos7870 SoC device tree source
>> + *
>> + * Copyright (c) 2015 Samsung Electronics Co., Ltd.
>> + */
>> +
>> +#include <dt-bindings/clock/exynos7870.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/soc/samsung,boot-mode.h>
>> +

...

>> +
>> +			reboot-mode {
>> +				compatible = "syscon-reboot-mode";
>> +				offset = <0x080c>;
>> +				mode-bootloader = <EXYNOS7870_BOOT_BOOTLOADER>;
>> +				mode-download = <EXYNOS7870_BOOT_DOWNLOAD>;
>> +				mode-recovery = <EXYNOS7870_BOOT_RECOVERY>;
>> +			};
>> +		};
>> +

...

>> +
>> +#include "exynos7870-pinctrl.dtsi"
>> +#include "arm/samsung/exynos-syscon-restart.dtsi"
> 
> Didn't this already include a reboot node?

Yes, I believe you've confused it with the *reboot-mode* node as defined
above.

> 
> Best regards,
> Ivaylo
> 
>>

