Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B202C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldRSCvbB6zoC2q/GXSRfHSY9Rj644F55MY3AhNieC6c=; b=wJbdzRw65V54hEDV+AlQuRiJIi
	CT+NC4i/2poQmtMzNFcDvLMN2AUJYDWppcUv42tjKPdMdOYK7P4cDtXD0UJ8pJ7oxSc21jH0WTkav
	dRqF2gxd9N5RGLWYb0AFhn7vgzGmJ3rzd2Lr4p6QuHMiLbmIcyCQuGGnO/m2oEmh+bjx6T6kEnG7o
	wX+JbpyZ5OFOm0g8tw8uvN6zsIgaCos0lUBrAnHvDI1zWbu10FHK7dMxVkfeyEVtGqONhNr+/kSWG
	4pI+7u9WV9A8hWu1pcZH+LONW1vaZIJFttyuXTwRXyYDvjHp1+aU6fMTAx2MAKSa/GT4jq3Ywltxw
	93qfnrBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwUz-000000070TT-2yKk;
	Wed, 16 Jul 2025 07:24:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwOD-00000006zYh-3HGX;
	Wed, 16 Jul 2025 07:17:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13C344691D;
	Wed, 16 Jul 2025 07:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D59DC4CEF0;
	Wed, 16 Jul 2025 07:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752650236;
	bh=cd5eTFGt2ZH0e4S6bPNCBDG2UvP/pounWuUyklto8IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNTOOGp1fisiEOjXIcRrpXEGRABig1maftTzhlm6DsuFz2zAL0jvsZQ4s/PSppxiR
	 vhpiqIZhoSS4CV1uJhzSev6asAFYFkZ8yvaF0cbqSeZIvVnoyvise+WObys4lLHI7h
	 t6OSZ0X8PWQlmweR7qtcjyEXzfy13gXwfxQcYjYiQ9ZsxPLmy5EtfNJ0RSwUWbMNEW
	 h1i4SngYPocQHPZMv0nQvm6cUYv9KHqYSnuT04DgM+odJXPVhbEim9+k5CEIkxmZEU
	 gCL7Imzf25DMANhDaBM/Pw4RPRLj/patX0dViwLjZVonEfImUg44BH9FbXXsW0z6Qz
	 43cOnJYF+99kw==
Date: Wed, 16 Jul 2025 09:17:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix a NULL vs IS_ERR() bug in
 airoha_npu_run_firmware()
Message-ID: <aHdR-j2aZ-7wMg2A@lore-desk>
References: <fc6d194e-6bf5-49ca-bc77-3fdfda62c434@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hNQ6m2oLBFgFtFKp"
Content-Disposition: inline
In-Reply-To: <fc6d194e-6bf5-49ca-bc77-3fdfda62c434@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_001717_838607_2D5CF6A0 
X-CRM114-Status: GOOD (  16.19  )
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


--hNQ6m2oLBFgFtFKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The devm_ioremap_resource() function returns error pointers.  It never
> returns NULL.  Update the check to match.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname=
}() for "memory-region"")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 4e8deb87f751..5b0f66e9cdae 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -179,8 +179,8 @@ static int airoha_npu_run_firmware(struct device *dev=
, void __iomem *base,
>  	}
> =20
>  	addr =3D devm_ioremap_resource(dev, res);
> -	if (!addr) {
> -		ret =3D -ENOMEM;
> +	if (IS_ERR(addr)) {
> +		ret =3D PTR_ERR(addr);
>  		goto out;
>  	}
> =20
> --=20
> 2.47.2
>=20

--hNQ6m2oLBFgFtFKp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaHdR+QAKCRA6cBh0uS2t
rGscAQDafezCTx6Tg7NHRZzwrIG+WrX3UsI4bzfWa7dBHTaBEQEA4NLY1nMESskq
JR4WxA/oO+Ge5Va28kqhvA6sUqCvzg0=
=PR8p
-----END PGP SIGNATURE-----

--hNQ6m2oLBFgFtFKp--

