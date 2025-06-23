Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE04C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qh1CJjO8c2zLPbBAKpH3KGrCB+i0u1GVzjXdu6Efzw=; b=m6+pDnbciuCHSmGS2bwu6RUH6x
	QzcmWFxJEDEIsBDAa9zBPDVl3uOdlU6XzCKFKBuL8E2FWXwWvYT5rGnk9zn2iovV4Jwahii3jtGt6
	nDlz72swsYCNNK7ZgEaT4S7MWk+oH/PXiA3hOkcfflOjoLfnnKP/3Kb5ImjnoHDr9dhx3VFlJdgE1
	0TST3Biso9QalUbHlnZ4OG52/FRaNZj1xfM97btpgD+VMhn2CVKjzA+oiEJjhhGBIe6hr+3fjiIdv
	ALAKuPvma6GGMeEGOugriTQ8THhBegxS8nAfD+8x6K2JnE5bjqrlPBQRMJtg2FcWENK56/Fh2L7Mg
	V9pieNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeMD-00000002L35-0m0o;
	Mon, 23 Jun 2025 10:24:57 +0000
Received: from mail-24425.protonmail.ch ([109.224.244.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdoX-00000002F6H-2lyC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750672205; x=1750931405;
	bh=2qh1CJjO8c2zLPbBAKpH3KGrCB+i0u1GVzjXdu6Efzw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E8POB4Dv/lqhX+/sJjDZa0/eRygsCa8wa0bD650TGPocFSrQmngVcmH1D3sAxuPA+
	 LW1kx1i/1pOmqd1rUMvyIAhqBWl1APVUa8m9mGWcG7GKTjZYT6pcqc9TgtP7e47tmX
	 qniN6zrdbbESjD1VetTautbvt1mkQo6xrcZtlg2bNE8ZxjqWMJH+FOeC792/ZFCjA2
	 cJYsbS5g0TjVCk8W/p8chAN4R8U7yoOff0HvBQ2Nd5H/49aF46mWlAnjhafpzeMz3Z
	 K47KMGRf+oZnnk9ahBhiWXKdU8vibpziYrRLgevjgfQ3LlNNNuqTpqC9bZtwqcdO9a
	 e7L6adwy/WWKQ==
Date: Mon, 23 Jun 2025 09:49:59 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Max Shevchenko <wctrl@proton.me>
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux@roeck-us.net" <linux@roeck-us.net>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "robh@kernel.org" <robh@kernel.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "wctrl@proton.me" <wctrl@proton.me>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>
Subject: Re: [PATCH 09/11] ARM: dts: mediatek: add basic support for MT6572 SoC
Message-ID: <kZ6sH6-8EHhW5FtsAmo9HXndj7D1jFyW0cv0A4KDO3i5SS9JiGEZNTd1gbMXizu4vI0M0hjROLK5DEnKbB36jWUKUPRKukq5IRK9Tz2qz7k=@proton.me>
In-Reply-To: <94fd71e6-0f09-42d0-94ef-1ff111daac9f@collabora.com>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me> <20250620-mt6572-v1-9-e2d47820f042@proton.me> <94fd71e6-0f09-42d0-94ef-1ff111daac9f@collabora.com>
Feedback-ID: 131238559:user:proton
X-Pm-Message-ID: 776204d2426614811a793f4a9aa639b87ffcd972
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_025010_307425_798F71B5 
X-CRM114-Status: GOOD (  17.87  )
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


On Monday, June 23rd, 2025 at 11:35 AM, AngeloGioacchino Del Regno <angelog=
ioacchino.delregno@collabora.com> wrote:

> Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
>
> > From: Max Shevchenko wctrl@proton.me
> >
> > Add basic support for the MediaTek MT6572 SoC.
> >
> > Signed-off-by: Max Shevchenko wctrl@proton.me
> > ---
> > arch/arm/boot/dts/mediatek/mt6572.dtsi | 105 ++++++++++++++++++++++++++=
+++++++
> > 1 file changed, 105 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts=
/mediatek/mt6572.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..dd12231ca745be7455e9939=
1abd2d708f2f1a8a9
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2025 Max Shevchenko wctrl@proton.me
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > + #address-cells =3D <1>;
> > + #size-cells =3D <1>;
> > + compatible =3D "mediatek,mt6572";
> > + interrupt-parent =3D <&sysirq>;
> > +
> > + cpus {
> > + #address-cells =3D <1>;
> > + #size-cells =3D <0>;
> > + enable-method =3D "mediatek,mt6589-smp";
> > +
> > + cpu@0 {
> > + device_type =3D "cpu";
> > + compatible =3D "arm,cortex-a7";
> > + reg =3D <0x0>;
> > + };
> > + cpu@1 {
> > + device_type =3D "cpu";
> > + compatible =3D "arm,cortex-a7";
> > + reg =3D <0x1>;
> > + };
> > + };
> > +
> > + system_clk: dummy13m {
> > + compatible =3D "fixed-clock";
> > + clock-frequency =3D <13000000>;
> > + #clock-cells =3D <0>;
> > + };
> > +
> > + rtc_clk: dummy32k {
> > + compatible =3D "fixed-clock";
> > + clock-frequency =3D <32000>;
> > + #clock-cells =3D <0>;
> > + };
> > +
> > + uart_clk: dummy26m {
> > + compatible =3D "fixed-clock";
> > + clock-frequency =3D <26000000>;
> > + #clock-cells =3D <0>;
> > + };
> > +
>
>
> Anything that has an MMIO address shall be child of "soc".
>
> soc {
> watchdog@....
>
> timer@....
>
> etc.
> };
>
> > + watchdog: watchdog@10007000 {
> > + compatible =3D "mediatek,mt6572-wdt",
> > + "mediatek,mt6589-wdt";
>
>
> those fit in one line:
>
> compatible =3D "mediatek,mt6572-wdt", "mediatek,mt6589-wdt";
>
> > + reg =3D <0x10007000 0x100>;
> > + interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
> > + timeout-sec =3D <15>;
> > + #reset-cells =3D <1>;
> > + };
> > +
> > + timer: timer@10008000 {
> > + compatible =3D "mediatek,mt6572-timer",
> > + "mediatek,mt6577-timer";
>
>
> same
>
> > + reg =3D <0x10008000 0x80>;
> > + interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_LOW>;
> > + clocks =3D <&system_clk>, <&rtc_clk>;
> > + clock-names =3D "system-clk", "rtc-clk";
> > + };
> > +
> > + sysirq: interrupt-controller@10200100 {
> > + compatible =3D "mediatek,mt6572-sysirq",
> > + "mediatek,mt6577-sysirq";
>
>
> same; and reg goes after compatible.
>
> > + interrupt-controller;
> > + #interrupt-cells =3D <3>;
> > + interrupt-parent =3D <&gic>;
>
>
> are you sure that interrupt-parent is gic?

Other MT65xx devicetrees have GIC as parent for itself and SYSIRQ, so I ass=
ume.

>
> > + reg =3D <0x10200100 0x1c>;
> > + };
> > +
> > + gic: interrupt-controller@10211000 {
> > + compatible =3D "arm,cortex-a7-gic";
>
>
> reg here.
>
> > + interrupt-controller;
> > + #interrupt-cells =3D <3>;
> > + interrupt-parent =3D <&gic>;
>
>
> are you sure that the interrupt parent isn't sysirq here? :-)

not really, downstream has no mentions about SYSIRQ or its' address

>
> > + reg =3D <0x10211000 0x1000>,
> > + <0x10212000 0x2000>,
> > + <0x10214000 0x2000>,
> > + <0x10216000 0x2000>;
> > + };
> > +
> > + uart0: serial@11005000 {
> > + compatible =3D "mediatek,mt6572-uart",
> > + "mediatek,mt6577-uart";
>
>
> fits in one line
>
> > + reg =3D <0x11005000 0x400>;
> > + interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
> > + clocks =3D <&uart_clk>;
>
>
> clock-names =3D .....
>
> > + status =3D "disabled";
> > + };
> > +
> > + uart1: serial@11006000 {
> > + compatible =3D "mediatek,mt6572-uart",
>
>
> ...again.
>
> > + "mediatek,mt6577-uart";
> > + reg =3D <0x11006000 0x400>;
> > + interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> > + clocks =3D <&uart_clk>;
> > + status =3D "disabled";
> > + };
> > +};
>
>
> Cheers,
> Angelo

thanks for suggestions, applied.


Sincerely,
Max

