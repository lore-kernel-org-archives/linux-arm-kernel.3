Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6DBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ziSh7+jqZyf3UzqZajs8CYNo1sTpmApE/Ayopvs16o=; b=Y7Pf+39wI+qjl9jHrzDnwc2m9u
	27L/lJ3TLjMajZrKqMfV7/5cNrHYIwlS8mxBXmPUhCTgO77WYJZx7V57gvQkyzxDRyASMnFqWEwNH
	Cfrev4hMjq4ra9jGoq0WyMkXqmYXFKyVKqGBFOvTJrv+y/GmJfEFNLyS8AKUFd1ZLJk1fPbade+iK
	/2uW54zfDncS6g5+uEqnPXma8QibEQ79/8CRtHznh+kOwkx28yJwldOafn0vl4IZujbtiku0Gq82H
	rfH7R71IL5KsdIDZlFbzQiv3+OODQjdWU2I7OXHhRjFhn7SBzt1PD6LoeEMcWWTdnRqBQcanXpvD+
	msMyrxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJog-0000000E4Vi-0HjK;
	Wed, 10 Sep 2025 12:20:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJoe-0000000E4Uu-00Y1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:20:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67DAC601A8;
	Wed, 10 Sep 2025 12:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F05FC4CEF0;
	Wed, 10 Sep 2025 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757506847;
	bh=9ziSh7+jqZyf3UzqZajs8CYNo1sTpmApE/Ayopvs16o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8ISRPkm6DSTl3snhoL8y++8BXcZSOq1nbIGJu+WpGPiPuBTWZOcEou6TRZTK0cb0
	 5w9y8+QsLq5fbHFecF+64tInUBFAM+46A5rfaxSWdFHVF6K6PFIpI89BLcSy1qfCcC
	 /Dr37obCYmvSpRkr/GC6/Hu42Tw1rLujmFhOwaPSamrC5SufsJ1S521aJA3tBkS6yP
	 AEErbxprqZFrJ7jKY7Ag23PIwEAIsfRqD29XSRiqhL4di/mZ8nWcbidLW7jF/GEUVH
	 az9sgMXwaJoAGJvb/1ftFjE8GSVFJ2EUdlqBLYM3e5dX+9RN09BNLANGYG8inJjr/8
	 zgIXFAV7948QA==
Date: Wed, 10 Sep 2025 13:20:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <akemnade@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <9853ad77-555d-4a38-972c-834ff45b9cb7@sirena.org.uk>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
 <20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="08SCNPHVt+IzhmFS"
Content-Disposition: inline
In-Reply-To: <20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
X-Cookie: I think my career is ruined!
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


--08SCNPHVt+IzhmFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 09, 2025 at 10:33:02PM +0200, Andreas Kemnade wrote:
> To be able to fully describe how the SY7636A is connected to the system,
> add properties for the EN and VCOM_EN pins. To squeeze out every bit
> of unused current, in many devices it is possible to power off the
> complete chip. Add an input regulator to allow that.

Lee, the code for this is in the regulator tree so it probably makes
sense to merge the binding update there too?

--08SCNPHVt+IzhmFS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjBbRgACgkQJNaLcl1U
h9DOSwf/T2EB8PZz+auYD+noS9Bw0dg85UYJrG+bYea2qYRMFLDrCUIgvLct2UPp
2ktkLkieGmEy7MFzC3f1YLXHweE2w19JO/kYkacFpW2pz0hjagVHam+Z504lWpyM
wkjicYM58xTdX8RnarCd0f4ICwhQg0690Uz33IFe6iH9/VK+YZA3OCcLbrvzaOVN
4Yah1l+s+R23fLs0EMjVWmxt+zw8XzLQ9OOoSCyYU78tSinLJw7LlYqIG25Vo0eS
9lZB2lktjR+3fpW1gndQM72do0TfOnQLja2F4j4iCDfull8fl+jBGJ+dFzzda/cR
syefzGHG8QR2JW1A3WD9f4i60ZIErg==
=bcPe
-----END PGP SIGNATURE-----

--08SCNPHVt+IzhmFS--

