Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67517C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaFm3NHs7J9dh90xya+WtwuKBbg4FZwXz0ElhPEvrNQ=; b=MHpjW/xzSli0FeBo51IaJjHCN1
	wNfwUsMiWxQSNrDtC4KBLsDedJFwGF56X0OLEBGgbGzwyPzjKYRHzVYpkun9AMLa40pkIsoqtTyYi
	M3aUpXfg4HNnRIotEnIkCdPgCy92DaYztjWyIgBW9Qk58IGN9WmQbNtdkwuJCsykT3E/GrjGzvJKH
	2ZorKYQ+mQRyB6QceQxvFF8ybAq0mu0geWao3UNjaNmhVRRJ0sqU56ldttkYN/5+baRVHTFejRR66
	L/cq1hU6apWmM6EciMAqKhdSukODTfnU6zasXIWzR/Qj4tGH0fcyLnP4yeDzraEzA3rNcpHmoyMkA
	FhC1boSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3zT-00000001Gbh-1PdK;
	Thu, 08 May 2025 16:20:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2tL-000000014hE-3U9U;
	Thu, 08 May 2025 15:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1799D5C633A;
	Thu,  8 May 2025 15:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A144EC4CEE7;
	Thu,  8 May 2025 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746717031;
	bh=dhECve019k+MAhaJXpnJX0vZpEJhKyOVtBrA+Jc60Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jiLzLgnNY0s2FTPN5+DxCy5Hc10iLZS6vuh/B+dVKZ6zKd/hSyVEe58/lA0bztS7m
	 ymneFlZ/yNcmS1JXeh8kTaRgTz5yCcTkIK/jUSo8TmuSSw6fO+vGl2Ws+UplUycPtP
	 lzWp5XeU8zpMwhowNEHlqbONMLjgB6e1qsLi2t6HE+UyGDvaVJNjNtlXqQcl3tQaj7
	 +0cLGZF/sUQS2BjI1onrqLymbKDVh94UUXp7Dk6Z0OK4CYFRP0j2z6tEjIqCGsOEjb
	 MmvOmdQFFn4kKRx6jCrBkW98MGqJmDnaMkgff4kBbIdgUaZBASIEA5NmQMfSdH3zOV
	 M5I/xYSK1H5Yw==
Date: Thu, 8 May 2025 17:10:28 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/4] net: airoha: Fix an error handling path in
 airoha_probe()
Message-ID: <aBzJZCIvE9u_IAM-@lore-desk>
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
 <3791c95da3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V+aLiTt/t6jXV4qn"
Content-Disposition: inline
In-Reply-To: <3791c95da3fa3c3bd2a942210e821d9301362128.1746715755.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_081031_923012_864D38D1 
X-CRM114-Status: GOOD (  15.81  )
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


--V+aLiTt/t6jXV4qn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> If an error occurs after a successful airoha_hw_init() call,
> airoha_ppe_deinit() needs to be called as already done in the remove
> function.
>=20
> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>   - Call airoha_ppe_init() at the right place in the error handling path
>     of the probe   [Lorenzo Bianconi]
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
> +	airoha_ppe_init(eth);

it was actually a typo in my previous email but this should be clearly
airoha_ppe_deinit().

Regards,
Lorenzo

>  error_hw_cleanup:
>  	for (i =3D 0; i < ARRAY_SIZE(eth->qdma); i++)
>  		airoha_hw_cleanup(&eth->qdma[i]);
> --=20
> 2.49.0
>=20

--V+aLiTt/t6jXV4qn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaBzJZAAKCRA6cBh0uS2t
rOayAQCaglkROsypWbnoARe9kkq6RYdKaAl4rjlfjKCEB8HWQQEAgs12WF2PhlvU
iTcoAkcTJX4fuM85cyB9I8L+eeZi/wg=
=QUnf
-----END PGP SIGNATURE-----

--V+aLiTt/t6jXV4qn--

