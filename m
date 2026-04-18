Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BDAF99C7C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 11:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8rrSqvI84yxcy6+fk+ghAExFVSWPfMgcozLKdCjGYk=; b=K80uwhHN03QYmTtKU3KnT/ANiw
	MZxPf0J0h1XIcq9FeH8y/G6U0MhxsfoRwkynrAtI7xxoFmJYeRC7S+77i74EH9n9G8aKziusNM7i6
	jNO6WQ7Y8MvQDL6BNMSAzLCS9iuC8/hwVg5H3UsR0IdKDYui5P7L9WJIs8JgDOY2/Jy0HaLPDkF/Y
	jlmwJVR5uDbJVkRWXZJNccAF94rN0WwGxItQf45GIoWKNx8n7wr4aJodA01ncbO6FC8ezSPtArqG7
	czS0los2R4cA0ioi/g7j5n94uBXaAUERE8jQimzM/IMBCgfj/G0OISLsCpR3Wub6WflElVTPgCvKH
	0a39deAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE4H6-00000004xdH-0Dz5;
	Sat, 18 Apr 2026 11:55:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE4H1-00000004xcj-0oNz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 11:55:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E42E1A32;
	Sat, 18 Apr 2026 04:55:34 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C79563F7B4;
	Sat, 18 Apr 2026 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776513340; bh=cGEAy3W2Hgjbx+Rpgzb/NTGU3TEbtjntAU+pNGtk3uo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I77IGIhfG2oOTNKY29yxyRzy03ikR066Bf0UIC+xT0+oE5iDSQmGJsRT10wsFPrz9
	 a7stl6AZSe1Zo6+3IRh0kqsUl2qmZZ72nnDjWTdskqAGAHZKaDTvrfDfx0nVIPaVVz
	 GkhaABXQM85B71RsWimBNtjtlIVlY83Q3wV1GUeY=
Date: Sat, 18 Apr 2026 13:55:19 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Michal Piekos <michal.piekos@mmpsystems.pl>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: dts: allwinner: t113s mangopi: enable watchdog for
 reboot
Message-ID: <20260418135519.16e41490@ryzen.lan>
In-Reply-To: <2825865.mvXUDI8C0e@jernej-laptop>
References: <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
	<2825865.mvXUDI8C0e@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_045543_271303_55D394ED 
X-CRM114-Status: GOOD (  17.77  )
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

On Fri, 17 Apr 2026 20:19:20 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Hi,
>=20
> Dne nedelja, 12. april 2026 ob 19:42:10 Srednjeevropski poletni =C4=8Das =
je Michal Piekos napisal(a):
> > Reboot hangs on MangoPi MQ-R T113s because no restart handler is
> > available.
> >=20
> > Enable the SoC watchdog whose driver registers a restart handler.
> >=20
> > Tested on MangoPi MQ-R T113s.
> >=20
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> >  arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.=
dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > index 8b3a75383816..f0232a5e903b 100644
> > --- a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > @@ -33,3 +33,7 @@ rtl8189ftv: wifi@1 {
> >  		interrupt-names =3D "host-wake";
> >  	};
> >  };
> > +
> > +&wdt {
> > +	status =3D "okay";
> > +}; =20
>=20
> Move this to sun8i-t113s.dtsi. All t113 boards have the same issue.
> Watchdog should be always enabled on ARM.

We actually have that line in U-Boot:
https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/sunxi-u-boot.dtsi=
#L22-L27

IIRC, the idea was that it is *firmware* that chooses the watchdog, so
the generic DT should not be the place to set this.

If people use $fdtcontroladdr as the DT source, everything falls in
place neatly, no need for changes or runtime patching.

Cheers,
Andre

