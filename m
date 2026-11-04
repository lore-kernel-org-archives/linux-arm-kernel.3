Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67730606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Io47XTYD;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KIrJ95ZN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IgL8bbbD5PBuVHx0MhUlHNvCk4KSHKYvUVpt2RQ9QAk=; b=Io47XTYDX0tHxdBfX1dcYG26WU
	+gnDcJXRiM5/LqZlj3sgLhTSbdriLtZLnHN4ZMdakni0kgcDivW5Isc8Ez3a97fC2Wrw1yhSv5yy4
	ocAD+3N0dVZf65eD84TPITD1EGIJdAeVsUFxMITnqjmda8wAWlHVyl3OrJvt+aRWk/f/7wfi56kia
	iOu+lL4nm1oPJqOdB90K6jqSPltXSzpmOQ24pdifXEtPlpPoW/GhJ9tZtsP6UZJbVoTbH3bqTGeBg
	Y/7soeQRQx7pQQ1yFAgdTgoWbiVF6kK43IVNRBb7lh1cndn0fKHDeahclbcZOTQPXNeGnAdVhFbr9
	5FLjrfSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOb91-00000005UUc-2dMu;
	Wed, 04 Nov 2026 13:35:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOb8m-00000005UQf-3YgA;
	Wed, 04 Nov 2026 13:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793799298;
	bh=K4WRmMcozdlmKCpBfUDKJDyfirNWgMEqUfaXcX01+Ck=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KIrJ95ZNpBYRh5QBfOQ0+BBXOCSnHvrzRI0hhjUocS5n7v939rXfiCeZ072sf0NTd
	 8zV9WMEzxR2aW1OhrMUxZn6BOZe1Rezl+5YsXwU81FF8OIyGEPrX9J81zueXHpIUJb
	 IpdFIiP8j024oHzBlG62kkY5gb+q2ey798s7N3lsd+Ove2ST7gFRh8GtibFmWGOBz1
	 tt+6H653mDg10w1XILDWZhzOZNAJfbeqrSn4mFvLwD09s1ipohxkFrVXovnd7+2dme
	 UaPAj7KHvzMte9CL8mpqVAq16GLV+Fzu7h1hg2Jm2CV9woOB3iCH8rFQikRxWWiXsZ
	 BkQ2ca+xy/PkA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C07717E0269;
	Wed, 04 Nov 2026 14:34:57 +0100 (CET)
Message-ID: <920015edaef1c92d0b22b9f0eb1a47006f901800.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: postproc: fix the G1 input height
 extension
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: shomenkow@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	stable@vger.kernel.org
Date: Wed, 04 Nov 2026 08:34:55 -0500
In-Reply-To: <20261104-b4-hantro-pp-v1-1-1d75e9b225f8@gmail.com>
References: <20261104-b4-hantro-pp-v1-1-1d75e9b225f8@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-KPft1s7sKlSpjBko+t3L"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_053501_286251_80B2D9D1 
X-CRM114-Status: GOOD (  22.69  )
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


--=-KPft1s7sKlSpjBko+t3L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 novembre 2026 =C3=A0 14:27 +0300, Sergei Khomenkov via B4 Re=
lay a
=C3=A9crit=C2=A0:
> From: Sergei Khomenkov <shomenkow@gmail.com>
>=20
> The G1 post-processor takes its input size in macroblocks: the low
> bits in swreg72, the high bits in swreg92 (bits 28:26 for bits 11:9
> of the width, bits 31:29 for bits 10:8 of the height). This is the
> VDPU1 layout in Rockchip's MPP library, whose JPEG decoder writes the
> height extension as ((height / 16) & 0x700) >> 8.
>=20
> hantro_postproc_g1_enable() computes the width extension that way but
> writes the height extension as MB_HEIGHT(height >> 8), shifting lines
> instead of macroblocks. Every input of 256 to 4080 lines gets an
> extension of 1 instead of 0, so the post-processor is told it has 256
> more macroblock rows than it has: 286 instead of 30 for 480 lines,
> 301 instead of 45 for 720 and 324 instead of 68 for 1080. Inputs
> below 256 lines are not affected.
>=20
> Shift the macroblock count, as is done for the width.
>=20
> The problem was found with an LLM coding assistant while porting
> mainline Linux to a Rockchip RK3026 board; the assistant also drafted
> this change. Tested on that board (G1, ID 0x6731), decoding H.264
> (640x480, 854x480, 1280x720) and VP8 (640x480, 1280x720) to YUYV
> through the post-processor, 241 frames, against a software conversion
> of the decoder's NV12 output. Without this change only the 4 VP8 key
> frames match: a few pixels at the bottom left of the last macroblock
> row differ from run to run, and VP8 inter frames propagate them. With
> it all 241 frames match. 320x240 is correct either way.
>=20
> Fixes: 3f6702e1be8a ("media: verisilicon: postproc: 4K support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drive=
rs/media/platform/verisilicon/hantro_postproc.c
> index e94d1ba5ef10..ecc6b3137eb0 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -106,7 +106,7 @@ static void hantro_postproc_g1_enable(struct hantro_c=
tx *ctx)
>  	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
>  	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
>  	HANTRO_PP_REG_WRITE(vpu, input_width_ext, MB_WIDTH(ctx->dst_fmt.width) =
>> 9);
> -	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.heigh=
t >> 8));
> +	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.heigh=
t) >> 8);

Good catch.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-KPft1s7sKlSpjBko+t3L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaus0fwAKCRDZQZRRKWBy
9H3BAQCWA7Qn33zc8a1P66WNwL1GB7N5NWBBSVTGnj8uRpY0awD+INx3885oUsh6
2rMww8Wio+s/sOVlScbF+QSL6a6ELwA=
=uHJb
-----END PGP SIGNATURE-----

--=-KPft1s7sKlSpjBko+t3L--

