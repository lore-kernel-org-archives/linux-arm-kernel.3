Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729D3D5B864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 19:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZASHbHIy3pW/TwTPYabawNDQ0TGE9xjqa93XhNrEzE=; b=X4PR1Vh7XtFW1BVeXH2OAcwKKa
	PVbzy56xyLXA5k+hZL0ZG80P9oew11fWBmekIkZVjN/xN8pCqxYIgINlWWRtrgPsq3TRp2svFBVcs
	qRovpLtmww6++HnV9rjIcK7rBby3rlYHTldBmynJDU+7hHYyHZZrIwRQ//+tm42/Ye7XVzfxbrNvv
	whB9F3KB2tVMaAFRIZ/b3oiHQoLqnVGSTT3k65yziTLZu0twLMnawbbyw7ElXBiYw25/ub848qDhM
	E52rY3Ra9BucGKVxr5cvO1nJ+RKspb2RHyT/OgHpGcWO3+5evswTZocgEL4n4U/UYn3k0j7hl1rdg
	knLXboUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVEK4-00000004BFU-17dW;
	Mon, 15 Dec 2025 19:33:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVEK2-00000004BFH-1Dy9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 19:33:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F56860007;
	Mon, 15 Dec 2025 19:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F21C4CEF5;
	Mon, 15 Dec 2025 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765827208;
	bh=Xf/Uivn2/05IFaA/e+fqhQihwVLhOLhR1m30cTTyHno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TDSd2bDGVVxpTStolPf4XfKM5vsnraj4PlGN9K/1MRm4lr5MsSOYDxeLm1lh8FMR/
	 n2bXpNs3Dx8k0brZP/eDsSl+TcSW68ACV8RXbJfSN/BOSoH7ib2PTvwFqxpauuf1U8
	 dQ7L/madDBUOH9aWSnyI6qzDEr3SQDSWVD1xW74YPKp9arB+rMGVmLPwP9UZRGTIgo
	 Ep979uz3mdtzNrV9ku/wLODNYc9l41NpX88GmULxxz2LFKJPQ5mLBHcrLPKbrr1kQ4
	 k2VfmcLKjLcl2i81hlAxz5UgLerJM3kAl7xSY+lpoN+zSNrYUTlAQPGXkwpbTspKeU
	 iJoSECfAkuQrQ==
Message-ID: <546ff0cb-a3a2-4fa4-a78b-79c923ed7765@kernel.org>
Date: Mon, 15 Dec 2025 20:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
To: David Heidelberg <david@ixit.cz>,
 Lukas Timmermann <linux@timmermann.space>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
 <20251215-lat3st-staging-v3-2-2e4914b64dd8@timmermann.space>
 <c62d6c99-0c8d-40e5-95fc-ae73ecaca926@ixit.cz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <c62d6c99-0c8d-40e5-95fc-ae73ecaca926@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 15/12/2025 19:53, David Heidelberg wrote:
> Hello Lucas,
> 
> thanks for the sending Nexus 10 upstream, see few nitpicks below:
> 
> On 15/12/2025 16:05, Lukas Timmermann wrote:
>> From: Alexandre Marquet <tb@a-marquet.fr>
>>
>> Manta is the code name for Google Nexus 10, and was manufactured by
>> Samsung with their Exynos5250 SoC.
>> This patch adds initial device-tree file for this board.
>>
>> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
>> Co-developed-by: Lukas Timmermann <linux@timmermann.space>
>> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
>> ---
>>   arch/arm/boot/dts/samsung/Makefile             |   1 +
>>   arch/arm/boot/dts/samsung/exynos5250-manta.dts | 511 +++++++++++++++++++++++++
>>   2 files changed, 512 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
>> index 7becf36656b1..e0143ee8c82d 100644
>> --- a/arch/arm/boot/dts/samsung/Makefile
>> +++ b/arch/arm/boot/dts/samsung/Makefile
>> @@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>>   	exynos4412-trats2.dtb
>>   dtb-$(CONFIG_ARCH_EXYNOS5) += \
>>   	exynos5250-arndale.dtb \
>> +	exynos5250-manta.dtb \
>>   	exynos5250-smdk5250.dtb \
>>   	exynos5250-snow.dtb \
>>   	exynos5250-snow-rev5.dtb \
>> diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
>> new file mode 100644
>> index 000000000000..0f006590576c
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
>> @@ -0,0 +1,511 @@
>> +// SPDX-License-Identifier: GPL-2.0
> 
> you could use here modern SPDX I guess (GPL-2.0-only)
> 
>> +/*
>> + * Google Manta (Nexus 10) board device tree source
>> + *
>> + * Copyright (c) 2023-2025 Alexandre Marquet
>> + * Copyright (c) 2025 Lukas Timmermann
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/clock/maxim,max77686.h>
>> +#include <dt-bindings/input/linux-event-codes.h>
>> +#include "exynos-pinctrl.h"
>> +#include "exynos5250.dtsi"
>> +#include "exynos-mfc-reserved-memory.dtsi"
>> +
>> +/ {
>> +	model = "Google Nexus 10";
>> +	compatible = "google,manta", "samsung,exynos5250", "samsung,exynos5";
>> +
>> +	aliases {
>> +		mmc0 = &mmc_0; /* eMMC */
>> +		mmc1 = &mmc_1; /* WiFi */
>> +	};
>> +
>> +	bmp180_vdda_reg: regulator-bmp180-vdda {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "BMP180_VDDA";
>> +	};
> something-something-regulator (all occurences within the DTS)
> 

I don't understand this suggestion.

>> +
>> +	bmp180_vddd_reg: regulator-bmp180-vddd {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "BMP180_VDDD";
>> +	};



>> +};
>> +
>> +&clock {
>> +	assigned-clocks = <&clock CLK_FOUT_APLL>;
>> +	assigned-clock-rates = <1000000000>;
>> +};
>> +
>> +&cpu0 {
>> +	cpu0-supply = <&buck2_reg>;
>> +};
>> +
>> +&ehci {
>> +	status = "disabled";
>> +};
>> +
>> +&i2c_0 {
>> +	status = "okay";
> 
> status should be before first sub-node (none in this case), with 
> preceding newline, please change all occurences
> 

Well yeah, but do you have actually any comment pointing real issues?


Best regards,
Krzysztof

