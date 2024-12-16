Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C4AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 19:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kDEx6aEWb4XCihAt9e19jF/ukq7Jlz0QppIXYIzNSQ=; b=Mjq1SKXhUzWq8/3w6oQKFP8DGL
	4QIXDwQ20m1o4ibsI1fnpAFLhiOjQv3OMIxibMj6Gq6LafStfj4mykimSnxOCiG/qdTNbkv4s4PqA
	urOLtIcYuWxxPW0KUnnf0Z38MHhTsOU7ar1728oOLBjcLoHKH/r8+U0nRU5TJP4BplQqtbX4L9bmW
	dG3tRZCGv01yTZK1auvD0YNMlFkf4/5rfXbTBLkHqdojcvBGh3kCH7pB5/W244MjeE66e3XCtR92/
	k+1KOS5snO9htmLSkVUVrdvBpSytAJEs1fRer/csTH1qupUDTisutguBpG34ta8ku/ia/SdZDlCVm
	X2XV7jEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNH8Q-0000000BAWs-2cfv;
	Mon, 16 Dec 2024 19:52:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNH7L-0000000BAJ7-3Laf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 19:51:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E9DEA41A44;
	Mon, 16 Dec 2024 19:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193EFC4CED0;
	Mon, 16 Dec 2024 19:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734378658;
	bh=DCENrOvzdQr/kVc1IkdcNpE1zRhi24sD9OPqr7cgrd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EaJ7W90r0NH1YcpXzq/MObcJhIwJpFskVv8yOHb4b50pzHCRZrcv2xGOXH8HMvn6o
	 j6kqOzpUYKqIMXrWxQBCeiq7mEMCNwSm88t1vAQy0koidh9Nofph6gi6Z+1wR37j1G
	 8XT7ByEO3m9UJZ0xu9JQLDKPHIvd91jcIup4AxSvncC/d7Q+H2S1hWLeUqdt3cElYQ
	 9ZndKGBy1a214SUZ1ap1VEYOVQzFnvlRmFPYlAUn1GWunCDQNFoM7oxDzgp8x5AkM9
	 64ybcID98YsAKdTNQa5Bzq5+z907uiNK1iE0CJhwLgkCh2yWoy7J3+zM4jw4QqTQvN
	 xQpRmhBd00OQw==
Date: Mon, 16 Dec 2024 19:50:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>,
	linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>, Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 03/11] dt-bindings: regulator: pca9450: Document
 nxp,sd-vsel-fixed-low property for LDO5
Message-ID: <20241216-reburial-turmoil-4825bbee6aa8@spud>
References: <20241127164337.613915-1-frieder@fris.de>
 <20241127164337.613915-4-frieder@fris.de>
 <20241128-endanger-envy-d1b19f650b38@spud>
 <9276fad1-0e3c-4935-a62a-1580af2e0a4b@kontron.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mv3VqQIkN3EYFrXr"
Content-Disposition: inline
In-Reply-To: <9276fad1-0e3c-4935-a62a-1580af2e0a4b@kontron.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_115059_987356_15A5ED69 
X-CRM114-Status: GOOD (  35.10  )
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


--Mv3VqQIkN3EYFrXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 04:36:41PM +0100, Frieder Schrempf wrote:
> On 28.11.24 6:33 PM, Conor Dooley wrote:
> > On Wed, Nov 27, 2024 at 05:42:19PM +0100, Frieder Schrempf wrote:
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> This new property can be used for boards which have the SD_VSEL tied
> >> to a fixed low level. The voltage of LDO5 is therefore only controlled
> >> by writing to the LDO5CTRL_L register.
> >>
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >> Changes for v2:
> >> * new patch
> >> ---
> >>  .../bindings/regulator/nxp,pca9450-regulator.yaml           | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-r=
egulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-reg=
ulator.yaml
> >> index 5d0d684186c96..0e19c54aa5f8a 100644
> >> --- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulato=
r.yaml
> >> +++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulato=
r.yaml
> >> @@ -49,6 +49,12 @@ properties:
> >>            Properties for single LDO5 regulator.
> >> =20
> >>          properties:
> >> +          nxp,sd-vsel-fixed-low:
> >> +            type: boolean
> >> +            description:
> >> +              Let the driver know that SD_VSEL is hardwired to low le=
vel and
> >> +              there is no GPIO to get the actual value from.
> >=20
> > Does this mean that if you don't provide the property or a GPIO it is t=
ied
> > high or High-Z? If so, please mention it here. More likely, given the
> > context of this patch, no gpio and no tied low property means the driver
> > should handle things as they used to be - but you should call that out
> > in your commit message to be clear.
>=20
> Providing neither 'sd-vsel-gpios', nor 'nxp,sd-vsel-fixed-low' means the
> driver has to assume that SD_VSEL is tied high and it has to use the
> LDO5CTRL_H for voltage control.
>=20
> I will make this more clear in the commit message.
>=20
> This is the original/current behavior of the driver, though it doesn't
> match the actual hardware as all known boards actually have the SD_VSEL
> connected to the USDHC_VSELECT (which changes state whenever the USDHC
> controller wants to switch IO voltage).

That's fine, as long as it is a match for the old behaviour. Sorry for
the delay responding, I was unexpectedly AFK last week.

>=20
> Getting rid of this mismatch is one of the main motivations for this seri=
es.
>=20
> >=20
> >> +
> >>            sd-vsel-gpios:
> >>              description:
> >>                GPIO that can be used to read the current status of the=
 SD_VSEL
> >> --=20
> >> 2.46.1
> >>
>=20

--Mv3VqQIkN3EYFrXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2CEnQAKCRB4tDGHoIJi
0oetAP9Pu1rjpU+pdzrm+eH6iXyG806l63oOj31Uyy4uLHkwsQD2JBjIL+4gCPRG
BRzqvKOglizkXPaKI5xuRY1P6rmvBA==
=XLsF
-----END PGP SIGNATURE-----

--Mv3VqQIkN3EYFrXr--

