Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFE6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQWW+6GJT6SMKoyIQM+lsAzbcfqDVW6okh5ggmHwFxw=; b=yezJh7LELNE7R3OQkQu9Ja8Fu/
	6eYQL9RJgOod0mdfVZ+WpepqWd/nECoB8d4ICwzBoAWF9UMJIcsOANztgmWwCwvIl33qRBVB2D/Gc
	IWOB7IV6FOK1Hlvwp6jlwX0VqCAei5jngL6TOkoH4Bb6fddNexQtxWJWreBv9MgnfO6rrhh0zTPOk
	ZLdGwGky4vu8UUE12+m3hTnkmWFZJsoMW6sysdWQh+M4i8L7Y5P58xOJJPXy7H2xG0dqIhdB5wgSY
	0vqeYPC/tUwiMpRrRc+TPLAGGEv6Ezavl6TRCpCtPaP1LDrClF3ziOcWqZNPD0H3BGdAw2bIobsM1
	BqEIyElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbHq-00000003O6F-2ofU;
	Tue, 01 Apr 2025 13:04:14 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbDy-00000003NMk-1zOU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 13:00:16 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1F677240027
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Apr 2025 15:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1743512411; bh=DzC9bukHy47TjGfwcug8gM7evmzmuBLiRPZ4FYnSoOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=KcC27z+1Skglm25OKuxiO3aOVwBu6LWCxDrTfL+KZIo8jba2WPpMRawGb9xp64Dln
	 qR9PDCvt+D+n3cl4DtMMdMVJOrm4rsKsiKEbwMdahVXMWUQwzX7M6oE7cbUf7e8iYh
	 q4iiLzaGNEEdU/D3UjDqEnFJaLYg7BszvhgTpr+/xSPm9wBuWo2jWbQkwCEnSQwBy6
	 iucE2U9GlxFByRzTiiE3PS1pIIpLMP7nzb5kwLkctiehJz8QWGb3xRvQwxh+Q7oh7K
	 KArnw9Vs7jEF9PhLby0MEcGoVnw7Kij4BF6Ck+dLRwsIxSLYOg6/d0/xBnwX5dKiYM
	 zVWbhBGaKMwoA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZRp4m3h9Mz9rxQ;
	Tue,  1 Apr 2025 15:00:08 +0200 (CEST)
Date: Tue,  1 Apr 2025 13:00:08 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
Message-ID: <Z-vjWFFWvo1gesCe@probook>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
 <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_060014_784962_9446F698 
X-CRM114-Status: GOOD (  26.90  )
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

On Sun, Mar 30, 2025 at 11:10:28PM +0200, Martin Blumenstingl wrote:
> Thanks for your patch!
> 
> On Sun, Mar 23, 2025 at 1:38 PM J. Neuschäfer via B4 Relay
> <devnull+j.ne.posteo.net@kernel.org> wrote:
> [...]
> > +               eth_phy0: ethernet-phy@0 {
> > +                       /* IC Plus IP101A (0x02430c54) */
> > +                       reg = <0>;
> Does reg = <1> also work on your board?
> 0 is the broadcast address. It's unfortunately something that we still
> have incorrect in a lot of .dts files.

Unfortunately not. I tried addresses 1 to 31 without success, which
seems strange; my guess was that the PHY should respond to one of them.
I get this error:

# ip l set eth0 up
[    6.806847] meson6-dwmac c9410000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[    6.810609] meson6-dwmac c9410000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)


> 
> [...]
> > +&i2c_AO {
> > +       status = "okay";
> > +       pinctrl-0 = <&i2c_ao_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       pmic@32 {
> > +               compatible = "ricoh,rn5t618";
> > +               reg = <0x32>;
> > +               system-power-controller;
> Here I'm a bit surprised:
> Aren't some of the outputs used to drive VCCK (CPU power rail) and
> VDDEE (everything else power rail, which also powers the GPU)?

Unfortunately I don't have schematics and I wasn't able to trace the
connections on the board because they're so tiny. So it's quite possible that
you're right, but I can't be sure.

Are there voltage sensors in the Meson8 SoC that I could use to establishs the
relation between PMIC outputs and SoC supplies?

> 
> [...]
> > +&usb1 {
> > +       status = "okay";
> > +       dr_mode = "host";
> > +       /*
> > +        * This bus features a Realtek RTL8188 2.4GHz WiFi module, with a
> > +        * 3.3V supply voltage that must be enabled before use.
> > +        */
> > +       vbus-supply = <&wifi_3v3>;
> If you want to go for perfection then you can use
> Documentation/devicetree/bindings/sound/xmos,xvf3500.yaml as
> reference.
> It's also an "onboard" USB device which requires toggling a GPIO and regulators.
> The driver side is super easy to manage as it's generic (meaning: it
> parses any GPIO and regulator as long as the USB ID is registered):
> drivers/usb/misc/onboard_usb_dev.c

I considered using onboard_usb_dev, but then came to the conclusion that
I don't need it because I don't need reset sequencing, only power.

> That way you can just describe the RTL8188 on the USB bus and assign
> it's vd33-supply without having to (ab)use vbus-supply of the USB
> controller.

This does sound reasonable. I'll reconsider the onboard_usb_dev
approach.

> 
> [...]
> > +               sdxc_c_pins: sdxc-c {
> > +                       mux {
> > +                               groups = "sdxc_d0_c", "sdxc_d13_c",
> > +                                       "sdxc_clk_c", "sdxc_cmd_c",
> > +                                       "sdxc_d47_c";
> > +                               function = "sdxc_c";
> > +                               bias_pull_up;
> This has to be bias-pull-up (dashes instead of underscores).

Oh, good catch, I'll fix it.


Thanks for your review,
J. Neuschäfer

