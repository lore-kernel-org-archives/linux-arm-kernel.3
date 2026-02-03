Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435CAE87855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3vv76smtIuT2OXkL6CzgGGbQ/ZXl+Qn6Gh6GsyLJoE=; b=j2uY0CVGjIaX5cKBzo0vgLfWTl
	k52PpMlK8IY4BdTRX/xVpUXbjw6HWjubue98MS/9NR6JSem1y8EA8G6oQzXVtewgtivTv+y1NYy4B
	4Q8cYINXf6/4j59PiLO6ywOA14voLC46kzcRZF03BHxvAP/kuLZG2viZZkHiiwJSMbljgJummLntN
	nlvtlQ3Z+6nELau80jd8ZjxN76SzAIw+7Mu8F/QC7fo8n6sTpaCONZM8DuqadPngBdH01W9OjuJrH
	5zBYnYw+AJHoVYPdtuWFSGKXkkXLs/1vKcR/4tlOp0jljz5q9rIZWHMakvUGlNpmHczgrcGJhYQa0
	mtArtpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLDH-000000079on-1lam;
	Tue, 03 Feb 2026 18:33:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLDF-000000079oW-3nsg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Feb 2026 18:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t3vv76smtIuT2OXkL6CzgGGbQ/ZXl+Qn6Gh6GsyLJoE=; b=aDgLfXQN5yvbT1salP6rg6U01f
	zFLF8TxKoIWcRy4Nf3O71h+JBQxJbpwpKCDS5VCIf1mQLHu9pwvQ4vOAufmEPe0wHHLyY9vS3+PHc
	RfDuVzGrO3mHwjH+aEmdZZxYSC8sB0JhluKcAj6de1AKVKcSWyXvWqr7Iy3zxYwcMJk+u/PeA1Wem
	wn/7/L6IyfmN7a3mIhtAQhFa/B13pKb4FPHoqk9rhHV4BPYWbKqmhdk4TXpzzsgeK84dTGyJlL5RH
	9nkYzodvdMPdavfTHxNq4uPhKD553WIyUo8lPhSYRLCLmAqGZqgfAjOSJCsWe/So/gWCdWipawPOE
	T+enZ4Ew==;
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLDC-0000000GrGA-22KV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:33:20 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-40866608701so3193110fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 10:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770143596; cv=none;
        d=google.com; s=arc-20240605;
        b=JhLWA5CLPzkFfHTd+66n3WJWJVaOw69tLZX+BSpBFlril3lv/er1IaUCQgM7LvhVUY
         5E0zp9hpLiJxwpt8bD+a4zAZK+/C/Cb2lBa1RO9VLfpnkSCyxw6Tiqe4sy71vqh1UD6N
         pbqZnBulV3dVBTRlbNEXN7USwH5lCxjuscYqGhLc+hzc9B0nBRxtkKgqNk9QTHfuPEET
         0zdTZPYDWsNJWZ4ocRitsn1OMuL9MPVz/H94wS+Kr8IhVDpeJP9mbrZEaR2NZON6YiO7
         FnHGC/PYaxSG69lsv3TcuUv0IHYWCcWYgVXEF6JYyHClYBzmLKPAgT6QPZ8dSVOxuMKu
         VS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t3vv76smtIuT2OXkL6CzgGGbQ/ZXl+Qn6Gh6GsyLJoE=;
        fh=sgdUmqWFABRXFqLbzu6qpEBIeaz8CeKj4guHaQ7EYM0=;
        b=dE7WOsqH26KN4Vr76fTF1ygBav9yQyH6IgvQk3GBsAZ2HjO01s4c5TkVhcItZjVP8r
         pVE+f7uNMQ1w6uEW8bqIUwgjixdkQivEARcIzo6gCNcTc7YRC5ATVZLnu50CZtbi43Y+
         sErnHLkS3TZ3O5jj7xh7vIR8uuzIcnHl0fQ7R7Pjj6WEazd07T+F/DXGVj1+T2hD1Pek
         QV84ndf5AJlbsLzGZHknj6OJsZdLoil3a8PYXzHCrUVQ0lO5eDYJ+6DZSW23yc2uQgjx
         LvUqBeZTOnN9slKGhaX+UC/Dj4+0Am9ENHg9KDrqNo0/BaESY1CpigaR3yCkYBMobVx7
         0QVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1770143596; x=1770748396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3vv76smtIuT2OXkL6CzgGGbQ/ZXl+Qn6Gh6GsyLJoE=;
        b=hqXkM9KoXW6nKjd2CQt7ommhCajfsXgnE9Tc+jgPW4fuBpo/oRjcyTtTE3PcL1+CxY
         Iq2Cxq641afYED8lJ/vSscuktx9VDoFPLUOoARlJUidQc6ccMWTU7QvBZW9Z8P1gVbLt
         PMJMi+QUwlMrmhe2WIqPNbRZq3I5lwhFrOn1bkUfk8zHY5g/vVCNbQAgyPce9B4vMJoE
         Vy5Ro2i9HmrxB6d0i2fO5fFgpleebxSQb8OHEm4kTdbCTI2lkPFKLDJQ9rAask45bbTq
         BTYZf6+I+g9DPstZ5GhMkurNYFVQWzAVR/okG6t4dfr57TAEjnGVvM9Y7CNlcHAZF5QP
         vgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770143596; x=1770748396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3vv76smtIuT2OXkL6CzgGGbQ/ZXl+Qn6Gh6GsyLJoE=;
        b=LNeFE08Xaki7OPMnb0AAbHVIFcJN29DdR81X0O+KAh0IBpNjaMpezW1WQ212W5RH93
         Azc9XK+15qNyD8DyuN3iYLx7hHRJNxVmEgHYOSvchinZX/3TRC7h08vZ9SORUGF8FD91
         5tV+aVscGWpNfZXDP6fKJrXRRwU/KFQ+T8auN6lKFggsEomgy8add4OtEnL4jmQWPX8y
         MBtW9ia4djitZuvTnqiRICV+vzHZ/+6Cs0FHi29G8gfOAMFHs+K2/5CkUruufO6bnXJf
         qq8TiXdKa45nhG7K92ywtIdY4PLCkWH9CEw1zgBdmYmd4BefqX9G8ViuSCAdI8h1K/3D
         rTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRFf+vSHbBQaL+El8DH/m2pY/ZBTr2ho7LO47EMPWK6mV4IdPjDTpuNKmgNWAt5B8roo+Hs26lfhPRKPOIsA8h@lists.infradead.org
