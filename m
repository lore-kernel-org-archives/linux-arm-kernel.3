Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA99CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 12:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D00p/ZLIR/RsP8OkApuHeaaH+BRWS3xl1t7256kK+zQ=; b=dx5wdoICBGGaxrBnZb4SgB96dQ
	be7nUWy33/ovDJ6uaDM2DwFZXGRV7Tvhwrsx0ufFf2v+AEA8lXyUmDlBS0hcLIXUl4TUMX4cs8aGg
	rEwzgfJx9TlftV3rrY+VLsBYnOify0cfE/4r79OpJyMeNs6wgKnnBfKvMMYNRtQYhBDX6XTsO5hx6
	zZWvQewwSjjkQzemuu5pkt0JgZ07d5u8TMmeRzeb87qmcPnRsM5YlWBIdoDM2A8lIRaHqAqiFSevX
	cwM/gKO+TFQtMqWOM97w+85N94hc0aWlU919HC2hIPb2UMDvpq61HqCKuBRyqIgCmDesOogAwZinF
	8XOo/sdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3id-0000000AnuV-1ES6;
	Sun, 10 May 2026 12:57:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3ib-0000000Anu5-0l6N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 12:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FD4540AB2;
	Sun, 10 May 2026 12:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A9FC2BCB8;
	Sun, 10 May 2026 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778417832;
	bh=+NS+mXELE481716R2xNZldzsT5uuYWBaGG4XaPtkZB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X35Jy1xxwjZiXNL2+9B0ZW8989OIFO/yghiQR4xC/S83dLejud6EqKzTkvhnt6562
	 U37bcycl+TgDrMaDcjA2JYEkgT7lEvZZBrr1Vv/6RrvHPx0dWqVbHw7oCj0VMOqG4A
	 AyxP8ybpUyKxZpj+1vxN/13O8irYjkClKU29gcrFSrlQurtLJJcRIarkzkpmfTpKOW
	 O5mHBRPNthwy1CTZFiL224RdpbG1s2eSiIlT2gUcGunf8BpP+HwQtnS+QILuXs5o7U
	 j5Tb2nGAStnXgNaZgFZxceRHqneDy2yOtoaTrUMwXFvxkvShZhuYvsDzYZFP+2gEsx
	 zukpylrY8x7pA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0F0A61AC5898; Sun, 10 May 2026 13:57:10 +0100 (BST)
Date: Sun, 10 May 2026 21:57:09 +0900
From: Mark Brown <broonie@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] sound: soc: fsl: eukrea-tlv320: update board checks to
 use the DT
Message-ID: <agCApXl_RwG3r2iu@sirena.co.uk>
References: <20260509214622.38319-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="moTdlZ1qRYHiIRf6"
Content-Disposition: inline
In-Reply-To: <20260509214622.38319-1-enelsonmoore@gmail.com>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_055713_262107_8F149188 
X-CRM114-Status: GOOD (  13.40  )
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


--moTdlZ1qRYHiIRf6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2026 at 02:46:19PM -0700, Ethan Nelson-Moore wrote:

> index 6be074ea0b3f..2e6abd620571 100644
> --- a/sound/soc/fsl/eukrea-tlv320.c
> +++ b/sound/soc/fsl/eukrea-tlv320.c
> @@ -142,7 +142,7 @@ static int eukrea_tlv320_probe(struct platform_device=
 *pdev)
>  		eukrea_tlv320.name =3D "cpuimx-audio";
>  	}
> =20
> -	if (machine_is_eukrea_cpuimx27() ||
> +	if (of_machine_is_compatible("eukrea,cpuimx27") ||

This renders the inclusion of asm/mach-types.h redundant.

--moTdlZ1qRYHiIRf6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoAgKUACgkQJNaLcl1U
h9Ax4AgAgv6+tIbDDD8stQVUf7j6gAchwIieJhA6JxS0eCb4ecn1MK83Uf1bfuVn
7sqL965uvAq/aC1lxo3VG7m/gAWRlVaDv+7OioA9JUxssJ6IERpte+/TKNNDYhrH
3MBFObS+EuAwYX0VZFT9jJ08x8TJp3PFjBflqDhLj0aRGZxymNa9o1KQH3IVeyMe
FydtycOaC+WnXh5Nnb7DpAZF2NiKsmvtJwgMKXLtjP60hHA14Sv6xyzZhbltaPh5
BatDdFzgOBY+0EmOG0O0e8vnfv483HCZyfx6ddv7RHpTYSA1mtPpsqVpCtSJ0Far
F3oXuc1b+nDm5G2SL5WXYxFkOVM6Ig==
=l4qE
-----END PGP SIGNATURE-----

--moTdlZ1qRYHiIRf6--

