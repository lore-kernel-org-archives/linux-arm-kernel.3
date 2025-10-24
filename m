Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9CCCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5A3LnFV1JXMiV8IKs93nnFfYiQF51ex2SRQx85q3Ewc=; b=fU/BiC5mHLayGjTyKyKnoXYhk5
	ZEFxmUFKTBxHoOkAbeFCLaByvv7CHYpFXxbJDJUVqgX/XPF8rSO8AGhevJNDUeoCGJ4zQp4P0Ko9f
	4TAjSePk3DJF5EdEUAn62+VK23li9pdJ8A3kf1LLxXkAZ6acwBRg3agMT8NMglqkQ1O0NglAXOG4K
	K70LD7OJI+Hilm4XC3eSmDluEhBqpf/vqSzbEheqZQYzgVnwaYmKV0d9cTYlpWAXeWnXSUhWmjoIZ
	B91QkDOjSy1pbMBtAjhtMuGNXMWxUIhpg94RvdVk43IUUaYGlytRmZAgJD3ec8/4s0Nf+zE5q6oKo
	P8b3ZqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHus-00000009YJw-3eRi;
	Fri, 24 Oct 2025 13:33:14 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHup-00000009YJG-2H1S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 13:33:13 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59ODX5eD757492;
	Fri, 24 Oct 2025 08:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761312785;
	bh=5A3LnFV1JXMiV8IKs93nnFfYiQF51ex2SRQx85q3Ewc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fSHvfpicgo8vRenVuPaiPUFCmHm+D5vtN/ASrCSSjjOLobWm5Z7QYOoG0LKpG2Op0
	 MXGPvopueyeRr8mwxxJnTd2+GIB79n9OaNvo/rVwLctIiL+qU0oLi7oW3oDN1fWDi6
	 +xfndGPCGLQT2UsMB/c2OBHS6ujF0zoAhVhCVGy8=
Received: from DFLE205.ent.ti.com (dfle205.ent.ti.com [10.64.6.63])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59ODX4ou3608351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 08:33:04 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 08:33:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 08:33:04 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59ODX1N7391117;
	Fri, 24 Oct 2025 08:33:01 -0500
Message-ID: <a1a8f585-9650-49e6-9dfc-89c5ecb7d9ea@ti.com>
Date: Fri, 24 Oct 2025 19:03:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: ti: Add support for Kontron
 SMARC-sAM67
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20251017135116.548236-1-mwalle@kernel.org>
 <20251017135116.548236-3-mwalle@kernel.org>
 <9da776bc-3156-4f4b-9e64-6ada5b47fab3@ti.com>
 <DDQCQPRRVOHB.1ENJWEGUOSBTR@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <DDQCQPRRVOHB.1ENJWEGUOSBTR@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_063311_765781_22A0DA78 
X-CRM114-Status: GOOD (  26.37  )
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

Hi Michael,

