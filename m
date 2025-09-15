Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD02CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPpCQPE4eMkTvvxsIdtpPEd1CfQJpfQRp57YufKsBb0=; b=FJ8quS1GMnSGofWK377umiFFs+
	wkwt9aGSBOfu53LEPc2SNE2UYX4/NTLzuo/7MW+RbQObezxr3PfYM6nII6C3tO/sfVlGWSu80c7+j
	ketH9ITEqgniGFhqAEHZp99jXBrpK/RWVCtyLummW2GzYHInctJQ9RZM7Fh7nN8eP6QxPUyWmouws
	jz50Qf+LqyKSJ4TThK8nyIqPaYrE985CVJSR8hGJraOi218bYG7juuWxt0011adBVk5q4WYscyTot
	IVaZwblmXbYUy3EfBKLYViZvJj1mUyqi1YHTkFMlfJlQoi22lBFVebgFBG6WPqfYsjTHHh7ZsX10d
	12Zfhi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9RQ-00000004Nv8-1Wei;
	Mon, 15 Sep 2025 13:40:24 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9RN-00000004Nsq-0zp5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:40:22 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 84EC1240101
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 15:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1757943617; bh=zPpCQPE4eMkTvvxsIdtpPEd1CfQJpfQRp57YufKsBb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=dVapLH1Y2yl9IQrix08z166i+XkRsYr4C8jQ1vymIQIZHRTs1mBJVWAl8RxzO3vpC
	 cgA1JZncSEt5qrUrn6gsup2CIAdfj8bJy5b2HF9eH2cyw6GzVLQiflcMtKLPbKzWCn
	 anKsZk9OSOXnENjYCBDgkhia9DCVsttjkOuSdX+95LHk4eOzIs/DcQcCy3KTWxT9xR
	 xdaRzHfyP6q0HHAApVzeh7m5t/7PvzSPSuJ5XgURyFjwSrv0CEKc9akUhRjLF2JBXe
	 QdFy2dH63ZDLiYSSzMc1ZoYDSqjARgTRohjzqu6WFEMR1/GrKOHO1sFFj5Nt4JlOnY
	 GMUtJyGorF3rw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cQR3w2hDqz9rxV;
	Mon, 15 Sep 2025 15:40:12 +0200 (CEST)
Date: Mon, 15 Sep 2025 13:40:15 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
Message-ID: <aMgXPPn3D3epmAua@probook>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
 <20250912-x96q-v1-2-8471daaf39db@posteo.net>
 <20250912105449.70717d80@donnerap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912105449.70717d80@donnerap>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_064021_561336_5C3E34F7 
X-CRM114-Status: GOOD (  41.53  )
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

On Fri, Sep 12, 2025 at 10:54:49AM +0100, Andre Przywara wrote:
> On Fri, 12 Sep 2025 01:52:10 +0200
> J. Neuschäfer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrote:
> 
> Hi,
> 
> many thanks for posting the DT, I really wish more people would do that!
> 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM,
> > 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> > output, and infrared input.
> > 
> >   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
> > 
> > Tested, works:
> > - debug UART
> > - status LED
> > - USB ports in host mode
> > - MicroSD
> > - eMMC
> > - recovery button hidden behind audio/video port
> > - analog audio (line out)
> > 
> > Does not work:
> > - Ethernet (requires AC200 MFD/EPHY driver)
> > - analog video output (requires AC200 driver)
> > - HDMI audio/video output
> > 
> > Untested:
> > - "OTG" USB port in device mode
> > - built-in IR receiver
> > - external IR receiver
> > - WLAN (requires out-of-tree XRadio driver)
> > 
> > Table of regulators on the downstream kernel, for reference:
> > 
> >  vcc-5v      1   15      0 unknown  5000mV     0mA  5000mV  5000mV
> >     dcdca    0    0      0 unknown   900mV     0mA     0mV     0mV
> >     dcdcb    0    0      0 unknown  1350mV     0mA     0mV     0mV
> >     dcdcc    0    0      0 unknown   900mV     0mA     0mV     0mV
> >     dcdcd    0    0      0 unknown  1500mV     0mA     0mV     0mV
> >     dcdce    0    0      0 unknown  3300mV     0mA     0mV     0mV
> >     aldo1    0    0      0 unknown  3300mV     0mA     0mV     0mV
> >     aldo2    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     aldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     bldo1    0    0      0 unknown  1800mV     0mA     0mV     0mV
> >     bldo2    0    0      0 unknown  1800mV     0mA     0mV     0mV
> >     bldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     bldo4    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     cldo1    0    0      0 unknown  2500mV     0mA     0mV     0mV
> >     cldo2    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     cldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 235 +++++++++++++++++++++
> >  2 files changed, 236 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > index 780aeba0f3a4e14d69c9602e37b8d299165507b9..2edfa7bf4ab31c4aa934da98e5e042edc9aaf600 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-tanix-tx1.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-x96q.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9534eb03b89557f2545af5af7cf43390be722cf0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
> > @@ -0,0 +1,235 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Copyright (C) 2025 J. Neuschäfer <j.ne@posteo.net>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h616.dtsi"
> > +#include "sun50i-h616-cpu-opp.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +	model = "X96Q";
> > +	compatible = "amediatech,x96q", "allwinner,sun50i-h616";
> > +
> > +	aliases {
> > +		mmc0 = &mmc0;
> > +		mmc1 = &mmc1;
> > +		mmc2 = &mmc2;
> 
> We don't do mmc aliases in the upstream DTs. Long story, but you should
> not need them. I guess you want to disagree ;-),

