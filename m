Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1339606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sf737RfS;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=OpINkCMT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GGID1vEGmxlhJubnVm56qCe+584XOcxBg6J482g0XBI=; b=sf737RfSzs9RG/tvMv4yNqwC9L
	2EczuayYfO/KuXvCH440WgJwGClwM0ym29h58vBYet1whEQkT5oe4fCZKZBm4hIqxynDko6qe15Tf
	7lYGWC8yLHAL5wvVLvwnKEa+/ZSQ2OqUZq52ZSvszY17ySom2ePAtHz2VjAO0sryZuKtxEhAsqfQw
	wYg5tqhlFXphsusOAVNZD9H7WvDrq0ECG3ewUAdaNsNCoWR7lQ5u3UXA2utQF/aHORSh5tLvCRhnx
	glxlV46hegllwBc8Z5DOTX4HLRO5KbYFU6U3a9sOtbe/VcAmXzQswR3y0ztUjSRJFu5KmH2DPS/0x
	H1XJH4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyxI-00000009Lpg-2MMj;
	Thu, 05 Nov 2026 15:00:44 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyxE-00000009LpH-3uSH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:00:43 +0000
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 34AEB2020F5;
	Thu, 05 Nov 2026 16:00:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793890833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GGID1vEGmxlhJubnVm56qCe+584XOcxBg6J482g0XBI=;
	b=OpINkCMTWfmWgbQqY37XhoZ8X9wm4O2L3BWfnUPYRAth8HkmMe4fzWhQn3gBFzNG/ypfEs
	MpIITGdsaV+v/f8LVF8pR55ZZS3IvRtBNUW/jP7TUoX6hFdG0H3RadL2cRJE3UZ/Ky9fZO
	EErUUBqiW4uNvEqH+61XAW3mlge+z8XJHoKRAQJyXgvyftQx7ku0F96VYC3JWaSDIn/B5k
	BiQlGEDU3SH8knrpfiR5uNsGErlvw/i8HwhNiQjvgYNac2ZW4RvEXO/AA7sFXcImtOMRk+
	4lhvs5brzSaGqh3Urb7kvmSN+DLR7OVRaBnTvfAa3LJtw+UM1jTZ2TIGGOwVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793890833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GGID1vEGmxlhJubnVm56qCe+584XOcxBg6J482g0XBI=;
	b=AfEQ9ItYIfx67ZQHnZOiSCYhIozwM6hgy30D8bFub2sla6xj+BMUezQSQdRG3/tPvcLPXj
	Sr5aRX5kTa7JVA/iR6HEgIGZ+pQ6aOR1LjLHgT9SD45O3SpVaEgk8x/rC+cDTqsXsPbicc
	vwQ4NMzFtIxqO3ONlPtSK2HSznSrozM1U94k11rRluDsGsOkYLYa056Rmb74aLU9nZxL/M
	E8ZJsvmS4ZYA1nx0jdRbqecqmhvC27VsIeUxp4FYplS7LD8gYcvdShAAVRc8jkTkEKmEEz
	0FfC9Ni6nKqGbzSzi+RWRxBXf1Jvp4R8sI9WTFoLjZbYRXAIxZeOhjZxAUBGqA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793890833; a=rsa-sha256;
	cv=none;
	b=J43jk3juJ6r4hf7tDRXaaJIfsdU70nVFRR2ywvs2kQTcqrsRAqZkUq5TaTlbxVFpUF9EBw
	1bsCG/GTGWGXI92+iVgQeEsByCZqYvEI6xXYwN1N27ilZda6nOJxCR2xirGhM2zkJhqEiB
	NZ00yft5WBRR7/foUf9Qyj75qO9mtsQSASnndyRI1zgdVI8t5OWHNNFYjIzj1Ca3hw76xr
	0Vh7rGZXAIp3mfjdbr5jqp0iOEkFpKKim/5BCplmpTZKsrhwsGTIXe6E2ySnqT0ktN1Xji
	krki923h0pCgjSmo451il+FavEr48Z5gvelEDeQOrJmIFLN+rV0kzNj/nAb5dA==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 16AA81BF5CC; Thu, 05 Nov 2026 16:00:33 +0100 (CET)
Date: Thu, 5 Nov 2026 16:00:33 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
References: <20261105144920.2796623-2-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105144920.2796623-2-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_070041_193983_71FB8600 
X-CRM114-Status: GOOD (  18.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-05 08:49, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Rebased
> 
> It's been nearly a year and these are still orphans. There was a promise
> to upstream something for the kontron ones, but that hasn't happened.

That's unfortunate, but these includes are used at least by the barebox
bootloader [1,2], dropping these would cause a DT regresssion.

Would it help to upstream [1,2]?

Regards,
  Marco

[1] https://elixir.bootlin.com/barebox/v2026.10.0/source/arch/arm/dts/imx6dl-samx6i.dts#L8
[2] https://elixir.bootlin.com/barebox/v2026.10.0/source/arch/arm/dts/imx6q-samx6i.dts#L8

> 
>  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
>  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
>  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
>  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
>  4 files changed, 123 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> deleted file mode 100644
> index 5a9b819d7ee8..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR X11
> -/*
> - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> - */
> -
> -#include "imx6dl.dtsi"
> -#include "imx6qdl-kontron-samx6i.dtsi"
> -
> -/ {
> -	model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> -	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> deleted file mode 100644
> index e76963436079..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR X11
> -/*
> - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> - */
> -
> -#include "imx6q.dtsi"
> -#include "imx6qdl-kontron-samx6i.dtsi"
> -
> -/ {
> -	model = "Kontron SMARC-sAMX6i Quad/Dual";
> -	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> deleted file mode 100644
> index 3a968782e854..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -//
> -// Copyright 2017 NXP
> -
> -#include "imx6qdl-pico.dtsi"
> -
> -/ {
> -	leds {
> -		compatible = "gpio-leds";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_leds>;
> -
> -		led {
> -			label = "gpio-led";
> -			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> -
> -};
> -
> -&i2c1 {
> -	mpl3115@60 {
> -		compatible = "fsl,mpl3115";
> -		reg = <0x60>;
> -	};
> -};
> -
> -&i2c2 {
> -	io-expander@25 {
> -		compatible = "nxp,pca9554";
> -		reg = <0x25>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#interrupt-cells = <2>;
> -	};
> -
> -};
> -
> -&iomuxc {
> -	pinctrl_gpio_leds: gpioledsgrp {
> -		fsl,pins = <
> -			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
> -		>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> deleted file mode 100644
> index 3d56a4216448..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -
> -#include "imx6qdl-pico.dtsi"
> -
> -/ {
> -	leds {
> -		compatible = "gpio-leds";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_leds>;
> -
> -		led {
> -			label = "gpio-led";
> -			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> -
> -};
> -
> -&i2c1 {
> -	adc@52 {
> -		compatible = "ti,adc081c";
> -		reg = <0x52>;
> -		vref-supply = <&reg_2p5v>;
> -	};
> -};
> -
> -&i2c2 {
> -	io-expander@25 {
> -		compatible = "nxp,pca9554";
> -		reg = <0x25>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#interrupt-cells = <2>;
> -	};
> -};
> -
> -&i2c3 {
> -	rtc@68 {
> -		compatible = "dallas,ds1337";
> -		reg = <0x68>;
> -	};
> -};
> -
> -&pcie {
> -	status = "okay";
> -};
> -
> -&iomuxc {
> -	pinctrl_gpio_leds: gpioledsgrp {
> -		fsl,pins = <
> -			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
> -		>;
> -	};
> -};
> -- 
> 2.53.0
> 

