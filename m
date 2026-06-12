Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D7CCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fXUbxNQMef3KW0BeIYSPmJZG+Y5jb6njF1/ZJj+fSc=; b=JMEMBjIwqJoA8Q6WYQ6neMuXMY
	hjxjAxrMrZvWhFuMFXu5IgJ/uThF1CVA2GwOS8Zr4rVPStI7my1dKj1a58dVI+tDULlVisz0U+VqL
	CRWrTwJ2WwfbJAEUbBg4m2rqUbUUqCQfuuJQvswjHpAJOOCITRCQqZqYYj0RsLhywSW7MVLDYEgHB
	If4mYaSBqvh/UzNC9kdSGNyAf5wyPaK3722Vf/65PD4ovpzS5p3txJ9dslyoX+nOn/A1MsP/mUchn
	3PyZH9LBnucvF9etv89x5RKmKGg7osU5wgV7kDSQG+Nf9Wudf1xYdFC8d/dC4seg3zj4aP4/PDVOr
	nMlSuCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyUv-0000000AhIy-1rvY;
	Fri, 12 Jun 2026 09:48:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyUu-0000000AhIp-2lkg;
	Fri, 12 Jun 2026 09:48:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D2A540D70;
	Fri, 12 Jun 2026 09:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D6D1F000E9;
	Fri, 12 Jun 2026 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781257697;
	bh=6fXUbxNQMef3KW0BeIYSPmJZG+Y5jb6njF1/ZJj+fSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IDoZx6CMkmJysz3zmuz6DeQEus1tZDstIBNG9RO8Q3WKHebeBPofSrSQmBf9d1oEp
	 T5qTOQB01dlfZTo0IISNrO3VbH8eShKKjm1wAbcEErVKPhNhVNG/hN8LjLGhYa/WQW
	 5H7DdYGam4rlbYlnJrKN0T9NIiOLCRP/FtdjdTFWkG8/nWCF4bxLuxHFRiqH+Q2iT5
	 yHC616RGbmlh8V+DcboLU4CWAeyZITU7+kUbRPzmPC/pICG+ffobi8fTQuPtDsziJF
	 MT3fU4d0DnUEsyN0hq2y9nCb5HuxHNTPmRd0RrTMOXRfsOe+088qWr5i8Bj9OFd0MS
	 gzs2HQcNF1Pug==
Date: Fri, 12 Jun 2026 11:48:15 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: "Wayen.Yan" <win847@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] net: airoha: Fix error handling in
 airoha_ppe_flush_sram_entries()
Message-ID: <aivV3wr7zHQcENtI@lore-desk>
References: <6a2bd37a.4034e349.1b41bb.1caf@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EoeaF+jQtSFUc+T+"
Content-Disposition: inline
In-Reply-To: <6a2bd37a.4034e349.1b41bb.1caf@mx.google.com>
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


--EoeaF+jQtSFUc+T+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> In airoha_ppe_flush_sram_entries(), the outer "err" variable was never
> updated when the inner loop variable shadowed it, causing the function
> to always return 0 even when airoha_ppe_foe_commit_sram_entry() fails.
>=20
> Drop the outer "err" variable and return directly on error, propagating
> the error code from airoha_ppe_foe_commit_sram_entry() correctly.
>=20
> Fixes: 620d7b91aadb ("net: airoha: ppe: Flush PPE SRAM table during PPE s=
etup")
> Link: https://lore.kernel.org/netdev/6a2b40e4.4dd82583.3a5c46.e52f@mx.goo=
gle.com/
> Signed-off-by: Wayen.Yan <win847@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_ppe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 5c9dff6..a124f15 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -1330,7 +1330,7 @@ static int airoha_ppe_flush_sram_entries(struct air=
oha_ppe *ppe)
>  {
>  	u32 sram_num_entries =3D airoha_ppe_get_total_sram_num_entries(ppe);
>  	struct airoha_foe_entry *hwe =3D ppe->foe;
> -	int i, err =3D 0;
> +	int i;
> =20
>  	for (i =3D 0; i < sram_num_entries; i++) {
>  		int err;
> @@ -1338,10 +1338,10 @@ static int airoha_ppe_flush_sram_entries(struct a=
iroha_ppe *ppe)
>  		memset(&hwe[i], 0, sizeof(*hwe));
>  		err =3D airoha_ppe_foe_commit_sram_entry(ppe, i);
>  		if (err)
> -			break;
> +			return err;
>  	}
> =20
> -	return err;
> +	return 0;
>  }
> =20
>  static struct airoha_npu *airoha_ppe_npu_get(struct airoha_eth *eth)
> --=20
> 2.51.0
>=20
>=20

--EoeaF+jQtSFUc+T+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaivV3wAKCRA6cBh0uS2t
rG1XAQCCuKkYI+tIMsjd+zKovSrzkgniTy4bU0wXXl1QiLXSFQD/SnwATkCTQzfe
Aa6qlJSWjvbDGHvmlP81Dcujo8NQZQs=
=7Aip
-----END PGP SIGNATURE-----

--EoeaF+jQtSFUc+T+--