X-Gm-Message-State: AOJu0YyG0m5Ttiq4Gi0nrcrgXku0XYsUQzCPHEG7DfBQgmOoP/JZ6yIS
	6ephJJtrcH0ZWOtNi1OMMcpaVMTHOd0S5bKjhM6ofrfOLXGaCTfyuax98H4NCtdIsY8kkUwyVen
	PHB90izGL1b1L7+qyyM0gpaiOI9jaaZ7uFw2cHCEXyQ==
X-Gm-Gg: AZuq6aKKPtYeH65jO8npNlqemmgBoVDa7yrjN7BH4mnLWaPAx7oXjEzn+Mb/yFyoJ9n
	EdUNfZ2ZtvEOo0cINi+0YGvoYTvj5JQ1ernwX6ZHZDHYCV8SyNSqFE2mjLz9CF9+6mp52RZ+Bd+
	yLf6NSusDIQxN/MSNZsJg17IXUz0MF7aZiyQR94aYQFM7rT+hqpjrm22dTOoEYfYY7DdAHEWIJZ
	ietI9rhPufBMhZoKLqibQ3yXcgeXz/H0dtPU+6ZjfTiMjRXsgJlwWpiMovmOLoSDrxOAsg=
X-Received: by 2002:a05:6820:460b:b0:65d:aa2:2e30 with SMTP id
 006d021491bc7-66a20e5a269mr232470eaf.28.1770143595944; Tue, 03 Feb 2026
 10:33:15 -0800 (PST)
MIME-Version: 1.0
References: <20260202181029.1832198-1-tharvey@gateworks.com>
 <20260202181029.1832198-2-tharvey@gateworks.com> <aYD4BwB3McK45vCk@lizhi-Precision-Tower-5810>
