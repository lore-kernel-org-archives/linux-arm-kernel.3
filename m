Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AA8C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 14:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIlAd/YKM2QlvqdvA7bpAzwyx+IC2HK2K12o8N2kXcE=; b=NbzIshHyiHdFCYWsTLQC5aUFcu
	l/3ErTNjivsvcY/Rdk8xKSmRFME/VgCGJosWLroSzKxxEHIfO77kNNVcD/mpET3VpZxRcqp8KCTPe
	3VbhZvKgcyLME3sycV/UWo1iSX3BjSV5/i8rjL/RGVmQgPlszhQc2kNZiODDWxJxSO99de6+GxVo5
	nyDuaxsqXVpZAbgNcSP4sWrnuaK9ijG1dT9iY3HzP5RaEwizmgZLRZ0uEChJxnw/rA8/tYO14x6mq
	5IDmBSb0m+vlo1utYe2Dc+ofFv3ednVZWDPhFKRqgKrB1gSl+JW1/0YPHV1OzHuKZt/dDSBaTyREz
	37fwQqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGIER-00000005o2l-283R;
	Sat, 17 May 2025 14:09:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGICR-00000005nqS-2Zk8;
	Sat, 17 May 2025 14:07:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D421614BF;
	Sat, 17 May 2025 14:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F81BC4CEE3;
	Sat, 17 May 2025 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747490858;
	bh=PeIoRJcyHR4S55FKA1UWzyjZnGdb8RK10FAMdjCcHwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ew5pYssabtoP6JFJWQiM3hIMrCoHzKcPSiZtxfJKLMvc31pLIzMeGbmxv51S2MUEU
	 ZuEH0lwwmawqgWClCCuVTT3qbDD9u0PW5qPF/aCSMGkbDk/x67n1FfbhXfBB3kpO/t
	 q11jgitBNBIzjrWsI+3/az4WC6RfWQlIVZ2mfLmh1UAvZwjlqVirO2Crk5LSgL7c2K
	 Mrvd1m8Wr8qM5uZqndpePdEnIkGgJIK4zXxj7YW2CMnx7z50Hm7dpDuywMl6/7VK5S
	 th9weo7XZVBzbv4C2jTohVLzeBdAdQFc6c3fNH3JrENmcaW65Gp9W6O8Ija7nq+Ar/
	 v32yrkf1PxFDQ==
Date: Sat, 17 May 2025 16:07:35 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/4] net: airoha: Fix an error handling path in
 airoha_probe()
Message-ID: <aCiYJ98sE0FCcKql@lore-desk>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
 <47910951a3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dSuy9aXH7PkbQe/T"
Content-Disposition: inline
In-Reply-To: <47910951a3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
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


--dSuy9aXH7PkbQe/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> If an error occurs after a successful airoha_hw_init() call,
> airoha_ppe_deinit() needs to be called as already done in the remove
> function.
>=20
> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
> Changes in v3:
>   - call airoha_ppe_deinit() and not airoha_ppe_init()   [Lorenzo Biancon=
i]
>=20
> Changes in v2:
>   - Call airoha_ppe_init() at the right place in the error handling path
>     of the probe   [Lorenzo Bianconi]
> v2: https://lore.kernel.org/all/3791c95da3fa3c3bd2a942210e821d9301362128.=
1746715755.git.christophe.jaillet@wanadoo.fr/
>=20
> v1: https://lore.kernel.org/all/f4a420f3a8b4a6fe72798f9774ec9aff2291522d.=
1744977434.git.christophe.jaillet@wanadoo.fr/
>=20
> Compile tested only.
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index af8c4015938c..d435179875df 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2967,6 +2967,7 @@ static int airoha_probe(struct platform_device *pde=
v)
>  error_napi_stop:
>  	for (i =3D 0; i < ARRAY_SIZE(eth->qdma); i++)
>  		airoha_qdma_stop_napi(&eth->qdma[i]);
> +	airoha_ppe_deinit(eth);
>  error_hw_cleanup:
>  	for (i =3D 0; i < ARRAY_SIZE(eth->qdma); i++)
>  		airoha_hw_cleanup(&eth->qdma[i]);
> --=20
> 2.49.0
>=20

--dSuy9aXH7PkbQe/T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaCiYJgAKCRA6cBh0uS2t
rLZLAP9yQ+AJh1B7emNBad3Bow3uvaKtJ69qO/Dqb1e2GqapMgEAzNPhgqXKXtU+
3KEBK8c3JI8g9p/oCZRY9lninB+MjA8=
=Ji36
-----END PGP SIGNATURE-----

--dSuy9aXH7PkbQe/T--

