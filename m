Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CEFC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5L29TJa6m72S7CSmyGeNFab1Ftr8bq9pTOKm5Xk3pg=; b=uDdTpEf0nwAGlymrIJKlm1/oSr
	bHE4rPuTuK9KQX7t5T4Oj420KTmsCfSEeS2xYt7aXYdn/I62JqhR6NNe1FIPSlFtGV4iJX319NSzL
	uZelQCHZlwiscRIA8qvochy+1j0AsSnI+JYiD4frnL+5B4iiz019AcAVL+mPFFVoUyvc1PjJgl6w5
	J5hjeG9EmT9y7ogiFaG+qz46cOfjeRXbdlP1trb1hgmBe7Y8mJzieH9md9ImwTax5JImy3y57aBTs
	Z1vIMS25n/g5Hjj4vRjVtey4e8XfH7uV6aRcdginhQbLd2VrCqObdGIY46OnbmeOkal+girNi7ZjU
	Z8Ed/Tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te6hZ-0000000Bw7n-2wbB;
	Sat, 01 Feb 2025 06:09:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te6gE-0000000Bw29-2hSy;
	Sat, 01 Feb 2025 06:08:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso18736095e9.0;
        Fri, 31 Jan 2025 22:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738390113; x=1738994913; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5L29TJa6m72S7CSmyGeNFab1Ftr8bq9pTOKm5Xk3pg=;
        b=P4xD0hybSZmWfPIOr3Emzh5xsHQpLDhyENX6iYW/SVKrLuu6vZnlGIdAKgz9QZG6qu
         9xynZIszTa9EPr9t8SID4kDnW1zJg9rJ2AUjp1KWm4NpmHWxesN98djOmPoex4MYT4qh
         Mq/qPGDlbje/XqikWAkDLf9NfMHvFy4/rtfCbchIbKAFClRCkSKs3UtOfsufkm5SAoBe
         8EPEvYNQ80Gs48F9MBuzTpkcC2icJ71jwTi/JmtoKq9kxbGg78brQD+zFPzPlgVZGUYB
         vn5qRDhENK/Ry4Umjq4XgrVDZqvEEVxQ/wzR0Jq7UD5Z5iy6NYiRZhbnMcz9rs1x+8vB
         PXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738390113; x=1738994913;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5L29TJa6m72S7CSmyGeNFab1Ftr8bq9pTOKm5Xk3pg=;
        b=IqsI0025z1BEv/MZbw4i3U8oTjW358oDhmiyCCuwX5f1TZoomwfC8Anirmqe+DFuK2
         YZX2HEQu9ZWm7cYG76iIPdGd8VzDaZ7Ilh/1mtmtYEBNMslD4Nvni9lOprQbPVIi89iH
         /wr+71EH8S48z+wIY034M/bALZrnU/BGkeNi2BYRSsKnvtMduCPLy8TAvoQvP2vPRoso
         eP/2S8gtjHZU4+fZLgdkR4Ni1VVwzdP1XtDHDTpZ0IrT1UnShOMnUIu5Fd4iljo4ULzv
         bsmlIIpDGYokumdlaeiA0z8lbfR54osB9puheZiw+rnBa9VWbIcgWnvUak6Bn10oTW1a
         +vRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQjCy0uoC/kM3Lpez2qhOECeCwMKF5cGzrGyZuPClfHlFLeXziSV5Eif3Z5Jzui8o0ke7UY35z2ooNTgR5@lists.infradead.org, AJvYcCWIJEwuYfSX/ii4os7J+RhwcnLvH0j1vbaE3LRbe8Pn5TihiM8eHsh93PljMeE18e7ayVpRe4g4dP9WV0m8fg+idQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8vXUM4hYlGRFB2kEzs5DyKd05FW705bva3kcOa7POC0LsVcxz
	E9sGow9n0rkdP57/tCGZwa5UEu0b6TcrS/IvXdGCmteuuB+z0oOd
X-Gm-Gg: ASbGncv/bIHzaD2ZY8YKN5OVt8mol1+qKkzfHEAnQro2kIrQ3//cFjbkP2UdV8Wxzrc
	1O6F5kNUZrUeHi0gAAhdVXRplJHKUIUAjmAOjAHiKyuAPvWbbI65Oc1KVrYjpiOgmL6sx0Yh7rC
	bcJxLigT2L/vY1qgijidleZ6uRySaixNW+p/ik52srtiTK5DcUpmwAbdV7k/c18FOx2EXvZUMET
	1JfRpAY0GSwk2/QPe2yXFaJQvIzh2624l7C+DI6MARkq0jGzKluYi1rwrZgZfY4jbER4ALqKjmi
	H9xf4jN42zE9JDnzpli6z/HsAOoVagDdSiurYQ==
