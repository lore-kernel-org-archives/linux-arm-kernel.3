Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0E3C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ut+V3KseSh4eYJkusl95jQJnVPMpgE/trF8B0ZPWHAY=; b=WaFBzdqYU7FdOCtMPcRtsM+zcy
	R1W0X9mF5pdWTFxk8MdtJ943bAd1HxTDiRvLqxGJEF6rHwYq+4GAT523WbpKYEw6XCF7JjqzK+uw9
	LyWMmA8NDaf06DET2uuz3CYWOnTmqPbF6gPgU2yI2fCnXCoDi6NE6sil2Pw6AZSN6+RX8tlygbBw6
	lM6dtyWhad73MrA1rxKOufeVffYpJA2x8sQmAZFBRzMZK4ylOnb87xl8r66YHR38GlnTPqGc3MSIO
	eecj//bbJYH7L7NojPqXwX02l8CT+Z1JpjPqwDpdKO/n4pFM/6ksIUX/qJdTLrKbDQLh9d77YSSpn
	ahotlPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu60V-0000000Frdy-3KJZ;
	Wed, 12 Aug 2026 10:16:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu60U-0000000Frdh-2i60
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:16:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAF1A6187C;
	Wed, 12 Aug 2026 10:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A971F00A3A;
	Wed, 12 Aug 2026 10:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786529781;
	bh=ut+V3KseSh4eYJkusl95jQJnVPMpgE/trF8B0ZPWHAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CuCOjGE+Y2AG5z0+og+zew/WtI2kYltgC1GUl3fgDc3L5B/Recish3bW/1pERzvYY
	 trzTUgwPngJ0A+5wTsHbHnXNjpllRAU+nvEPsfI+8AayglaXiM+8qTy579FZdRPUgg
	 EteBAPs4rnW9z+nzM8JtFh2E+30hryQ8R7bPEj12hatUp+U4D7ceNIfPS1hW3UEsKo
	 hIk2eWXcCjEaXZFnZqdgE6UNzE8WvjWBblpe/6h4dvfDKytDwuNxeiDQvMsxlEsPJO
	 I6BO6tKWDFlWbDnT7RiKG0YaM0ekh8L9lARnVu5oK6g0rV/IBxEfWVJHvSgbS1HrYX
	 8an52fF116axA==
Date: Wed, 12 Aug 2026 11:16:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <c22c308d-ce38-4327-a9d9-19ea995584e5@sirena.org.uk>
References: <20260811185013.26960-1-rosenp@gmail.com>
 <647a44e4-babe-4858-84de-ad26b6711ba2@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/+shNZ2aS8W/JL81"
Content-Disposition: inline
In-Reply-To: <647a44e4-babe-4858-84de-ad26b6711ba2@amd.com>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH
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


--/+shNZ2aS8W/JL81
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 07:58:23AM +0200, Michal Simek wrote:
>=20
>=20
> On 8/11/26 20:50, Rosen Penev wrote:
> > Use devm_clk_get_enabled() to let the clock be enabled automatically
> > and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> > clk_disable_unprepare() calls in probe and remove. As a result, move the
> > clk struct member into probe, which is the only place it's used.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--/+shNZ2aS8W/JL81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8R/AACgkQJNaLcl1U
h9B/6Qf9HATYH1keNl7jmNP54GvocXgMJ8FoZoYGeP5z5EYg19v1hrFQ9rXa/nFm
TOqwYItNcjlth2SskjOyN40TnNPiDVlk+HAyjqValGhriqANU86f3u1Z51237FCu
35W0hxDjE7MykqMKwS941dBD+Q3FOkGv0oE7gP5ktyPSYAUcys4zplr+e7STKsC+
U5kUbGSKHmLFALlNkbFLaYhVC3gJWMqNlEQ/Lc036i7lJWp6wlRgtIqd48aWac6+
My4ZqhEn3xhm23XZOMfXDyRvyNHXaamPl2Zf289LeQNcuJQL4QjhM3kc32+8SoQ1
0FaaqAX+V/Ew4uWrAUSo/U9W6jezlw==
=0u+6
-----END PGP SIGNATURE-----

--/+shNZ2aS8W/JL81--

