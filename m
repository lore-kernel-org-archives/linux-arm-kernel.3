Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A31FC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 17:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bJusFc6Bh2W1sShrglX89wR39ATPmujO34pb8Ql680=; b=b2M3kN/lwZlJY50bZnO6IZ8QOw
	WAfMJ7S7+clpUsushgzzK3inAD8RK5T0vO0/3eb+ejBSwqwxXKZC140eHtzl1dxjc1Kdrd0a195Y+
	FMt1VBXVejU3oyJfV3usO6X7PUXYF6Asj80SHwr/Qw7Yr3UjknzYs2ctU/oWG2JiemLX5F3h/A3j5
	Nl4rjts3aw29PTNtbTkXa0gzz409FSyQgoITfJu7fkQxQkXgp9mdIyDs1mhWmsUZYQtNoV7DbdkKs
	+K7+6N/0S5dMSozu0t4TGYKc0IlFBGVJmTl9NQ3WaDgH4KGNL60SbmN/fUmcuOIE/fhOEeazTDV57
	U2h5M9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJbgx-00000009KBt-07QH;
	Mon, 26 May 2025 17:32:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJbeo-00000009K4V-30nq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 17:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C307744EFE;
	Mon, 26 May 2025 17:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEFAC4CEE7;
	Mon, 26 May 2025 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748280637;
	bh=++BoeWAgoVok/kbNT/X+LVWuRHe4UOQ0Rg+rCYlkPWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TLipo4G1A4/dTZ2yoky4OJWMqtN5wnK1+8zs1tLfjZ37azdeDbxOn33urpKYPSj8R
	 x7hghE+gkHJurHCis31OgpI80DarhFDkMPw0/4AiMVbZvClX1y7PyF1nC0d0BSbhAd
	 InmAs8Nl5SeHnJo1wJwaLb9l1FkvqhO7yrPEEFr3H8O/iZUe7OhGgRsevEOX6YfFnQ
	 CavK9GJ7YdSG+0+b2oCttmiBak6d5qtFueohieqLA++qkwJxVGAGkJ5Q77QSOoRTRt
	 EtI238iv70lZ6dUrXk4VuvHpvcBa+jMrRI6Fp3gF/jGMs1q+OCI8lBa2nCsKMKHWht
	 w9rxZuU6LjWrg==
Date: Mon, 26 May 2025 19:30:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Michael <michael@fossekall.de>
Cc: Chen-Yu Tsai <wens@csie.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
Message-ID: <20250526-refined-dog-of-blizzard-b48f11@houat>
References: <aCJZmm8rC0RwbcBX@a98shuttle.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wx3fp4rhvd2s43t7"
Content-Disposition: inline
In-Reply-To: <aCJZmm8rC0RwbcBX@a98shuttle.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_103038_782310_A1C6A23F 
X-CRM114-Status: GOOD (  13.07  )
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


--wx3fp4rhvd2s43t7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
MIME-Version: 1.0

Hi,

On Mon, May 12, 2025 at 10:27:06PM +0200, Michael wrote:
> with v6.9 and later there is no output on the BananaPI HDMI connector.
>=20
> I have bisected the issue to the following commit:
>=20
>   358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid=
")
>=20
> With this patch, sun4i_hdmi_connector_clock_valid() is occasionally called
> with clock=3D0, causing the function to return MODE_NOCLOCK.
> In the old sun4i_hdmi_mode_valid() before the patch, mode->clock is
> always!=3D0, maybe that gives someone a hint.

This doesn't make sense to me, if only because the two callers of
tmds_char_rate_valid (hdmi_compute_clock and
drm_hdmi_connector_mode_valid) have, right before calling it, checks to
make sure the clock rate isn't 0, and would return MODE_ERROR or EINVAL
in such a case.

https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/drm_h=
dmi_state_helper.c#L234
https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/drm_h=
dmi_state_helper.c#L553

Do you have some logs (with dri.devel=3D0xff)? Does it happen with 6.15 as
well?

Maxime

--wx3fp4rhvd2s43t7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDSlOgAKCRAnX84Zoj2+
dsbbAX99s9kKf45MW0A0sRoR7VuFGBnreiDwHOLIAAo4qprwTU4rlEcbnOBL7Y1m
XpJezKkBgJizzKS4du2vMNyg/eBB/0g/gvrzOsCy21C78GxZsMiwUpQBB81Ja0fq
gR2HdeNy8w==
=UHi2
-----END PGP SIGNATURE-----

--wx3fp4rhvd2s43t7--

