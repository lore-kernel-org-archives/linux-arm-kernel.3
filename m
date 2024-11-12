Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03353D42B9B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JzPROz1nsHbGEclfKh8jf9jsrbMpci++OmYF8hXYss=; b=wolEpGlAhBmnuVlXlDG/y/vFij
	URA7QvJ6lvUuN7aC0fMmcw+7/q89LU5aAz7IoBZ+X9Rpf6e41s2SKh0hBZRBZ0NKryuGY8+6BplTz
	6vQw4XLRFNp8NySYxr1MjPzkDmzH1SIzF4w7wR8P46LV/ZyguHUHEPvvLlxPNI4K7xWRLfw7HwKLk
	bDytHiflcgKBYEqP64fuj++yTco6pPXbPQLdD5srNSpSwp6Hf3N0dHTIrGCeyeRgp406MFafJLg7w
	hqpZOSv71QdkQwD3ZYvXStsncsI4aXhXwLMLR4fSwFc+BOtzZxSadS6MTgVwyqxPJMvPSJBfxqBWc
	C+bQ6cug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsXc-00000003trr-35KL;
	Tue, 12 Nov 2024 15:10:52 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsU6-00000003t9N-3bPc;
	Tue, 12 Nov 2024 15:07:16 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731424032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JzPROz1nsHbGEclfKh8jf9jsrbMpci++OmYF8hXYss=;
	b=fqrrWSgJDCXj9QX3GYICI4bGW449R0E70n9ccimyXlQonBWFc8GQnB/AFmy3YcZfR/h+Or
	Y7Y6fSJbiv0PNMjhKraNdLtn7kY0Q7GJtVES+zk333uiQZ5wVJnWQLQ/+KqEUuUQUyfzVP
	O1XpYYzJg/b/snCU7RndlbCaQ90yja24QDUCJ6jrE08UrjqP88d5nsmIDQMNJKZc2AabhS
	2mposGDaIvnsWzTKkrA943iqABdAQc0MslxbrNNUygk4nN+CzGXUSepa257eyNDkWP0Tnj
	A9/NKqiO+xHcSiutZpnSf4FW6Crb6yJ7SZDMSJT8d6pEy9wkcTtlWg54jiO8Mw==
Date: Tue, 12 Nov 2024 16:07:10 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Tam=C3=A1s_Sz=C5=B1cs?= <tszucs@linux.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki
 <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable UART8 on rock-3b
In-Reply-To: <CA+GksrJLpeU8x-kjR1Ng3ySf+giiufCsJuBssng9qoX1PjAunA@mail.gmail.com>
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-4-tszucs@linux.com>
 <4ba81dfa-f276-4e05-b46b-92f50dbcfcc4@kwiboo.se>
 <CA+GksrJLpeU8x-kjR1Ng3ySf+giiufCsJuBssng9qoX1PjAunA@mail.gmail.com>
Message-ID: <9330ebb370780c001fd2aaee49aec9e8@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_070715_219272_2D901C13 
X-CRM114-Status: GOOD (  21.83  )
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

Hello Tamas,

On 2024-11-12 15:35, Tamás Szűcs wrote:
> I agree; it's not possible to tell if the user will use a PCIe/USB,
> PCIe/UART, SDIO/UART, perhaps USB/UART device, or any other HIF
> combination. The way I see it is UART8 is hardwired to the M2E, so
> there is a reasonable expectation that it should work too if need be.

Please correct me if I'm wrong, but isn't this UART supposed to be
used for the Bluetooth part of an SDIO WiFi + Bluetooth module, in
form of a non-standard M.2 module that Radxa sells?

With that in mind, I see very little sense in just enabling the UART,
without defining the entire Bluetooth interface, which AFAIK produces
nasty looking error messages in the kernel log when there's actually
nothing connected to the UART.

As a side note, please use inline replying. [*]

[*] https://en.wikipedia.org/wiki/Posting_style

> On Mon, Nov 11, 2024 at 8:12 PM Jonas Karlman <jonas@kwiboo.se> wrote:
>> 
>> Hi Tamás,
>> 
>> On 2024-11-11 19:17, Tamás Szűcs wrote:
>> > Enable UART lines on Radxa ROCK 3 Model B M.2 Key E.
>> >
>> > Signed-off-by: Tamás Szűcs <tszucs@linux.com>
>> > ---
>> >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> > index b7527ba418f7..61d4ba2d312a 100644
>> > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
>> > @@ -732,7 +732,7 @@ &uart8 {
>> >       pinctrl-names = "default";
>> >       pinctrl-0 = <&uart8m0_xfer &uart8m0_ctsn &uart8m0_rtsn>;
>> >       uart-has-rtscts;
>> > -     status = "disabled";
>> > +     status = "okay";
>> 
>> This should probably be enabled using an dt-overlay, there is no UART
>> device embedded on the board and the reason I left it disabled in
>> original board DT submission.
>> 
>> On second thought maybe they should be enabled, think PCIe and USB 
>> lines
>> on the M.2 Key E is already enabled by default. I probably only tested
>> with a pcie/usb wifi/bt card and not a sido/uart wifi/bt card.
>> 
>> >  };
>> >
>> >  &usb_host0_ehci {

