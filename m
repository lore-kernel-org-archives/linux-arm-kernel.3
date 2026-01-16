Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0A6C982DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 16:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yI2XYSwTvVhb9DCV7BJIh+Gsz4vYaSmf6hvMKZExTCo=; b=q6TMHZtX+V9ri+7Rqv/bXmXsYo
	mf+r6sz9+m63+idrxr29e8D6KFlivYl1Wvvb6HMAzk2XWzPA3HOiHk5XYDald65eFCWZBGirbtbb1
	2fRjRxX8CViiVY+6CjpcnmeS+iNssXktlRjjCAhgADXEwzz2UZv8WggMn6S6WT0rgcT15ywMlMnZx
	kktDwtmXVz6kd+UJnkX1z15/yj0tv7UyF626JucMB5TeDcf/XGewXi31VRbgTitVHTXNSjKXvMUtY
	QWA+WGoYZTXrZxXc9AeruphcgdB8acKpxyBgrpR7zgMCDtyemg6zf5Ax4gxOSGyYL3vn1MTbkKW8D
	LN/P5YvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgn18-0000000EUQF-1vtm;
	Fri, 16 Jan 2026 16:49:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgn16-0000000EUPp-1l3r;
	Fri, 16 Jan 2026 16:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=yI2XYSwTvVhb9DCV7BJIh+Gsz4vYaSmf6hvMKZExTCo=; b=ChRtAKmFPFgjEj2MJUr5lwxoqR
	6KHtYVPzSVyn9bFz7rHB0lcpr2sYi5ewutGrLY8qE1juhIvHX/67F94QnlB3wraAH2jbNuNpFg5au
	IUqv1YSIaYrLzsoah74DeYeyC1CmUwzF7yH9YPP5HtAeBisxSpCTqBnPNmEgNIBOKicSlpmLu1O1y
	FY2kEU9Bf++OXlUxM8zRYYOKoDsWM6GO0ZOI2Lb3Vm1/at800F8Mj1DJpFupJQn7TYh6twB4eg4a4
	vkvQRrNNTtUj5LtTcg3HNgxs/XmdZeQ5E6rbcPfIDuWwnTjBPBXkMzka6qXaS9py9cT8jz2tJ3N08
	kyeM9y5w==;
Received: from i53875a97.versanet.de ([83.135.90.151] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vgn0l-002eXq-JT; Fri, 16 Jan 2026 17:49:24 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
Date: Fri, 16 Jan 2026 17:49:23 +0100
Message-ID: <6509513.iIbC2pHGDl@diego>
In-Reply-To: <20260116005953.286225-1-andyshrk@163.com>
References: <20260116005953.286225-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_084944_501029_B428916E 
X-CRM114-Status: GOOD (  22.56  )
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

Hi Andy,

Am Freitag, 16. Januar 2026, 01:59:49 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>

when resending an unmodified patch, please mark the subject as
[PATCH RESEND] ....

> Filter the mode that can't output by the crtc.

In commit 8e140cb60270 ("drm/rockchip: vop: limit maximum resolution to
hardware capabilities") which introduced the similar check on VOP(1), we
had additional information, in that the VOP1 hardware does not have
an output height limit. Is the same true for VOP2 ?

Because then I'd like to extend the commit description to something like:
=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D
The different VOP variants support different maximum resolutions. Reject
resolutions that are not supported by a specific variant.

Only the output width is checked because the hardware itself does not
have a hard output height limit.
=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D

Because when someone sees the code later they might ask why the height
is not checked, so having that in the commit description allows us all to
remember why the check is this specific way :-)

Thanks
Heiko

> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 498df0ce4680..74fba29bfff3 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1439,6 +1439,17 @@ static void vop2_crtc_disable_vblank(struct drm_cr=
tc *crtc)
>  	vop2_crtc_disable_irq(vp, VP_INT_FS_FIELD);
>  }
> =20
> +static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
> +						 const struct drm_display_mode *mode)
> +{
> +	struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> +
> +	if (mode->hdisplay > vp->data->max_output.width)
> +		return MODE_BAD_HVALUE;
> +
> +	return MODE_OK;
> +}
> +
>  static bool vop2_crtc_mode_fixup(struct drm_crtc *crtc,
>  				 const struct drm_display_mode *mode,
>  				 struct drm_display_mode *adj_mode)
> @@ -1884,6 +1895,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc =
*crtc,
> =20
>  static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs =3D {
>  	.mode_fixup =3D vop2_crtc_mode_fixup,
> +	.mode_valid =3D vop2_crtc_mode_valid,
>  	.atomic_check =3D vop2_crtc_atomic_check,
>  	.atomic_begin =3D vop2_crtc_atomic_begin,
>  	.atomic_flush =3D vop2_crtc_atomic_flush,
>=20





