Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 03:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xknFVA+C;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5IOzblz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FiR8bNJz68wyQ94GkBHZoR3YiuS4hpz+FXLXPKGN9Lk=; b=xknFVA+Cw2uaq4qZGXeyhG38u/
	6vl4/KcMko1q87Vnbm/cJsOQrwzgYMBwjueT/8CiVz//USu4o0bAX9ymtviEKiXMbP0fEukWcS2ZJ
	1Tijluo/hq166kQhTedSA9JUpCaOoMeDwk87hgnAIKIXNoMSpQHNU466pGi8fbqiDppsOvK5RU2NN
	iHf0iVJzCeuMO/Duze0okOX1CU2epHZd3BnbPwv1UGHa12hb65L0Zv8aAF01f9nME+e5gRZkhfL4g
	92E82bjeKJ+ZLZPo40wX7keJzoLl3nfGgS7SWq+KucZN3VoNXumUa09u5cIu0/igCjOs846Zl93sy
	m3v2gd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORdK-00000004FuO-0Dkt;
	Wed, 04 Nov 2026 03:25:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORdJ-00000004FuE-14rw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 03:25:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A62A43F1D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 03:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8147F1F00A02
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 03:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793762752;
	bh=FiR8bNJz68wyQ94GkBHZoR3YiuS4hpz+FXLXPKGN9Lk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=F5IOzblzVMFI6Zx8tG7Yt2TBiGdnoDbxyv6HGYRoDScDZEGta3FVGaKpN2Hcktbky
	 GJJcGsjqbGIFO5FcXmWnYbabSnO95o+H9/OQ7rnY/jsNjOGn8jlo8ycg09LL6MzQmB
	 zz1LAG9JD4KqD+QXvLSyHu33uMeCJJVcsfHP1ajPTp0lmtY3n6A7CBY34quq7LQnN7
	 F10HywVMTczJoShhzWDLzAOPWhTw+15r99gmxX1euVy3mprMVQNeXr3wYkmlWNHvNO
	 1SgVdJF5S5dJKlheJwUe4LCwDl79onScy96ySFZNqKlOD5hdsHxe2tXCYJIeO2zXV/
	 C64WEZT6EKL/w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3acd523a802so2030881fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 19:25:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBziFDLH2vXj1a/SaeScO2lKMRk5nDnuabDWrOQbJPtWZOWjN7pbVg86klbmGvhMFCPClEgJOQclqutaPMXfMIvx@lists.infradead.org
X-Gm-Message-State: APuU4Z+c7czNwXYZJsrEdwZcWpWiizhArBoe0jRCADgdrxaJ5MeFnJBe
	rqzQ3LMDqGxsyThNJWxmIofDYH/h4g7awVlM21SOqOzX00pW2h9+iJp/jAPfRJ+q4uilCIjR2hz
	YMnJt0rEJ2OoygGWz1wZbOMpT5LQ3aog=
X-Received: by 2002:a05:651c:b11:b0:3ab:4ab5:56ce with SMTP id
 38308e7fff4ca-3acb7b4edb0mr35654131fa.28.1793762750881; Tue, 03 Nov 2026
 19:25:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <aupKBdon3N4Kpnkt@daniel-HP-Stream-Laptop-14>
In-Reply-To: <aupKBdon3N4Kpnkt@daniel-HP-Stream-Laptop-14>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 4 Nov 2026 11:25:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65DdCiWrEOefDGUjYtT2=tcxQ+VW3vfcHVUAUgcEtEfwQ@mail.gmail.com>
X-Gm-Features: AclHuK_5Y2MLhaVY7HfmVbOKOfX5_2eeteHh2sW4OTC1OnqSFna6GnQ5i2y_CDY
Message-ID: <CAGb2v65DdCiWrEOefDGUjYtT2=tcxQ+VW3vfcHVUAUgcEtEfwQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: staging: media: sunxi: cedrus: spelling correction
To: Daniel West <daniel.west.dev@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 4:54=E2=80=AFAM Daniel West <daniel.west.dev@gmail.c=
om> wrote:
>
> Correct spelling in comment.
>
> Signed-off-by: Daniel West <daniel.west.dev@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index 780da4a8b5af..f57642c0d8fa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
>         }
>         cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
>
> -       /* Neightbor information address. */
> +       /* Neighbor information address. */
>         reg =3D VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neigh=
bor_info_buf_addr);
>         cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
>
> --
> 2.51.0
>

