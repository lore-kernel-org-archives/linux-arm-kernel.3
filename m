Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FD6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwZLVEC883iMdJgNsdYSpUpFPhWJPSZZ0C3e4RfHTgs=; b=H1R4XdGl9TsG76qLUBaVRxQdBq
	d8m5ZEcylZGATwKPJe6kYyLKuex4dmyZQDgxCIuNTBwNGlHjoAG04jJYv+5wKHVQrYecQC8Vx66Xv
	78UDqZRASGLx875r33R2p5ZEWBtmNFX5FxUp+2EsA8EqG5ulChm3msOWcB8cQlrfJSqFieTfsW9g1
	AdPZXHRoi0elrkVTf1gsuB5L23Y7fGQEQqLBrJEHlOY9b2ySeHMxX9tRhX8Ws+4fe9HdsDcGQArC2
	jCp0M6PIB9+yqePuuWpqncAZm3lcpoSBloOwrt25QZDn0WaKR6/cL5rxPqjshV360fzjjBW3cvcYm
	CUDP4Cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweSf-00000002lIh-0XhI;
	Mon, 24 Mar 2025 09:51:13 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweM4-00000002kbZ-1iuu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 09:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZwZL
	VEC883iMdJgNsdYSpUpFPhWJPSZZ0C3e4RfHTgs=; b=kfbWEBfw1SIvZlkQv25F
	M0iJPCs4vIaupYGmIm+mOHtw5pllyYBHgc//W6jKN9QoKm0MFHxd8ZIOVE85cJ75
	mjIr+HQciaLasH0jt5/+w2iiavgLughMFvv0VejbvoXfKOK4jp/YrWsittHxv1q3
	6JnEYkj3CQSN6tdJfRXsmCZXnmqwnsuEiPxokSq7Qn9XL8ZjSGRC9fTyCYypfth4
	1tVkXzRiiKRMYcholPO24QRi0MboWKXp73ZSMw4uTI9y6hrW8yMLQUo/wTOhjqCm
	w7FilVtlpPgboFX36WkcjevbEB/PaM6ReIt27hEhe7Bn8KLDPBiW+tFGajHnCqKq
	YQ==
Received: (qmail 2486927 invoked from network); 24 Mar 2025 10:44:17 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2025 10:44:17 +0100
X-UD-Smtp-Session: l3s3148p1@66acchMxkjRtKPH/
Date: Mon, 24 Mar 2025 10:44:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/13] arm64: defconfig: Enable Renesas RZ/T2H serial
 SCI
Message-ID: <Z-EpcXNXhSZ4zo2N@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-14-thierry.bultel.yh@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uCRVzdt7Zbst7U5c"
Content-Disposition: inline
In-Reply-To: <20250306152451.2356762-14-thierry.bultel.yh@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_024424_722996_F25C7BD7 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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


--uCRVzdt7Zbst7U5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 04:24:47PM +0100, Thierry Bultel wrote:
> Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
>=20
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Basically OK, but as said before we need to find a better symbol name.


--uCRVzdt7Zbst7U5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfhKXEACgkQFA3kzBSg
KbYN4Q/+N3koHF4uMmka6PokDDctb2ON5DN2pTLTVBF/LpuoznWskAdhzQQ281H4
psoKCXfAgXjgp61Dzfv1CgwG6i7ufyw1AIePI5562Zv/o7JJ8Vvvn+ERR2MIqUtB
UlldHS7kBQ5818jvJ6W27kDC8qdE6aMta2+OFkzuiO6rtOR94Dzx+O5j+IiXlFJ9
rMasjd5WIFA0Vg0kUCB+/NKloTeuGyUV0UOLamd0YsQSpLwlMc9CHPv8xSZcU/CV
fVtZGK/G+Q3bnCkKxh8PYWry3vbCiesRLUCIirPJS6rCJKsRlSJsDl5GYXviYvx7
1fV9PvzNIkjS0NYgbUQfCrmPP53Wl6atZqUScXwuIjSohbWrdVVPJiWYvHHAVbUC
QauVivAuBWJHDgOSx1GcNZBoQSxPW4Xf1jfEDDr/pxqQ2CmjLJWoNMR1LsFrKRdz
dcZEPCBSeH+8nZsnfSejgEcLYBJaw5uUdK53OMHXE6n+VY2lHYA+EG0B9Hk4nx6o
6mtUoCuLf5kyNqKHBsMNc1lAz4bx/rB2HtmHEgPVX9lGRKN2RI59f6u+ydLP08BG
L8LG3LXY9i/qpqVZJJ1bbFgO6y350l+U9EqAvPf9wkHKvGhuSiHSelJT/rS4a9jc
Uexcdzq9htGH8FtmJhIir6AfxLNH7cP61QWrdWQVhrtRpR3qz1c=
=PYQp
-----END PGP SIGNATURE-----

--uCRVzdt7Zbst7U5c--

