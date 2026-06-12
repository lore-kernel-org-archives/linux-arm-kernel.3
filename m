Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9EACD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0xvL3Sj/8gibbE41ajWqX2gvL5U/maoaJkeOu32Ghk=; b=PsIkqjUpu4LeAqqaA6XrCaiuSt
	qj8Jf0qRlfJF1ZG6wMKIHlshlgRkkqAlTLaTAnjLK2Uy0+r0pbZtrcqiZzkMbHw3UhuTlhytdxEPN
	okZfdjsletZSgfjMpUYCbrlCKfCrImbVY4eSBX1ELpAj6ZxY/n1TTLBYVVyNOjFiPkXN8ryLpzLos
	b/e8Lf6Yk98Ixrb0nqYWnbT4CfMNYUY8djGeoc1UOpPmVovwGtEK03pzyFFJGtRy7rDAp/s/oqy5g
	C4zE4/zq2qvVH2oax52ISAjEAfsbzP7bJCQjIwMLseHqVMYSGPB6SXPdaWKclL5eN5cYbjKhntnhO
	ERtnVrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzaX-0000000AmSo-3g4j;
	Fri, 12 Jun 2026 10:58:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzaW-0000000AmSW-3NZt;
	Fri, 12 Jun 2026 10:58:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47C5F416BE;
	Fri, 12 Jun 2026 10:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30471F000E9;
	Fri, 12 Jun 2026 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781261892;
	bh=h0xvL3Sj/8gibbE41ajWqX2gvL5U/maoaJkeOu32Ghk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bVyaXDwqaLqscmgx5y0KXHr8sUoZrkKYHau+S8zRzQaBA+TGA8e5P7mmeyWbIqHBC
	 dJeo0L+MPjk10rBC2bUz9iuq2az9Sh5Sc/NYAux7MH5NFrO8TUy4SDUrZ6WgyjQ2Cx
	 CM1q0+9bt9yP5sI+m84T41N6UX4pADMdk3Kvc3lHc4flAbH+2wp4gUpZIiGB66jOLb
	 WXN3n43ab6ZuhyapY5cb+B959niE83KaRK5VNFPCTedBvBU85n4NFyNXbgqxVqJeon
	 4crhYb8mfZGPqq0ex+YiJi2g7mYjwg0SEAAMDw0lnMWSEF4My1m22TnrGT/l0FeNyP
	 3zBImpEWkrkhQ==
Date: Fri, 12 Jun 2026 12:58:09 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] net: airoha: Fix debugfs new-tuple display for IPv4
 ROUTE entries
Message-ID: <aivmQX_f3AcPEARN@lore-desk>
References: <6a2be54b.ef98c1b2.3c3224.2ed8@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YwPDZJBwo+4sBM3J"
Content-Disposition: inline
In-Reply-To: <6a2be54b.ef98c1b2.3c3224.2ed8@mx.google.com>
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


--YwPDZJBwo+4sBM3J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_ppe_debugfs_foe_show(), the second switch statement falls
> through from PPE_PKT_TYPE_IPV4_HNAPT/DSLITE to PPE_PKT_TYPE_IPV4_ROUTE,
> accessing hwe->ipv4.new_tuple for all three types. However, IPv4 ROUTE
> (3-tuple) entries do not contain a valid new_tuple =E2=80=94 this field i=
s only
> meaningful for NATted flows (HNAPT/DSLITE). For ROUTE entries, the
> memory at the new_tuple offset holds routing information, not NAT data,
> so displaying "new=3D" produces garbage output.
>=20
> Display new_tuple only for HNAPT and DSLITE, and let IPV4_ROUTE fall
> through to the default case.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: 3fe15c640f38 ("net: airoha: Introduce PPE debugfs support")
> Link: https://lore.kernel.org/netdev/6a2b40ea.4dd82583.3a5c46.e5a2@mx.goo=
gle.com/
> Signed-off-by: Wayen.Yan <win847@gmail.com>
> - Drop redundant PPE_PKT_TYPE_IPV4_ROUTE case, let it fall to default
> Changes in v2:
>=20
> ---
>  drivers/net/ethernet/airoha/airoha_ppe_debugfs.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/n=
et/ethernet/airoha/airoha_ppe_debugfs.c
> index 0112c41..e46a985 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
> @@ -121,8 +121,6 @@ static int airoha_ppe_debugfs_foe_show(struct seq_fil=
e *m, void *private,
>  		case PPE_PKT_TYPE_IPV4_DSLITE:
>  			src_port =3D &hwe->ipv4.new_tuple.src_port;
>  			dest_port =3D &hwe->ipv4.new_tuple.dest_port;
> -			fallthrough;
> -		case PPE_PKT_TYPE_IPV4_ROUTE:
>  			src_addr =3D &hwe->ipv4.new_tuple.src_ip;
>  			dest_addr =3D &hwe->ipv4.new_tuple.dest_ip;
>  			seq_puts(m, " new=3D");
> --=20
> 2.51.0
>=20
>=20

--YwPDZJBwo+4sBM3J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaivmQQAKCRA6cBh0uS2t
rNNdAQCQ/7Vjz3KMz+tY+DP5RN7NG/ZMq4VyS3WwE9J58vKl8QD/YZw8JSh2gXeT
kY8fTc1iqQyz/qbbK8hGsaleQXSGcwA=
=aYth
-----END PGP SIGNATURE-----

--YwPDZJBwo+4sBM3J--

