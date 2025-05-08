Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58125C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hILdl8L1h7fbQfFAcsemN9qNReigLA5ggy0TA2w6Dg=; b=BHOUzCEkuIc1bHMgxJD1o2ywSK
	EzPLC8he4BChU4KiVXdzBMukF8AEpFuN8T+OnZDYzzQtOtJpE0WQhvlJg4gJX/WZydF97d4krDMp2
	HktynbUxX+QRmCjb+WHsy88FwfWm7L0NDX6uRt5m221KMm8P0bKU7qgAaWLUeLtbe3X+WSNJxxXPR
	kH+ZrW5XKg/uN7k2SmslAVhDsMAkGnm4mIWR+56NY5px2ueh0zVE8TJmq1mTKVcUxeQId0dNHG5jn
	cQ9iq2zzTIk8s2AzJa5JEJd3r/tBVi/p2svLYj7Pwa5/hvR5KFCuNS8kFytVBZKp7u/CyTHlaBu22
	UzVMvOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD497-00000001IET-3Qvu;
	Thu, 08 May 2025 16:30:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3E7-0000000191G-1eSB;
	Thu, 08 May 2025 15:32:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A10249B84;
	Thu,  8 May 2025 15:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE990C4CEE7;
	Thu,  8 May 2025 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746718318;
	bh=DF5Q0mSLcNjmiVluZaVYRFv1Km7OOZoaMMTU97Cg0Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePVkyDPWnT4m8p1cRtcnkq3pqnotnwGRDABeR8nZG/nr53S6NWjGwyn6f5hRrDDW/
	 mvBMdpzELu47Lq87GPFYfr7hInAEWsprDveImhfhELeogTp6ONjX3iyIJgmnlV+UGY
	 YH3xdg/q8ykieiA7gC90FCCg4zKudHiQUt1c0zKOkctX3PFUHS6G/fA+16XRG8S0f5
	 Ec+kilcRE7nijEwy0TXDHUbRtp2adghQZkDeMrtpyglic9etIRQFR1cCoUJU04MZRq
	 bgXro+FSlRNyL0SeJeGps8QVaAPecqGSFvlIbLjuBRwQYrhTWvLlv1EIIRZ+qiDvwQ
	 94njGQrvM/sWQ==
Date: Thu, 8 May 2025 17:31:54 +0200
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
Message-ID: <aBzOaiU6Ac3ZTU-4@lore-desk>
References: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="52bjE/uxYDiQLQGk"
Content-Disposition: inline
In-Reply-To: <5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_083159_470562_A2554C71 
X-CRM114-Status: GOOD (  23.38  )
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


--52bjE/uxYDiQLQGk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> If register_netdev() fails, the error handling path of the probe will not
> free the memory allocated by the previous airoha_metadata_dst_alloc() call
> because port->dev->reg_state will not be NETREG_REGISTERED.
>=20
> So, an explicit airoha_metadata_dst_free() call is needed in this case to
> avoid a memory leak.
>=20
> Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>   - New patch
>=20
> Compile tested only.
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 16c7896f931f..af8c4015938c 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2873,7 +2873,15 @@ static int airoha_alloc_gdm_port(struct airoha_eth=
 *eth,
>  	if (err)
>  		return err;
> =20
> -	return register_netdev(dev);
> +	err =3D register_netdev(dev);
> +	if (err)
> +		goto free_metadata_dst;
> +
> +	return 0;
> +
> +free_metadata_dst:
> +	airoha_metadata_dst_free(port);
> +	return err;
>  }
> =20
>  static int airoha_probe(struct platform_device *pdev)
> --=20
> 2.49.0
>=20

I have not tested it but I think the right fix here would be something like:

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/etherne=
t/airoha/airoha_eth.c
index b1ca8322d4eb..33f8926bba25 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2996,10 +2996,12 @@ static int airoha_probe(struct platform_device *pde=
v)
 	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port =3D eth->ports[i];
=20
-		if (port && port->dev->reg_state =3D=3D NETREG_REGISTERED) {
+		if (!port)
+			continue;
+
+		if (port->dev->reg_state =3D=3D NETREG_REGISTERED)
 			unregister_netdev(port->dev);
-			airoha_metadata_dst_free(port);
-		}
+		airoha_metadata_dst_free(port);
 	}
 	free_netdev(eth->napi_dev);
 	platform_set_drvdata(pdev, NULL);

Regards,
Lorenzo

--52bjE/uxYDiQLQGk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaBzOagAKCRA6cBh0uS2t
rPOJAQDJTb2xYCguiX/ivGfyWWdwij5dvd2KUapFuFCvVhjp2QD7BoT0xs5jz29J
d+A0RUW9SL63iUnc7PZVOIK/It8iRAg=
=OODZ
-----END PGP SIGNATURE-----

--52bjE/uxYDiQLQGk--

