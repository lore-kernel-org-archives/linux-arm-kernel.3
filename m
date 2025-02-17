Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218F1C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km4O/2HgH8CFmLxzZj0ztyAKVNJrr0OHpoZQa5eynRY=; b=gHHIkSyhEBL0oUjLVPw3jAvnV9
	/4rzrE3s3PLE024VDzCpJPzoupdnYmEM9u+orrtnBqZmrKoTqUAahraU8To1s4gKB39tIL2Cl8une
	0gTIbUB/PhIFUcNbZ7lno7i2JiNuTanX6CtJfmaKdofG9MBdrQ9HzTs7+6eeajbvgjMgrZGLWx8VU
	eMZVV/wItqn9EK6/up3rgkvS/H2ReiTukiRqkctCJAiSFYSKl1TyfKQe08DSMv9u8+YS0KhSd+ENm
	1Pi6FS/crTPvOUmgZHsF/qxLGH8atSNVxE0QwRudhqp0vlUgMop0pCQK4zYSka+SYD72A5PTLKsqn
	9w5whd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8j6-000000061OB-4AK9;
	Mon, 17 Feb 2025 21:32:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8hd-0000000618g-39Xr;
	Mon, 17 Feb 2025 21:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=km4O/2HgH8CFmLxzZj0ztyAKVNJrr0OHpoZQa5eynRY=; b=J9Gsuz5sV/BSaYMRSzAmvv17GB
	GXqAZ9x22QoaVuXylY1bKwRYo9jS6ntWADALzdJKRCGnTvMov2e55KZ+aMofNVtZEBS0NOEChHfzu
	j5Zv7mz/CGIkHVClpNrpunKVsRp6e8vnTthm5IDQml/qC2oy7qzY9mx1GNtIBmHU4Efk10v6ZeowP
	70S70zQg1nOw2kdcPtSxWm4zLt4fApluCZvkDOxf2Ydbo3E+IJ7QdEOGLv//dO27Q++LEbOGc7nIA
	5LllI1aLEc5Ql8Gpkee0kfQDBNeVEs6npmukUoFPxtCvDpf0jut6npLKC0mhO8RGgk8vb8QuxHm9H
	anKKwjlw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tk8hN-0007VX-JV; Mon, 17 Feb 2025 22:30:41 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Tim Lunn <tim@feathertop.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Stephen Chen <stephen@radxa.com>, Elon Zhang <zhangzj@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: Add Radxa ROCK 4D device tree
Date: Mon, 17 Feb 2025 22:30:40 +0100
Message-ID: <3568510.6YUMPnJmAY@diego>
In-Reply-To: <1914418.tdWV9SEqCh@earth>
References: <20250217164009.130286-1-detlev.casanova@collabora.com>
 <01b72ad6-67bc-472e-b04d-c9fd42d37d8d@kwiboo.se> <1914418.tdWV9SEqCh@earth>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_133057_797087_2D25DBA2 
X-CRM114-Status: GOOD (  17.03  )
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

Am Montag, 17. Februar 2025, 22:07:06 MEZ schrieb Detlev Casanova:
> On Monday, 17 February 2025 12:08:47 EST Jonas Karlman wrote:
> > On 2025-02-17 17:34, Detlev Casanova wrote:
> > > +	pmic@23 {
> > > +		compatible = "rockchip,rk806";
> > > +		reg = <0x23>;
> > > +
> > > +		gpio-controller;
> > > +
> > > +		interrupt-parent = <&gpio0>;
> > > +		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pmic_pins
> > > +			     &rk806_dvs1_null
> > > +			     &rk806_dvs2_null
> > > +			     &rk806_dvs3_null>;
> > > +
> > > +		system-power-controller;
> > > +
> > > +		vcc1-supply = <&vcc_5v0_sys>;
> > > +		vcc2-supply = <&vcc_5v0_sys>;
> > > +		vcc3-supply = <&vcc_5v0_sys>;
> > > +		vcc4-supply = <&vcc_5v0_sys>;
> > > +		vcc5-supply = <&vcc_5v0_sys>;
> > > +		vcc6-supply = <&vcc_5v0_sys>;
> > > +		vcc7-supply = <&vcc_5v0_sys>;
> > > +		vcc8-supply = <&vcc_5v0_sys>;
> > > +		vcc9-supply = <&vcc_5v0_sys>;
> > > +		vcc10-supply = <&vcc_5v0_sys>;
> > > +		vcc11-supply = <&vcc_2v0_pldo_s3>;
> > > +		vcc12-supply = <&vcc_5v0_sys>;
> > > +		vcc13-supply = <&vcc_1v1_nldo_s3>;
> > > +		vcc14-supply = <&vcc_1v1_nldo_s3>;
> > > +		vcca-supply = <&vcc_5v0_sys>;
> > > +
> > > +		#gpio-cells = <2>;
> > 
> > This should probably be sorted next to gpio-controller.
> 
> It's not unusual to put # props at the end. but I can move it up if it is 
> preferred.

That is actually a multi-colored bikeshed ;-)

When sorting alphabetically, do you
- just ignore the "#", this would move #gpio-cells to gpio*  but also
  split up #address-cells and #size-cells
- count "#" as special character and move them to the bottom, but this
  would split #gpio-cells from gpio-controller

--- TL;DR
So far I've not managed to come with a 1-size-fits-all opinion, but for
#gpio* and #clock* properties, readability gets better when they are
together with other gpio* / clock* properties .
----

Also I think you could do away with all the empty lines between properties
above (pinctrl <-> system-power-controller, etc), but of course keep the
empty between the subnodes below :-)


Heiko



