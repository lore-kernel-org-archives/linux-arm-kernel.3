Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8C3C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnM5hs9FlU5v7SuFbE9pl67y2MZ9opEc0+D8ijJ/D68=; b=Yqhe/6UrTnMw+3NQKGWnS0cOFp
	WyQu97MMIp1tmepWQ12urWHZYxPF5K7PHopTa5ONOD/q5pYjQlSS/JjJnfV5JPbX8tG27u22MCjwV
	hsCLSzTi/akR4pXUs4a5ol5rAzLzcMW9WJDPXw2QURcUbQBA6M3WkoiYSh2mlZ9G+a6s6mMkYXxM2
	Is01VWZObHA8C0QgHTrXoJC5p0hOxFr/2WnqWbqjnbqJ0Dp61WOwjSMmdCbRvpB7IT2qXdLmHTU8K
	KkAaI9UWAp4sb5jW5FrFdMVlVOIfzha+r/q6s9HLOPpRsNUyCs33UKQ0qy2GVUThdp7DKnG1SDojO
	aCsMZ2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBNS-0000000GXxp-2PYw;
	Wed, 12 Aug 2026 16:00:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuBNR-0000000GXxZ-2rPA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:00:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17DB960A7D;
	Wed, 12 Aug 2026 16:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60A51F000E9;
	Wed, 12 Aug 2026 16:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550424;
	bh=AnM5hs9FlU5v7SuFbE9pl67y2MZ9opEc0+D8ijJ/D68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kZtE0YPpkIcO4l0q2BQHb9PWBaO+v5moGJ+S9Ng0nvSGpHVSKqoP0NUZM7Q7U0vWW
	 m2lf5i1ApZ78MfWpgYul+JE+rANKtPaG2eSISSfSKu3+BllkVY0K6AufaAUN2+iWsc
	 K6wB52JAtWymZCIPsI8mVUAsy7cAkMCbmJKH4023f/XuWY4uxdhi2eI2vsKoJQTdC8
	 tToj41xk3k2jDL2f5F6Z5kS8vrnWg9Oczddxo0F8qOXtzwqlSD4z6FS6yeWcKDm29e
	 dNWKajT9PThs6HUiNpQ0bPAYbtx/UHVZNCkcZASivi/tqYvi5a5p9nHl7xiOYvc9sR
	 bAvBohxO3Vnyw==
Date: Wed, 12 Aug 2026 17:00:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <d56927e9-6679-460a-a452-161614fec0bf@sirena.org.uk>
References: <20260811185013.26960-1-rosenp@gmail.com>
 <647a44e4-babe-4858-84de-ad26b6711ba2@amd.com>
 <c22c308d-ce38-4327-a9d9-19ea995584e5@sirena.org.uk>
 <8ef668c5-e66b-4750-9fb9-54d8025a9c90@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3VE6C5Dw+QpIeR15"
Content-Disposition: inline
In-Reply-To: <8ef668c5-e66b-4750-9fb9-54d8025a9c90@amd.com>
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


--3VE6C5Dw+QpIeR15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 12, 2026 at 01:22:33PM +0200, Michal Simek wrote:
> On 8/12/26 12:16, Mark Brown wrote:

> > Please delete unneeded context from mails when replying.  Doing this
> > makes it much easier to find your reply in the message, helping ensure
> > it won't be missed by people scrolling through the irrelevant quoted
> > material.

> Do you mean patch content in this case?

Yes, we don't need the entire patch (especially not with the only
comment being added at the very end of the mail).

--3VE6C5Dw+QpIeR15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8mJMACgkQJNaLcl1U
h9BKlgf/Sx8cq+KhhJUMDgpwEmcOgSSqbMMGpyMyeQGAJvINHGZnkNxeJuoKCvQp
IC+g/vcbsAlD25/y4bPSL/e35PODdVE7ZvwsQgxZNojLNpOdyYKZVRrL1ugwB0pb
g9qGb67+u/T2CbufqheV4hVz+07z3ueKyH6MaR8mq4Hl0P2St1xBQVQvuhCrKIGa
jplhxYyiMmL42IYU50CZsXjRPJDWZcOieV4o40XWFnTaVMVLwFGoR5uFFRUpjAbJ
OIzF70tpA0gyfnfR3hSCCQHhRVCsXPxp9JWu6N5k9jUfHaNvUh+fjUFn89SARi2C
+rMEk14Afl60Swcmv2O0/04V8LlJ/Q==
=0E6j
-----END PGP SIGNATURE-----

--3VE6C5Dw+QpIeR15--