On 10/24/2025 12:21 PM, Michael Walle wrote:
> Hi Udit,
>
> thanks for the thorough review!
>
> On Fri Oct 24, 2025 at 7:13 AM CEST, Udit Kumar wrote:
>> On 10/17/2025 7:20 PM, Michael Walle wrote:
>>> Add device tree support for the Kontron SMARC-sAM67 module, which is
>>> based on a TI AM67A SoC.
>>>
>>> The module features:
>>>    * Quad-core AM67A94 at 1.4GHz with 8 GiB RAM
>>>    * 64 GiB eMMC, 4 MiB SPI flash for failsafe booting
>>>    * Dedicated RTC
>>>    * Multiple interfaces: 4x UART, 2x USB 2.0/USB 3.2, 2x GBE, QSPI,
>>>           7x I2C,
>>>    * Display support: 2x LVDS, 1x DSI (*), 1x DP (*)
>>>    * Camera support: 4x CSI (*)
>>>    * Onboard microcontroller for boot control, failsafe booting and
>>>      external watchdog
>>>
>>> (*) not yet supported by the kernel
>>>
>>> There is a base device tree and overlays which will add optional
>>> features. At the moment there is one full featured variant of that
>>> board whose device tree is generated during build by merging all the
>>> device tree overlays.
>>>
>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>> ---
>>>    arch/arm64/boot/dts/ti/Makefile               |    7 +
>>>    .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 +++++++++++++++++
>>>    .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 +
>>>    .../dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 +
>>>    .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 +
>>>    5 files changed, 1216 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>>>    create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
>>>    create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso
>>>    create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
>>> index 743115b849a7..d2a40ea642c4 100644
>>> --- a/arch/arm64/boot/dts/ti/Makefile
>>> +++ b/arch/arm64/boot/dts/ti/Makefile
>>> @@ -137,7 +137,14 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>>>    dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
>>>    
>>>    # Boards with J722s SoC
>>> +k3-am67a-kontron-sa67-dtbs := k3-am67a-kontron-sa67-base.dtb \
>>> +	k3-am67a-kontron-sa67-rtc-rv8263.dtbo k3-am67a-kontron-sa67-gbe1.dtbo
>>>    dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>>> +dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67.dtb
>>> +dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-base.dtb
>>> +dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-gbe1.dtbo
>>> +dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-gpios.dtbo
>>> +dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-rtc-rv8263.dtbo
>>>    dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
>>>    dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
>>>    dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>>> new file mode 100644
>>> index 000000000000..7169d934adac
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>>> @@ -0,0 +1,1091 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>>> +/*
>>> + * Kontron SMARC-sAM67 module
>>> + *
>>> + * Copyright (c) 2025 Kontron Europe GmbH
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> +#include <dt-bindings/phy/phy.h>
>>> +#include "k3-j722s.dtsi"
>>> +#include "k3-serdes.h"
>>> +
>>> [..]+
>>> +	ospi0_pins_default: ospi0-default-pins {
>>> +		pinctrl-single,pins = <
>>> +			J722S_IOPAD(0x000, PIN_OUTPUT, 0)	/* (L24) OSPI0_CLK */
>>> +			J722S_IOPAD(0x02c, PIN_OUTPUT, 0)	/* (K26) OSPI0_CSn0 */
>>> +			J722S_IOPAD(0x030, PIN_OUTPUT, 0)	/* (K23) OSPI0_CSn1 */
>>> +			J722S_IOPAD(0x034, PIN_OUTPUT, 0)	/* (K22) OSPI0_CSn2 */
>> I am not sure, which flash device is being used , could you check once
>> if all three CS are supported.
> Yes, all three are used. This board has one 4MiB on-board flash
> W25Q32 (or similar) and the two others CS are routed to the edge
> connector. They aren't multi purpose, so we can already set them
> to the CS function.


Thanks for details.  Just want to make sure, pins are not used for multi 
purpose.

Please use

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>
>>> +			J722S_IOPAD(0x00c, PIN_INPUT, 0)	/* (K27) OSPI0_D0 */
>>> +			J722S_IOPAD(0x010, PIN_INPUT, 0)	/* (L27) OSPI0_D1 */
>>> +			J722S_IOPAD(0x014, PIN_INPUT, 0)	/* (L26) OSPI0_D2 */
>>> +			J722S_IOPAD(0x018, PIN_INPUT, 0)	/* (L25) OSPI0_D3 */
>>> +		>;
>>> +		bootph-all;
>>> +	};
>>> +
>>> +	pcie0_rc_pins_default: pcie0-rc-default-pins {
>>> +		pinctrl-single,pins = <
>>> +			J722S_IOPAD(0x2ac, PIN_OUTPUT, 0)	/* (F25) PCIE0_CLKREQn */
>>> +			J722S_IOPAD(0x1b4, PIN_OUTPUT, 7)	/* (B20) SPI0_CS0.GPIO1_15 */
>>> +		>;
>>> +	};
>>> +
>>> +	pmic_irq_pins_default: pmic-irq-default-pins {
>>> +		pinctrl-single,pins = <
>>> +			J722S_IOPAD(0x090, PIN_INPUT, 7)	/* (P27) GPMC0_BE0n_CLE.GPIO0_35 */
>>> +		>;
>>> +	};
>>> +
>>> [..]
>>> +/* I2C_PM */
>>> +&wkup_i2c0 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&wkup_i2c0_pins_default>;
>>> +	clock-frequency = <100000>;
>>> +	status = "okay";
>>
>> This is more a question, I see all i2c controller you want to run at
>> 100Kz, but most of devices are supporting 400Khz
>>
>> like tps652g1 over main_i2c0 ,  pca9546 over main_i2c1 , is there
>> specific reason for this
> Actually yes and it was at 400kHz at first. But it wont work with
> the onboard management controller at that bus. Although it supports
> 400kHz, the mode in which we are using it, doesn't. In short, we
> aren't using clock stretching as this might cause the whole bus to
> hang without being able to recover it from the SoC. Therefore, the
> i2c reply bytes have to be prepared just-in-time and it turn out
> that 400kHz is too fast for that.

Understood.


>
> -michael
>
>>> +};
>>> +
>>> +/* SER3 */
>>> +&wkup_uart0 {
>>> +	/* WKUP UART0 is used by Device Manager firmware */
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&wkup_uart0_pins_default>;
>>> +	bootph-all;
>>> +	status = "reserved";
>>> +};
>> [..]
>

