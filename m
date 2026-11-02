Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFA606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=shwEUy1l;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Rj6zrNE8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8m+OLwIKwAxl3Yo6BqrrXG2lnGq3krn0gCAbeNdSwA4=; b=shwEUy1lNuK/z76pWYem2Jwzrt
	LrSUCckGp/NrBV2xrXHoNOCaUTWJoraTsjWyXIjLcyTieEsO0xS/P6Gnag561dcYgiLqaeVqXSrRr
	uFMiqSya/aboLmCkWW9uPGbajUyl3Cvz7T3t6fpgLKdvgvlpvvI6UWgiSCrWVmRupfnfHwspyWQiC
	vlevxzfWLA0NXKBsS1FiS4PJZDWaVkDAFaJmrUVUX3NOYWSLkQZuw6yXzLshoU1pFgvjXHa61T9S5
	7Zg6Q0iNjapKh3JI5Kurrx+K7nLatfy/2oesIuQVQJym4POPH8/D8EmEhOh0V08HgMnB3HW1jcVmk
	p1pJtf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxRb-00000000435-0MmA;
	Mon, 02 Nov 2026 19:11:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxRY-0000000041A-3KGd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646702;
	bh=2bw38SQHViussxJIXbLBvs1V6mhhWBzXS42chSu9hbg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Rj6zrNE8SU70J8ewdYtM4VrWPT9hQxqzjmxcuSeGZ+l0beXmDEd2xjIX+cOjjqeoc
	 sO7RBKOT+Ner5TIs23e+rDJ+H9PsWC6DcrA+DxFyUUWrrYH0ktRc0PtHVUHud2ftUQ
	 6fYTCorb4W8MOcnEKGsIK8/d4qJlhOQBH8AA1igatDPHVFJebBJuBTB/oB4/d1fel8
	 WtyvWluU/a/40kc5R8ba/GBN9OfCFJcokx/v8KORLv7MtIh3xBCXruoyQiNhwp2ofL
	 c9bgEAudToAZ2Uu573DljoqF9N1Y+qmRpqUMnv/eh8mSwzwsZY0Xv8ZXKNVZp9mOU+
	 BN3ksVxQZmGsQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A3BD17E003A;
	Mon, 02 Nov 2026 20:11:40 +0100 (CET)
Message-ID: <e3de9fb175ea02f6b49fd8bd2e173f04823fd17b.camel@collabora.com>
Subject: Re: [PATCH 08/10] staging: media: cedrus: vp8: use the vendor
 probability table size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:11:39 -0500
In-Reply-To: <20261102170303.1973892-9-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-9-jernej.skrabec@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4+OrXPDXnu6jqB54Yvxz"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_111145_004569_DF93130F 
X-CRM114-Status: GOOD (  17.50  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-4+OrXPDXnu6jqB54Yvxz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 novembre 2026 =C3=A0 18:03 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> The driver allocates the VP8 probability table with 0x2400 bytes, which
> is the size the old Allwinner A10 library uses. All newer vendor
> libraries allocate 0x5400 bytes and never write the area past 0x11b0
> from the CPU. The hardware uses that area as scratch space, most likely
> for the segment map, and its usage grows with the frame size: a
> 3840x2160 stream makes the hardware access memory past 0x2400 and
> causes IOMMU page faults.
>=20
> Allocate the table with 0x5400 bytes, like the vendor libraries do.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 969677a3bbf9..6b00efa77c22 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -25,7 +25,7 @@
>  #include "cedrus_hw.h"
>  #include "cedrus_regs.h"
> =20
> -#define CEDRUS_ENTROPY_PROBS_SIZE 0x2400
> +#define CEDRUS_ENTROPY_PROBS_SIZE 0x5400
>  #define VP8_PROB_HALF 128
>  #define QUANT_DELTA_COUNT 5
> =20

--=-4+OrXPDXnu6jqB54Yvxz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujgawAKCRDZQZRRKWBy
9AI/AQCxJz9EnnPrAIoA5yNTvO9ljlCZI3TJthPIfdHbuGic4AD+JHTwuW9a6dOj
gPGEjbipn75MeJAFopj4V59Bk7om7A4=
=JMmO
-----END PGP SIGNATURE-----

--=-4+OrXPDXnu6jqB54Yvxz--

