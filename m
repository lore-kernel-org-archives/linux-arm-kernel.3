Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94311C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vucpTji7QLeT4Yt7+x1nVopNJbqPPRcEBC9CkZ2GXhk=; b=xHQwZatymPWDiE+IUJlNrz3nqW
	Rw/RhNEhon4w1kNeK1/39mrPlUd/MJBCUuDS1KmG8zMHxzcbiOaAws+zYByOxbK0ZTDoJAcDLSfrv
	IuLFBt2bUH5RntUX1r1z+GoeRdvktBtLAS7NJhooOYq/dzhM6q2SEQjXfntjxuJDkxtEFEIJUJGie
	RtSp4IOMhxEefwstUsiHD16yBGM4q0AG+66XNBbxv+YCFSayHcNA0kw9C4oy1BdQEqwp97FXCHW4c
	gA8/erkrdJTrFi8qvbkg5cNY2TB5zEpXiWbC8e05dIXd+mTHd6Pzpg7BkMNBmboqKizW6Oj3Lflfn
	Dks02aYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27WA-0000000HPKS-3JTx;
	Thu, 03 Sep 2026 13:30:14 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27W7-0000000HPI4-0ej6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1788442199;
	bh=Iqe9spGh3XTkMw0WgH0pZdCzQfIL8GSoVCT8n0qhZk4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=U/hK9O8sx/Ej3wJEDLagfRm90spdB8oagI/tMQa+wm4eHs6IxoZsNSk44TMPsnRII
	 /Xpg3qvDhSglx+uQdaOfQ+mf9mO8K77agxy8r7yceDxqPdlYw/uCEbZKye4SHxIb6C
	 4IV0ndZQwdxyW+o8x/50o0Ry2UA5eoDqJZDvl1p4=
Message-ID: <1666390417d0d9b8f58a7bdad1b8ecb475ba0d4f.camel@crapouillou.net>
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS
 in Bluetooth node
From: Paul Cercueil <paul@crapouillou.net>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 15:29:57 +0200
In-Reply-To: <6e319291-72b8-4a43-b953-8a9f0a6049c8@samsung.com>
References: <CGME20260829101532eucas1p29f4e04d4dfd169377793c276221059a6@eucas1p2.samsung.com>
		<20260829101509.138284-1-paul@crapouillou.net>
	 <6e319291-72b8-4a43-b953-8a9f0a6049c8@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_063011_377386_2FD6AF84 
X-CRM114-Status: GOOD (  22.63  )
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

Hi Marek,

Le mercredi 02 septembre 2026 =C3=A0 10:36 +0200, Marek Szyprowski a =C3=A9=
crit=C2=A0:
> On 29.08.2026 12:15, Paul Cercueil wrote:
> > The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-
> > rtscts'
> > property.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>=20
>=20
> Indeed the CTS/RTS pins are used for BT on most of the ARM=C2=A0Exynos
> boards,
> as the "<&uartX_fctl>" property is assigned for pinctl-0. This is not
> really
> specific to i9100, so maybe this property should be added to other
> dts?

I can add it to all exynos4 boards that use the "uartX_fctl" property.


> However I wonder if Samsung UART driver actually use this "uart-has-
> rtscts"
> DT property? A quick "git grep uart-has-rtscts drivers/tty" shows
> nothing
> related to Samsung Exynos...

It looks like it does not. I still think the DT property should be here
but I won't fight over this.

Cheers,
-Paul

>=20
> > ---
> >=20
> > Notes:
> > =C2=A0=C2=A0=C2=A0 Changes:
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Bl=
uetooth
> > node"
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 -v2: Drop max-speed property. It's only supposed to =
be used in
> > some
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cases, which don't app=
ly here. As this was the "fix" for
> > getting
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bluetooth to work on m=
y device, which will be applied to
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver instead, the Fi=
xes: tag was removed.
> >=20
> > =C2=A0arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> > b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> > index 8a635bee59fa..95964be7daa8 100644
> > --- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> > +++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> > @@ -875,6 +875,7 @@ &serial_0 {
> > =C2=A0	status =3D "okay";
> > =C2=A0
> > =C2=A0	pinctrl-names =3D "default";
> > +	uart-has-rtscts;
> > =C2=A0	pinctrl-0 =3D <&bt_en>, <&bt_res>, <&uart0_data>,
> > <&uart0_fctl>;
> > =C2=A0
> > =C2=A0	bluetooth {
>=20
> Best regards

