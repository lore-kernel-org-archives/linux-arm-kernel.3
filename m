Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F4ACD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqyBluiRoUQtAELX3j26vahFC6LntA86G4+ojNuG26M=; b=oYh0bxrlbr6tLwCdrKqONX88IG
	WcELv4B074n/8rHMHkwH/DwZBoq9vB4HX+aghAaeGsayusmMXytvz4HCaSl5jlztGnCBU9C7KNCba
	WDyqVkyxZgeMEQIRwT45Jl+kJOe8907nCkB71PQl2Co9MK7NC2+RqDAvJjbZNv4UucRBRWaM7kGQU
	kIeQ1EpmvuaWDDgd8KIX7LPqzD5XkU4dg7hX8RzXZ2uYe6LVxPkZKdCOWK2BppS5bm2od5cvnPhtE
	TrUiGmnUusFwWwTOK+e49EqPQxR5GhsvZPjWLZy1mCe3/O/QelcEdC1KomacjTdV4wBJ0qGzQUqDf
	D17Yipvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxR4-0000000Aamt-2sdr;
	Fri, 12 Jun 2026 08:40:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxR3-0000000Aamj-3rvu;
	Fri, 12 Jun 2026 08:40:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4917242A07;
	Fri, 12 Jun 2026 08:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BD71F000E9;
	Fri, 12 Jun 2026 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781253617;
	bh=IqyBluiRoUQtAELX3j26vahFC6LntA86G4+ojNuG26M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kvCMVaesKA1Y5Cz2dqaIPHFzz2MBlzpD77udgjrekZF7CuhZBDY6tL1Ws+mE5ijP5
	 sKZcqMGQ707lAx0o6dEBwEdjCHcQC/Ktcs4XryQ6MyVndGQ2UN3FCeM+rKgxeKOYbk
	 X3Nmliw9y9jWa7Eq5/VWAQmokdpBVeb7oBrnQBrfT5RgNj4+x2oHqykq3LVX1G20gk
	 KkWeYmBwc+8Gr6+rpM16ZOamK5PGZEy8JxXO0BrxKPscO0htzK9TDJkgaUFXCQFWNx
	 yCI4YHs57SRDu6vqfpuC6k/hQkznKW4itOwqkWHuIRHLP2b2N3fJINg540T3PWJlq7
	 KxTshZqr1gGmQ==
Date: Fri, 12 Jun 2026 10:40:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Fix variable shadowing in
 airoha_ppe_flush_sram_entries()
Message-ID: <aivF7p3KdCvyOjtf@lore-desk>
References: <6a2b40e4.4dd82583.3a5c46.e52f@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d0t5x//dz2MbmcOP"
Content-Disposition: inline
In-Reply-To: <6a2b40e4.4dd82583.3a5c46.e52f@mx.google.com>
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


--d0t5x//dz2MbmcOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_ppe_flush_sram_entries(), the inner "int err" declaration
> shadows the outer "err" variable. When airoha_ppe_foe_commit_sram_entry()
> fails and the loop breaks, the function returns the outer err which is
> always 0, silently swallowing the error.
>=20
> Remove the inner declaration so the assignment writes to the outer
> variable and errors are properly propagated.
>=20
> Fixes: 620d7b91aadb ("net: airoha: ppe: Flush PPE SRAM table during PPE s=
etup")
> Signed-off-by: Wayen.Yan <win847@gmail.com>
> ---
>  drivers/net/ethernet/airoha/airoha_ppe.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 5c9dff6..2b849d4 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -1333,8 +1333,6 @@ static int airoha_ppe_flush_sram_entries(struct air=
oha_ppe *ppe)
>  	int i, err =3D 0;
> =20
>  	for (i =3D 0; i < sram_num_entries; i++) {
> -		int err;
> -
>  		memset(&hwe[i], 0, sizeof(*hwe));
>  		err =3D airoha_ppe_foe_commit_sram_entry(ppe, i);
>  		if (err)

I guess we can drop the outer err and just return here in case of error.
What do you think?

Regards,
Lorenzo

> --=20
> 2.51.0
>=20
>=20

--d0t5x//dz2MbmcOP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaivF7gAKCRA6cBh0uS2t
rIP+AQC/Wi/u5DcCTnudAHlBHNxkjod5I9HyuAD0KavETP4CfwEAgkSgJBvnADhY
cclhUUfL6oWf1d10T0OCN6Uu+GXLMQE=
=rHCo
-----END PGP SIGNATURE-----

--d0t5x//dz2MbmcOP--

