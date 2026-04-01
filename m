Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A198D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxkBWy1RiMT/07EKwYFoIvm+IfBD6Bsnz0wcULDId4k=; b=GN57NxhnXqSX3H45hIpLf7yjY7
	Tehu+sv2CU9RIP5spZPalsvtNBgG0DhdQzKH1Iz3t7gtWn+a4VXH0Fz2tQZKfcy85cOAym/mHfHXi
	sg/Jd5L9LsbgMnnvuSRIcTn+uojpZQmohG/8QfAtf3NbnYtUsiescYxVQvRr3CwN4nduTwPseMJtX
	3flWzd/zCGACcOz8g/our3Y49j/PunFWOCzIvt1OtZaD+P1rETOhqjC+oYOxBq94CdeJKTiBZ41r6
	YUEw67uD4aykrwnSWt1vIBVazPmKIkrqefZGFHM0RN6UbR+CrSh23Iu2jYb/tWjPoqKDWYPVQBNZK
	HjI7S66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tn0-0000000EeLs-0uBO;
	Wed, 01 Apr 2026 11:31:14 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tmx-0000000EeLK-3AUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PxkBWy1RiMT/07EKwYFoIvm+IfBD6Bsnz0wcULDId4k=; b=pyHRbovwKj2zMxxAPkvZaa+tpe
	IFkvI6VPffo9zA/8u3NncwcbAnjbUOg4KwwRtSDVUUuicEC48SsPs7XpROu7hsgFunPEDdv3AZZDy
	+GX+0T7LpjE9+tPmVc/hB7tCgBwRnqqvnaQodp04FDXQSx7pbo01xjfBx4OLmWR1QLnWKd/jM9mUE
	ANtocl88GI7oy1wf/tyTsX5es2kMjhiHpUFS+wGbPR6X605YsNBg0bLkKiNQMvozxGbuyPJv31ezD
	zm526Jb8c8owTnl4xrZ97V5iA2zejb44zxNEMxE3qZJibb8OXPB+SwpYyGUrJZPoq3ow1etdHyORr
	cSJh3+FA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7tmv-000ABG-2r;
	Wed, 01 Apr 2026 13:31:09 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7tmv-000F8Z-2J;
	Wed, 01 Apr 2026 13:31:09 +0200
Message-ID: <fc375090851c17e069d7271f99ac4f75490a9a92.camel@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: dts: freescale:
 fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Alexander Stein
 <alexander.stein@ew.tq-group.com>,  linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 01 Apr 2026 13:31:08 +0200
In-Reply-To: <bfd19beec4ccbe296cdc1da865b15caf3ad1e5cc.camel@ew.tq-group.com>
References: <20260224152523.570057-1-nora.schiffer@ew.tq-group.com>
	 <bfd19beec4ccbe296cdc1da865b15caf3ad1e5cc.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_043111_833845_F8493E03 
X-CRM114-Status: GOOD (  23.29  )
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

On Tue, 2026-03-17 at 09:29 +0100, Nora Schiffer wrote:
> On Tue, 2026-02-24 at 16:25 +0100, Nora Schiffer wrote:
> > All modern TQ-Systems boards follow the convention that mmc0 is the eMM=
C
> > and mmc1 is the SD-card when both interfaces exist, reducing difference=
s
> > between boards for both documentation and U-Boot code (which uses the
> > same Device Trees). Adjust the recently added MBLS1028A Device Tree
> > accordingly.
> >=20
> > Fixes: 0538ca1f102d ("arm64: dts: ls1028a: Add mbls1028a and mbls1028a-=
ind devicetrees")
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >=20
> > v2:
> > - updated author information after name change
> > - collected review tags
> >=20
> > As mentioned in the v1 submission, it would be great to get this in
> > before v7.0, as the TQMLS1028A/MBLS1028A was just added in the current
> > development cycle, and we'd like to avoid changing the aliases after th=
e
> > DTS was part of a mainline kernel release.
> >=20
> > Best,
> > Nora
>=20
>=20
> Hi Frank,
>=20
> can we get this applied, so the change makes it into v7.0?
>=20
> Best,
> Nora

Hi Frank,

is there still time for this patch to make it into v7.0? If not, it would b=
e
great to have this applied early in the v7.1 development cycle, so it can g=
et
backported to 7.0.y before anyone starts relying on the current order of mm=
c
devices.

Best,
Nora



>=20
>=20
>=20
> >=20
> >=20
> >  .../boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1=
028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.=
dtsi
> > index cf338b2e80064..426a81e1743f1 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dt=
si
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dt=
si
> > @@ -17,8 +17,8 @@ aliases {
> >  		gpio0 =3D &gpio1;
> >  		gpio1 =3D &gpio2;
> >  		gpio2 =3D &gpio3;
> > -		mmc0 =3D &esdhc; /* SD-Card */
> > -		mmc1 =3D &esdhc1; /* eMMC */
> > +		mmc0 =3D &esdhc1; /* eMMC */
> > +		mmc1 =3D &esdhc; /* SD-Card */
> >  		serial0 =3D &duart0;
> >  		serial1 =3D &duart1;
> >  	};
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

