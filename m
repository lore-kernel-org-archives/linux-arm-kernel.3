Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4343CC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+5K/3z8bHHDx4veFZVqR8dLIbT7Kl4Xgcjf72s2+S4=; b=ddnC9yVxglKHngxmAlhg8lfpLu
	cvb0ia3ojem4eXDkOWOYOouXsS4oaZh+wGygaTUdomkesaKJlITvLE9NckyvEAD1D7g9UIpLMoESY
	FN/5w6G6va7vl1kv2W9MSLolBw/KQ67EdWGrKCjP4s6426Vw8QGCnRrWRbJ3PJEBoJsYm9ERxlSx7
	tER5fJygxA8ivuasb0MkTq7TVvdiJwQcNAUmNBJgxwQr9u24K6P96kJjeZmzFzsIH6K+bXa5JoLgx
	PZHhUTyXK3/dlLK6V8Ftg5k/MqemE1CBBSN/lo+fgoeSMD8y6OjrG9sG8PLTAByXJ+Zy7XjjuQfP2
	k5ofrYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM1vh-0000000787d-0iIr;
	Mon, 02 Jun 2025 09:58:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM1tX-000000077sH-03EM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 09:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03E9C61154;
	Mon,  2 Jun 2025 09:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAD3C4CEEB;
	Mon,  2 Jun 2025 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748858146;
	bh=f3PThskvyc3o1dRe3gR60NcQON7tJMiafQa3JgdKS4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owoclCnU402xj1tKfjG2V3nRezynaK54F0LeM1C7LfPj5B6kEEc+R6xwRDWTX9Izt
	 fH4bF1SyqYcU4bzfflH7O+/vuVhM1ipyqI5itPn188lgbOxXSl16Vj9bbUSHwPJsAV
	 8jvPUNNMaaTUaPhWg+kdP52Xd/CbCrw3Vxy0DF5tZ3R/Je8tIWBrTlHG3v5WFeRVJt
	 yvNeq9RShmce2SQXZ+h+jwC5cyhw10/yBr8htEymYu0oSgwmd846TUElCHbXtoAysE
	 4Rlp6tzntGAPZEJHasqpvFqUjN/otT7Elj1N1qpY5NxxEVSfyU/eHW+psb3/D8MBIn
	 dRGSN1IypgS9A==
Date: Mon, 2 Jun 2025 11:55:44 +0200
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
Message-ID: <20250602-psychedelic-purring-poodle-900a5b@houat>
References: <aCJZmm8rC0RwbcBX@a98shuttle.de>
 <20250526-refined-dog-of-blizzard-b48f11@houat>
 <aDTZXagQ28OdNtLh@a98shuttle.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bjexc5aylm7p2ugp"
Content-Disposition: inline
In-Reply-To: <aDTZXagQ28OdNtLh@a98shuttle.de>
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


--bjexc5aylm7p2ugp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] [BISECTED] drm/sun4i: hdmi: No HDMI output with
 BananaPI M1 on 6.9
MIME-Version: 1.0

On Mon, May 26, 2025 at 11:13:01PM +0200, Michael wrote:
> On Mon, May 26, 2025 at 07:30:35PM +0200, Maxime Ripard wrote:
> > On Mon, May 12, 2025 at 10:27:06PM +0200, Michael wrote:
> > > with v6.9 and later there is no output on the BananaPI HDMI connector.
> > >=20
> > > I have bisected the issue to the following commit:
> > >=20
> > >   358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_v=
alid")
> > >=20
> > > With this patch, sun4i_hdmi_connector_clock_valid() is occasionally c=
alled
> > > with clock=3D0, causing the function to return MODE_NOCLOCK.
> > > In the old sun4i_hdmi_mode_valid() before the patch, mode->clock is
> > > always!=3D0, maybe that gives someone a hint.
> >=20
> > This doesn't make sense to me, if only because the two callers of
> > tmds_char_rate_valid (hdmi_compute_clock and
> > drm_hdmi_connector_mode_valid) have, right before calling it, checks to
> > make sure the clock rate isn't 0, and would return MODE_ERROR or EINVAL
> > in such a case.
> >=20
> > https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/d=
rm_hdmi_state_helper.c#L234
> > https://elixir.bootlin.com/linux/v6.15/source/drivers/gpu/drm/display/d=
rm_hdmi_state_helper.c#L553
>=20
> Before 6.14, sun4i_hdmi_connector_clock_valid() was also called from
> sun4i_hdmi_connector_atomic_check()...
>=20
> > Do you have some logs (with dri.devel=3D0xff)? Does it happen with 6.15=
 as
> > well?
>=20
> It does not happen with 6.15, as it was fixed in 6.14 with 84e541b1e58e
> ("drm/sun4i: use drm_atomic_helper_connector_hdmi_check()").

Then we might still need to backport that patch.

Does applying it to 6.9 alone makes it work, or do you need some additional=
 ones (I'm thinking of
ae048fc4f96d in particular, which in turn would require 47368ab437fd)

Maxime

--bjexc5aylm7p2ugp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaD11GwAKCRAnX84Zoj2+
drKQAYC96lg5+YW34Em5Duc/MTJOq0c14NGmAiHXTxuOqNkljUIBqho6t3MeKTO6
M6+OuV0BfR7FKf+9atUl2aa7s8n1k/MKwABVR/aK6AWGsPaqvm4doIaoMO5ji47F
Lsgy23oivw==
=0IgN
-----END PGP SIGNATURE-----

--bjexc5aylm7p2ugp--

