Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0900CC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ls0UnB1gBW3xwUNlzrpPwKAtoeyKMQuudatLOHNO6w=; b=lLNSA2B3pROFuH02gqtRfQtO3N
	ejJQo0KCZ/5d5qAKlXliIF0UKngMTUj2lI9weidDDhj44xB5FPsEgT5Jl1U4MpYfeiYBXWvYP/gUn
	MVS0rgVbGTn/lzIf8Nf4wway1/vKPnsdSYbFUO+Wa3da1bEl14/ySaEXwzAWKBZa7Wg6qOdELbq/V
	ebSuShQKnD5Bh3q36zGY7GJZzaIGjd6ZZgNeqtyONKXUAWbdrQ+4WhWtA66vAcctwgZLg3/8va02X
	rhGn/AD2um+KuKi3bsrJHipRkwlv8sT0U4TBSSv6nolVQePtledRy6QIio9w4CzNsFYkQZ+b2eb3+
	Kz9E1RLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwZm-000000070pH-2Cph;
	Wed, 16 Jul 2025 07:29:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwS6-000000070Az-0gzm;
	Wed, 16 Jul 2025 07:21:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A1B1460A0;
	Wed, 16 Jul 2025 07:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073B0C4CEF5;
	Wed, 16 Jul 2025 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752650477;
	bh=wbYVLhPOCi1vaoM7sTYVmfW1ciprMAQ8sQlxUBmwWnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+zQxyjGCDYcaP1LOQ4yvAGzfm9/yK0TZ8kv1G2i1KtEbA3F3mai3qoOO7djM14SK
	 Y255zByLUqIafo43lTVWuEhoj1StgVueK8xQacfHVVdQkJhwZugnMbxTMlubf87dgj
	 nJlN7EbS+iA7UMXdgLB/SQNnRdkiMNKo8UjIkGDs1l3T6II8Dx4sUtQ6sm4mivu9uc
	 NFHoSV0aHED5FMkDePsKBa9qA0XnzxYITizl1Ls+sX3dovkAG1eQmHKhgXmizK3RmM
	 PuUyONl+6kLCMsv4eDzWX2JeKaTT3dM2f/WEfIVX/prQZgLtIAa5XqVnaonLFVLn3t
	 AXD6cgqjgZaAA==
Date: Wed, 16 Jul 2025 09:21:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: Fix NULL vs IS_ERR()
 bug in mtk_wed_get_memory_region()
Message-ID: <aHdS6o8RNMWplCuT@lore-desk>
References: <87c10dbd-df86-4971-b4f5-40ba02c076fb@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6T5EAh89/vZOaNaz"
Content-Disposition: inline
In-Reply-To: <87c10dbd-df86-4971-b4f5-40ba02c076fb@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_002118_222491_D2CC253A 
X-CRM114-Status: GOOD (  17.41  )
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


--6T5EAh89/vZOaNaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> We recently changed this from using devm_ioremap() to using
> devm_ioremap_resource() and unfortunately the former returns NULL while
> the latter returns error pointers.  The check for errors needs to be
> updated as well.
>=20
> Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname=
}() for "memory-region"")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/et=
hernet/mediatek/mtk_wed_mcu.c
> index 8498b35ec7a6..fa6b21603416 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> @@ -247,8 +247,10 @@ mtk_wed_get_memory_region(struct mtk_wed_hw *hw, con=
st char *name,
>  	region->phy_addr =3D res.start;
>  	region->size =3D resource_size(&res);
>  	region->addr =3D devm_ioremap_resource(hw->dev, &res);
> +	if (IS_ERR(region->addr))
> +		return PTR_ERR(region->addr);
> =20
> -	return !region->addr ? -EINVAL : 0;
> +	return 0;
>  }
> =20
>  static int
> --=20
> 2.47.2
>=20

--6T5EAh89/vZOaNaz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaHdS6gAKCRA6cBh0uS2t
rJY+AP9l/ZwTg4VNy3YmVDYG7Q6N4lpACY/dpdBptMwTbwVXRQD/VnVlpZVCHfGU
giDlSZY55au/4/6aau9dTKjSxPxYzAE=
=DYVE
-----END PGP SIGNATURE-----

--6T5EAh89/vZOaNaz--

