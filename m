Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E7CC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4doV9GUIAy9xUM+AhC/KkssK6h0MHIlM0ziN846RuEo=; b=G8o5KhrDyI79+KYMfxuOnfNnhJ
	BaUBL4XQCmzZ719Q0Kgm4SU45K8xxmzqycivB7VRm3JCNzaaCKqJ4VjTuqbNs7rH2MQymd8V1NFSv
	YuUqunZwBN5Akxsu4xYWUWJZFyrmWPEznnw8W3WgjsfY2rotFuxnW8kr7SE4i2P7UMK6uOACgcLP1
	4kmSgbEk/AhOI9U91erSJIM5Im+Ep152NXNhXHMCHTa3v4B/ryHG8zKOhlS6hvW9jM/e8VGfMGSFj
	sNc3LfsaB3eVSnoWK13E124j0BmOd2txerrV2G+PgGdDJYI6OBwcpIUEBiZOEe3QmmmE5gZJDk4P9
	ZB4wFBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlp5-0000000E2dG-2D5B;
	Tue, 11 Aug 2026 12:43:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlp4-0000000E2ct-1wY2;
	Tue, 11 Aug 2026 12:43:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BC28600AD;
	Tue, 11 Aug 2026 12:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAD41F000E9;
	Tue, 11 Aug 2026 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786452193;
	bh=4doV9GUIAy9xUM+AhC/KkssK6h0MHIlM0ziN846RuEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=op7S08VpI3MrH1h/maoaiUxk163dPSARrCqOWylNsQmtVHV+KnxK4GX8vEm6kwbWL
	 ntm5ElhUpUHiS4sSlN+gI77xvYnSbPQiqonQLrh3g0zDWKd3HMB6gl8M0JMh6mCTDT
	 wGovQw6wQfSpz4wO5uP0Mtlqjwwi+kcvmLVCCNXHVCjcbZvjFMaQEdvEJkxcFdcLAn
	 gU1wOk3RewFn3ukeZbekbefbLhtx9sxYiBjQsBMXQRhJbyo79cWQik9Y/kBA4DLNEs
	 bxDoaLOKdBWil1q6EOIavriIi6PqWS9UmfwybeZv/TQn20XWNkNaYtvy/dOeRXNrCb
	 uNLFK2CXeDLNg==
Date: Tue, 11 Aug 2026 13:43:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] regulator: core: Add "enable and wait" functions
Message-ID: <99ad23ba-f8f2-404b-960e-1c22a20c9ac4@sirena.org.uk>
References: <20260811122011.3539250-1-wenst@chromium.org>
 <20260811122011.3539250-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jN3Lu5VuliZs+Yka"
Content-Disposition: inline
In-Reply-To: <20260811122011.3539250-2-wenst@chromium.org>
X-Cookie: Take me drunk, I'm home again!
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


--jN3Lu5VuliZs+Yka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2026 at 08:20:01PM +0800, Chen-Yu Tsai wrote:
> In device power sequencing and initialization use cases, it is common
> for the driver to enable the regulator and then wait for a certain
> period of time to pass before continuing.

Please don't bury core changes for subsystems in the middle of random
other serieses, this is the first time I've seen this.  :(

> One case in particular is not optimized yet: a regulator left on either
> by hardware reset default or by the bootloader, but does not have the
> "regulator-boot-on" property set. As the enable timestamp only gets
> updated when enabled by a consumer or by the core, the first enablement
> always needs to wait.

Just take a timestamp during registration if the regulator is enabled,
we check if it's enabled anyway so we may as well take that as the last
time the enable happened.

--jN3Lu5VuliZs+Yka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7GNoACgkQJNaLcl1U
h9BeJwf+NkLsGljQXwokTuIRv+ig4jdUnALSbb8+0ZIRrZ+96sNEkwqEODMFToii
m8eaYIc5o7+PoXbWo0li99AO3IoZAw8otyweKMS8qGabP4EmHx4RQlRtmT5EB8GN
KKPHgVNpuTTrP8/pNacCVJUZ2keDYA98Mqugtuxo14y9ZOp4HKevYQvXdimF1sXM
43lEEtZJ/tnW/FlDVUtljN42u51I1ly4Tc2SUvquTs1V5sOJGEFvAftOVMTQWZeb
dGPhAbqkevlNFnoQqIGB/9AeSYm8PpMRwVbveoDgBKXYMiHKpxokg2Vib+LH/6rn
wYimUcQhuqXcIN2eQrOr0HIWPeB9Qg==
=2Up9
-----END PGP SIGNATURE-----

--jN3Lu5VuliZs+Yka--