In-Reply-To: <aYD4BwB3McK45vCk@lizhi-Precision-Tower-5810>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 3 Feb 2026 10:33:03 -0800
X-Gm-Features: AZwV_QhKjPJbA6Vmjf-Q_euzKlxloI1sFd5BwuS6dzfZRpW8mJuxXVqgU-TfAA4
Message-ID: <CAJ+vNU0rwpoedAvPH5whLSXKHXX+jbsnAy1hKx_0To8KoMqBvA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts support
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_183318_726528_97E53C06 
X-CRM114-Status: GOOD (  23.35  )
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

On Mon, Feb 2, 2026 at 11:16=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Feb 02, 2026 at 10:10:29AM -0800, Tim Harvey wrote:
> > The GW7906 is based on the i.MX8M Mini SoC featuring:
> >  - LPDDR4 DRAM
> >  - eMMC FLASH
> >  - microSD connector with UHS support
> >  - LIS2DE12 3-axis accelerometer
> >  - Gateworks System Controller
> >  - IMX8M FEC
> >  - software selectable RS232/RS485/RS422 serial transceiver
> >  - PMIC
> >  - 1x isolated RS232 UART
> >  - 1x off-board bi-directional opto-isolated digital I/O
> >  - 1x M.2 A-E Key Socket and 1x MiniPCIe socket with USB2.0 and PCIe
> >    (resistor loading to route PCIe/USB2 between M.2 and MiniPCIe socket=
)
> >
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > ---
>
> Any difference with gateworks,imx8mm-gw7904? Can reuse existed file?
>

Hi Frank,

It has much more commonality with the gw7903 - I'll submit a v2 using
that as a base.

>
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../dts/freescale/imx8mm-venice-gw7906.dts    | 869 ++++++++++++++++++
> >  2 files changed, 870 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.=
dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/d=
ts/freescale/Makefile
> > index 700bab4d3e60..83fc7faf81d8 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7901.dt=
b
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7902.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7903.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7904.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-venice-gw7906.dtb
>
> Please run https://github.com/lznuaa/dt-format for new dts to keep nice
> node order,
>
> If output result is not good enough, let know

I notice you asking people to do this but is that tool robust? Every
dts I through at it crashes:

$ git clone https://github.com/lznuaa/dt-format.git
$ cd dt-format
$ make
$ ./dt-format ~/linux-6.18/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
Segmentation fault (core dumped)

Best Regards,

Tim

