Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFD710F92FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 20:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0M0/sXX/s0DXkkv0+EF2fIkGOqZ6C31hkXqcBioYKU=; b=gmLG6Q2I/a3hQvO/z5NVDlyq1b
	XQ7HQLOg6kJpEvmJihzDc7Ov3CCWO8Y/IktgZwaCkQDQNWnr9Glehn6Yfk6RESidsTUH7q8tyWPYh
	YkBoxTGckYkpISM646DV1SI3/IQOMsrOYF+brW9lHyf6leBSg9Ama5lcO7dBcE9S97Z0KGyr4iFXs
	OsoR0JYZbsk2KZQWt0/L3aKQroiZBum7ssTFQWGq386lnOIiBuGjPnlbG8BmGQzmLxjrbyhUQCjLX
	F+T6kVYe/BBKEteBTubbmEBWEzgxU8VJg7ecsmRTlULW2Oi6z8tDu9IZm7UsRCCSvyX6nX9ATSliN
	USEPTMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7fZs-0000000DWaW-0QuE;
	Tue, 31 Mar 2026 20:20:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7fZp-0000000DWa1-3ZcJ;
	Tue, 31 Mar 2026 20:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=j0M0/sXX/s0DXkkv0+EF2fIkGOqZ6C31hkXqcBioYKU=; b=dMmFTAQKdHoK+OMMZ3qvudqnUZ
	4rainb2qsrUHgHOP8R3lPswoGe4ucx+aqtz6sk1eZ0HRM1mTT+QpN8ZdcE7tmTimxinxyvclzImRZ
	rG7gHw2rRZgr+4aMdFknFtkiR23scQZZBBRxWw7pS4M6x2iqb3mZo9bysBw65vl02YInjsf1Jsn5i
	y6i04IKp2U0Jv1hI2U+VKaWjndyOdwY6CAluE4xfowMd481CiK7bPi0bZYrbvpzW5lhh4uQnWs8G2
	Z5kaLATQs5x8Fj9r+SMm31c7fZGXe7UA0JADZw1OIGNK7Ln1HCvdg62W2piCE0HgR6QbG6YNvSRZW
	p+S9lLsQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>, Dennis Gilmore <dennis@ausil.us>
Cc: Jimmy Hon <honyuenkwun@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>,
 Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 John Clark <inindev@gmail.com>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>, Peter Robinson <pbrobinson@gmail.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Mykola Kvach <xakep.amatop@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
Date: Tue, 31 Mar 2026 22:19:50 +0200
Message-ID: <2545205.jE0xQCEvom@phil>
In-Reply-To: <CAABkxwsD_59G3YrpMdUi7D1fVHruSuDHn9-gQAZbwTdxGBHaBA@mail.gmail.com>
References: <20260310031002.3921234-1-dennis@ausil.us>
 <CABjd4Yz3MKOp-gE8kNc4EOt3-a0mKZsxvbVYCN4KsbqTRDtWgA@mail.gmail.com>
 <CAABkxwsD_59G3YrpMdUi7D1fVHruSuDHn9-gQAZbwTdxGBHaBA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_132041_917934_22EA6572 
X-CRM114-Status: GOOD (  33.03  )
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

Hi Dennis,

Am Dienstag, 31. M=C3=A4rz 2026, 21:41:50 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Dennis Gilmore:
> On Wed, Mar 11, 2026 at 9:26=E2=80=AFAM Alexey Charkov <alchark@gmail.com=
> wrote:
> >
> > On Wed, Mar 11, 2026 at 5:29=E2=80=AFAM Dennis Gilmore <dennis@ausil.us=
> wrote:
> > >
> > > On Tue, Mar 10, 2026 at 7:20=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.=
com> wrote:
> > > >
> > > > <snip>
> > > > > +
> > > > > +       vcc5v0_otg: regulator-vcc5v0-otg {
> > > > > +               compatible =3D "regulator-fixed";
> > > > > +               enable-active-high;
> > > > > +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > > > > +               pinctrl-names =3D "default";
> > > > > +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> > > > > +               regulator-always-on;
> > > > > +               regulator-boot-on;
> > > > regulator-always-on and regulator-boot-on does not seem right.
> > > >
> > > > Why were these added? The vendor did not have them.
> > > > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b6=
5da2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi=
=2D5-pro.dts#L216-L226
> > > >
> > > > Was this mistakenly taken from the regulator usb 20 which is poweri=
ng
> > > > the onboard usb2.0 hub?
> > > > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b6=
5da2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi=
=2D5-pro.dts#L111-L119
> > >
> > > It may have been a missreading of the schematic, but it was added to
> > > get power to the USB3 port. before I added it devices plugged into the
> > > USB 3 port would not power on
> >
> > Hi Dennis,
> >
> > The schematic says that this regulator supplies the VBUS voltage for
> > the USB3 part of your Type-A OTG connector. If you make it always-on,
> > you'll likely lose the possibility to use this port in device mode
> > (which you would need e.g. for flashing images over a USB cable in
> > U-boot which also takes device tree sources from Linux via
> > devicetree-rebasing).
> >
> > You also link it up as the PHY supply of the USB2 controller, which
> > doesn't describe the actual hardware.
> >
> > Please see if you'd rather define a connector node for your Type-A
> > port, and list this regulator as its VBUS supply explicitly. I've
> > recently submitted a patch [1] to make the "onboard_usb_dev" driver
> > take care of enabling VBUS in exactly this type of situations (it's in
> > usb-testing now and will hopefully hit -next sometime soon). If you
> > need an example for its use, please refer to [2].
> >
> > Best regards,
> > Alexey
> >
> > [1] https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@f=
lipper.net/
> > [2] https://github.com/flipperdevices/flipper-linux-kernel/blob/2f814cd=
f07f50e901fc1b1328213e76460864c20/arch/arm64/boot/dts/rockchip/rk3576-flipp=
er-one-rev-f0b0c1.dts#L303-L328
>=20
> Sorry for the delay, I am taking a look at it now. Please let me know
> when it lands in -next. In the meantime, I believe what I have is in
> good shape and is working well here. I am happy to make a change once
> support lands upstream.

Review comments should be addressed before patches get applied.

So there is no waiting for "when it lands upstream" to make additional
fixes, when you know at submission time, that things need improvement.


Heiko



