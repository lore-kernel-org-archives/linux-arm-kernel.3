Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84161C35FF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQK1ZiYgatJSwREZQPDI3hAe3w8MffezjQn0Bn9FfXE=; b=cctkfg7h56BtIQL5R+ILSxqZ2d
	DiMeRCYN8Wp9MrQ+Xr7xbuwdVTLYawq5m90YhUFmC/1anvOdAaoHG8hSxBIitMaJtba/ZfEgNJ/zi
	VWs+EBjEcnS2sZPMEyJUijSZMjUjlWgI9OnPLj+bs6qyt0pLrn29apq5twBok8YL4u3vpc+7Axrfk
	d/+FKEOfIKQ8XKZRpYFXXrcR/ohuUh7+DGFcNKZWwGGdepA3OE6EEVsJkQ+mHHv8bOgGHnGOjCbkV
	oXWzPTY+RLxFtajDdCZPmwrq7+k2Nz5/gbGnazGztd7l+YUJi4TlYD6mp094Gxy+0Q8tOowt9ppRf
	SIGQ/1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhH0-00000003X5D-1T1k;
	Mon, 10 Mar 2025 17:50:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfmo-00000003KQQ-11OZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 16:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TQK1ZiYgatJSwREZQPDI3hAe3w8MffezjQn0Bn9FfXE=; b=c3oPs9vlrj6DGFOrk2LyCRrciO
	xo9M5F3vwHA2YwJ+8an4uTmyWy/mkKMaKNQ0sHF6brRBozzk62xKM6uV07aAMs72R/5WOMFXugabw
	9W/QqGsrdW3jmdbf/7/ivEzvCqOwkLlPT9emIEhHi8u20FpBU1kOpZHRP+svVdU5rTQghUAKTHcVI
	0EZMVLMoET7r4tsS/Ks33p012D6Yw5VsUqSTHZeCIDQBjyh8HIgaxd1XnWb7LSYeu38pIjA3K6oLc
	w2yj/9Y2/rZTcZyCaedzNyTpaTacZoIWew2ZqbAaGf9h1J1uV1qtRSP1DNv813v1fMSviOZ4sze3p
	TRmFRAiA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfmk-00000001un8-0FIK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D6E85A45162;
	Mon, 10 Mar 2025 16:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D516C4CEE5;
	Mon, 10 Mar 2025 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741623318;
	bh=RCE73KHSUJ50jx3NFplvsYyJfYQ1fa2jm0Y9GrKAnwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3kuO3S+Nx7mCzhWvx/E/uIZ2vURLJ4P2hDaJ/deXkTW5gSBPZ/iLJVR2JXwWHjUB
	 +QryoEs3PGgZ3VFmGnP3YWKk+omEPpJalBHrodC6z5anZmuMoXxlTc+ndYdHSSa0Ow
	 0905svS6DLYRFVfGYi2VTtnGFESX5SAVoXdRjKWyj//gNXF64A5J6arWZ78ImhY5ZF
	 Z+RuABasjNYhtf9eI7lt+nKeTWLg2jtryY+RblgQtZmgE3JMw2cXb8hGqfbNSX1yNo
	 9t326LigmhFb7EiFJePa+VlsNLKXHRXxuogam0HqQws4j4NmCLSnM/w1XJYOlbWsWQ
	 TuaRFNZZuP75g==
Date: Mon, 10 Mar 2025 16:15:12 +0000
From: Conor Dooley <conor@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"rui.zhang@intel.com" <rui.zhang@intel.com>,
	"lukasz.luba@arm.com" <lukasz.luba@arm.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Message-ID: <20250310-blurry-scam-bee8233878bc@spud>
