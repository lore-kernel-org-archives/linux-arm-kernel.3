Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B13C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 18:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JLJ0FpKM3qj52tf+7FbBXdfMaILfM/b7TzkNMXuLMs=; b=A6r7mo2tut71q+hohFk1MNej3V
	aY/0E5Gtw6iSwoxZV242WgLlX2m2N7fv3a0qOJ1LaUB3YfixFq85jWFb0uCnUo+8l3GAzrjZCliT5
	Onokbf6tn50yluZG6mV5aDnNquIlPKACcc1W8vjOlGEyyCqljl4Q9ldKy5Eh9E/tJvrlUgAwNM+db
	FfI0QwpXzWCyILvarFBE4nNGmIwfSdH9ecTRbq36rs8DMROCKXmNIOqSnPtadz2rdOqJP/Iit+HAW
	kLRP4E68zdrb6U5r9MmHeaH/2QGWpapMSQg03jMxETT52khWQpLl6PziLJO2NPGH2yxVgrp8drdNI
	Y7FexWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whASa-0000000FdXa-3zWF;
	Tue, 07 Jul 2026 18:23:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whASV-0000000FdWk-1bvn;
	Tue, 07 Jul 2026 18:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9JLJ0FpKM3qj52tf+7FbBXdfMaILfM/b7TzkNMXuLMs=; b=CGltUv6A8vNWyR6tnpsfe2ZOCQ
	JsAUW8Wrl8Jf6IDsfJvhIElhExWMpJ/Z/8WxZq5M/BwokI+6YCXoLZnwQzy0tJIEMX5AVoFVcAWml
	suUNS8GcSbCu+pd/KrNtbYBThifK89bbiGtIoSiKifux/D54RU999mk60Dh9Ujgv+gH6ZJQ7+STlE
	4jXjFZT3GSEnJwLEtDjDrNGMdZBBjJpb/4NI6T3V4nz9WK16fMb0Ys3Dm/LnwElUMW09UZWl+teC6
	U8S7EjJOwr0pjZHRAxncYs6FBeirD8AV7F6ABn6pXAEP1XuvC8EQ0pkRnjqgHn42p8hOBxaWNcVxE
	SCcwBPiw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: Hrushiraj Gandhi <hrushirajg23@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Tue, 07 Jul 2026 20:23:47 +0200
Message-ID: <14045151.uLZWGnKmhe@phil>
In-Reply-To: <20260707160354.GB3176120-robh@kernel.org>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
 <178301901903.3838694.3276523670393868229.b4-ty@sntech.de>
 <20260707160354.GB3176120-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_112352_026298_D848BD12 
X-CRM114-Status: GOOD (  16.35  )
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

Am Dienstag, 7. Juli 2026, 18:03:54 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Rob Herring:
> On Thu, Jul 02, 2026 at 09:04:55PM +0200, Heiko Stuebner wrote:
> >=20
> > On Mon, 08 Jun 2026 11:39:38 +0530, Hrushiraj Gandhi wrote:
> > > This series adds initial device tree support for the Vicharak Axon
> > > single-board computer, which is based on the Rockchip RK3588 SoC.
> > >=20
> > > The Vicharak Axon is a feature-rich SBC targeting developer and embed=
ded
> > > use cases. It ships with:
> > >=20
> > >   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
> > >   - RK806 PMIC providing all SoC power domains
> > >   - eMMC 5.1 (on-board) and microSD slot
> > >   - Gigabit Ethernet via RGMII (RTL8211F)
> > >   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
> > >   - PCIe 3.0 x4 and two PCIe 2.0 slots
> > >   - SATA 3.0
> > >   - USB 2.0 host ports (EHCI/OHCI)
> > >   - NXP PCA9554 I/O expander for status LEDs
> > >   - Haoyu HYM8563 RTC
> > >=20
> > > [...]
> >=20
> > Applied, thanks!
> >=20
> > [1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
> >       commit: e0008b108aaf8c5aa22930b2ceadf8f894562acb
> > [2/2] arm64: dts: rockchip: add Vicharak Axon board
> >       commit: e08c3389c78dbefd31a57df8807cf57ef6f3c9b1
>=20
> Both have issues and should be dropped.

I've dropped both the Axon as well as the Vaaman2 board from the
same vendor now.

The whole thing is confusing.

I should've caught the pinctrl issue, and do remember running a dtbscheck
on at least one Vcharak board - but that must have been the Vaaman2 board
because there the pmic fullfills the binding (and general setup of other
rk3588 boards).

The vendor-prefix is missing indeed. I found earlier versions of the
version-avalanche had it, up until v6 [0] . Though I haven't figured out
yet why it was lost.

Hence I dropped both boards.


Hrushiraj: please start anew with both boards.

But include all the tags you received in previous versions.


Heiko


[0] https://lore.kernel.org/linux-rockchip/20260601162143.170030-2-hrushira=
jg23@gmail.com/



