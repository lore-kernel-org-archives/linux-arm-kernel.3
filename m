Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E881CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZL5JxJsiTCoCm2lKtnn2UECrdAHXWzTP8LDNGKPBMM=; b=tYYUegr+ivZwi4aVlHq6hSK6tN
	ssZH3SFBqS1WY7KfWoqLeTTEdqXjGCf+/weFKJxoaBP5B8inbnPiVKSMpGGsPh+NiFncFzMojzig8
	aJpJS3KPLIcNDA8u3TYgnN57GDqv0JcLECfu0qPmYteJnIt8+4XBFSQXMIKan/ccJbi42XNlBOz45
	Zkfnvc5PJ8owHYcutwuAHeDd2hhOsPrKMpQkSfZbK3gJ8TXzkCsZxGQ0Lml2F74+tzF+q9S0inM59
	0bwLEv69XXz3vbYi5YMhJSz1WCM7gy6WJLRBJTzf1hwWCkFZxUEVTxvkKb0oH8hVIXEtoZ//MK1B5
	URn0y4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtnu-00000002OBW-1NG8;
	Tue, 26 May 2026 15:34:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtnq-00000002OB2-3OCS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:34:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E6D9600AB;
	Tue, 26 May 2026 15:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3091F000E9;
	Tue, 26 May 2026 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809685;
	bh=NZL5JxJsiTCoCm2lKtnn2UECrdAHXWzTP8LDNGKPBMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QXKpyi0TZD8Tcj6Q9+hRh1av4YyrjQoxXv7CHD4/qNsbUk/ZxWHo06eRo8VBF3JT1
	 sMyvxnW7II4T8lcikr/B+TmGWjrzoYWgH2PMwi9iHP+FXQr4JhiHhm/DrfaP/7CbUH
	 FA97D7ylMEgiY48ezmMEMtzNc8qbEjdjcIxzTutaM7eq+LCv2QK/Z3RW8o7n9hYmeX
	 +XTqXY9WlIFVga7LWVXtH1NOED7HsaqI1KFOYUefmch6iQlQMiOWPnUlCJckR+6e0s
	 82bc1ONsQn9M5lUdZEV5lfqDp2eRwsMk+DDsVtGnKhtwT/yZWn3LxcAG5Y6AuplxDC
	 xKgafFy1tOf2A==
Date: Tue, 26 May 2026 16:34:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: imx-rpmsg: Support headphone jack detection
Message-ID: <1f4d888d-7c1d-4ea9-9357-e8424bf9ba40@sirena.org.uk>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260526053815.140008-3-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NyFsfh5e6+CEA30G"
Content-Disposition: inline
In-Reply-To: <20260526053815.140008-3-chancel.liu@nxp.com>
X-Cookie: You are fairminded, just and loving.
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


--NyFsfh5e6+CEA30G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 02:38:14PM +0900, Chancel Liu wrote:
> Add headphone jack detection support for i.MX RPMSG audio cards.
> When the "hp-det-gpios" property is present in the device tree node,
> use simple_util_init_jack() from the ASoC simple card utilities to
> register a headphone jack with GPIO-based insertion detection.

> +#include <sound/simple_card_utils.h>

We need to ensure that SND_SIMPLE_CARD_UTILS is selected.

> +	if (of_property_present(np, "hp-det-gpios")) {
> +		ret = simple_util_init_jack(&data->card, &data->hp_jack,
> +					    1, NULL, "Headphone Jack");
> +		if (ret)
> +			goto fail;
> +	}
>  fail:

The interaction with deferred probe is a bit fun here, we're doing this
after registering the card which might defer via unbind_card_list now.
late_probe() might be safer, everything should be mostly up by then.

--NyFsfh5e6+CEA30G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVvY8ACgkQJNaLcl1U
h9C4vwf/ajjHtHHhwPmt99KXLyiz8M117WQigkzPq5aOFos1o0Q2SFypW9w7t5mH
PCYraLdPYViSdlibqfXT1fnGrZmvK4Q6xrIphv+FNZakAeEoU/Sm9yKjVMpP11l+
bZrhqp6WDUMfgLsZOCmRCwsJDolW+ZN1OWHHk2vROMGve54/FzP9NXgU+BHkuw3n
7uINB550fzB6XfEMNyifdUxVCfdolaOFmbTEp/NUbQ3pYC20prZQb2jDDmN/jvcq
GHByGL7MqID2+G5snfxn5yjOhcgsw2S7kXHlSK+3LFxR4MP1VNAdEauzXD2gXv2e
9jieq1ygWvOXB5BIqgsLjPS3zrVa4A==
=4uBe
-----END PGP SIGNATURE-----

--NyFsfh5e6+CEA30G--

