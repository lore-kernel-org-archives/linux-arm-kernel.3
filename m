Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697BEC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yL1Q8MeGkdWjnBhlnFZNQ/XsDwLNPuhnlCpbJptzEc=; b=NnHNPiRf7lZIYJt3LXFmWVEdac
	cfiQt5BdtTxgtGZULA9lvJ3QAolMKEtTskSy3deJXiISKcijM5cavZNvfGbyLGk78Yt+0eLmPDTsS
	Oz2lnD6TXverOKWQcqu9MZK0I5+PWUV4M4GLtqNefPabsOGhRFAeYMZLswCqLYezxCb82qDs1D3A6
	1/1PNpqcuJrukUFm1JVWyS6skAx26xUfmVtNnut39xBexHSJ3RV6IGgd8n3I0Mq6Nx9hNjsfZlKIr
	woP1PjeApm8utz9vgylfSH/hdvNlpahmnOEOasXkVXTZen/O7pAabYXgL2+gj1htrgHwqRFBd432D
	Bfg1PnwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrDx-000000004YG-2pBT;
	Tue, 29 Jul 2025 20:47:01 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugrBU-000000004QX-2Ha6;
	Tue, 29 Jul 2025 20:44:30 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1753821866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5yL1Q8MeGkdWjnBhlnFZNQ/XsDwLNPuhnlCpbJptzEc=;
	b=CAlUKgS2JWCsia0rQZx7lIYBJOzGB5olZqt10pYII0QxIwTb3kiDjt61BDMCR6uMBptsGr
	MB3FY8jFHCpHGxTPkG6UIwX8HCQhAy3KNE/i3eTZOMLkkX3bvqqhDK1rEYCurUCU59d/4H
	iTv8y931pDAdRBw77PPFMfRhqEG8OWDz3HEql48yYlRCqJQWsMwCWMogBRqkspwsTqe9EQ
	KmRWJNTWRHidQKg4yY81igs0YBDGoJXevztsxhEPsAFZWeoFsLxb0UAqzYEH6c4O05Qmiu
	A+8gdlxajP47r3kSN5VZIn9LfIZk51GPp3IE2O18zfXx0Ekb/xDNGlabReUU3Q==
Date: Tue, 29 Jul 2025 22:44:21 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Pinebook Pro: Update WiFi
In-Reply-To: <CALeDE9PBnfu9Oxo4xc8O+uJW8p+_=43Y-goe0i3=VmT0SsovNg@mail.gmail.com>
References: <20250729185827.144547-1-pbrobinson@gmail.com>
 <6948463c8ca90bd9c72fb34178ddb029@manjaro.org>
 <CALeDE9PBnfu9Oxo4xc8O+uJW8p+_=43Y-goe0i3=VmT0SsovNg@mail.gmail.com>
Message-ID: <92e82815dc8fd407dc13ca823685de4f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_134428_969528_6CD3CACA 
X-CRM114-Status: GOOD (  26.03  )
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

Hello Peter,

On 2025-07-29 22:09, Peter Robinson wrote:
>> On 2025-07-29 20:58, Peter Robinson wrote:
>> > Update the WiFi configuration to include the wake-up
>> > pin and add an ethernet alias to allow assignment of
>> > a mac-address from the firmware.
>> >
>> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> > ---
>> >  .../boot/dts/rockchip/rk3399-pinebook-pro.dts | 19 +++++++++++++++++++
>> >  1 file changed, 19 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> > b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> > index 5a8551d9ffe47..05c48cb09df6f 100644
>> > --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> > @@ -19,6 +19,7 @@ / {
>> >       chassis-type = "laptop";
>> >
>> >       aliases {
>> > +             ethernet0 = &brcmf;
>> 
>> I'm sorry, but this alias isn't acceptable.  In a few words, this
>> simply isn't an Ethernet interface.
> 
> Can you explain why? It's a wireless ethernet interface with a MAC
> address, there's other example in the kernel doing this so there's
> already a precedent, can you explain how else to do this or give me an
> example?

Strictly speaking, there's no such thing as Wireless Ethernet
interface.  Yes, WiFi interfaces do produce frames that, from the
drivers' perspective, look very much like wired Ethernet frames,
but WiFi technically isn't just "Ethernet over radio waves".  Truth
be told, WiFi used to be called that in its early days, perhaps
to make it more appealing, but the distinction became clear rather
soon.  It's somewhat similar to how tunneling protocols may produce
Ethernet frames, but they're still called tunnel interfaces.

I'm not aware of an already existing example of a WiFi interface
that's aliased as ethernetX.  Could you, please, be more precise?
Anyway, the correct way should be to use a wifi0 alias here, which
is already used in a few places in arch/arm64/boot/dts/qcom, for
example.  I'm not sure will a wifi0 alias work "automagically", but
if there are some issues preventing it from working as expected,
fixing those issues would be the right thing to do.

>> We're already stretching a bit the dynamic nature of, well, everything
>> with the aliases in the Rockchip DT files, and an alias like this one
>> would be stretching the whole thing beyond the breaking point.
> 
> Why? If you look through DT outside of rockchip there's even more
> stretching and I don't see how using this goes beyond breaking, I
> think this is a bit of an exaggeration. Rather than saying no how
> about explaining an alternative solution?

Sorry, I wasn't clear enough in this part of my response.  To clarify
it a bit, I referred to stretching it beyond breaking by adding a
technically incorrect alias.

Please see above for a technically correct alternative approach.

>> >               mmc0 = &sdio0;
>> >               mmc1 = &sdmmc;
>> >               mmc2 = &sdhci;
>> > @@ -883,6 +884,12 @@ vcc5v0_host_en_pin: vcc5v0-host-en-pin {
>> >               };
>> >       };
>> >
>> > +     wifi {
>> > +             wifi_host_wake_l: wifi-host-wake-l {
>> > +                     rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
>> > +             };
>> > +     };
>> > +
>> >       wireless-bluetooth {
>> >               bt_wake_pin: bt-wake-pin {
>> >                       rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
>> > @@ -940,7 +947,19 @@ &sdio0 {
>> >       pinctrl-names = "default";
>> >       pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
>> >       sd-uhs-sdr104;
>> > +     #address-cells = <1>;
>> > +     #size-cells = <0>;
>> >       status = "okay";
>> > +
>> > +     brcmf: wifi@1 {
>> > +             reg = <1>;
>> > +             compatible = "brcm,bcm4329-fmac";
>> > +             interrupt-parent = <&gpio0>;
>> > +             interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
>> > +             interrupt-names = "host-wake";
>> > +             pinctrl-names = "default";
>> > +             pinctrl-0 = <&wifi_host_wake_l>;
>> > +     };
>> >  };
>> >
>> >  &sdhci {

