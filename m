Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8BFC3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NjCYglNkm1Zl4iApsrgmqE3oBvV4Fa8v5fivAhosNk=; b=UhzxSsr6kWf2sU1FTyLZmRcBhy
	bfqp084ALJTFzcmey2a+9u5jgg2PqraNyNReDe7vtRbv0sN5S8W97TxxC0O4B60FdpzabhGAA7TcU
	sqkXcdrWVcGDkg18qg71fC5SfVaHxiXTZrItGBY/xFmDVszuhNxMyiqRRvyc/vE7L9GDXJJDpKr7S
	QyBt7aFfwmJQikHiho2ucoxkCriyU8iYYaqArUe4BpCd8nxgFSH/XmhBapFApXS19Qe7WUGuSxDcQ
	DcJ397aDGk4cyM10tSPFChBl1YKp2xmlR9vQJ0/y1aEuaFDr/dvX8Txt3FCmVfJN9VkLWrugOfaYF
	NKathe1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o65-0000000AIY1-0MrP;
	Tue, 29 Apr 2025 16:46:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lqj-00000009wS7-0Qov;
	Tue, 29 Apr 2025 14:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5646CA4B3F3;
	Tue, 29 Apr 2025 14:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B844C4CEE3;
	Tue, 29 Apr 2025 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745936535;
	bh=Hn26jb1aZXYejporzmo9DyB26YCJ0sQN1ZLh9FSFMwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=poAzvqd9eURiN3jHfL6W1FWeIh2XPHdSkTOF9+NePUCEE0nzrSuN1fjK3bW/7ZGwy
	 Ir9/VDJas1weKrZiNqb6UU/su4AjVwwtrL8sl48e55NyCHfHCF8wO38ljtClLcA5uI
	 EaLQwyZ2k88ED96kVWNRgqY0sZMPwnq6p/SHSYXo6AtoLiMOmcukV03EhbfElFnd9o
	 N/lFzou9P83ffhnPzX/isaPcgPwHRhnmzT9G/iq8P8BB4qDQS8K65z42MtijnppqFR
	 /FHkzILlOymDkVoEtFLSsK0XLe4KZ2EXAll0Y/ncxY1nSCK8vwxbpIEsUByFzG9lX3
	 3JE9LbbW+xNEQ==
Date: Tue, 29 Apr 2025 16:22:13 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH] net: airoha: Fix an error handling path in airoha_probe()
Message-ID: <aBDglZH4VaBlWU2a@lore-desk>
References: <f4a420f3a8b4a6fe72798f9774ec9aff2291522d.1744977434.git.christophe.jaillet@wanadoo.fr>
 <aAJFgqrOFL_xAqtW@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cs66MFCPOyZ/spK5"
Content-Disposition: inline
In-Reply-To: <aAJFgqrOFL_xAqtW@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_072217_271463_E0C737F8 
X-CRM114-Status: GOOD (  19.83  )
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


--Cs66MFCPOyZ/spK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > If an error occurs after a successful airoha_hw_init() call,
> > airoha_ppe_deinit() needs to be called as already done in the remove
> > function.
> >=20
> > Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > Compile tested-only
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 69e523dd4186..252b32ceb064 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -2631,6 +2631,8 @@ static int airoha_probe(struct platform_device *p=
dev)
> >  		}
> >  	}
> >  	free_netdev(eth->napi_dev);
> > +
> > +	airoha_ppe_deinit(eth);
> >  	platform_set_drvdata(pdev, NULL);
> > =20
> >  	return err;
> > --=20
> > 2.49.0
> >=20
>=20
> Hi Christophe,
>=20
> I agree we are missing a airoha_ppe_deinit() call in the probe error path,
> but we should move it above after stopping the NAPI since if airoha_hw_in=
it()
> fails we will undo the work done by airoha_ppe_init(). Something like:
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 16c7896f931f..37d9678798d1 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2959,6 +2959,7 @@ static int airoha_probe(struct platform_device *pde=
v)
>  error_napi_stop:
>  	for (i =3D 0; i < ARRAY_SIZE(eth->qdma); i++)
>  		airoha_qdma_stop_napi(&eth->qdma[i]);
> +	airoha_ppe_init(eth);
>  error_hw_cleanup:
>  	for (i =3D 0; i < ARRAY_SIZE(eth->qdma); i++)
>  		airoha_hw_cleanup(&eth->qdma[i]);
>=20

Hi Christophe,

any plan to repost this fix?

Regards,
Lorenzo

>=20
> Agree?
>=20
> Regards,
> Lorenzo



--Cs66MFCPOyZ/spK5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaBDglQAKCRA6cBh0uS2t
rHX6APwIvo/4Y3dZRr6TbMAZgufdsaVik6rZZyhOrTPpqe6ybwEAhi4Y5iLOE9C4
os6h8aHQ7FIIGzhvOp1QYkFsEvZ0TQI=
=ylrk
-----END PGP SIGNATURE-----

--Cs66MFCPOyZ/spK5--

