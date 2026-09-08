Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA4FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lvf6ae9vhnmAZvdnwee/xpmQhuiBBZDKs7Y2hA4lCME=; b=jFW21n2fOq65+6vaZhHFvMyMOK
	qrS3gyLRZZ6tD7jHI99ZVFUiC82zt7PcUNgwf1jVDadUM3h/Ojo3k9qDzQ4tnh+ChXD61PQfJd8lB
	1Zqo6XleUYqSmyxVMR0eUu16pWJ6U7wMPnoqSg0VbprSUQI22wpTRLvU2aSw2HZGTDR30TEoRB6w7
	PgrM983/PgdvFBm5gKoFds5PzLsxyHAwMN9JxaRI8cpzGbGOml2NMmNDJLN27Elv87FyIxw/bnAPu
	iaqIcnruohwCvL0hiqx/W/ufo0KHCbxRyQv7/hWxgEu2YUNIQgZBVAnnber4qt+GTZ9Rf3WIjGXfc
	Gu4GG0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pv0-00000008ESL-3mMZ;
	Tue, 08 Sep 2026 07:06:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3put-00000008EO3-0BYP;
	Tue, 08 Sep 2026 07:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851208;
	bh=2fcrYPpUrtoB6BEGf24Voa6RfaHacqnigE3TyU9Q1Xo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AuYiKfn0fFshNHjujbNbTmK8vwYckrWNao4X5pzLTRLRgxo52kqrKqTboQbrk/1dY
	 K0bGgkeV3bacBN67EbvGHlPKQZ8br0lJyQHvu18trECjyWww391KRicoGzD0P47Dhl
	 SiwZVU3ZoPe8ePQHem0z46ojf/Mf6yNsYglr2L3SL5Vmge00bUu1Oo7K8gF/epJc0V
	 YF1dG+do0ddmI/hBDpEWj7FkMB4WQLw6kGnkYNzRflg9sGorqNznC56sYVF9AfflBs
	 xOARzZ9uaVkk6HFnlwNmYhOYhJK8yj8uGVMTGWXY4LgV33ebdbq/7IzSwTnm4iRBCt
	 N/PD47J6x26UA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 964E817E0D43;
	Tue, 08 Sep 2026 09:06:47 +0200 (CEST)
Message-ID: <f8419831-8467-4d72-bbe9-d5b7c158cb22@collabora.com>
Date: Tue, 8 Sep 2026 09:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC
 dtsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Julien Massot <julien.massot@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa
 <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20260902193351.185771-1-l.scorcia@gmail.com>
 <20260902193351.185771-10-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260902193351.185771-10-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_000651_247628_A6266474 
X-CRM114-Status: GOOD (  18.69  )
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

On 9/2/26 21:25, Luca Leonardo Scorcia wrote:
> From: Val Packett <val@packett.cool>
> 
> Add the dtsi to be included by all boards using the MT6392 PMIC,
> providing support for regulator, keys, pinctrl and RTC.
> 
> Import the new file in the shared device tree for the Pumpkin boards.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++++++++++++++++
>   .../boot/dts/mediatek/pumpkin-common.dtsi     |   7 +
>   2 files changed, 152 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> new file mode 100644
> index 000000000000..cc4770d70246
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2024 Val Packett <val@packett.cool>
> + * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
> +
> +&pwrap {
> +	pmic: pmic {
> +		compatible = "mediatek,mt6392";
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		mt6392keys: keys {
> +			compatible = "mediatek,mt6392-keys";
> +
> +			key-power {
> +				linux,keycodes = <KEY_POWER>;
> +				wakeup-source;
> +			};
> +
> +			key-home {
> +				linux,keycodes = <KEY_HOME>;
> +				wakeup-source;
> +			};
> +		};
> +
> +		mt6392pio: pinctrl {
> +			compatible = "mediatek,mt6392-pinctrl";
> +
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		mt6392regulators: regulators {
> +			compatible = "mediatek,mt6392-regulator";
> +
> +			/* Fixed supply defined in the data sheet */
> +			avddldo-supply = <&mt6392_vsys_reg>;
> +
> +			mt6392_vcore_reg: vcore {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_BUCK_MODE_FORCE_PWM>;
> +			};
> +			mt6392_vproc_reg: vproc {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_BUCK_MODE_FORCE_PWM>;
> +			};
> +			mt6392_vsys_reg: vsys {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_BUCK_MODE_FORCE_PWM>;
> +			};
> +			mt6392_vaud28_reg: vaud28 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vxo22_reg: vxo22 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vaud22_reg: vaud22 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vadc18_reg: vadc18 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vcama_reg: vcama { };
> +			mt6392_vcn35_reg: vcn35 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vio28_reg: vio28 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vusb_reg: vusb {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vmc_reg: vmc {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vmch_reg: vmch {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vemc3v3_reg: vemc3v3 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vcamaf_reg: vcamaf {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vgp1_reg: vgp1 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vgp2_reg: vgp2 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vefuse_reg: vefuse {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vm25_reg: vm25 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vdig18_reg: vdig18 { };
> +			mt6392_vm_reg: vm {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vio18_reg: vio18 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vcn18_reg: vcn18 {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vcamd_reg: vcamd {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vcamio_reg: vcamio {
> +				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
> +							   MT6392_LDO_MODE_LP>;
> +			};
> +			mt6392_vrtc_reg: vrtc { };
> +		};
> +
> +		mt6392rtc: rtc {
> +			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index 805fb82138a8..b19d5792bd89 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -6,6 +6,8 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   
> +#include "mt6392.dtsi"
> +
>   / {
>   	aliases {
>   		serial0 = &uart0;
> @@ -160,6 +162,11 @@ &i2c2 {
>   	status = "okay";
>   };
>   
> +&pmic {
> +	interrupt-parent = <&pio>;
> +	interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
>   &uart0 {
>   	status = "okay";
>   };

