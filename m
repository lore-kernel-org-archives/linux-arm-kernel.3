Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA07C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 20:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	From:Subject:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OK3R5dXcTJj2wL9xZzZ3c6xb7EGe7PgQLjn11tnh4TQ=; b=crqbmBjMCWuF6b1WKgDlbOEODj
	k7r3ByxM4DPhNmgc9zK9ThCQbkLjQfyv7KMLFDUu+OMVY52wgPd+qdoDkwsafOdZ5f2Oi0CBbDLnI
	DuvJKIeUUhP3mztQJQIxlcTJmgY0RzS7/xPrgsCyskkFrbrixR+QmL2yYPalb/uqu6Y+niAfVjV1w
	hwXClr66UaB7LYyRP3naAvsU1JP8fqF4HgcuMaGRBwalWRiG4wcLDMo3oMPpMClFM5Wo4aq+KHpf6
	nFDKwOu1e3v8Hyv0e6ygJRp/Jo6AtigQsPBg2GOec8YnWqa1fMixLgJqc7lS1wp1q2YwS3Iixfr+D
	Rwe8pjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGxH-0000000GZUV-3dRm;
	Thu, 05 Jun 2025 20:12:51 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGtH-0000000GZ8t-2sDb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 20:08:45 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1749154121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OK3R5dXcTJj2wL9xZzZ3c6xb7EGe7PgQLjn11tnh4TQ=;
	b=YQKEQUi2Pstu3EzNcko9YE4QP82nsguw95NIR1TrkXxSBPFfqHVmxSLC0aBunnrbJZ0UOF
	QgA62cCzKRJeL9e9piPRVRaIs6WyksCdYgn/6Vzzzr4yEJ6Cbi9nfH0bbh5tMlVFyr6hZ0
	ySCyOuaYO8IF/V+9O0NwXLCDJmyEAz8dfdCElwdALQ9zHGnCA45OG8Oi7Ny3O0rYPl1J+p
	FDVtAIkvSSSnWpY/lr1YP8vZovPJW/6GTQVmR15gloQa4Kd0JmgVemDbq4y6OsuEfrUmVp
	wTaDMu/oUc93GDsEUPHUZGJ3xmAHDbtguz5bV1fq7Wf4hbQaMA+I2RdG6/8wtw==
Content-Type: multipart/signed;
 boundary=57318c575cf0bc267bcbb636acd15cccce634ec5c21f129cbe5e981a9e70;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Jun 2025 22:08:29 +0200
Message-Id: <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
To: "Piotr Zalewski" <pZ010001011111@proton.me>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, "Dang Huynh"
 <danct12@riseup.net>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
In-Reply-To: <20241206192013.342692-3-pZ010001011111@proton.me>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_130843_941149_C36B008D 
X-CRM114-Status: GOOD (  23.28  )
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

--57318c575cf0bc267bcbb636acd15cccce634ec5c21f129cbe5e981a9e70
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Piotr,

Since kernel 6.14-rc1 I have the problem that visual output is no longer
shown on my PineTab2 and a ``git bisect`` pointed to this patch/commit
as the culprit. What is important to note is that ``CONFIG_DRM=3Dm`` seems
to be required as the problem does not occur with ``CONFIG_DRM=3Dy``.

Near the end of my bisect session, something interesting occurred.
I was booted into a 'bad' kernel (ie no visual output) and when I
started to build my final kernel, I closed the lid of the PineTab2 which
made it go into suspend. When my final kernel was built, I opened the
lid again, which made it resume, to transfer my final kernel to it.
And much to my surprise, I then did have visual output.
When I read the (below) commit message of the 'offending' commit, it may
not be such a surprise after all.

When I build a (new) 6.14-rc1 kernel with a revert of this commit on
top, then I did not have the above mentioned problem, confirming this
commit was the 'bad' commit.

I did try it on a Quartz64-B (also rk3566) and it did not have any issue
(output via HDMI).
I don't know what the cause for this issue is, hopefully you do.

Cheers,
  Diederik

On Fri Dec 6, 2024 at 8:26 PM CET, Piotr Zalewski wrote:
> Remove color_mgmt_changed check from vop2_crtc_atomic_try_set_gamma to
> allow gamma LUT rewrite during modeset when coming out of suspend. Add
> a check for color_mgmt_changed directly in vop2_crtc_atomic_flush.
>
> This patch fixes the patch adding gamma LUT support for vop2 [1].
>
> [1] https://lore.kernel.org/linux-rockchip/20241101185545.559090-3-pZ0100=
01011111@proton.me/
>
> Suggested-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 0c8ec7220fbe..d259f1c6571d 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1601,7 +1601,7 @@ static void vop2_crtc_atomic_try_set_gamma(struct v=
op2 *vop2,
>  					   struct drm_crtc *crtc,
>  					   struct drm_crtc_state *crtc_state)
>  {
> -	if (!vop2->lut_regs || !crtc_state->color_mgmt_changed)
> +	if (!vop2->lut_regs)
>  		return;
> =20
>  	if (!crtc_state->gamma_lut) {
> @@ -2669,7 +2669,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc =
*crtc,
>  	struct vop2 *vop2 =3D vp->vop2;
> =20
>  	/* In case of modeset, gamma lut update already happened in atomic enab=
le */
> -	if (!drm_atomic_crtc_needs_modeset(crtc_state))
> +	if (!drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state->color_mgm=
t_changed)
>  		vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
> =20
>  	vop2_post_config(crtc);


--57318c575cf0bc267bcbb636acd15cccce634ec5c21f129cbe5e981a9e70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEH5QAAKCRDXblvOeH7b
bo+zAQCF7eO0LKR0BrCxe85yPqZUywQSlor81IjdsdhLATzzDQD/ZlzKuhnWKhP4
3U0JPH5a2g4+MJx3D3O3+nc6OyIN2gQ=
=ZAVT
-----END PGP SIGNATURE-----

--57318c575cf0bc267bcbb636acd15cccce634ec5c21f129cbe5e981a9e70--

