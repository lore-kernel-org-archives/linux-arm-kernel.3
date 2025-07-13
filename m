Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D150FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbIoEtbAOYqWI5SbzeKBdgx9xcrk+A/+RYnTLbzS3WA=; b=wuO/qAyNuCud6Dp7tbeWF9ZAwd
	RLUqHp26gVqIkNUyv+NLWB6oNu+pJLW7W5fCQfJvmCDLJXr6ASZL2OWi4nbZA/d4VPBhhDVWl0TEy
	OwocNUObt9qIGBSEJhCzNZvG1joId994wo2iWV4TPC6J9FkWOdj4Ivd30CuuzshNlSqN8Krhouk7o
	fCHFD+q7YOKMheXRVRzOlIw7j1N4hq3IQAEjAnDwkl6u13+IaYjv9iP1Tv8CwaT3pUvKyDJBVhmr7
	tsxxFDRfnl7lEp3KBhePRp37jwoZeFSBGrVylKkJmoPfq2AwR1xzQdi8ze9lB1pp2KRz6WWaT3Qof
	Bavj/FAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1nh-00000000WKH-47xr;
	Sun, 13 Jul 2025 18:51:49 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1lH-00000000WB7-0HYF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 18:49:21 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 901541F0004F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 18:49:09 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7DDEEB00467; Sun, 13 Jul 2025 18:49:07 +0000 (UTC)
Received: from shepard (armstrong.paulk.fr [82.65.240.19])
	by laika.paulk.fr (Postfix) with ESMTPSA id 97E55B000E1;
	Sun, 13 Jul 2025 18:49:04 +0000 (UTC)
Date: Sun, 13 Jul 2025 20:49:01 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 1/9] dt-bindings: media: sun6i-a31-csi: Add optional
 interconnect properties
Message-ID: <aHP_nR2y5iMsCtFH@shepard>
References: <20250704154628.3468793-1-paulk@sys-base.io>
 <20250704154628.3468793-2-paulk@sys-base.io>
 <20250709-misty-coot-of-fantasy-cfadfa@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X9zBqThFU9k8sBj9"
Content-Disposition: inline
In-Reply-To: <20250709-misty-coot-of-fantasy-cfadfa@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_114919_419941_42E09CAC 
X-CRM114-Status: GOOD (  26.24  )
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


--X9zBqThFU9k8sBj9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed 09 Jul 25, 09:26, Maxime Ripard wrote:
> On Fri, Jul 04, 2025 at 05:46:18PM +0200, Paul Kocialkowski wrote:
> > An interconnect can be attached to the sun6i-a31-csi device, which is
> > useful to attach the dma memory offset. Add related properties.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  .../devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml  | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a3=
1-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-cs=
i.yaml
> > index 1aa5775ba2bc..978ef2dc0ae7 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.y=
aml
> > @@ -40,6 +40,12 @@ properties:
> >    resets:
> >      maxItems: 1
> > =20
> > +  interconnects:
> > +    maxItems: 1
> > +
> > +  interconnect-names:
> > +    const: dma-mem
> > +
>=20
> Is it really optional? My experience (despite being a bit outdated by
> now) was that it was required for some SoCs, and missing for others.

My understanding of the current stituation is that devices with the
interconnects property will get the dma offset from it while others
will have it set via sunxi_mbus' notifier. So in practice the
interconnects property is not required.

Currently the A83T and V3s/V3/S3 have sun6i-a31-csi devices declared in
their device-trees without the property. So I'm not sure if this still
allows us to add a mandatory property that may not always be present.

It should definitely be added (along with a mbus node) to existing users
though.

So all in all I think it makes more sense to not mark it as mandatory.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--X9zBqThFU9k8sBj9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhz/50ACgkQhP3B6o/u
lQzxTw//ROiN0Htb48Bzab2XLYugHHGICn0T1zNUDY1N+dbp1F7DBt7zbFSKmJrQ
KoEAcG81QXASWnIaf0NTPaBhSetnasv1VP7AGA7Bzp6J0ddaRESL3Y12C9k7VBDs
x62h5WT9Pyu9RchfXGaRbEwQBxcFu7+a3QUkqsXhs/2kFxFrfFrFJKnfNorgKf2P
TzKXxMPG67cmkl3+nek5hyyxftfZOpZatmFbnGV/K4SOd1F4o0hlblhAlaUfm7Nw
oulvKgn7ObSPXB/rhxzmlvAe92WDjta6xAaK3uhC05+wphwJxuCjzo4nImERZ6at
zqKV7r4GwQLjm4ttJ2LXs6qIrwYNGmvcnCIwm2N4i5vN+Si6GoOGMD6rsmHWKYQB
USnaF5WKD5eiBAQL4R9szCA3XBxWa3SHlxbdJfS1sJe81PtHxaT8TsINn7zNcf16
f7rAxcX1xd1nA6couHmXA/wungzTP65cfc01oq27XtrbKBuxvGImhSHMVMVdqHyU
pQeOAlrbHxy1w03g3pGFNrfLdTG1ntHCaqp77+eXzxqS1kZKkDxcTft8YpZMXa60
QeKx44JurlO4HeFJHE6uxpo5V5YHdzBqRv3gQ9eis8n5Ek4ZU9fHJwUkDd8GWGHY
vyT7FJ0Fw6DmKxqHlN6r8bt7KpcwJzIOqZStRrvQNJX6D+peS5E=
=u6Ul
-----END PGP SIGNATURE-----

--X9zBqThFU9k8sBj9--

