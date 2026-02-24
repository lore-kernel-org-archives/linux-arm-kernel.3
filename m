Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070F1F4BB6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAbGsN5jwYcKtQnh4HcERW/DJaa8iU8kncHDOnNPM5A=; b=BruN/r7JcPLgmBN/a1xuW9dCQ3
	L+9YDwgAuihMm8J4QnQzJXImSRa6LLwTb7mPcMcniSnJ9VEsBWhnPfHknhDMr4BTnGvtdnP3ud+Rj
	NJhFvls7MVO1QKykwc1X9afzkmlJ1AFYoc0CtD2JhVeGOlaAxbcRGbQIAOSqDJcYhgfnYodAShe4s
	AKi20k3Y3x0jC7JO9FUleJIvJm0QNCgVfVXvyw20LXoeCTnyso0gLo7Dds1LGySkWW10bGtYfGGsU
	bcP34yrm7jMuKibOUE0g0lPa0Q8m/cukx/JCj+q1IGn+QfvRofPTZAf8rHAjwINV4Z0bqpq1sNJ1A
	9IX1SaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwhF-00000002YlA-2AE2;
	Tue, 24 Feb 2026 17:59:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwh9-00000002YcG-3uhe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:59:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 350EA600AE;
	Tue, 24 Feb 2026 17:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8761C19425;
	Tue, 24 Feb 2026 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771955978;
	bh=Pm0JybyrwPgd7Q3ZPwZAesVM4nExNviwgUepqONQY9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bN0nuxW5g0VsrYpqmJx3G74DnHU/8MhQT9q+TAko5i1psT9b5zGDxTUNSR39qKcXh
	 VJkuR6dLGCaQZwCR9dTqHUyei+/GdA/fDTJ32yxzNpuTKCJWA+oeKpwKGmuvXhBZRM
	 69Th8rYqptplTG31VwXaGfrWpamJfLf1gA6HDd8Q4bMebr/9VSiRHS+IQ5Ce01xCJ9
	 M0pqjgVibh1pK5rjtwFG6rNW+2w0Ri82/e22Vef+nbyuYrTgbkWEaz4rc6pHWd0gn1
	 r/+3rOfbmPavcNiQmHWiS6BcbrddvgUxBJAUK7VdAno3f9YAGJiJqcppE6BtcafjA8
	 aaLKeTnPJRXZA==
Date: Tue, 24 Feb 2026 17:59:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH 2/4] dt-bindings: mmc: fsl-imx-esdhc: add S32N79 support
Message-ID: <20260224-splatter-sneak-3ec0e4d1272b@spud>
References: <20260224111533.3194883-1-ciprianmarian.costea@oss.nxp.com>
 <20260224111533.3194883-3-ciprianmarian.costea@oss.nxp.com>
 <20260224-remote-deliverer-958fcaba8bfa@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvK9ZLScef9N3RQa"
Content-Disposition: inline
In-Reply-To: <20260224-remote-deliverer-958fcaba8bfa@spud>
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


--GvK9ZLScef9N3RQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 05:58:05PM +0000, Conor Dooley wrote:
> On Tue, Feb 24, 2026 at 12:15:31PM +0100, Ciprian Costea wrote:
> > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >=20
> > Add compatible string "nxp,s32n79-usdhc" for the uSDHC controller found=
 in
> > NXP S32N79 series automotive SoCs.
> >=20
> > The controller is compatible with the existing i.MX uSDHC controllers.
> >=20
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b=
/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> > index b98a84f93277..014b049baeb6 100644
> > --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> > @@ -35,6 +35,7 @@ properties:
> >            - fsl,imx8mm-usdhc
> >            - fsl,imxrt1050-usdhc
> >            - nxp,s32g2-usdhc
> > +          - nxp,s32n79-usdhc
>=20
> Ditto here, no driver change?

Actually, this doesn't make sense per the commit message "the
controller is compatible with the existing...". I'd expect to see a
fallback compatible permitted in that case.

>=20
> >        - items:
> >            - const: fsl,imx50-esdhc
> >            - const: fsl,imx53-esdhc
> > --=20
> > 2.43.0
> >=20



--GvK9ZLScef9N3RQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ3nBAAKCRB4tDGHoIJi
0m+EAQDnbg8zdo9Sf4rvR034p6zn4SpvO/7R/5X0IYTSPdIyrwEAkdsQLtF2gKTA
X6rF0qy1YqMwF44vvtHbxe6qP2OwtAg=
=nn62
-----END PGP SIGNATURE-----

--GvK9ZLScef9N3RQa--

