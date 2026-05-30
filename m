Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1A2CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzwkDTAQqG6PPS7fnoCTQG10EzG6gQrpm3Qj4d8jAGQ=; b=IRM5p1XIV1TOY4xni/kOXJmCwX
	+GKGeM/6tT+xjGeM9/SG63/58z8ixscIxfT05NrpC+kppYpXB3WK+MJlDE96zbwKqBbIkon4H/F8M
	gOWN7Rmmr9zzCLmZ22CQmRNoWyrVcNfuE8uVzuL1ArbFWjJzhLdkA1zaLEKZBmOyllZI6+kKUuWFs
	V03Zqkt0uz8ZqA9ZsDMu6EwV+5Fx0sz1ToCcwqoKFKMXGeiOlkqnm9VW9Qj1buLdyQP3RdmSszla/
	+pN0T1dxSFdlKcTCIoWT2vSH7ZfIDxnu0nFRuT+19xcotaF1KK2xsSo9SlvEqjYvwmjiikBoXloJi
	FcrmPVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGjM-00000008cOV-3rLt;
	Sat, 30 May 2026 10:15:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGjJ-00000008cNv-29mP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 10:15:47 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:382:6f:8c15:9eec:bfe9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 579157CA;
	Sat, 30 May 2026 12:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780136119;
	bh=zvaQmf+JYcrSECFYTq4UgqqoBQXPSdcx+io6HmU0Skc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZSaTGwIJEU8eaobh6MC0b3gcnNDLpSV9zHMxVRStc4f8kSxSuDWq6QnARS2AUHlid
	 G7l8wSlvHfjDDzDW4muwKU7nMnF0XIvUHgrhuAkY8PK0s8g6c4IKdMUgzosQIYw0/x
	 1o8tHlJlfIH/2CGUQJyY7+wPUrssN6gDr5ZSGmGg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260529144125.vs4bds6nwimqdnbg@quack>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com> <20260515-beagley-cameras-v2-1-f6acb66c9995@ideasonboard.com> <20260529144125.vs4bds6nwimqdnbg@quack>
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2 pinctrl
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Date: Sat, 30 May 2026 15:45:35 +0530
Message-ID: <178013613529.933414.3135232474616950291@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_031545_698591_D84F7176 
X-CRM114-Status: GOOD (  16.90  )
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

Hi Nishanth,

Quoting Nishanth Menon (2026-05-29 20:11:25)
> On 06:46-20260515, Jai Luthra wrote:
> > I2C2 is used by camera sensor devices connected on the 22-pin CSI0
> > connector. Add the pin definition here so I2C2 may be enabled by the
> > camera sensor overlays.
> >=20
>=20
> Why not add the i2c node here with the pinmux, but disable the node with a
> comment that this should be enabled for camera sensors? A bit confused
> seeing a orphan pinmux node. but i dont see any other function for the
> i2c2 other than support the camera sensors :)
>=20

Ah I saw main_i2c0 pins defined here already with no node (that's also only
used by CSI1/DSI0 connector), so I followed the same pattern here.

Will move them both here in v2.

Thanks,
    Jai

>=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm6=
4/boot/dts/ti/k3-am67a-beagley-ai.dts
> > index 5255e04b9ac7..06aac02a7668 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> > +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> > @@ -157,6 +157,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) =
I2C0_SDA */
> >               bootph-all;
> >       };
> > =20
> > +     main_i2c2_pins_default: main-i2c2-default-pins {
> > +             pinctrl-single,pins =3D <
> > +                     J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22)=
 GPMC0_CSn2.I2C2_SCL */
> > +                     J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23)=
 GPMC0_CSn3.I2C2_SDA */
> > +             >;
> > +     };
> > +
> >       main_uart0_pins_default: main-uart0-default-pins {
> >               pinctrl-single,pins =3D <
> >                       J722S_IOPAD(0x01c8, PIN_INPUT, 0)       /* (A22) =
UART0_RXD */
> >=20
> > --=20
> > 2.54.0
> >=20
> >=20
>=20
>=20
> --=20
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource

