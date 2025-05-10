Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458F8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ax61nFiKr+NHGnTrNtCeDjj2GUB1vtyzZaP25fpKBBY=; b=smlu2KqITWsx8xDC/yUcdvseVQ
	InMC/BaaGYVxUmUuxDt2J8tx51Zx9klU24VDhq659zjzZvHtT6iJDcuSiSuf3bbTB+K+4gd69ub2R
	XiAjep1YVj+RQE7lUz6liUPBQ4KmJ2HwbBsR/WP1C0fkpInZ15jmnqiSHoY8Sije/IQb+tQzBxSvW
	sFDQ1az8Y+2AVdmZa/Dj9DdEtQcgyuut3HZu6hxHdOBr6yzUAqYd/TsKh7uaZa2tfk6pYAhNujGPd
	3XvL3elcn7EWaNrJ5AKjXSme/RHoyR0MHPmEJHAh9uv8JK2M+IXn5oaiYRdQFCF0GxLXvsCHFqq4U
	mxfXgT0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDfnu-00000005f5Z-0lP0;
	Sat, 10 May 2025 08:43:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDfRS-00000005dVM-3OWI;
	Sat, 10 May 2025 08:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E9A6614BB;
	Sat, 10 May 2025 08:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0830C4CEE2;
	Sat, 10 May 2025 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746865217;
	bh=w4KCtfNN++3rTxuFj1Y4PcCXB490W9C1G146sr8flJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ovsafr1IoxltalBpWEdz0LRdhvqKYCKnVgsC+Vf1jGoTlQa8kTcrVqMddNZ9jxlGx
	 NsSZnwuns+gK0X7hsYK5kHY7+tv3l0Nz8CjPhoYHdPXCF3678/kL56DbxnAtJ6Dm8c
	 hfvz+XXtlGWevcAN0Kt/M/3Nm6tKw3+SIMuWThSODPIHMoli0nXWiNNMlaDGX2Cdhr
	 yvaAnWPq/C34W7kk9VhP1ArPoAgmx/6aX4+j1kYOXdxwqId3K8uKrV8E3YIHbh4Oi9
	 5Ka4dw3rSJqhJ7duWnZ8/z9zvwQ/1FT+Zn1pnpUQQ8NntaD1WvfQ+jZN8GZpIQwVD+
	 PI7AGINwOgXzQ==
Date: Sat, 10 May 2025 10:20:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/4] net: airoha: Fix an error handling path in
 airoha_alloc_gdm_port()
Message-ID: <aB8MPkMYXWvoaA03@lore-desk>
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
 <aBzOaiU6Ac3ZTU-4@lore-desk>
 <68149c51-ba75-4f0f-a86a-bd810d47d684@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1vz8AGLIu0dXvB1F"
Content-Disposition: inline
In-Reply-To: <68149c51-ba75-4f0f-a86a-bd810d47d684@wanadoo.fr>
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


--1vz8AGLIu0dXvB1F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Le 08/05/2025 =E0 17:31, Lorenzo Bianconi a =E9crit=A0:
> > > If register_netdev() fails, the error handling path of the probe will=
 not
> > > free the memory allocated by the previous airoha_metadata_dst_alloc()=
 call
> > > because port->dev->reg_state will not be NETREG_REGISTERED.
> > >=20
> > > So, an explicit airoha_metadata_dst_free() call is needed in this cas=
e to
> > > avoid a memory leak.
> > >=20
> > > Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > > Changes in v2:
> > >    - New patch
> > >=20
> > > Compile tested only.
> > > ---
> > >   drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++++++-
> > >   1 file changed, 9 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/e=
thernet/airoha/airoha_eth.c
> > > index 16c7896f931f..af8c4015938c 100644
> > > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > > @@ -2873,7 +2873,15 @@ static int airoha_alloc_gdm_port(struct airoha=
_eth *eth,
> > >   	if (err)
> > >   		return err;
> > > -	return register_netdev(dev);
> > > +	err =3D register_netdev(dev);
> > > +	if (err)
> > > +		goto free_metadata_dst;
> > > +
> > > +	return 0;
> > > +
> > > +free_metadata_dst:
> > > +	airoha_metadata_dst_free(port);
> > > +	return err;
> > >   }
> > >   static int airoha_probe(struct platform_device *pdev)
> > > --=20
> > > 2.49.0
> > >=20
> >=20
> > I have not tested it but I think the right fix here would be something =
like:
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index b1ca8322d4eb..33f8926bba25 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -2996,10 +2996,12 @@ static int airoha_probe(struct platform_device =
*pdev)
> >   	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
> >   		struct airoha_gdm_port *port =3D eth->ports[i];
> > -		if (port && port->dev->reg_state =3D=3D NETREG_REGISTERED) {
> > +		if (!port)
> > +			continue;
>=20
> I think it works.
>=20
> We can still have port non NULL and airoha_metadata_dst_alloc() which fai=
ls,
> but airoha_metadata_dst_free() seems to handle it correctly.
>=20
> CJ

Actually, in order to be consistent with the rest of the code where a
routine undoes changes in case of an internal failure, I would prefer your
approach. Can you please post your solution in the next iteration? Thanks.

Regards,
Lorenzo

>=20
>=20
> > +
> > +		if (port->dev->reg_state =3D=3D NETREG_REGISTERED)
> >   			unregister_netdev(port->dev);
> > -			airoha_metadata_dst_free(port);
> > -		}
> > +		airoha_metadata_dst_free(port);
> >   	}
> >   	free_netdev(eth->napi_dev);
> >   	platform_set_drvdata(pdev, NULL);
> >=20
> > Regards,
> > Lorenzo
>=20

--1vz8AGLIu0dXvB1F
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaB8MPgAKCRA6cBh0uS2t
rA/HAP9Zi1+4C2rxgiwNRJbwEjcF5j+ybpugyU0dEY4lrRu2EQEAybkmU3Kx+5HH
BBgU9PCKsxYpYZbJameFHUNS4FU14AA=
=nxAu
-----END PGP SIGNATURE-----

--1vz8AGLIu0dXvB1F--