X-Google-Smtp-Source: AGHT+IEYH0pv6AduWyKxWc4Cd6i+pLbjNEsHL1oQVmGX+xC5axAa4pD6AzuvU5iIR9IRc8PkpJqOFw==
X-Received: by 2002:a05:6000:188b:b0:385:f2a2:50df with SMTP id ffacd0b85a97d-38c5195f498mr12879535f8f.27.1738390112591;
        Fri, 31 Jan 2025 22:08:32 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d42dfsm78311155e9.4.2025.01.31.22.08.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2025 22:08:32 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250131200319.19996-3-funderscore@postmarketos.org>
Date: Sat, 1 Feb 2025 10:08:17 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>,
 Karl Chan <exxxxkc@getgoogleoff.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5270ED13-CF9D-4ACE-A52C-EFDB0F71494E@gmail.com>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
 <20250131200319.19996-3-funderscore@postmarketos.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_220834_692999_2C6FB2B0 
X-CRM114-Status: GOOD (  25.88  )
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

> On 1 Feb 2025, at 12:03=E2=80=AFam, Ferass El Hafidi =
<funderscore@postmarketos.org> wrote:
>=20
> From: Ferass El Hafidi <funderscore@postmarketos.org>
>=20
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released =
in=20
> 2020.  It is known as `xiaomi-aquaman` internally.  Specifications:
> * Amlogic S805Y SoC
> * Android TV 9, upgradable to Android TV 10
> * 8 GB eMMC
> * 1 GB of RAM
>=20
> The devicetree is based on p241's DT, with some changes to better =
match
> the Mi TV Stick.

Explain the bits that are omitted/different (see comments below).

>=20
> Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
> ---
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../meson-gxl-s805y-xiaomi-aquaman.dts        | 311 ++++++++++++++++++
> 2 files changed, 312 insertions(+)
> create mode 100644 =
arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile =
b/arch/arm64/boot/dts/amlogic/Makefile
> index 2fbda8419..0921707f1 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -49,6 +49,7 @@ dtb-$(CONFIG_ARCH_MESON) +=3D =
meson-gxbb-wetek-hub.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-wetek-play2.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s805x-libretech-ac.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s805x-p241.dtb
> +dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s805y-xiaomi-aquaman.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s905d-libretech-pc.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s905d-mecool-kii-pro.dtb
> dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxl-s905d-p230.dtb
> diff --git =
a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts =
b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> new file mode 100644
> index 000000000..6b72f054a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Ferass El Hafidi <funderscore@postmarketos.org>
> + * Based on meson-gxl-s805x-p241.dtb:
> + *  - Copyright (c) 2018 BayLibre, SAS.
> + *    Author: Neil Armstrong <narmstrong@baylibre.com>
> + *    Author: Jerome Brunet <jbrunet@baylibre.com>

If this was cloned from the p241 file I would retain the Baylibre
Copyright and add myself as an additional author. You=E2=80=99ve =
extended
their work not created a new one.

> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/meson-aiu.h>
> +
> +#include "meson-gxl-s805x.dtsi"

Amlogic Y variants normally omit CVBS, Ethernet, SD, and sometimes IR,
so you could clone the s805x.dtsi and remove nodes there, then include
an s805y.dtsi file. Perhaps not worth the effort for a single device
at this time, but could be done as future optimisation.

