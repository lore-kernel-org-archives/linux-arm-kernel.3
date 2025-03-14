Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A899C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 07:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwp8mATsV/Ux9lA4ss1Nf12O+zS5Xj7+Qi84/089LBc=; b=v9+G3KLNvglxGnr52JPQi7qWRr
	Z6Cp8k1q4icaDkxVdOonVzBsvbPcZHnwg212zXwPxr/Hf68efGGTghN02r7zs2GiecKOt/v4YJDM0
	g6mz5a/i3LWlAn2lWnHhyTNzgKcKHLdTsimK5nAWxeiATuLMeBaHxkEYu6x/SEKsVNIprnNPxlU1g
	UupClYX+7/Xty+jHI9epYe2Od/EuL9D888YVvb3djZ72hqUgTcufrPMM3p9v803Xgl+dUi2o7dUxg
	9iGtLrg5UT+pNqlNDJu9UiL1WFIKOZqM0Wpjkvaz1DJf6S3mUbETdnY7XwknZMZY/t9qWVcRmKNMw
	GXl+S4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszJk-0000000DIfO-3RkJ;
	Fri, 14 Mar 2025 07:18:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszI4-0000000DIGB-3a5h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 07:17:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36ED2A48826;
	Fri, 14 Mar 2025 07:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B100C4CEE3;
	Fri, 14 Mar 2025 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741936627;
	bh=UQ9+UxxXMrfNzmzYIXUgXpda8cS4hyKtx7pSVVB4XT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZJUWeP3sHk6WCJL0OtYdbiCuY/p+7aX9aOSQ5yYdne4MyGWo/SNiSeMrs1gYa+JO
	 CWwzl04PnwppTgZp8gLgNPVG5202ypbgmU2+TjMJuSKYHHOVdcVkQ7JeaCyHz63Vc4
	 yWtuEBPoUM45XMJle6OmEdnV9w1PH9lwGWqTT3vTpWOvue1kLL8noa57uuzJh9Jh+B
	 lCMpnwKHoFrjFVBL36k1eflre4uvWPrckExcnzh1t/UfGeQYnQcVnEir5wE9wAFYsd
	 7xXzAGwysS+21vOCMj9FdBfiGWEi+PuhZYCgD6viaU1zfl5o7laAY45ofEvF1GrLlq
	 fLQqcA28rGXaw==
Date: Fri, 14 Mar 2025 08:17:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: wens@csie.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, jernej.skrabec@gmail.com, samuel@sholland.org, 
	neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in
 sun4i_backend_atomic_check
Message-ID: <20250314-prophetic-attentive-platypus-3ab214@houat>
References: <20250314012029.668306-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6q3hnszpv4smntsm"
Content-Disposition: inline
In-Reply-To: <20250314012029.668306-1-chenyuan0y@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_001708_955321_07F6EA2A 
X-CRM114-Status: GOOD (  17.19  )
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


--6q3hnszpv4smntsm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in
 sun4i_backend_atomic_check
MIME-Version: 1.0

Hi,

On Thu, Mar 13, 2025 at 08:20:29PM -0500, Chenyuan Yang wrote:
> The function sun4i_backend_atomic_check was dereferencing pointers
> returned by drm_atomic_get_plane_state without checking for errors. This
> could lead to undefined behavior if the function returns an error pointer.
>=20
> This commit adds checks using IS_ERR to ensure that plane_state is
> valid before dereferencing them.
>=20
> Similar to commit da29abe71e16
> ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed"=
).
>=20
> Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for t=
he frontend")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4=
i/sun4i_backend.c
> index 2dded3b828df..a8e0e2123764 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi_e=
ngine *engine,
>  	drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
>  		struct drm_plane_state *plane_state =3D
>  			drm_atomic_get_plane_state(state, plane);
> +
> +		if (IS_ERR(plane_state))
> +			return PTR_ERR(plane_state);
> +

This introduces a build warning. You shouldn't mix declarations and code.

Maxime

--6q3hnszpv4smntsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9PX8AAKCRAnX84Zoj2+
digtAYDNEX1uj/4n3Y1V97Pum0BMwqi1SG9ZsgnDjPQggA14QSrt5669uvj0YJTA
3iABKQIBgMzzgD0FMGNquJ6X6rm3DTbMEwkB184/UVSwGcm7tvHmz5pua6n6Vv8l
gD3dBQbbBw==
=ecRp
-----END PGP SIGNATURE-----

--6q3hnszpv4smntsm--

