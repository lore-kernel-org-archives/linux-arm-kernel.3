Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1120CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HfS4Rwakf0M9AKxnjqEONBUgIQ0CKLuVXSewYYRCt0=; b=px3FZYFQC6F9g6/NhGdRpNU5VE
	tsc/7K9VwRruDTCB1DGpdFLHW9XKogd7K/iRoonx6a8TmI/mAGDr2bA/alHv5+mivTR0Xi3Qs4DBA
	Lc5Dr/6ybOU0ffccs1/tidIiX9IMSixJBIf0QnLqszQDmZSEPaiuTJ0N4je7CK3aG4W/JNu/Tpfdw
	ZA+MsHNTx+tgJt/MPKTo1gRZssxm6SnCbeJnPt0htS7yC4Lzg4LQpc0xCAYa72DYwvpLHNN4I5+Yo
	ls6hKUM5Le/x4OSHHqREQpPGB7zioFW27eBkDIjkQKqrZIre1ACDNBWXMnV+Fy/DqcFdMt8SWW8hO
	jNKAk0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYktl-0000000D2aI-1r4m;
	Sun, 14 Jun 2026 13:29:13 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkth-0000000D2Zu-1NoC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 13:29:11 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E871F37002F3
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 13:29:04 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 6A044B45688; Sun, 14 Jun 2026 13:29:03 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C008CB4567C;
	Sun, 14 Jun 2026 13:29:01 +0000 (UTC)
Date: Sun, 14 Jun 2026 15:28:58 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 4/6] dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC
 compatible entry
Message-ID: <ai6smn4BnbAIMXCt@collins>
References: <20260613152655.212490-1-paulk@sys-base.io>
 <20260613152655.212490-5-paulk@sys-base.io>
 <20260613-nondescript-sociable-goat-aee13a@quoll>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NSEvN2AwITQmLA/Z"
Content-Disposition: inline
In-Reply-To: <20260613-nondescript-sociable-goat-aee13a@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_062909_548846_DCF93C01 
X-CRM114-Status: GOOD (  21.40  )
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


--NSEvN2AwITQmLA/Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Sat 13 Jun 26, 20:22, Krzysztof Kozlowski a =C3=A9crit :
> On Sat, Jun 13, 2026 at 05:26:53PM +0200, Paul Kocialkowski wrote:
> > The V3s/V3/S3 comes with a rx-only D-PHY paired with the MIPI CSI-2
> > controller. It is compatible with the D-PHY found on the A31.
> >=20
> > Add an entry with a new compatible and the A31 compatible as fallback.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-=
mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-=
mipi-dphy.yaml
> > index 6a4fd4929959..3ca1a1c47032 100644
> > --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dp=
hy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dp=
hy.yaml
> > @@ -21,6 +21,9 @@ properties:
> >        - items:
> >            - const: allwinner,sun50i-a64-mipi-dphy
> >            - const: allwinner,sun6i-a31-mipi-dphy
> > +      - items:
> > +          - const: allwinner,sun8i-v3s-mipi-dphy
>=20
> So that's enum with previous first entry (50i-a64) - same fallback.

Ah sorry about that. Thanks for the review!

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--NSEvN2AwITQmLA/Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmourJoACgkQhP3B6o/u
lQwV+A/+NkOCmMfOg2YFf5bQKC5plenZLRP17/88N9UXHjsV3ImZ8OtBZjC8y/9q
MzYyACkWYH8Me6BqtOnnWsIhwWZk5dnkibEudFSYZXj6y5XumVtqQY6JuT6fTS7M
+bGYBtH511C/QCiRVSUdV+nh07htVNPouWpDiePOyQxgLRGrXFTjbvX5MAlpiR1z
wld6FnIrX4Scsjs1j2Ow4Ns8ikjQ+TlKbjiErf5PLrqlEgACxcpnpDofDfqNrbBF
wzxJE4QWD3DW5kqxvCKsaFOP8ZqMdlkU0QrH1QCPimrdFlhD8BdkJppLQDLT6+Vw
b9lKj08AwoCZDunrjGBqUPWvsKeHGkWrLGD6ReJP0Pom3t5HSQT0azoc06os6tI7
rqd/BWBSvJe4+efslxM/ptqqqBBn1dRQPqgv46FQDwDh6oIFSeRSCJHn6FcIcxd9
lSTJQLS19oYyiokAu9TBbHfvq0wvLrOytKccxv8e9Uk20ER2X5cInI17KibuAvxU
zy956vSRzj6GG68m8rswA8pwtx4qidemyM4KZMkUxcATDSDUR7KjSWpYWQK7G4bO
BYViglw8xHSVuQCLpKhNk0MghQ//Qx6o+uDmePHmOgkNEQMzXJ8W0URQ94eVkbZC
Lnfbgmtd5fIB7JQgK8fASwIAgprARTW08+bmUxRT4tP4Gt2DukQ=
=7Yam
-----END PGP SIGNATURE-----

--NSEvN2AwITQmLA/Z--