I've seen mmc aliases before, and I've seen the annoying effects of an
unstable probe order, so this is mostly of thing of habit.

> in this case U-Boot has
> you covered, by adding the aliases during build time: just use
> $fdtcontroladdr, as you should do anyway.

I'm using a recent upstream U-Boot with a FIT image ('make image.fit' in
the Linux source tree). In this case U-Boot does not add mmc aliases.
Is there a special Kconfig option I need to enable in U-Boot?

What do you mean by 'build time'? U-Boot's?


> 
> > +		serial0 = &uart0;
> > +	};
[...]
> > +&mmc0 {
> > +	vmmc-supply = <&reg_aldo1>;
> > +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> > +	disable-wp;
> > +	bus-width = <4>;
> > +	max-frequency = <150000000>;
> 
> That line is already in the .dtsi file, so redundant.

Good point, removing.
> 
> > +	status = "okay";
> > +	/* µSD */
> 
> If we really need this comment, it should be above, right after the
> "&mmc0 {". And I wonder if it should be "microSD" instead.

Good points, I'll do both.

> > +};
> > +
> > +&mmc1 {
> > +	/* TODO: XRadio XR819 WLAN */
> 
> Either you just keep the comment, an mention mmc1, but don't reference the
> node, or you add the properties that you know of already, like
> vmmc-supply, vqmmc-supply, mmc-pwrseq, bus-width, non-removable.
> But this "empty reference with a comment" is somewhat odd.

I'll change it to a pure comment for now.

> > +};
> > +
> > +&mmc2 {
> > +	vmmc-supply = <&reg_aldo1>;
> > +	vqmmc-supply = <&reg_bldo1>;
> > +	non-removable;
> > +	cap-mmc-hw-reset;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	bus-width = <8>;
> > +	max-frequency = <100000000>;
> 
> Are you sure you need that?

I found it in the downstream DT. The eMMC probes fine without it, so
I'll remove it. The eMMC datasheet (assuming I found the right one),
claims a maximum of 200 MHz, so the 100 MHz restriction seems
unnecessary.

> 
> > +	status = "okay";
> > +	/* eMMC */
> 
> Please move that comment up.

Will do.


[...]
> > +		regulators {
> > +			reg_dcdca: dcdca {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <810000>;
> > +				regulator-max-microvolt = <1100000>;
> > +				regulator-name = "vdd-cpu";
> > +			};
> > +
> > +			dcdcb {
> > +				/* unused */
> > +			};
> > +
> > +			reg_dcdcc: dcdcc {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <810000>;
> > +				regulator-max-microvolt = <990000>;
> > +				regulator-name = "vdd-gpu-sys";
> > +			};
> > +
> > +			dcdcd {
> > +				regulator-always-on;
> 
> Why is this always on? What happens if you remove that line or turn it off?
> For always-on regulators we either need a comment saying why, or, better,
> have an explanatory regulator-name (like above).
> Is that for DRAM, by any chance (1.5V for DDR3 chips)?

The observed behavior is that the system halts when dcdcd is disabled.
The relationship is a bit hard to determine without schematics, but the
DDR3 chips (Micron MT41J256M4) do indeed use 1.5V. Since this is the
only source of 1.5V, I think it's a safe guess that this is indeed the
DRAM regulator.

> 
> Cheers,
> Andre

Thanks for the review!
J. Neuschäfer

