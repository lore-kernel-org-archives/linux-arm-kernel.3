Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0B2C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 01:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFsDZftR4B6MnKOTyovSysgE8zvgQdPlPTpypjZ3vYs=; b=JUWkeZkU0/1aQB31cnv9r0ywWW
	1I1yr1Yg7u/FCqZw0PUm+lCpVDA7LKVpzF2vISKEXMru5yMtu+A9p6N+t4TGVbFCZt6PJlSKx8ufJ
	bVOYcgPiaiKlt+FwWBTqY9voREKzWfyvXdN9y/hn7APrlSI7kiDkgnWynczKnGVAmQuwNwZqyicAu
	152VugBAG+P00Q9xDWyKkcDU8wnzxabx6pcuP4sM//sdsNvyiaaxyN4IOZjGONzBh/8sLM14b4OqY
	sXoESikdmROhc7VUBKdbLIm3DG1J1k8wXJE0zsEDqfgbpGZNjtqcwvWnJHM7aOa7GFbIH8sGvBKMI
	Evm0ge0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKoBi-0000000GpoV-42XJ;
	Fri, 30 May 2025 01:05:34 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKo9Z-0000000GpZU-2QLY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 01:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748566992;
	bh=KFsDZftR4B6MnKOTyovSysgE8zvgQdPlPTpypjZ3vYs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GYwn9aM2pL8l5gIcaYkirTaiB8gbp0L78Zi217/yDsV9ZsH2YLy+rQBki8bSu5YOK
	 ASsc7eIO1mVcouIje5YbVePzf8rzlGlt5CWAMwx+RsYF6m8icq1ryxvUBM0n+JU5gb
	 AO3DjOH8HFkF7vX7PZuVNNEjeUyf+F0gchYRZrKJmUW5Uw5fgHZ9MczhMSFZsOXwM5
	 ujngdo4GK0fNem0D8RzTtOdUvfjTmJn9xo00qL9qcBGNrKO6FNjIYVW2Cy6IXEwwg8
	 h+e3a7398aolewWN8N52TFIpt1NdkZHeMrXMgslDRI8AE48d/dgJ8bBVnBxaTRz5RD
	 exQQTqavG2z8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b7lNF0RNjz4x5Y;
	Fri, 30 May 2025 11:03:08 +1000 (AEST)
Date: Fri, 30 May 2025 11:03:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: manual merge of the net-next tree with the reset
 tree
Message-ID: <20250530110307.1eb48635@canb.auug.org.au>
In-Reply-To: <20250506112554.3832cd40@canb.auug.org.au>
References: <20250506112554.3832cd40@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dgk32W/+5/HDY1_RY9Za7rs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_180322_032342_1CA80D95 
X-CRM114-Status: GOOD (  21.09  )
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

--Sig_/dgk32W/+5/HDY1_RY9Za7rs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 May 2025 11:25:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   57dfdfbe1a03 ("MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Por=
t Reset driver")
>=20
> from the reset tree and commit:
>=20
>   326976b05543 ("MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH=
 glue layer driver")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc MAINTAINERS
> index c056bd633983,5c31814c9687..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -20827,14 -20699,14 +20829,22 @@@ S:	Maintaine
>   F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
>   F:	drivers/usb/gadget/udc/renesas_usbf.c
>  =20
> + RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
> + M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> + L:	netdev@vger.kernel.org
> + L:	linux-renesas-soc@vger.kernel.org
> + S:	Maintained
> + F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> + F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> +=20
>  +RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
>  +M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>  +M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>  +L:	linux-renesas-soc@vger.kernel.org
>  +S:	Supported
>  +F:	Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.=
yaml
>  +F:	drivers/reset/reset-rzv2h-usb2phy.c
>  +
>   RENESAS RZ/V2M I2C DRIVER
>   M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>   L:	linux-i2c@vger.kernel.org

This is now a conflict between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dgk32W/+5/HDY1_RY9Za7rs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg5A8sACgkQAVBC80lX
0Gy5awf/TVPywlTaI7enDzkgErfmCiQkSYcadqY8FSfKDhsuQZK25S2o+9IWu1Wx
rHxCcEYFFxrPSIPjXmurxEcq/C8qoODSB1YTn4VjoYU/nF2M5Ar5vOOH7vqrobUK
VFjgNyyygGi7SvPV4PDF4vI3SYn2EaqQw/0av92AhC97gDOUPzOX+9cLW17peegG
KAmwbchzGlspI3el238rhbg7IpuRycHVDzQ1UK59FGu19RhLUcuY3gP9fytw0eWE
MMt3LGu/EbIQYxIaR04j38Yy1uGAGwDz7GFRv0SFb70R0gSAkWlxQ4Lvg0f4pvZn
QGDg+Sw5VHcT84FE3kbKQ1qgrqOTHg==
=D5jt
-----END PGP SIGNATURE-----

--Sig_/dgk32W/+5/HDY1_RY9Za7rs--