> +
> +/ {
> + compatible =3D "xiaomi,aquaman", "amlogic,s805x", =
"amlogic,meson-gxl";

After updating the bindings, use =E2=80=9Camlogic,s805y=E2=80=9D here.

> + model =3D "Xiaomi Mi TV Stick (S805Y)";

I=E2=80=99d use =E2=80=9CXiaomi Mi TV Stick (Aquaman)=E2=80=9D so the =
connection between the
binding name and model name is obvious.

> +
> + aliases {
> + serial0 =3D &uart_AO;
> + serial1 =3D &uart_A;
> + };
> +
> + au2: analog-amplifier {
> + compatible =3D "simple-audio-amplifier";
> + sound-name-prefix =3D "AU2";
> + VCC-supply =3D <&vcc_5v>;
> + enable-gpios =3D <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> + };
> +
> + chosen {
> + stdout-path =3D "serial0:115200n8";
> + };
> +
> + cvbs-connector {
> + /* No CVBS connector */
> + status =3D "disabled";
> + };
> +
> + emmc_pwrseq: emmc-pwrseq {
> + compatible =3D "mmc-pwrseq-emmc";
> + reset-gpios =3D <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> + };
> +
> + hdmi-connector {
> + compatible =3D "hdmi-connector";
> + type =3D "a";
> +
> + port {
> + hdmi_connector_in: endpoint {
> + remote-endpoint =3D <&hdmi_tx_tmds_out>;
> + };
> + };
> + };
> +
> + leds {
> + compatible =3D "gpio-leds";
> +
> + led-white {
> + color =3D <LED_COLOR_ID_WHITE>;
> + function =3D LED_FUNCTION_POWER;
> + gpios =3D <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> + default-state =3D "heartbeat";
> + panic-indicator;
> + };
> + };
> +
> + memory@0 {
> + device_type =3D "memory";
> + reg =3D <0x0 0x0 0x0 0x40000000>;
> + };
> +
> + vddio_boot: regulator-vddio-boot {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDIO_BOOT";
> + regulator-min-microvolt =3D <1800000>;
> + regulator-max-microvolt =3D <1800000>;
> + };
> +
> + vddao_3v3: regulator-vddao-3v3 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDAO_3V3";
> + regulator-min-microvolt =3D <3300000>;
> + regulator-max-microvolt =3D <3300000>;
> + };
> +
> + vddio_ao18: regulator-vddio-ao18 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VDDIO_AO18";
> + regulator-min-microvolt =3D <1800000>;
> + regulator-max-microvolt =3D <1800000>;
> + };
> +
> + vcc_3v3: regulator-vcc-3v3 {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VCC_3V3";
> + regulator-min-microvolt =3D <3300000>;
> + regulator-max-microvolt =3D <3300000>;
> + };
> +
> + vcc_5v: regulator-vcc-5v {
> + compatible =3D "regulator-fixed";
> + regulator-name =3D "VCC_5V";
> + regulator-min-microvolt =3D <5000000>;
> + regulator-max-microvolt =3D <5000000>;
> + };
> +
> +
> + emmc_pwrseq: emmc-pwrseq {
> + compatible =3D "mmc-pwrseq-emmc";
> + reset-gpios =3D <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> + };
> +
> + wifi32k: wifi32k {
> + compatible =3D "pwm-clock";
> + #clock-cells =3D <0>;
> + clock-frequency =3D <32768>;
> + pwms =3D <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> + };
> +
> + sdio_pwrseq: sdio-pwrseq {
> + compatible =3D "mmc-pwrseq-simple";
> + reset-gpios =3D <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> + clocks =3D <&wifi32k>;
> + clock-names =3D "ext_clock";
> + };
> +
> + sound {
> + compatible =3D "amlogic,gx-sound-card";
> + model =3D "MI-AQUAMAN";

Just =E2=80=9CAQUAMAN=E2=80=9D ?

> + audio-aux-devs =3D <&au2>;
> + audio-widgets =3D "Line", "Lineout";
> + audio-routing =3D "AU2 INL", "ACODEC LOLN",
> + "AU2 INR", "ACODEC LORN",
> + "Lineout", "AU2 OUTL",
> + "Lineout", "AU2 OUTR";
> + clocks =3D <&clkc CLKID_MPLL0>,
> + <&clkc CLKID_MPLL1>,
> + <&clkc CLKID_MPLL2>;
> +
> + assigned-clocks =3D <&clkc CLKID_MPLL0>,
> +  <&clkc CLKID_MPLL1>,
> +  <&clkc CLKID_MPLL2>;
> + assigned-clock-parents =3D <0>, <0>, <0>;
> + assigned-clock-rates =3D <294912000>,
> +       <270950400>,
> +       <393216000>;
> +
> + dai-link-0 {
> + sound-dai =3D <&aiu AIU_CPU CPU_I2S_FIFO>;
> + };
> +
> + dai-link-1 {
> + sound-dai =3D <&aiu AIU_CPU CPU_I2S_ENCODER>;
> + dai-format =3D "i2s";
> + mclk-fs =3D <256>;
> +
> + codec-0 {
> + sound-dai =3D <&aiu AIU_HDMI CTRL_I2S>;
> + };
> +
> + codec-1 {
> + sound-dai =3D <&aiu AIU_ACODEC CTRL_I2S>;
> + };
> + };
> +
> + dai-link-2 {
> + sound-dai =3D <&aiu AIU_HDMI CTRL_OUT>;
> +
> + codec-0 {
> + sound-dai =3D <&hdmi_tx>;
> + };
> + };
> +
> + dai-link-3 {
> + sound-dai =3D <&aiu AIU_ACODEC CTRL_OUT>;
> +
> + codec-0 {
> + sound-dai =3D <&acodec>;
> + };
> + };
> + };
> +};
> +
> +&acodec {
> + AVDD-supply =3D <&vddio_ao18>;
> + status =3D "okay";
> +};
> +
> +&aiu {
> + status =3D "okay";
> +};
> +
> +&cec_AO {
> + status =3D "okay";
> + pinctrl-0 =3D <&ao_cec_pins>;
> + pinctrl-names =3D "default";
> + hdmi-phandle =3D <&hdmi_tx>;
> +};
> +
> +&ethmac {
> + /* No Ethernet connector */
> + status =3D "disabled";
> +};
> +
> +&internal_phy {
> + pinctrl-0 =3D <&eth_link_led_pins>, <&eth_act_led_pins>;
> + pinctrl-names =3D "default";
> +};
> +
> +&ir {
> + /* No IR */
> + status =3D "disabled";
> +};
> +
> +&hdmi_tx {
> + status =3D "okay";
> + pinctrl-0 =3D <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> + pinctrl-names =3D "default";
> + hdmi-supply =3D <&vcc_5v>;
> +};
> +
> +&hdmi_tx_tmds_port {
> + hdmi_tx_tmds_out: endpoint {
> + remote-endpoint =3D <&hdmi_connector_in>;
> + };
> +};
> +
> +&saradc {
> + status =3D "okay";
> + vref-supply =3D <&vddio_ao18>;
> +};
> +
> +/* Wireless SDIO Module */
> +&sd_emmc_a {
> + status =3D "disabled";
> + pinctrl-0 =3D <&sdio_pins>;
> + pinctrl-1 =3D <&sdio_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> + #address-cells =3D <1>;
> + #size-cells =3D <0>;
> +
> + bus-width =3D <4>;
> + cap-sd-highspeed;
> + max-frequency =3D <50000000>;
> +
> + non-removable;
> + disable-wp;
> +
> + /* WiFi firmware requires power to be kept while in suspend */
> + keep-power-in-suspend;
> +
> + mmc-pwrseq =3D <&sdio_pwrseq>;
> +
> + vmmc-supply =3D <&vddao_3v3>;
> + vqmmc-supply =3D <&vddio_boot>;

If you add a generic SDIO node here board variants will have working
WiFi regardless of the module used. The idea is used here:

=
https://patchwork.kernel.org/project/linux-amlogic/patch/20241127043358.37=
99737-1-christianshewitt@gmail.com/

> +};
> +
> +/* eMMC */
> +&sd_emmc_c {
> + status =3D "okay";
> + pinctrl-0 =3D <&emmc_pins>, <&emmc_ds_pins>;
> + pinctrl-1 =3D <&emmc_clk_gate_pins>;
> + pinctrl-names =3D "default", "clk-gate";
> +
> + bus-width =3D <8>;
> + cap-mmc-highspeed;
> + max-frequency =3D <200000000>;
> + non-removable;
> + disable-wp;
> + mmc-ddr-1_8v;
> + mmc-hs200-1_8v;
> +
> + mmc-pwrseq =3D <&emmc_pwrseq>;
> + vmmc-supply =3D <&vcc_3v3>;
> + vqmmc-supply =3D <&vddio_boot>;
> +};
> +
> +&pwm_ef {
> + status =3D "okay";
> + pinctrl-0 =3D <&pwm_e_pins>;
> + pinctrl-names =3D "default";
> + clocks =3D <&clkc CLKID_FCLK_DIV4>;
> + clock-names =3D "clkin0";
> +};
> +
> +/* This is connected to the Bluetooth module: */
> +&uart_A {
> + status =3D "okay";
> + pinctrl-0 =3D <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> + pinctrl-names =3D "default";
> + uart-has-rtscts;
> +};
> +
> +&uart_AO {
> + status =3D "okay";
> + pinctrl-0 =3D <&uart_ao_a_pins>;
> + pinctrl-names =3D "default";
> +};
> +
> +&usb {
> + status =3D "okay";
> + dr_mode =3D "host";
> +};
> +
> +&usb2_phy0 {
> + phy-supply =3D <&vcc_5v>;
> +};
> --=20
> 2.47.1
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


