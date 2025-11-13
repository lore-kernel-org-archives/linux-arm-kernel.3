Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC12CD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 22:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8U24sO6e6httf2hxXjc6YUvS3goaUUaOyj8qFfupFU=; b=P9hpMu18mK68u4j2bmBTodYzE+
	CA3KHcqP+c/Qcfr0Q/hu9PLNfkbbmH3Tv31BLW9MbV5o2L4gWN6pz2ItPz0yxJsd2RQKAzgi32j1l
	zyqpy6yqbbH4iXqPGlduWJY7PqjFCk+JnzS6cOyXPMBNb/YMgDms5lOxvoWyTpHmzE874uG+OjcKT
	MxA1zcaM2Cn6o+qzMksBFVChw3Xy1zfGmkrHiY68U2cM9CSKZKnETv0btaKxE5RofMBPlyRNdwLdL
	Q3K/98FMjTdT06UwNzdLTECmcEZs+2Sfw1NgWi2PHnW17g0llnbJNSFhZAcdNQOUts6ZOy4e2OyqQ
	xzPg96rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfvI-0000000BC5i-0JUV;
	Thu, 13 Nov 2025 22:36:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfvF-0000000BC5F-1Gdn;
	Thu, 13 Nov 2025 22:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=N8U24sO6e6httf2hxXjc6YUvS3goaUUaOyj8qFfupFU=; b=pdaf5v2kpjdd3L8m7MpTD/k7FZ
	tEeUMmQgNYvULW6OFSQyWsUYSGIP0x1cZqDXwkXZhL6AkIHEO3EPf+qurca7bn5gErEAu1AgnwKXM
	oWKsss3Jam9eKIbsrDCPPU0M0usEhuzkeuMy7OP04rtsORGZ8X44U2LfAmd5Vn4/ptx1hHY9TJ/Tw
	aRYkw3qRlQpZot7Qwn7JOK5PqVeCCJOqaeyrepB94GjfioEXAtEJoWOTbY389yMdGJoZB0aY2BOXl
	mx2n1kCqVGU6fyLYV92LkVGfgKwcEUAZCw0W6UOukop8G6NmYZkkEfc9B5Fmn/LyICMVLBWhcazyw
	Ki/XwKuw==;
Received: from i53875a11.versanet.de ([83.135.90.17] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vJfv4-0005Rc-Hp; Thu, 13 Nov 2025 23:35:58 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, michael.opdenacker@rootcommit.com
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add Tinkerboard 3 and 3S device tree
Date: Thu, 13 Nov 2025 23:35:57 +0100
Message-ID: <3310785.5fSG56mABF@diego>
In-Reply-To: <20251111172003.2324525-3-michael.opdenacker@rootcommit.com>
References: <20251111172003.2324525-1-michael.opdenacker@rootcommit.com>
 <20251111172003.2324525-3-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_143609_371876_9BD05683 
X-CRM114-Status: GOOD (  14.36  )
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

Am Dienstag, 11. November 2025, 18:20:23 Mitteleurop=C3=A4ische Normalzeit =
schrieb michael.opdenacker@rootcommit.com:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>=20
> Add initial device tree support for Asus Tinkerboard 3 [1] and 3S [2],
> which are SBCs based on the Rockchip 3566 SoC.
>=20
> The "3S" version ("S" for "storage") just adds a 16 GB eMMC
> and a "mask ROM" DIP switch (to mask the eMMC and enter "Mask ROM"
> mode for recovery) to the "3" version.
>=20
> This adds support for:
> - Debug UART (/dev/ttyS2)
> - SD card (/dev/mmcblk1)
> - eMMC (/dev/mmcblk0, only on Tinkerboard 3S)
> - I2C:
>   - i2c0 (internal bus with a PMIC and regulators)
>   - i2c2 (internal bus with an at24 eeprom and an RTC device)
> - USB 2.0 ports
> - 2 GPIO LEDS
>=20
> Link: https://tinker-board.asus.com/series/tinker-board-3.html [1]
> Link: https://tinker-board.asus.com/series/tinker-board-3s.html [2]
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---

please follow the DTS coding style
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html


> +/ {
> +	aliases {
> +		serial2 =3D &uart2;
> +		mmc1 =3D &sdmmc0;
> +		i2c0 =3D &i2c0;
> +		i2c2 =3D &i2c2;

alphabetical property order


> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial2:1500000n8";
> +	};
> +
> +	vcc3v3_sys: regulator-3v3-vcc-sys {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc3v3_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc5v0_sys: regulator-5v0-vcc-sys {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +
> +	vcc5v0_usb_host: regulator-5v0-vcc-usb-host {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpios =3D <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&usb_host_pwren_h>;
> +		regulator-name =3D "vcc5v0_usb_host";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	gpio_leds: gpio-leds {

gpio-foo before regulator-bar

> +		compatible =3D "gpio-leds";
> +
> +		act-led {
> +			gpios =3D <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger=3D"mmc1";
> +};

missing indentation

> +
> +		rsv-led {
> +			gpios =3D <&gpio0 RK_PD6 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger=3D"none";
> +		};
> +	};
> +};
> +
> +&uart2 {

alphabetical ordering of phandles please (uart2 definitly somewhere after i=
2c0)

> +	status =3D "okay";
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +
> +	rk809: pmic@20 {
> +		compatible =3D "rockchip,rk809";
> +		reg =3D <0x20>;
> +		assigned-clocks =3D <&cru I2S1_MCLKOUT_TX>;
> +		assigned-clock-parents =3D <&cru CLK_I2S1_8CH_TX>;
> +		#clock-cells =3D <1>;
> +		clocks =3D <&cru I2S1_MCLKOUT_TX>;
> +		clock-names =3D "mclk";
> +		clock-output-names =3D "rk809-clkout1", "rk809-clkout2";
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pmic_int_l>, <&i2s1m0_mclk>;
> +		#sound-dai-cells =3D <0>;
> +		system-power-controller;
> +		wakeup-source;
> +
> +		vcc1-supply =3D <&vcc3v3_sys>;
> +		vcc2-supply =3D <&vcc3v3_sys>;
> +		vcc3-supply =3D <&vcc3v3_sys>;
> +		vcc4-supply =3D <&vcc3v3_sys>;
> +		vcc5-supply =3D <&vcc3v3_sys>;
> +		vcc6-supply =3D <&vcc3v3_sys>;
> +		vcc7-supply =3D <&vcc3v3_sys>;
> +		vcc8-supply =3D <&vcc3v3_sys>;
> +		vcc9-supply =3D <&vcc3v3_sys>;
> +
> +		regulators {
> +			vcc_1v8: DCDC_REG5 {
> +				regulator-name =3D "vcc_1v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc3v3_sd: SWITCH_REG2 {
> +				regulator-name =3D "vcc3v3_sd";
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vccio_sd: LDO_REG5 {
> +				regulator-name =3D "vccio_sd";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v3: SWITCH_REG1 {
> +				regulator-name =3D "vcc_3v3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +	};
> +
> +	vdd_cpu: regulator@40 {

you probably need &cpu0 phandles to set this regulator-supply?

> +		compatible =3D "silergy,syr827";
> +		reg =3D <0x40>;
> +		fcs,suspend-voltage-selector =3D <1>;
> +		regulator-name =3D "vdd_cpu";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <830000>;
> +		regulator-max-microvolt =3D <1200000>;
> +		regulator-ramp-delay =3D <2300>;
> +		vin-supply =3D <&vcc3v3_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	status =3D "okay";
> +
> +	m24c08@50 {

I guess eeprom@50 ?

Heiko



