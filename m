Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258CFC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OBINtI0SAZP2fUdQnW19FOxjYjmq02Jp24p47V1i4U=; b=cSX3Xo/wLMqdI9VDLvI0831chv
	irgazscbRzFm2XN3AUvusbHNTrFOHtt85plcj2wG3toxQ2Iw2wRkEQaZUOf0lG6ygK5d1S/jBSYCg
	/S+4ygp91B4YVGBTYjT9/mDV525DltkQ08gizgkk/CzXcKJdHq8ewqKrmXnUFuY5BTewZ7JGjcqUz
	rpyY88Mc5LZnE2B0luNwuxmdodpD61px7lG9DgcMwTGszM2SnhgCmSwn3Jqge23PaKvX+rmn7B2Tg
	guno2qsjdnMOH6C7hxnBHDZP4wtCZq2jVOI3VRA/jWGjhwYwP2Xzxq57HdvZbwxj5CPqkTUq/iKUE
	Hcznd21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvFY-0000000DMdo-1kfQ;
	Tue, 13 May 2025 19:25:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEubv-0000000DHEm-41SM;
	Tue, 13 May 2025 18:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/OBINtI0SAZP2fUdQnW19FOxjYjmq02Jp24p47V1i4U=; b=N1MArj0DxnQLp1gnjOJp7tC7Yi
	9upVlge54nLsV6IlChGDVcNBfiltmQWCdo7msRylE6vERsX8YOWC566zrpDtt2BRdQJ80VBhwAbMC
	6vGnv2yUYRLGHo+ciUKU8b9Y56fziOS5LCBa2HqAoJird5xIlQMbVpv7HI265ICDT+T9EAGRmYpAt
	9mNmOGzJcm1Aq8tKeWhG855fyQaEL38UBnXHMVn21/sFIb2PM15uvPvyvQiJwaE84w8Dql9BLUzyP
	cfn9ngGz78gBZrHxUpOAJMJfnFLIDH0M87ajaIYlaBKH772g9+3eJyGhk8N7nG9vHMxM+MzxbZ4X3
	y6Bj3Xnw==;
Received: from [61.8.147.169] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEubM-0003sw-Um; Tue, 13 May 2025 20:43:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Fred Bloggs <f.blogs@napier.co.nz>, Hsun Lai <i@chainsx.cn>
Cc: Hsun Lai <i@chainsx.cn>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 3/3] arm64: dts: rockchip: add DTs for Sakura Pi RK3308B
Date: Tue, 13 May 2025 20:43:39 +0200
Message-ID: <2678259.iZASKD2KPV@phil>
In-Reply-To: <20250513163515.177472-4-i@chainsx.cn>
References: <20250513163515.177472-1-i@chainsx.cn> <20250513163515.177472-4-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_114416_022604_FE6B911B 
X-CRM114-Status: GOOD (  14.33  )
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

Hi,

Am Dienstag, 13. Mai 2025, 18:35:14 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Hsun Lai:

> +	vcc5v0_sys: vcc5v0-sys {

preferred node-names for regulators is regulator-foo, so here please
regulator-vcc5v0-sys (phandle can stay as it is).

Same for all the other fixed-/pwm- regulators below.

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +
> +	vdd_core: vdd-core {
> +		compatible =3D "pwm-regulator";
> +		pwms =3D <&pwm0 0 5000 1>;
> +		regulator-name =3D "vdd_core";
> +		regulator-min-microvolt =3D <827000>;
> +		regulator-max-microvolt =3D <1340000>;
> +		regulator-init-microvolt =3D <1015000>;
> +		regulator-settling-time-up-us =3D <250>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		pwm-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vdd_log: vdd-log {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_log";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1050000>;
> +		regulator-max-microvolt =3D <1050000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc_ddr: vcc-ddr {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_ddr";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1500000>;
> +		regulator-max-microvolt =3D <1500000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc_1v8: vcc-1v8 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_1v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		vin-supply =3D <&vcc_io>;
> +	};
> +
> +	vcc_io: vcc-io {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_io";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +	vcc_phy: vcc-phy-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_phy";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc5v0_otg: vcc5v0-otg {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_otg";
> +		regulator-always-on;
> +		gpio =3D <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&otg_vbus_drv>;
> +		vin-supply =3D <&vcc5v0_sys>;
> +	};
> +
> +};


> +&i2c1 {

empty i2c controller? I guess it is routed to the external pins?
If so, could use a comment explaining that.


> +/* SPI0 for external gpio pin */
> +&spi0 {
> +	status =3D "okay";
> +
> +	spi_dev@0 {
> +		compatible =3D "spidev";

having a generic spidev is not allowed. If there is an actual
device connected there, it should have a real compatible.
If that isn't a real device, this could be handled in an overlay.


> +		reg =3D <0>;
> +		spi-max-frequency =3D <0x2faf080>;
> +	};
> +};
> +
> +/* SPI1 for ws2812*/
> +&spi1 {
> +	status =3D "okay";
> +
> +	spi_dev@0 {
> +		compatible =3D "spidev";

same as above, please no generic spidev

> +		reg =3D <0>;
> +		spi-max-frequency =3D <0x2faf080>;
> +	};
> +};
> +
> +&pinctrl {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rtc_32k>;
> +
> +	usb {

please sort these nodes alphabetically

> +		otg_vbus_drv: otg-vbus-drv {
> +			rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	sdio-pwrseq {
> +		wifi_enable_h: wifi-enable-h {
> +			rockchip,pins =3D <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	wifi {
> +		wifi_host_wake: wifi-host-wake {
> +			rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +
> +	bluetooth {
> +		bt_reg_on: bt-reg-on {
> +			rockchip,pins =3D <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		bt_wake_host: bt-wake-host {
> +			rockchip,pins =3D <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		host_wake_bt: host-wake-bt {
> +			rockchip,pins =3D <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&pwm0 {
> +	status =3D "okay";

status as last property

> +	pinctrl-0 =3D <&pwm0_pin_pull_down>;
> +};
> +
> +&saradc {
> +	vref-supply =3D <&vcc_1v8>;
> +	status =3D "okay";
> +};
> +
> +&pwm3 {

please sort phandles alphabetically

> +	status =3D "okay";
> +};
> +
> +&i2c1 {

same

> +	status =3D "okay";
> +};


Thanks
Heiko



