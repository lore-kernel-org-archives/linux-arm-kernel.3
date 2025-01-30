Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4590C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUy++D7rWEv8kx3eb43BTYyO0ymTKI8FyYrde/hPCJw=; b=Rc5i5AHeMbmjL9SvwsoSz1pLdW
	EIxlL4grBiRJAhlbjytkYc8TRe0p+JUnf/67nsvzqJ10HuGbmhqktLrG1DesWqEc1bAdcLGL7wCOl
	7P0qDO1EN92zCai2DLkipFr5BilyPbmdAg/EFr8uGJ2YkrQtwL/e0ReYB0FEz1U4khXicTKLS8fOV
	OGuaeWQOquhZTdiyVLP3Q1DXNN6YPMVLQlHHb2ltEYuifTWx5q5biqmLGPoFv6yMu7gaHgEWCadoT
	GpiZQLY6JjdEnnFKSif9GwulREyJkxrND2OLIJpUlYL1QEITKrSRT3Ro4k2tUE5r8qRgbJ0FfQLjg
	hjGjMvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTKF-00000008kUt-3Lyf;
	Thu, 30 Jan 2025 12:07:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTIw-00000008kMt-3BTc;
	Thu, 30 Jan 2025 12:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BBBC6A41DCD;
	Thu, 30 Jan 2025 12:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB455C4CED2;
	Thu, 30 Jan 2025 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738238752;
	bh=N9+aP35sgFfJsvBYos8MkBS8AdR7qkaK2Qnqd2yxZGk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s0e1hgaTsvjRhbnZqzyVQvPcx1FcDvyE44Ib2LDLq/bAPHy/XerDezQZyS4KH8fOO
	 Q7N9w6EKZC69+T2j8J6qHBfAJVVPVzkJRbwrAidk7WurhFw4lAMMVbIizlx90LHyTT
	 sb5ZU5bYccR7fNsFDcPYZzNhJaT1W5x9Y3vKgnL7jddvj3Lc6o3CgSaQE9EPxS55TD
	 MbkcMuz5J3kj/fUU9olqxJ36FOcQ8fIwIEZE/uO62SPs8hf879BB1GwTkHCDAER3NR
	 Z0rTvCs/Ctao1bSIEONvxqI9iSy5BK9+lONYaoB16eMfuR3Rro2LmdYpQkKuz1EEms
	 2YWvX2GXhi6WQ==
Message-ID: <cd6edfed-08a8-44de-9bfb-5199fd2813fd@kernel.org>
Date: Thu, 30 Jan 2025 13:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add MNT Reform 2
To: Patrick Wildt <patrick@blueri.se>, linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <Z5toOecuMiBXM6aF@windev.fritz.box>
 <Z5tobRnjXmr4dl7j@windev.fritz.box>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z5tobRnjXmr4dl7j@windev.fritz.box>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_040554_941562_38A8B9F3 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

On 30/01/2025 12:54, Patrick Wildt wrote:
> +
> +&hdptxphy_hdmi0 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0m2_xfer>;
> +	status = "okay";
> +
> +	vdd_cpu_big0_s0: vdd_cpu_big0_mem_s0: rk8602@42 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



> +		compatible = "rockchip,rk8602";
> +		reg = <0x42>;
> +
> +		vin-supply = <&vcc5v0_sys>;
> +		fcs,suspend-voltage-selector = <1>;
> +		rockchip,suspend-voltage-selector = <1>;
> +
> +		regulator-compatible = "rk860x-reg";
> +		regulator-name = "vdd_cpu_big0_s0";
> +		regulator-min-microvolt = <0x86470>;
> +		regulator-max-microvolt = <0x100590>;
> +		regulator-ramp-delay = <0x8fc>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vdd_cpu_big1_s0: vdd_cpu_big1_mem_s0: rk8603@43 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



> +		compatible = "rockchip,rk8602", "rockchip,rk8603";
> +		reg = <0x43>;
> +


...

> +&spi2 {
> +	status = "okay";
> +	assigned-clocks = <&cru CLK_SPI2>;
> +	assigned-clock-rates = <200000000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
> +	num-cs = <1>;
> +
> +	rk806single: pmic@0 {
> +		compatible = "rockchip,rk806";
> +		spi-max-frequency = <1000000>;
> +		reg = <0x0>;

reg is always theh second property.

> +
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default", "pmic-power-off";
> +		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
> +			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
> +		pinctrl-1 = <&rk806_dvs1_pwrdn>;
> +
> +		pmic-reset-func = <1>;
> +
> +		vcc1-supply = <&vcc5v0_sys>;
> +		vcc2-supply = <&vcc5v0_sys>;
> +		vcc3-supply = <&vcc5v0_sys>;
> +		vcc4-supply = <&vcc5v0_sys>;
> +		vcc5-supply = <&vcc5v0_sys>;
> +		vcc6-supply = <&vcc5v0_sys>;
> +		vcc7-supply = <&vcc5v0_sys>;
> +		vcc8-supply = <&vcc5v0_sys>;
> +		vcc9-supply = <&vcc5v0_sys>;
> +		vcc10-supply = <&vcc5v0_sys>;
> +		vcc11-supply = <&vcc_2v0_pldo_s3>;
> +		vcc12-supply = <&vcc5v0_sys>;
> +		vcc13-supply = <&vcc_1v1_nldo_s3>;
> +		vcc14-supply = <&vcc_1v1_nldo_s3>;
> +		vcca-supply = <&vcc5v0_sys>;
> +
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +
> +		rk806_dvs1_null: dvs1-null-pins {
> +			pins = "gpio_pwrctrl2";
> +			function = "pin_fun0";
> +		};
> +
> +		rk806_dvs1_slp: rk806_dvs1_slp {

No underscores in node names. Missing suffix also suggests this fails
tests, so standard disclaimer:

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.


> +			pins = "gpio_pwrctrl1";
> +			function = "pin_fun1";
> +		};

Best regards,
Krzysztof

