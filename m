Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o5JWlN9j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W8I6eZPNeQyfIA2MHqpnCAXBcywuCKbuTriES8lpKTM=; b=o5JWlN9jOPwN00Dk64nS33Olit
	EMQuswCiecGg8blQIsvhWGA4VVr/QxhN/1q/L0SfXvY/AyqIGn+PBOLxRPYPgffb5I4vQl1pgUMaC
	Zhl5ENC5EsqdnYS9PhiX/mugjb4Ygi9xogTWxLNiaNLKAMi514pvxWPkGpplekPcqUsIjDYfGZPa9
	I1JedlLkPwLJLYWj8MfjwOkp2laEjcEekNprdatz1reeYoez7rRcCvuDbXpVmXklEtD0QQocDZaQe
	B+z31FJ3dfArLCrxpY87xCO3izD9sKs+sKyOrR0WisT8BDz8Q7oDtSowBpdl/lrY9FEdpn/LT9jNI
	SymyNoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKvWN-00000000yD4-1D0X;
	Sun, 25 Oct 2026 10:32:11 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKvWJ-00000000yCT-1GjB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 10:32:10 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 83D953700F60
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 10:32:01 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D68B3B6DC7D; Sun, 25 Oct 2026 10:31:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 752CAB6CD17;
	Sun, 25 Oct 2026 10:31:58 +0000 (UTC)
Date: Sun, 25 Oct 2026 11:31:56 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Cc: mripard@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: fix typo in comment
Message-ID: <at3anD2TX8iQZ6Ws@collins>
References: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odmBEKKySAXLue9n"
Content-Disposition: inline
In-Reply-To: <20261007140056.7447-1-contatocaio.ferreira7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_033207_523596_A448655A 
X-CRM114-Status: GOOD (  17.97  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

--odmBEKKySAXLue9n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Wed 07 Oct 26, 11:00, Caio Vinicius Ferreira a =C3=A9crit :
> Fix a spelling mistake in a comment: Neightbor -> Neighbor.
>=20
> Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Acked-by: Paul Kocialkowski <paulk@sys-base.io>

Thanks,

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..f57642c0d8fa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>  	}
>  	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
> =20
> -	/* Neightbor information address. */
> +	/* Neighbor information address. */
>  	reg =3D VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_in=
fo_buf_addr);
>  	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
> =20
> --=20
> 2.56.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--odmBEKKySAXLue9n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmrd2pwACgkQhP3B6o/u
lQyZzhAAjpLJ/LCS9ud2LmKBfIDoSIa36gfGD9iUB8J1/bgqENht/+QvFN/62jVi
gAf0nT1W0HrQ2TIiFwdhhNnphU6VJUfI0C9Z+SpqAoKXf3j+qj34ZPpsSd+thEUB
4HObZyKK5px6YWkHL1XekYjdbCjh2T6HZ6UTt8rZxR7V5RIFq4QKNZHN/myhUk5X
X4IqbHpjD9zeD+9TH26kRbc4xlfMXiyfM88YkEWks8dMchnL+h69TOdk91I49y/H
0wYthqG/WZsqNptz+z0ra6o8esqzgewhCTzNaFcb9GlIBG9gxhWAXi5w8HltGvmr
DvfdXEj1ENFsiAy94HUstuTjG/76BOFiLHHrGle8u/Yi4iNu3rKVngmrcfltTqhP
LVB2sqaiHYUH2tpNTv4UXmHbyhMTIA0jF/QW+I/p/2+Uv5dxIgLkwWMGfXZMojfm
jAaaaA9h1GIkgPN6Sg4O2wn+g3YVTK3GVSBhwtE0D/KQMjsHv3HCZFSMQm6oYibv
ZSS65D9RiGtg98h7zaFz7+bX01ZlAw5NRc4bbTPpweGFFX+0cidtdhMx9z5gw4wP
fWbMP4DDoiCNPsjiW4CFNow0elBgsdn/WaW8lFtQ/WoGitoGArpT6iOlLLDRKOsN
oSBIGryhLuvhFKe+8WNjHfWppj8Q/RVYN/vkE65Y0C8QEeDmsf8=
=b2qN
-----END PGP SIGNATURE-----

--odmBEKKySAXLue9n--