>
> Frank
>
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-dahlia.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-dev.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-ivy.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts b/a=
rch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > new file mode 100644
> > index 000000000000..ec146a2b7549
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > @@ -0,0 +1,869 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 Gateworks Corporation
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/net/ti-dp83867.h>
> > +#include <dt-bindings/phy/phy-imx8-pcie.h>
> > +
> > +#include "imx8mm.dtsi"
> > +
> > +/ {
> > +     model =3D "Gateworks Venice GW7906 i.MX8MM board";
> > +     compatible =3D "gateworks,imx8mm-gw7906", "fsl,imx8mm";
> > +
> > +     aliases {
> > +             ethernet0 =3D &fec1;
> > +             rtc0 =3D &gsc_rtc;
> > +             rtc1 =3D &snvs_rtc;
> > +             usb0 =3D &usbotg1;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D &uart2;
> > +     };
> > +
> > +     memory@40000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x0 0x40000000 0 0x80000000>;
> > +     };
> > +
> > +     gpio-keys {
> > +             compatible =3D "gpio-keys";
> > +
> > +             key-user-pb {
> > +                     label =3D "user_pb";
> > +                     gpios =3D <&gpio 2 GPIO_ACTIVE_LOW>;
> > +                     linux,code =3D <BTN_0>;
> > +             };
> > +
> > +             key-user-pb1x {
> > +                     label =3D "user_pb1x";
> > +                     linux,code =3D <BTN_1>;
> > +                     interrupt-parent =3D <&gsc>;
> > +                     interrupts =3D <0>;
> > +             };
> > +
> > +             key-erased {
> > +                     label =3D "key_erased";
> > +                     linux,code =3D <BTN_2>;
> > +                     interrupt-parent =3D <&gsc>;
> > +                     interrupts =3D <1>;
> > +             };
> > +
> > +             key-eeprom-wp {
> > +                     label =3D "eeprom_wp";
> > +                     linux,code =3D <BTN_3>;
> > +                     interrupt-parent =3D <&gsc>;
> > +                     interrupts =3D <2>;
> > +             };
> > +
> > +             switch-hold {
> > +                     label =3D "switch_hold";
> > +                     linux,code =3D <BTN_5>;
> > +                     interrupt-parent =3D <&gsc>;
> > +                     interrupts =3D <7>;
> > +             };
> > +     };
> > +
> > +     led-controller {
> > +             compatible =3D "gpio-leds";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&pinctrl_gpio_leds>;
> > +
> > +             led-0 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_RED>;
> > +                     label =3D "led01_red";
> > +                     gpios =3D <&gpio5 5 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-1 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     label =3D "led01_grn";
> > +                     gpios =3D <&gpio4 30 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-2 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_RED>;
> > +                     label =3D "led02_red";
> > +                     gpios =3D <&gpio5 2 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-3 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     label =3D "led02_grn";
> > +                     gpios =3D <&gpio1 14 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-4 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_RED>;
> > +                     label =3D "led03_red";
> > +                     gpios =3D <&gpio1 9 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-5 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     label =3D "led03_grn";
> > +                     gpios =3D <&gpio5 3 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-6 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_RED>;
> > +                     label =3D "led04_red";
> > +                     gpios =3D <&gpio4 29 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-7 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     label =3D "led04_grn";
> > +                     gpios =3D <&gpio4 28 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-8 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_RED>;
> > +                     label =3D "led05_red";
> > +                     gpios =3D <&gpio1 13 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-9 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     label =3D "led05_grn";
> > +                     gpios =3D <&gpio4 31 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-a {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_RED>;
> > +                     label =3D "led06_red";
> > +                     gpios =3D <&gpio5 4 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +
> > +             led-b {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     label =3D "led06_grn";
> > +                     gpios =3D <&gpio1 8 GPIO_ACTIVE_HIGH>;
> > +                     default-state =3D "off";
> > +             };
> > +     };
> > +
> > +     pcie0_refclk: pcie0-refclk {
> > +             compatible =3D "fixed-clock";
> > +             #clock-cells =3D <0>;
> > +             clock-frequency =3D <100000000>;
> > +     };
> > +
> > +     reg_3p3v: regulator-3p3v {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "3P3V";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
> > +};
> > +
> > +&A53_0 {
> > +     cpu-supply =3D <&buck2>;
> > +};
> > +
> > +&A53_1 {
> > +     cpu-supply =3D <&buck2>;
> > +};
> > +
> > +&A53_2 {
> > +     cpu-supply =3D <&buck2>;
> > +};
> > +
> > +&A53_3 {
> > +     cpu-supply =3D <&buck2>;
> > +};
> > +
> > +&ddrc {
> > +     operating-points-v2 =3D <&ddrc_opp_table>;
> > +
> > +     ddrc_opp_table: opp-table {
> > +             compatible =3D "operating-points-v2";
> > +
> > +             opp-25000000 {
> > +                     opp-hz =3D /bits/ 64 <25000000>;
> > +             };
> > +
> > +             opp-100000000 {
> > +                     opp-hz =3D /bits/ 64 <100000000>;
> > +             };
> > +
> > +             opp-750000000 {
> > +                     opp-hz =3D /bits/ 64 <750000000>;
> > +             };
> > +     };
> > +};
> > +
> > +&fec1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_fec1>;
> > +     phy-mode =3D "rgmii-id";
> > +     phy-handle =3D <&ethphy0>;
> > +     local-mac-address =3D [00 00 00 00 00 00];
> > +     status =3D "okay";
> > +
> > +     mdio {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             ethphy0: ethernet-phy@0 {
> > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
> > +                     ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> > +                     ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_=
NS>;
> > +                     ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_=
NS>;
> > +                     tx-fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_N=
IB>;
> > +                     rx-fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_N=
IB>;
> > +
> > +                     leds {
> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <0>;
> > +
> > +                             led@1 {
> > +                                     reg =3D <1>;
> > +                                     color =3D <LED_COLOR_ID_AMBER>;
> > +                                     function =3D LED_FUNCTION_LAN;
> > +                                     default-state =3D "keep";
> > +                             };
> > +
> > +                             led@2 {
> > +                                     reg =3D <2>;
> > +                                     color =3D <LED_COLOR_ID_GREEN>;
> > +                                     function =3D LED_FUNCTION_LAN;
> > +                                     default-state =3D "keep";
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&gpio1 {
> > +     gpio-line-names =3D "", "", "", "", "", "", "", "",
> > +             "", "", "rs422_en#", "rs485_en#", "rs232_en#", "", "", ""=
,
> > +             "", "", "", "", "", "", "", "",
> > +             "", "", "", "", "", "", "", "";
> > +};
> > +
> > +&gpio2 {
> > +     gpio-line-names =3D "", "", "", "", "", "", "dig1_ctl", "",
> > +             "dig1_out#", "dig1_in", "", "", "", "", "", "",
> > +             "", "", "", "", "", "", "", "",
> > +             "", "", "", "", "", "", "", "";
> > +};
> > +
> > +&gpio5 {
> > +     gpio-line-names =3D "", "", "", "", "", "", "", "",
> > +             "", "", "", "", "pci_wdis#", "", "", "",
> > +             "", "", "", "", "", "", "", "",
> > +             "", "", "", "", "", "", "", "";
> > +};
> > +
> > +&i2c1 {
> > +     clock-frequency =3D <100000>;
> > +     pinctrl-names =3D "default", "gpio";
> > +     pinctrl-0 =3D <&pinctrl_i2c1>;
> > +     pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
> > +     scl-gpios =3D <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +     sda-gpios =3D <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +     status =3D "okay";
> > +
> > +     gsc: gsc@20 {
> > +             compatible =3D "gw,gsc";
> > +             reg =3D <0x20>;
> > +             pinctrl-0 =3D <&pinctrl_gsc>;
> > +             interrupt-parent =3D <&gpio4>;
> > +             interrupts =3D <26 IRQ_TYPE_EDGE_FALLING>;
> > +             interrupt-controller;
> > +             #interrupt-cells =3D <1>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             adc {
> > +                     compatible =3D "gw,gsc-adc";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     channel@6 {
> > +                             gw,mode =3D <0>;
> > +                             reg =3D <0x06>;
> > +                             label =3D "temp";
> > +                     };
> > +
> > +                     channel@8 {
> > +                             gw,mode =3D <3>;
> > +                             reg =3D <0x08>;
> > +                             label =3D "vdd_bat";
> > +                     };
> > +
> > +                     channel@82 {
> > +                             gw,mode =3D <2>;
> > +                             reg =3D <0x82>;
> > +                             label =3D "vin";
> > +                             gw,voltage-divider-ohms =3D <22100 1000>;
> > +                             gw,voltage-offset-microvolt =3D <700000>;
> > +                     };
> > +
> > +                     channel@84 {
> > +                             gw,mode =3D <2>;
> > +                             reg =3D <0x84>;
> > +                             label =3D "vdd_5p0";
> > +                             gw,voltage-divider-ohms =3D <10000 10000>=
;
> > +                     };
> > +
> > +                     channel@86 {
> > +                             gw,mode =3D <2>;
> > +                             reg =3D <0x86>;
> > +                             label =3D "vdd_3p3";
> > +                             gw,voltage-divider-ohms =3D <10000 10000>=
;
> > +                     };
> > +
> > +                     channel@88 {
> > +                             gw,mode =3D <2>;
> > +                             reg =3D <0x88>;
> > +                             label =3D "vdd_0p9";
> > +                     };
> > +
> > +                     channel@8c {
> > +                             gw,mode =3D <2>;
> > +                             reg =3D <0x8c>;
> > +                             label =3D "vdd_soc";
> > +                     };
> > +
> > +                     channel@8e {
> > +                             gw,mode =3D <2>;
> > +                             reg =3D <0x8e>;
> > +                             label =3D "vdd_arm";
> > +                     };
> > +
> > +                     channel@90 {
> > +                             gw,mode =3D <2>;
> > +                             reg =3D <0x90>;
> > +                             label =3D "vdd_1p8";
> > +                     };
> > +
> > +                     channel@92 {
> > +                             gw,mode =3D <2>;
> > +                             reg =3D <0x92>;
> > +                             label =3D "vdd_dram";
> > +                     };
> > +
> > +                     channel@a2 {
> > +                             gw,mode =3D <2>;
> > +                             reg =3D <0xa2>;
> > +                             label =3D "vdd_gsc";
> > +                             gw,voltage-divider-ohms =3D <10000 10000>=
;
> > +                     };
> > +             };
> > +     };
> > +
> > +     gpio: gpio@23 {
> > +             compatible =3D "nxp,pca9555";
> > +             reg =3D <0x23>;
> > +             gpio-controller;
> > +             #gpio-cells =3D <2>;
> > +             interrupt-parent =3D <&gsc>;
> > +             interrupts =3D <4>;
> > +     };
> > +
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c02";
> > +             reg =3D <0x50>;
> > +             pagesize =3D <16>;
> > +     };
> > +
> > +     eeprom@51 {
> > +             compatible =3D "atmel,24c02";
> > +             reg =3D <0x51>;
> > +             pagesize =3D <16>;
> > +     };
> > +
> > +     eeprom@52 {
> > +             compatible =3D "atmel,24c02";
> > +             reg =3D <0x52>;
> > +             pagesize =3D <16>;
> > +     };
> > +
> > +     eeprom@53 {
> > +             compatible =3D "atmel,24c02";
> > +             reg =3D <0x53>;
> > +             pagesize =3D <16>;
> > +     };
> > +
> > +     gsc_rtc: rtc@68 {
> > +             compatible =3D "dallas,ds1672";
> > +             reg =3D <0x68>;
> > +     };
> > +};
> > +
> > +&i2c2 {
> > +     clock-frequency =3D <400000>;
> > +     pinctrl-names =3D "default", "gpio";
> > +     pinctrl-0 =3D <&pinctrl_i2c2>;
> > +     pinctrl-1 =3D <&pinctrl_i2c2_gpio>;
> > +     scl-gpios =3D <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +     sda-gpios =3D <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +     status =3D "okay";
> > +
> > +     pmic@4b {
> > +             compatible =3D "rohm,bd71847";
> > +             reg =3D <0x4b>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&pinctrl_pmic>;
> > +             interrupt-parent =3D <&gpio3>;
> > +             interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> > +             rohm,reset-snvs-powered;
> > +             #clock-cells =3D <0>;
> > +             clocks =3D <&osc_32k>;
> > +             clock-output-names =3D "clk-32k-out";
> > +
> > +             regulators {
> > +                     /* vdd_soc: 0.805-0.900V (typ=3D0.8V) */
> > +                     BUCK1 {
> > +                             regulator-name =3D "buck1";
> > +                             regulator-min-microvolt =3D <700000>;
> > +                             regulator-max-microvolt =3D <1300000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                             regulator-ramp-delay =3D <1250>;
> > +                     };
> > +
> > +                     /* vdd_arm: 0.805-1.0V (typ=3D0.9V) */
> > +                     buck2: BUCK2 {
> > +                             regulator-name =3D "buck2";
> > +                             regulator-min-microvolt =3D <700000>;
> > +                             regulator-max-microvolt =3D <1300000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                             regulator-ramp-delay =3D <1250>;
> > +                             rohm,dvs-run-voltage =3D <1000000>;
> > +                             rohm,dvs-idle-voltage =3D <900000>;
> > +                     };
> > +
> > +                     /* vdd_0p9: 0.805-1.0V (typ=3D0.9V) */
> > +                     BUCK3 {
> > +                             regulator-name =3D "buck3";
> > +                             regulator-min-microvolt =3D <700000>;
> > +                             regulator-max-microvolt =3D <1350000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     /* vdd_3p3 */
> > +                     BUCK4 {
> > +                             regulator-name =3D "buck4";
> > +                             regulator-min-microvolt =3D <3000000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     /* vdd_1p8 */
> > +                     BUCK5 {
> > +                             regulator-name =3D "buck5";
> > +                             regulator-min-microvolt =3D <1605000>;
> > +                             regulator-max-microvolt =3D <1995000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     /* vdd_dram */
> > +                     BUCK6 {
> > +                             regulator-name =3D "buck6";
> > +                             regulator-min-microvolt =3D <800000>;
> > +                             regulator-max-microvolt =3D <1400000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     /* nvcc_snvs_1p8 */
> > +                     LDO1 {
> > +                             regulator-name =3D "ldo1";
> > +                             regulator-min-microvolt =3D <1600000>;
> > +                             regulator-max-microvolt =3D <1900000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     /* vdd_snvs_0p8 */
> > +                     LDO2 {
> > +                             regulator-name =3D "ldo2";
> > +                             regulator-min-microvolt =3D <800000>;
> > +                             regulator-max-microvolt =3D <900000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     /* vdda_1p8 */
> > +                     LDO3 {
> > +                             regulator-name =3D "ldo3";
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     LDO4 {
> > +                             regulator-name =3D "ldo4";
> > +                             regulator-min-microvolt =3D <900000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +
> > +                     LDO6 {
> > +                             regulator-name =3D "ldo6";
> > +                             regulator-min-microvolt =3D <900000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-boot-on;
> > +                             regulator-always-on;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&i2c3 {
> > +     clock-frequency =3D <400000>;
> > +     pinctrl-names =3D "default", "gpio";
> > +     pinctrl-0 =3D <&pinctrl_i2c3>;
> > +     pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
> > +     scl-gpios =3D <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +     sda-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +     status =3D "okay";
> > +
> > +     accelerometer@19 {
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&pinctrl_accel>;
> > +             compatible =3D "st,lis2de12";
> > +             reg =3D <0x19>;
> > +             st,drdy-int-pin =3D <1>;
> > +             interrupt-parent =3D <&gpio1>;
> > +             interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> > +     };
> > +};
> > +
> > +&pcie_phy {
> > +     fsl,refclk-pad-mode =3D <IMX8_PCIE_REFCLK_PAD_INPUT>;
> > +     fsl,clkreq-unsupported;
> > +     clocks =3D <&pcie0_refclk>;
> > +     clock-names =3D "ref";
> > +     status =3D "okay";
> > +};
> > +
> > +&pcie0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_pcie0>;
> > +     reset-gpio =3D <&gpio5 11 GPIO_ACTIVE_LOW>;
> > +     clocks =3D <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
> > +              <&clk IMX8MM_CLK_PCIE1_AUX>;
> > +     assigned-clocks =3D <&clk IMX8MM_CLK_PCIE1_AUX>,
> > +                       <&clk IMX8MM_CLK_PCIE1_CTRL>;
> > +     assigned-clock-rates =3D <10000000>, <250000000>;
> > +     assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL2_50M>,
> > +                              <&clk IMX8MM_SYS_PLL2_250M>;
> > +     status =3D "okay";
> > +};
> > +
> > +&disp_blk_ctrl {
> > +     status =3D "disabled";
> > +};
> > +
> > +&pgc_mipi {
> > +     status =3D "disabled";
> > +};
> > +
> > +/* console */
> > +&uart2 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_uart2>;
> > +     status =3D "okay";
> > +};
> > +
> > +&usbotg1 {
> > +     dr_mode =3D "host";
> > +     disable-over-current;
> > +     status =3D "okay";
> > +};
> > +
> > +/* microSD */
> > +&usdhc2 {
> > +     pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > +     pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > +     pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> > +     pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> > +     cd-gpios =3D <&gpio2 12 GPIO_ACTIVE_LOW>;
> > +     bus-width =3D <4>;
> > +     vmmc-supply =3D <&reg_3p3v>;
> > +     status =3D "okay";
> > +};
> > +
> > +/* eMMC */
> > +&usdhc3 {
> > +     pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > +     pinctrl-0 =3D <&pinctrl_usdhc3>;
> > +     pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> > +     pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> > +     assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> > +     assigned-clock-rates =3D <400000000>;
> > +     bus-width =3D <8>;
> > +     non-removable;
> > +     status =3D "okay";
> > +};
> > +
> > +&wdog1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_wdog>;
> > +     fsl,ext-reset-output;
> > +     status =3D "okay";
> > +};
> > +
> > +&iomuxc {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_hog>;
> > +
> > +     pinctrl_hog: hoggrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10      0x4000004=
1 /* RS422# */
> > +                     MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11      0x4000004=
1 /* RS485# */
> > +                     MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12      0x4000004=
1 /* RS232# */
> > +                     MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9        0x4000004=
1 /* DIG1_IN */
> > +                     MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8        0x4000004=
1 /* DIG1_OUT */
> > +                     MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6        0x4000004=
1 /* DIG1_CTL */
> > +                     MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12     0x4000004=
1 /* PCI_WDIS# */
> > +             >;
> > +     };
> > +
> > +     pinctrl_accel: accelgrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15      0x159
> > +             >;
> > +     };
> > +
> > +     pinctrl_fec1: fec1grp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_ENET_MDC_ENET1_MDC                 0=
x3
> > +                     MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO               0=
x3
> > +                     MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3           0=
x1f
> > +                     MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2           0=
x1f
> > +                     MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1           0=
x1f
> > +                     MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0           0=
x1f
> > +                     MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3           0=
x91
> > +                     MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2           0=
x91
> > +                     MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1           0=
x91
> > +                     MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0           0=
x91
> > +                     MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC           0=
x0
> > +                     MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC           0=
x91
> > +                     MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL     0=
x91
> > +                     MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL     0=
x1f
> > +                     MX8MM_IOMUXC_SAI2_TXFS_GPIO4_IO24               0=
x19 /* IRQ# */
> > +                     MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25                0=
x19 /* RST# */
> > +             >;
> > +     };
> > +
> > +     pinctrl_gsc: gscgrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26       0x159
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c1: i2c1grp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL          0x400001c=
3
> > +                     MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA          0x400001c=
3
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c1_gpio: i2c1gpiogrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14        0x400001c=
3
> > +                     MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15        0x400001c=
3
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c2: i2c2grp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL          0x400001c=
3
> > +                     MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA          0x400001c=
3
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c2_gpio: i2c2gpiogrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16        0x400001c=
3
> > +                     MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17        0x400001c=
3
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c3: i2c3grp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL          0x400001c=
3
> > +                     MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA          0x400001c=
3
> > +             >;
> > +     };
> > +
> > +     pinctrl_i2c3_gpio: i2c3gpiogrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18        0x400001c=
3
> > +                     MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19        0x400001c=
3
> > +             >;
> > +     };
> > +
> > +     pinctrl_gpio_leds: gpioledgrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5    0x19
> > +                     MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30        0x19
> > +                     MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2        0x19
> > +                     MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14      0x19
> > +                     MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9       0x19
> > +                     MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3         0x19
> > +                     MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29        0x19
> > +                     MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x19
> > +                     MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13      0x19
> > +                     MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31       0x19
> > +                     MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4         0x19
> > +                     MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8       0x19
> > +             >;
> > +     };
> > +
> > +     pinctrl_pcie0: pciegrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_ECSPI2_MOSI_GPIO5_IO11     0x41
> > +             >;
> > +     };
> > +
> > +     pinctrl_pmic: pmicgrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_NAND_DATA02_GPIO3_IO8      0x41
> > +             >;
> > +     };
> > +
> > +     pinctrl_uart2: uart2grp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX     0x140
> > +                     MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX     0x140
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2: usdhc2grp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x190
> > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d0
> > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d0
> > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d0
> > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d0
> > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d0
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x194
> > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d4
> > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d4
> > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d4
> > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d4
> > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d4
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x196
> > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d6
> > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d6
> > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d6
> > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d6
> > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d6
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12        0x1c4
> > +                     MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT  0x1d0
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc3: usdhc3grp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x190
> > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d0
> > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d0
> > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d0
> > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d0
> > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d0
> > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d0
> > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d0
> > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d0
> > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d0
> > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x190
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x194
> > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d4
> > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d4
> > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d4
> > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d4
> > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d4
> > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d4
> > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d4
> > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d4
> > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d4
> > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x194
> > +             >;
> > +     };
> > +
> > +     pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x196
> > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d6
> > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d6
> > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d6
> > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d6
> > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d6
> > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d6
> > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d6
> > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d6
> > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d6
> > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x196
> > +             >;
> > +     };
> > +
> > +     pinctrl_wdog: wdoggrp {
> > +             fsl,pins =3D <
> > +                     MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B    0xc6
> > +             >;
> > +     };
> > +};
> > --
> > 2.25.1
> >

