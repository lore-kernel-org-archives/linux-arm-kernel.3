Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E4CCA0EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 23:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTHOzHuH/OUYRQt+fJsVLAyMUCubD4Mkl8PUofqnPdY=; b=UMoURJ7uMbUF9giZNoFa24PefC
	+JRImdZ/vac3EJbin/VglpQ4JF25tItH37aryK1Qjo2Tm6LKcVrpSFXETHexDSyJkUywvwlG3DbGh
	IMNH6iNeVBROO3dGbwO71/oFEjrwDQRY6HLsq//CEEKa0QxQVcWOn01+B3K9pUchHJwNcLXFYT4RI
	8NOmYEnZ8Kx/khQxy7kR8iivAEiPIUlzvWkCg7VVt+UoKeNIIONpFDNpHvOkl6AbPYyIOEfrLzD8Z
	LrAf7HIdYFbMg3OEfX6PEJ9Ea6/RVoBmpn++tF68wvbdyakac2q2rDxulEvBktbzVNssMOrMro4DB
	fNPUPL+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulbl5-00000009MYr-1EIH;
	Mon, 11 Aug 2025 23:16:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulZtV-000000094Qj-1jq7;
	Mon, 11 Aug 2025 21:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KTHOzHuH/OUYRQt+fJsVLAyMUCubD4Mkl8PUofqnPdY=; b=Ly+GxV93u1KZk2vFVzdyKE9DZ3
	uq4EiWkDX2RSipaV/DZfo16leHZaSnqjarqHtvK223jbe1sJQkHJ36ABrrNjzXILfVYSRuasgSJU7
	FG6HoxuA4okX6j9uKM0/kNcC086DakRpU8lieIbdtLONKQbCXOTp8Jd4PslM6J6nQ6CRQnyKt96RQ
	8vZ3stkmwoL4BS62fojlkBB0u1N4mT3LemNwlzBxWUYIhZkhrX9Miws/KKcUDu6kQOMqC7VctR+jU
	k5qDtWjTGVB9UVLKweFd80rc95pmqvdEO+CldznIyF0NK5TdnWk8+1RqocpTXnKZVcfP5sZf0ulqV
	ycCcm6kQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulZtR-0000000FXmK-3LPM;
	Mon, 11 Aug 2025 21:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754947035;
	bh=raW5g/LV8GRTMwkoKNboyFHz5L/VYuTT0dEoV8anao8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Qr9AdoN8zECuc23K+vkrLvUlmvybTlzWqs1bZrqXrfvPtamis/qCY9KkBvjLNyA54
	 pD1gToT97PtdLTJAxpTzKifthtpY/wSQ/H/j1+KiRYzDkfH00wWJQArPXNVr8tlIJu
	 0pd9Yf8WtC37EMcvQ1t6jv9ySRaC9zpJvgXcyk7Ge2BtO1pQwvB4jxon2KuyJ5fgjj
	 GlkrW6IFhk9Gv2rY9hNMi+DiktckEHN6t4d0g4d6Ishh/1X9dAQkSr7IMefoWg3E22
	 hzq5kanEdfaOE392Ry3OULmWQ/bdm3RMm6pJO4fbZaeGfLGIpTWzK7JOkENSoROg8Q
	 9Wr6TKN3g6ElA==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D79C17E0286;
	Mon, 11 Aug 2025 23:17:14 +0200 (CEST)
Message-ID: <a08b45fe17a0374230f300f30d344252b6d597da.camel@collabora.com>
Subject: Re: [PATCH v2 3/7] media: rkvdec: Implement capability filtering
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Detlev Casanova
 <detlev.casanova@collabora.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>, Sebastian Fricke
	 <sebastian.fricke@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 11 Aug 2025 17:17:12 -0400
In-Reply-To: <20250810212454.3237486-4-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <20250810212454.3237486-4-jonas@kwiboo.se>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-+plCxMyBS08v/1oHFlUB"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_221721_997644_261328B6 
X-CRM114-Status: GOOD (  19.95  )
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


