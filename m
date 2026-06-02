Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2F4CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNtggajtPS/6B2q6YiJYjuXgqHO/K+hRE4We3qzRvT8=; b=ILYfmvWPblp3AgPrBBepjUtxSI
	tk8it3C5bfY5LKCDDIyOMMUvvNOxaQLZXrjUwK/Y5ER/1ohCubpmlFx6YV30MMcHMuZ+LK5++4WvP
	Pv7ZMqPjyUQ9jyFW3ofMqsrjgZAMG6pjbuNxB3aGH/+ozL+9Pd0lFbQ7ecP46Te85Iw7HpTPhPTsK
	UP8PY5u0zzQubfG2d47GRhO1n7ond3OGj4xoDnn0ymWGkmNOp4z9QtJ2AUwD0XAAMdwyxkmkEn5KV
	bpZ7VlXlUJoufL7F7dQ7MmE18M30QNMnKnj+bPFqHW+qYbFNMIMgWwhlkoTqfpIfvcLSidKG9yb0D
	JrIffMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULrB-0000000CiMv-2Vz1;
	Tue, 02 Jun 2026 09:56:21 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULr8-0000000CiLc-2i0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tNtggajtPS/6B2q6YiJYjuXgqHO/K+hRE4We3qzRvT8=; b=KHhna32vrdKF/fNjy6wfgzkhnr
	PfMIyH4AMAQij9Ccr2zMspTM2z4DxE/rHNjAGEPNIVtwJsmcQpuaZIc+yMRoB/cxRTBoaBCxKTppw
	COpDz61skm+d7ZrqfZ896b//g2CKf/4108cN9AqSQQI1phdzoQt+xTnbzOMawUyjhWFjqOUH7+Ww5
	e+lGvtdT0wNmiT/pD/ayxBp98RnDUUkHIM5ggxUcZGHTb/DyvchDFUO2ZvZHbH+75qFMHL2XVBk87
	T6Ilt6fd9Ff2P421ev8OPzEhet412ZNyHoFj4aj8fKRMluJVCgZCY+cehFXovtHqUa3t+z3tUB3b7
	tgYMOtTg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wULr2-0003LT-0J;
	Tue, 02 Jun 2026 11:56:12 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wULr0-000FFh-38;
	Tue, 02 Jun 2026 11:56:11 +0200
Message-ID: <2b4b5b6ab51f991d859e52c1572008ae715c650f.camel@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: dts: freescale:
 fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Alexander Stein
 <alexander.stein@ew.tq-group.com>,  linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 02 Jun 2026 11:56:10 +0200
In-Reply-To: <fc375090851c17e069d7271f99ac4f75490a9a92.camel@ew.tq-group.com>
References: <20260224152523.570057-1-nora.schiffer@ew.tq-group.com>
	 <bfd19beec4ccbe296cdc1da865b15caf3ad1e5cc.camel@ew.tq-group.com>
	 <fc375090851c17e069d7271f99ac4f75490a9a92.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28019/Tue Jun  2 08:33:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_025618_793821_95B95FDC 
X-CRM114-Status: GOOD (  30.04  )
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

On Wed, 2026-04-01 at 13:31 +0200, Nora Schiffer wrote:
> On Tue, 2026-03-17 at 09:29 +0100, Nora Schiffer wrote:
> > On Tue, 2026-02-24 at 16:25 +0100, Nora Schiffer wrote:
> > > All modern TQ-Systems boards follow the convention that mmc0 is the e=
MMC
> > > and mmc1 is the SD-card when both interfaces exist, reducing differen=
ces
> > > between boards for both documentation and U-Boot code (which uses the
> > > same Device Trees). Adjust the recently added MBLS1028A Device Tree
> > > accordingly.
> > >=20
> > > Fixes: 0538ca1f102d ("arm64: dts: ls1028a: Add mbls1028a and mbls1028=
a-ind devicetrees")
> > > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >=20
> > > v2:
> > > - updated author information after name change
> > > - collected review tags
> > >=20
> > > As mentioned in the v1 submission, it would be great to get this in
> > > before v7.0, as the TQMLS1028A/MBLS1028A was just added in the curren=
t
> > > development cycle, and we'd like to avoid changing the aliases after =
the
> > > DTS was part of a mainline kernel release.
> > >=20
> > > Best,
> > > Nora
> >=20
> >=20
> > Hi Frank,
> >=20
> > can we get this applied, so the change makes it into v7.0?
> >=20
> > Best,
> > Nora
>=20
> Hi Frank,
>=20
> is there still time for this patch to make it into v7.0? If not, it would=
 be
> great to have this applied early in the v7.1 development cycle, so it can=
 get
> backported to 7.0.y before anyone starts relying on the current order of =
mmc
> devices.
>=20
> Best,
> Nora

Hi Frank,

how should we proceed with this? You provided your Reviewed-by months ago, =
but
the patch never got applied.=C2=A0It is also marked as 'archived' in patchw=
ork:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260224152523.=
570057-1-nora.schiffer@ew.tq-group.com/


I'm not sure if changing the aliases at this point would be too much of a
breaking change... would it make sense to resubmit it, or should I consider=
 it
rejected?

Best,
Nora


>=20
>=20
>=20
> >=20
> >=20
> >=20
> > >=20
> > >=20
> > >  .../boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi  | 4 ++=
--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbl=
s1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028=
a.dtsi
> > > index cf338b2e80064..426a81e1743f1 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.=
dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.=
dtsi
> > > @@ -17,8 +17,8 @@ aliases {
> > >  		gpio0 =3D &gpio1;
> > >  		gpio1 =3D &gpio2;
> > >  		gpio2 =3D &gpio3;
> > > -		mmc0 =3D &esdhc; /* SD-Card */
> > > -		mmc1 =3D &esdhc1; /* eMMC */
> > > +		mmc0 =3D &esdhc1; /* eMMC */
> > > +		mmc1 =3D &esdhc; /* SD-Card */
> > >  		serial0 =3D &duart0;
> > >  		serial1 =3D &duart1;
> > >  	};
> >=20
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