References: <20250227122453.30480-1-john.madieu.xa@bp.renesas.com>
 <20250227122453.30480-4-john.madieu.xa@bp.renesas.com>
 <20250228-shampoo-uprising-44ae0d3bd68b@spud>
 <OSBPR01MB2775DFC184F78E9FB50F28FFFFD52@OSBPR01MB2775.jpnprd01.prod.outlook.com>
 <20250307-everyone-ragweed-e05a10a9646b@spud>
 <OSBPR01MB277531D7C872C9EB0B287069FFD52@OSBPR01MB2775.jpnprd01.prod.outlook.com>
 <20250307-barbell-pretzel-368d6a4d1336@spud>
 <OSBPR01MB2775D121B55A0C543F251BAEFFD72@OSBPR01MB2775.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y4DhUv2VFm8QJbH+"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2775D121B55A0C543F251BAEFFD72@OSBPR01MB2775.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_161522_360625_7517507B 
X-CRM114-Status: GOOD (  40.68  )
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


--Y4DhUv2VFm8QJbH+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 09, 2025 at 10:39:27AM +0000, John Madieu wrote:
> Hi Conor,
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Friday, March 7, 2025 5:04 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>
> > Subject: Re: [PATCH v2 3/7] dt-bindings: thermal: r9a09g047-tsu: Docume=
nt
> > the TSU unit
> >=20
> > On Fri, Mar 07, 2025 at 03:55:27PM +0000, John Madieu wrote:
> > > Hi Conor,
> > >
> > > > > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > > > > ---
> > > > > > > v1 -> v2:
> > > > > > >  * Fix reg property specifier to get rid of yamlint warnings
> > > > > > >  * Fix IRQ name to reflect TSU expectations
> > > > > > >
> > > > > > > +    enum: [0, 1]
> > > > > > > +    description: |
> > > > > > > +      TSU operating mode:
> > > > > > > +      0: Mode 0 - Conversion started by software
> > > > > > > +      1: Mode 1 - Conversion started by ELC trigger
> > > > > >
> > > > > > Can you make this "software" and "elc" or something please,
> > > > > > unless people will genuinely find "0" and 1" to be more
> > informative.
> > > > > > And why doesn't the property have a default?
> > > > >
> > > > > Sorry for miss-specifying.
> > > > > ELC is an external event trigger. May be should I specify it like
> > that ?
> > > >
> > > > If "elc trigger" is meaningful to people using hte device (IOW, it
> > > > matches datasheet wording) then that's fine I think.
> > >
> > > "elc trigger" matches datasheet wording.
> > >
> > > >
> > > > > To make sure I got your point, do you mean specifying a default
> > > > > value in bindings ?
> > > >
> > > > The property doesn't actually need to be required, it could easily
> > > > have a default (say software) and only be set in the case of using
> > > > the elc trigger - which brings you to Rob's comment that it can just
> > > > be a boolean, setting the property if elc and leaving it out of
> > software.
> > >
> > > Got the point now. I can make it default to software trigger, and add
> > > optional Boolean property to ELC trigger. Let's say "renesas,elc-
> > trigger;"
> >=20
> > Yah, that works.
> >=20
> > >
> > > >
> > > > Rob's other comment was
> > > >
> > > > | Who/what decides the mode? If a user is going to want to change
> > > > | this, then it should be a runtime control, not a DT property.
> > >
> > > Changes are not possible at runtime. Some customers may want software,
> > > while other may want the external trigger, and this is immutable
> > > configuration.
> >=20
> > What makes it immutable? Set by some wiring on the board? I couldn't fi=
nd
> > the user in your driver patches to better understand how you were using
> > it.
>=20
> I haven't prototyped ELC trigger yet. Since the hardware manual
> describes about ELC trigger, I have documented it in bindings. If you
> think, it is not needed at this stage, then I can drop it now and
> revisit later.

Ideally a binding is complete, even if the driver isn't. To me
"immutable" would mean something like "the trigger type is determined by
hardware or firmware configuration", but if it is determined by register
writes (e.g. wired up for elc trigger, but you can opt for software
trigger in the driver) then it should be a userspace control.

--Y4DhUv2VFm8QJbH+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ88QEAAKCRB4tDGHoIJi
0vhMAQCm2Y7JfoFQzgyGUf9s0PImQnGR4b2zFgNyA8NdDDoM3QD/eDs9SL5uwZcg
mBlbEbmXWmVrRzklDQPVrwR33fZJwQg=
=zZHw
-----END PGP SIGNATURE-----

--Y4DhUv2VFm8QJbH+--

