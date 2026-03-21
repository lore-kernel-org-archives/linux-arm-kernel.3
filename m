Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EFC1094471
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BODd0zrQTtQ2EVDGUzJPSylEhK+yTzVCUDSdTfTCQ+o=; b=ak8dCCgawbEk6Uk9eRt5rhDS63
	cCv4qN02rx6dDXuQ6qsMSqdpCnKRn/S461z6WfeeKbFFnKyc9UxySfQgoZSYUcJh5xK9SFqG09pH1
	mQ3ojN2pa4ZRdpMtYulJrQxnpCPOBeHacAdlmsygpcLE8zge0MtAKOq17PCWWZFInU8rc4mO5afoF
	BpMNxAR7OMm3qFMn/dRH5LfpgH2kR6vZ9DzvKhOIOl3tpbu6krGUZTX0Mlk3NgKFX8R34OHfb52WO
	MtkiXoe/1pN47VGR/u3UIsAZNyHQDTNPFlFyabOQtsm35IU3+ltGZXSJL/NN3s1LsuWezddfsa+1y
	/XKFPlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3w5I-0000000ETsk-1q8o;
	Sat, 21 Mar 2026 13:09:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3w5G-0000000ETsK-0FaM;
	Sat, 21 Mar 2026 13:09:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3BDD40C00;
	Sat, 21 Mar 2026 13:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F69C19421;
	Sat, 21 Mar 2026 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774098576;
	bh=dTmt0CpKQWFrPI2bQR7wWvu2/uBaYz30e6vvB7xr+D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NK1XDnNX7jKHvW9R9uT9CawmULfhovJZTIsIzwrqu89k7RbHmtbLxRgVlsnfjBbLm
	 5sbcnMcJ6Ju6k2OgkqJ5TW6KaxRp3IbBgbIKDdod92fGhFfDJX3z9SDKwKgsHWbA8T
	 ty5z2wQy6LzmhDipnAo9DkNwFzsZwXFNsvLoV2XpZZtFybY3ZwbsEINecHQ5pB2qju
	 2FjoZ6TVBuRsdOYXGn4hpU3jfdlC410nH9+P5o9/Q4Eh3aXM7OGI33RNEZ6HEfGsGl
	 FJVrEwj2lrrgh7FWe7QrqkefL2+xyZQc32SQw3Ad1OSX1DxItD7KC63/gVFq8aBDmN
	 y/T1WPiT2KgZw==
Date: Sat, 21 Mar 2026 14:09:34 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Rework the code flow in
 airoha_remove() and in airoha_probe() error path
Message-ID: <ab6YjhbSbUNt_KR4@lore-desk>
References: <20260320-airoha-remove-rework-v1-1-adeef7e3c01f@kernel.org>
 <20260321094429.GW74886@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EZz7n3wwzIYEdEN2"
Content-Disposition: inline
In-Reply-To: <20260321094429.GW74886@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_060942_120259_C87C892B 
X-CRM114-Status: GOOD (  21.24  )
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


--EZz7n3wwzIYEdEN2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 21, Simon Horman wrote:
> On Fri, Mar 20, 2026 at 09:42:28AM +0100, Lorenzo Bianconi wrote:
> > As suggested by Simon in [0], rework the code flow in airoha_remove()
> > and in the airoha_probe() error path in order to rely on a more common
> > approach un-registering configured net-devices first and destroying the
> > hw resources at the end of the code.
> > Introduce airoha_qdma_cleanup routine to release QDMA resources.
> >=20
> > [0] https://lore.kernel.org/netdev/20251214-airoha-fix-dev-registration=
-v1-1-860e027ad4c6@kernel.org/
> >=20
> > Suggested-by: Simon Horman <horms@kernel.org>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 82 ++++++++++++++++++------=
--------
> >  1 file changed, 47 insertions(+), 35 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
>=20
> ...
>=20
> > @@ -3028,7 +3044,7 @@ static int airoha_probe(struct platform_device *p=
dev)
> > =20
> >  	err =3D airoha_hw_init(pdev, eth);
> >  	if (err)
> > -		goto error_hw_cleanup;
> > +		return err;
>=20
> Hi Lorenzo,
>=20
> AI generated review warns that eth->napi_dev is leaked here.
> And that does seem to be the case.

Hi Simon,

right. I will fix it in v2.

Regards,
Lorenzo

>=20
> > =20
> >  	for (i =3D 0; i < ARRAY_SIZE(eth->qdma); i++)
> >  		airoha_qdma_start_napi(&eth->qdma[i]);
>=20
> ...

--EZz7n3wwzIYEdEN2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCab6YjgAKCRA6cBh0uS2t
rNf6AP9KP6eC4+MHzMb7WFbxq92nj5wfHEpgj5oEBa1ehx8vawEAiqgEov1K4lLS
0i3wDxbABgh92m891ZGxsVx+2UzXcgU=
=SzaX
-----END PGP SIGNATURE-----

--EZz7n3wwzIYEdEN2--

