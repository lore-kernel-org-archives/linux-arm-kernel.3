Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000B9CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AU0Gj7255AvQ5CwD1pZx8WKNH581mx4ihVIONMOZiTA=; b=t5HrT2clVtwZKVV2HqS0xoue9Z
	q4jCTcPqRvACwlIWaiwAZ1ylgqvHimEczSP0xIWXwPOAPX+BNOQgsHqpQ4FLWYY9BLl4Kr+RD0j5n
	ZoeXFN7YJnA3O8jixEWiizeJGwe8tEdVsKewQygAGtUkZq+EbCxxhxjScTkKLP+417m7gm1r4Jt+g
	gWpeuIpjqUUWaJwH/Z6CeKmLX9L48Yc7A4n231KIiKJx5UBCHXl1yuAsq52qapwxLg+ms1v8KcL3e
	06Th8ld/Mxp/n4Dyj5VLtnRBNXvdZH8ASEphuxU/vv+Ox+k+ExamqGNkRPKFF+Gk+lu+9kNbmLyf/
	gdCYgXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSzV-0000000FlRD-3wbg;
	Tue, 16 Jun 2026 12:34:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSzT-0000000FlR3-2Yo8;
	Tue, 16 Jun 2026 12:34:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB8F3440CE;
	Tue, 16 Jun 2026 12:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513B81F000E9;
	Tue, 16 Jun 2026 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781613242;
	bh=AU0Gj7255AvQ5CwD1pZx8WKNH581mx4ihVIONMOZiTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ORbZDDXRXZDF5r27bqtCDyNWhYxW83M3PZV1M1XhHFzVDjuThzl/q2lyxnx6ZOHdB
	 W96WTV8hCRBbFpX/UEh0SJaYf05GYlJmmpmEHPbkGmD/nFqQSRVQzAvb4X90qrElQb
	 NFNztCewp7PGZ5DDafiMXFX9gmcDig48e5TK3fpvdD5B6DcVKK1L0jgDlr+HtfN0KI
	 rRl8vBqimk7bMiiOa29i5hVKTKfzz5VfZe0xzDxuQp1DA1cY3/WFZPeQCrlApOLQJj
	 9hqrRnv4pKQNGHQJZwjW7vBfET+jVp4gRwR5rUYAv74Tg6Z9sFCCgMd4tHJkMojTvZ
	 JRO000ngSqyRQ==
Date: Tue, 16 Jun 2026 14:34:00 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] [net] net: airoha: fix foe_check_time allocation size
Message-ID: <ajFCuOEGT0iJttOh@lore-desk>
References: <178161119471.2163752.14373384830691569758@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hWXa442R11LoZs39"
Content-Disposition: inline
In-Reply-To: <178161119471.2163752.14373384830691569758@gmail.com>
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


--hWXa442R11LoZs39
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> foe_check_time is declared as u16 pointer but was allocated with
> only ppe_num_entries bytes instead of ppe_num_entries * sizeof(u16).
>=20
> When airoha_ppe_foe_verify_entry() is called with hash >=3D ppe_num_entri=
es/2,
> it writes beyond the allocated buffer, causing heap buffer overflow and
> potential kernel crash.
>=20
> Fixes: 6d5b601d52a2 ("net: airoha: ppe: Dynamically allocate foe_check_ti=
me array in airoha_ppe struct")
> Signed-off-by: Wayen Yan <win847@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_ppe.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 5c9dff6bcc..8fb8ecf909 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -1578,7 +1578,8 @@ int airoha_ppe_init(struct airoha_eth *eth)
>  			return -ENOMEM;
>  	}
> =20
> -	ppe->foe_check_time =3D devm_kzalloc(eth->dev, ppe_num_entries,
> +	ppe->foe_check_time =3D devm_kzalloc(eth->dev,
> +					   ppe_num_entries * sizeof(*ppe->foe_check_time),
>  					   GFP_KERNEL);
>  	if (!ppe->foe_check_time)
>  		return -ENOMEM;
> --=20
> 2.51.0
>=20
>=20

--hWXa442R11LoZs39
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajFCuAAKCRA6cBh0uS2t
rJMyAP0XT8469xm0evPWy2tNpY3Hl1oAlHZBX0cU5FrHDnoG/QD+IdvSSfUcOGbL
7vS6dZq7Uv9cqvghkCSPUUQf1TxLUQE=
=AVaX
-----END PGP SIGNATURE-----

--hWXa442R11LoZs39--