--=-+plCxMyBS08v/1oHFlUB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=A9cri=
t=C2=A0:
> Add filtering of coded formats and controls depending on a variant
> capabilities.
>=20
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
> - Adjust code style in rkvdec_enum_coded_fmt_desc()
> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 67 ++++++=
++++++++-----
> =C2=A01 file changed, 49 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index e7b9dfc2d1ab..56807122720e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -365,13 +365,36 @@ static const struct rkvdec_coded_fmt_desc rkvdec_co=
ded_fmts[] =3D {
> =C2=A0	}
> =C2=A0};
> =C2=A0
> +static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capab=
ility)
> +{
> +	return (ctx->dev->capabilities & capability) =3D=3D capability;
> +}
> +
> =C2=A0static const struct rkvdec_coded_fmt_desc *
> -rkvdec_find_coded_fmt_desc(u32 fourcc)
> +rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
> =C2=A0{
> +	int fmt_idx =3D -1;
> =C2=A0	unsigned int i;
> =C2=A0
> =C2=A0	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_coded_fmts[i].fourcc =3D=3D fourcc)
> +		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> +			continue;
> +		fmt_idx++;
> +		if (index =3D=3D fmt_idx)
> +			return &rkvdec_coded_fmts[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static const struct rkvdec_coded_fmt_desc *
> +rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> +		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
> +		=C2=A0=C2=A0=C2=A0 rkvdec_coded_fmts[i].fourcc =3D=3D fourcc)
> =C2=A0			return &rkvdec_coded_fmts[i];
> =C2=A0	}
> =C2=A0
> @@ -382,7 +405,7 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx =
*ctx)
> =C2=A0{
> =C2=A0	struct v4l2_format *f =3D &ctx->coded_fmt;
> =C2=A0
> -	ctx->coded_fmt_desc =3D &rkvdec_coded_fmts[0];
> +	ctx->coded_fmt_desc =3D rkvdec_enum_coded_fmt_desc(ctx, 0);
> =C2=A0	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
> =C2=A0
> =C2=A0	f->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> @@ -396,21 +419,22 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ct=
x *ctx)
> =C2=A0static int rkvdec_enum_framesizes(struct file *file, void *priv,
> =C2=A0				=C2=A0 struct v4l2_frmsizeenum *fsize)
> =C2=A0{
> -	const struct rkvdec_coded_fmt_desc *fmt;
> +	struct rkvdec_ctx *ctx =3D fh_to_rkvdec_ctx(priv);
> +	const struct rkvdec_coded_fmt_desc *desc;
> =C2=A0
> =C2=A0	if (fsize->index !=3D 0)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	fmt =3D rkvdec_find_coded_fmt_desc(fsize->pixel_format);
> -	if (!fmt)
> +	desc =3D rkvdec_find_coded_fmt_desc(ctx, fsize->pixel_format);
> +	if (!desc)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	fsize->type =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
> =C2=A0	fsize->stepwise.min_width =3D 1;
> -	fsize->stepwise.max_width =3D fmt->frmsize.max_width;
> +	fsize->stepwise.max_width =3D desc->frmsize.max_width;
> =C2=A0	fsize->stepwise.step_width =3D 1;
> =C2=A0	fsize->stepwise.min_height =3D 1;
> -	fsize->stepwise.max_height =3D fmt->frmsize.max_height;
> +	fsize->stepwise.max_height =3D desc->frmsize.max_height;
> =C2=A0	fsize->stepwise.step_height =3D 1;
> =C2=A0
> =C2=A0	return 0;
> @@ -470,10 +494,10 @@ static int rkvdec_try_output_fmt(struct file *file,=
 void *priv,
> =C2=A0	struct rkvdec_ctx *ctx =3D fh_to_rkvdec_ctx(priv);
> =C2=A0	const struct rkvdec_coded_fmt_desc *desc;
> =C2=A0
> -	desc =3D rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
> +	desc =3D rkvdec_find_coded_fmt_desc(ctx, pix_mp->pixelformat);
> =C2=A0	if (!desc) {
> -		pix_mp->pixelformat =3D rkvdec_coded_fmts[0].fourcc;
> -		desc =3D &rkvdec_coded_fmts[0];
> +		desc =3D rkvdec_enum_coded_fmt_desc(ctx, 0);
> +		pix_mp->pixelformat =3D desc->fourcc;
> =C2=A0	}
> =C2=A0
> =C2=A0	v4l2_apply_frmsize_constraints(&pix_mp->width,
> @@ -550,7 +574,7 @@ static int rkvdec_s_output_fmt(struct file *file, voi=
d *priv,
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	desc =3D rkvdec_find_coded_fmt_desc(f->fmt.pix_mp.pixelformat);
> +	desc =3D rkvdec_find_coded_fmt_desc(ctx, f->fmt.pix_mp.pixelformat);
> =C2=A0	if (!desc)
> =C2=A0		return -EINVAL;
> =C2=A0	ctx->coded_fmt_desc =3D desc;
> @@ -602,10 +626,14 @@ static int rkvdec_g_capture_fmt(struct file *file, =
void *priv,
> =C2=A0static int rkvdec_enum_output_fmt(struct file *file, void *priv,
> =C2=A0				=C2=A0 struct v4l2_fmtdesc *f)
> =C2=A0{
> -	if (f->index >=3D ARRAY_SIZE(rkvdec_coded_fmts))
> +	struct rkvdec_ctx *ctx =3D fh_to_rkvdec_ctx(priv);
> +	const struct rkvdec_coded_fmt_desc *desc;
> +
> +	desc =3D rkvdec_enum_coded_fmt_desc(ctx, f->index);
> +	if (!desc)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	f->pixelformat =3D rkvdec_coded_fmts[f->index].fourcc;
> +	f->pixelformat =3D desc->fourcc;
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -970,14 +998,17 @@ static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx=
)
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> -		nctrls +=3D rkvdec_coded_fmts[i].ctrls->num_ctrls;
> +		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> +			nctrls +=3D rkvdec_coded_fmts[i].ctrls->num_ctrls;
> =C2=A0
> =C2=A0	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
> =C2=A0
> =C2=A0	for (i =3D 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		ret =3D rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> -		if (ret)
> -			goto err_free_handler;
> +		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
> +			ret =3D rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> +			if (ret)
> +				goto err_free_handler;
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	ret =3D v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

--=-+plCxMyBS08v/1oHFlUB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJpd2AAKCRBxUwItrAao
HFagAJ9kpySvBjaNAzNBLEMtnAbxTfaYngCfcZh2egLoFBDVztkKTSFbUTpixT8=
=akP1
-----END PGP SIGNATURE-----

--=-+plCxMyBS08v/1oHFlUB--

