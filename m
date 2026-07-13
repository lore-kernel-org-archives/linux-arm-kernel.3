Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2793C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PWwYyZCnbfXWgO9LHedRidprsqhsFzreLR4BeyON5c=; b=Fb2mZzAYYsaUwNMtDKShaBT7ZH
	LaQAyRPnJn+rpaykbDc2OTt4icaZHxxIPpSii4ILer7qU1ArONjgbQ+4bDKccGhTRs0xZdMYGbNfT
	YM6nkRX+PyW2LPYw8JODtZx/uQhN71dQDCZNhiOqZExMyhNosCC0vm+jKtjxN2nJjlmH0b8wfafG+
	lbIAiueXNW3hl6G+7WUqf6V6e9+T1SIO+8oDahd1q8ux9USVqSa1bz/vtC3urmEunIGYSIYvCL09Y
	asODec7WXPMeO8gcgImD3MpREQHbwyCI3ojJunDi8YPSmr+uDnMjMiQ5yS/pcz2kmdm6vFjeQh+ku
	TAXfsn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBS9-00000008Upn-2Lq8;
	Mon, 13 Jul 2026 07:51:49 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBS7-00000008UnZ-1Tje
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6PWwYyZCnbfXWgO9LHedRidprsqhsFzreLR4BeyON5c=; b=RSjVNoETA6d+cqne82/gUyS6A/
	mh3aa+03CHahLJX0DEgVMLKdngnpCh+J/xokQIvqfAoPtHikMTqEXkLUOGAhBIK+qpQHakIZ4jI9Z
	ms4CUL/bpnNGijVs+fKWsFT+F/Mi7l2hlXh2N2JaTvIhfgS/obyrRb/6g7HsCyuTbMKS8J0rVkB7n
	7PRWdm7/SG/CuzjgkJsemzwGnfflc/ZnrSr0dcsudO4/3ewe4WSmcyCHqbgztkNvgJuJ2CmFFznKQ
	Od39/cKscPGxXj7/gnnPAIzbZxZfHueLGF8Kyus6XJXpGde0bc0JYU+o/9J7VMpgGtInCCrHoOCYv
	unReUGdA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wjBRz-000Gav-2v;
	Mon, 13 Jul 2026 09:51:39 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wjBRz-000JPd-1T;
	Mon, 13 Jul 2026 09:51:39 +0200
Message-ID: <123688e88d5892eeb3905eb9a90a3d2a0971c4b1.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-am642-tqma64xxl-mbax4xxl: add
 icssg1 ti,pa-stats
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, Tero
 Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Date: Mon, 13 Jul 2026 09:51:38 +0200
In-Reply-To: <67187ee8-bfed-46e0-a9b5-ab88e024b420@ti.com>
References: <aaec2ddf7cecb58ca0af37d4f03afec571804757.1783348781.git.nora.schiffer@ew.tq-group.com>
	 <a03189aa138f74955a03b9fe6018a17bf7e2ce8c.1783348781.git.nora.schiffer@ew.tq-group.com>
	 <67187ee8-bfed-46e0-a9b5-ab88e024b420@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28058/Sun Jul 12 08:25:26 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_005147_463819_8F2F0B33 
X-CRM114-Status: GOOD (  17.37  )
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

On Mon, 2026-07-13 at 13:06 +0530, Vignesh Raghavendra wrote:
>=20
> On 06/07/26 20:13, Nora Schiffer wrote:
> > From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
> >=20
> > Add missing ti,pa-stats syscon phandle. In addition to providing
> > additional ethtool stats, this avoids a "icssg-prueth icssg1-eth:
> > couldn't get ti,pa-stats syscon regmap" error message.
> >=20
> > Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
> > [Nora Schiffer: edited commit description]
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
>=20
> Does this need a Fixes tag then?

I don't think so - the message was introduced in commit 550ee90ac61c ("net:=
 ti:
icssg-prueth: Add support for PA Stats"), which was then fixed up in commit
9e70eb4a9a8e ("net: ti: icssg-prueth: Make pa_stats optional") to avoid bre=
aking
existing Device Trees. There is no commit that this patch meaningfully "fix=
es",
and backporting it to stable kernels does not seem necessary to me.

If anything, the message in the driver might be downgraded from "error" to
"warning" in another patch, but I'll leave that decision to you.

Best,
Nora


>=20
> > ---
> >=20
> > v2: update commit message to correctly describe the error message this
> > avoids.
> >=20
> >  arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/a=
rch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> > index 46be6824dd163..b9e52d8bc8524 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> > +++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> > @@ -110,6 +110,7 @@ icssg1_eth: icssg1-eth {
> >  		ti,mii-g-rt =3D <&icssg1_mii_g_rt>;
> >  		ti,mii-rt =3D <&icssg1_mii_rt>;
> >  		ti,iep =3D <&icssg1_iep0>,  <&icssg1_iep1>;
> > +		ti,pa-stats =3D <&icssg1_pa_stats>;
> > =20
> >  		ethernet-ports {
> >  			#address-cells =3D <1>;
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

