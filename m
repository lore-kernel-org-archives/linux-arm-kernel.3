Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A153CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 06:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCL0Rx0W3iI63zmPRqUcYncVa5PzWhfu/HGITZfWxNU=; b=ZR+jtTUKgbrbOknxl+RgQdTzcv
	ajkkQkNaVHqfJPGGp9fAXGASag7lytW5C5pdrZJ52qxfRNmYCPHK/j4ihr+xnfKY83H4YMLmezNtX
	Dtv5oDuBHKCGBW7BagEZAUvFEVYUR3Zi2oJFzU5cHgZvdEFy2/f4+S1wcY7mZsLbJHfPGOgjg7G8z
	XH9KNiqb10M06j3TH0owQB/iZStp+7vdbheoLs+e8AcsqKxNe64QA9zBS+XgSSsRxqpWUpft3u4LM
	HsItGMStJ7r3MZxMKY4vTx7N8k/E0cGLeAAkCwiTL1wzOJoEW/tQwA6YkputkJNjqXrosvRTAI2Td
	UXOfLM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBen-00000008OIG-1akk;
	Fri, 24 Oct 2025 06:52:13 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBej-00000008OE7-46Zu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 06:52:11 +0000
Received: from localhost (ip-109-43-112-130.web.vodafone.de [109.43.112.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4342B10C;
	Fri, 24 Oct 2025 08:51:56 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Oct 2025 08:51:55 +0200
Message-Id: <DDQCQPRRVOHB.1ENJWEGUOSBTR@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] arm64: dts: ti: Add support for Kontron
 SMARC-sAM67
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251017135116.548236-1-mwalle@kernel.org>
 <20251017135116.548236-3-mwalle@kernel.org>
 <9da776bc-3156-4f4b-9e64-6ada5b47fab3@ti.com>
In-Reply-To: <9da776bc-3156-4f4b-9e64-6ada5b47fab3@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_235210_167782_074E1B09 
X-CRM114-Status: GOOD (  23.25  )
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

Hi Udit,

thanks for the thorough review!

On Fri Oct 24, 2025 at 7:13 AM CEST, Udit Kumar wrote:
> On 10/17/2025 7:20 PM, Michael Walle wrote:
>> Add device tree support for the Kontron SMARC-sAM67 module, which is
>> based on a TI AM67A SoC.
>>
>> The module features:
>>   * Quad-core AM67A94 at 1.4GHz with 8 GiB RAM
>>   * 64 GiB eMMC, 4 MiB SPI flash for failsafe booting
>>   * Dedicated RTC
>>   * Multiple interfaces: 4x UART, 2x USB 2.0/USB 3.2, 2x GBE, QSPI,
>>          7x I2C,
>>   * Display support: 2x LVDS, 1x DSI (*), 1x DP (*)
>>   * Camera support: 4x CSI (*)
>>   * Onboard microcontroller for boot control, failsafe booting and
>>     external watchdog
>>
>> (*) not yet supported by the kernel
>>
>> There is a base device tree and overlays which will add optional
>> features. At the moment there is one full featured variant of that
>> board whose device tree is generated during build by merging all the
>> device tree overlays.
>>
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile               |    7 +
>>   .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 +++++++++++++++++
>>   .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 +
>>   .../dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 +
>>   .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 +
>>   5 files changed, 1216 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.d=
ts
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.d=
tso
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.=
dtso
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv=
8263.dtso
>>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Ma=
kefile
>> index 743115b849a7..d2a40ea642c4 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
>> @@ -137,7 +137,14 @@ dtb-$(CONFIG_ARCH_K3) +=3D k3-j721s2-evm-pcie1-ep.d=
tbo
>>   dtb-$(CONFIG_ARCH_K3) +=3D k3-j721s2-evm-usb0-type-a.dtbo
>>  =20
>>   # Boards with J722s SoC
>> +k3-am67a-kontron-sa67-dtbs :=3D k3-am67a-kontron-sa67-base.dtb \
>> +	k3-am67a-kontron-sa67-rtc-rv8263.dtbo k3-am67a-kontron-sa67-gbe1.dtbo
>>   dtb-$(CONFIG_ARCH_K3) +=3D k3-am67a-beagley-ai.dtb
>> +dtb-$(CONFIG_ARCH_K3) +=3D k3-am67a-kontron-sa67.dtb
>> +dtb-$(CONFIG_ARCH_K3) +=3D k3-am67a-kontron-sa67-base.dtb
>> +dtb-$(CONFIG_ARCH_K3) +=3D k3-am67a-kontron-sa67-gbe1.dtbo
>> +dtb-$(CONFIG_ARCH_K3) +=3D k3-am67a-kontron-sa67-gpios.dtbo
>> +dtb-$(CONFIG_ARCH_K3) +=3D k3-am67a-kontron-sa67-rtc-rv8263.dtbo
>>   dtb-$(CONFIG_ARCH_K3) +=3D k3-j722s-evm.dtb
>>   dtb-$(CONFIG_ARCH_K3) +=3D k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
>>   dtb-$(CONFIG_ARCH_K3) +=3D k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
>> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arc=
h/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>> new file mode 100644
>> index 000000000000..7169d934adac
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>> @@ -0,0 +1,1091 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +/*
>> + * Kontron SMARC-sAM67 module
>> + *
>> + * Copyright (c) 2025 Kontron Europe GmbH
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/phy/phy.h>
>> +#include "k3-j722s.dtsi"
>> +#include "k3-serdes.h"
>> +
>> [..]+
>> +	ospi0_pins_default: ospi0-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			J722S_IOPAD(0x000, PIN_OUTPUT, 0)	/* (L24) OSPI0_CLK */
>> +			J722S_IOPAD(0x02c, PIN_OUTPUT, 0)	/* (K26) OSPI0_CSn0 */
>> +			J722S_IOPAD(0x030, PIN_OUTPUT, 0)	/* (K23) OSPI0_CSn1 */
>> +			J722S_IOPAD(0x034, PIN_OUTPUT, 0)	/* (K22) OSPI0_CSn2 */
>
> I am not sure, which flash device is being used , could you check once=20
> if all three CS are supported.

Yes, all three are used. This board has one 4MiB on-board flash
W25Q32 (or similar) and the two others CS are routed to the edge
connector. They aren't multi purpose, so we can already set them
to the CS function.

>> +			J722S_IOPAD(0x00c, PIN_INPUT, 0)	/* (K27) OSPI0_D0 */
>> +			J722S_IOPAD(0x010, PIN_INPUT, 0)	/* (L27) OSPI0_D1 */
>> +			J722S_IOPAD(0x014, PIN_INPUT, 0)	/* (L26) OSPI0_D2 */
>> +			J722S_IOPAD(0x018, PIN_INPUT, 0)	/* (L25) OSPI0_D3 */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	pcie0_rc_pins_default: pcie0-rc-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			J722S_IOPAD(0x2ac, PIN_OUTPUT, 0)	/* (F25) PCIE0_CLKREQn */
>> +			J722S_IOPAD(0x1b4, PIN_OUTPUT, 7)	/* (B20) SPI0_CS0.GPIO1_15 */
>> +		>;
>> +	};
>> +
>> +	pmic_irq_pins_default: pmic-irq-default-pins {
>> +		pinctrl-single,pins =3D <
>> +			J722S_IOPAD(0x090, PIN_INPUT, 7)	/* (P27) GPMC0_BE0n_CLE.GPIO0_35 */
>> +		>;
>> +	};
>> +
>> [..]
>> +/* I2C_PM */
>> +&wkup_i2c0 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&wkup_i2c0_pins_default>;
>> +	clock-frequency =3D <100000>;
>> +	status =3D "okay";
>
>
> This is more a question, I see all i2c controller you want to run at=20
> 100Kz, but most of devices are supporting 400Khz
>
> like tps652g1 over main_i2c0 , =C2=A0pca9546 over main_i2c1 , is there=20
> specific reason for this

Actually yes and it was at 400kHz at first. But it wont work with
the onboard management controller at that bus. Although it supports
400kHz, the mode in which we are using it, doesn't. In short, we
aren't using clock stretching as this might cause the whole bus to
hang without being able to recover it from the SoC. Therefore, the
i2c reply bytes have to be prepared just-in-time and it turn out
that 400kHz is too fast for that.

-michael

>> +};
>> +
>> +/* SER3 */
>> +&wkup_uart0 {
>> +	/* WKUP UART0 is used by Device Manager firmware */
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&wkup_uart0_pins_default>;
>> +	bootph-all;
>> +	status =3D "reserved";
>> +};
> [..]


