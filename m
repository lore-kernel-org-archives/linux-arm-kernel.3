Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8396FE7DF00
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOpBAlejMQlf8l36+6BJOJmGY4gq2Qds1l7yR6luOBM=; b=D7ICDm3hYgo8wtsgSIBbN4Wumn
	/YYWaG0ev37LYlVUildsyRurgHu0mDFDikJETAcFFE2G+xRTnqF0uDYgltmH+uam89dOI7iR+ydQc
	h3kE89VXOdoN80LgkB9oUOPvHnk4I3+tAUQwpJkBpuFMGKf7rl9zFQffR9GNgeU0zMxruUjpCW65Z
	TLDvYIUX7WHZcSk48MRXMH5rwDGpx9erm2M43S0kKv2WtgJvYAXuhcZBTc35RrPaM74pz6Og5NQi/
	IF4BczUB7cxGbCXwltTTKZgdBrYlESoRxc7IUbZv4e5DWRk5Fqbg6ShYpphUIr3tj+4r/WEKiz+b2
	FX4NVOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwqf-00000005IxS-11VG;
	Mon, 02 Feb 2026 16:32:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwqd-00000005Iwc-2eaF;
	Mon, 02 Feb 2026 16:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wOpBAlejMQlf8l36+6BJOJmGY4gq2Qds1l7yR6luOBM=; b=TRdURifyGorxqYhF+Xe6NQmQKv
	e3FXp1BxThFJbkOEu4okyaJVdbHeJzPowbHjeNQpsSAM+0ofryNflYOIGvjTiWQ78ROHqD6KOHilw
	smdx0kPf4Ojm46C2+Xijl3zlyfIDSEOq4zT6uu2ZXJCB18nb6pABu52cFVtfVxZH7PwQAgsKWH8zW
	ZnjEcDr++ZyahxOaCjzlbu1z7BdKo0OXpNGh7qqQ895dTFEEV9Jv4rpTf0gnh3KtqV1eqTVNAj/4Q
	XU8bUy8GlfvMPDT8hGfwXbHEq2sqLYQ7mpIX1d34jgo/D+cqQdWfFtLQ1fdJ/5FFeF9ukczzEy7+l
	7tRreH9w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwqa-0000000Eqg7-32nv;
	Mon, 02 Feb 2026 16:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770049939;
	bh=EbEcrN/Wa7xsaLg8FjqJkY67F/gdBSGhJKVWbuWvgtY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SLt97rhGMZFLOSh/T2m5qPWsdjbnIbe7p98Ae65y+OIRQAPOHS5V7IiMNMJt2I5q0
	 i8ip9fNtICHk6o6pP8+dtXzQGFVHCvfM5l2vCrGS9u8gV0anm7Sm3oM5Np5XNfi7p4
	 xINUFjlpdXXeyOgbj8r49BNxczNTUkWTSSDNaJ0qxVd9DDhiUospsvhNAoH2mvzrLd
	 UI62ZkxaQoRAt9T7khg/yKusIiGkgDuNI6w/uLPtiMvMUBt1yOl7Ns20s5ijq135wa
	 80FZLW6lxw/1LFITVFCEXcA77i+53ndesDm3xomWB0ux5Z/6/2vXbUtnyziBKy/Vr3
	 zk1XLtA9yL2hw==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CFB417E1276;
	Mon,  2 Feb 2026 17:32:17 +0100 (CET)
Message-ID: <ca81b8b03651cdb4f997c89fffd489407be59b8b.camel@collabora.com>
Subject: Re: [PATCH 2/2] media: rkvdec: reduce stack usage in
 rkvdec_init_v4l2_vp9_count_tbl()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor	
 <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>, Alex Bee	
 <knaerzche@gmail.com>
Date: Mon, 02 Feb 2026 11:32:16 -0500
In-Reply-To: <20260202094804.1231706-2-arnd@kernel.org>
References: <20260202094804.1231706-1-arnd@kernel.org>
	 <20260202094804.1231706-2-arnd@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-2jK0PyPR5gtYSVPZSaBh"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_163220_956943_65C42360 
X-CRM114-Status: GOOD (  17.63  )
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


--=-2jK0PyPR5gtYSVPZSaBh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 f=C3=A9vrier 2026 =C3=A0 10:47 +0100, Arnd Bergmann a =C3=A9cri=
t=C2=A0:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The deeply nested loop in rkvdec_init_v4l2_vp9_count_tbl() needs a lot
> of registers, so when the clang register allocator runs out, it ends up
> spilling countless temporaries to the stack:
>=20
> drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: stack =
frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werror,-Wfra=
me-larger-than]
>=20
> Marking this function as noinline_for_stack keeps it out of
> rkvdec_vp9_start(), giving the compiler more room for optimization.
>=20
> The resulting code is good enough that both the total stack usage
> and the loop get enough better to stay under the warning limit,
> though it's still slow, and would need a larger rework if this
> function ends up being called in a fast path.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index ba51a7c2fe55..1c875d5a2bac 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -893,7 +893,8 @@ static void rkvdec_vp9_done(struct rkvdec_ctx *ctx,
> =C2=A0	update_ctx_last_info(vp9_ctx);
> =C2=A0}
> =C2=A0
> -static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
> +static noinline_for_stack void
> +rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
> =C2=A0{
> =C2=A0	struct rkvdec_vp9_ctx *vp9_ctx =3D ctx->priv;
> =C2=A0	struct rkvdec_vp9_intra_frame_symbol_counts *intra_cnts =3D vp9_ct=
x->count_tbl.cpu;

--=-2jK0PyPR5gtYSVPZSaBh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYDRkAAKCRDZQZRRKWBy
9HFyAP0RF5b0OenNAGH35mTowVmYp7pBvzgVyYN7ehX7jmx8VAEAw6AY+q+q1f2m
VfoYBMjnRCRr5g/hOebJT5oXUy814QA=
=fZxd
-----END PGP SIGNATURE-----

--=-2jK0PyPR5gtYSVPZSaBh--

