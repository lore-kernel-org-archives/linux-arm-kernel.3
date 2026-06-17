Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098C9CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcHn+OqjLeBAX8IEau6ZDZhceXfurepXWjvJLi5A47U=; b=kWNz/4y8Dpqo+jDlEZ/DqvwMJj
	igWCTNyC3ypMTkIroyKzDnsWr4IJZxGjt30zHUW/6uurJ1G4pLI0WcJCdpvN/FbJIzb/O4lnJ9pGv
	DNlQIeqWIVFgocaopZ9nNQ2DPC292fZz7Tcp9If/XjDlAakZFli1wmfA6QwxFqc90/Td5kefhgvHV
	nWilzs5FfQlipnjKhUdGRLy7J0HuEkmsxN9IH8pJ4Amfq+Qo2yqCO/PZW9sgph+9SDzXbje62mmD1
	DCnGalew8fwimsjKUzQfh/c4fzLj1BKuvmTn9DqUhHJ6ThRbw62ki9TvOMfM30usV64VPRUwGC/2K
	BemmJqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqDa-0000000HPLK-1LCd;
	Wed, 17 Jun 2026 13:22:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqDY-0000000HPLB-48Vv;
	Wed, 17 Jun 2026 13:22:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BB106001D;
	Wed, 17 Jun 2026 13:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86941F00A3A;
	Wed, 17 Jun 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781702527;
	bh=XcHn+OqjLeBAX8IEau6ZDZhceXfurepXWjvJLi5A47U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LS08RM8pAhzITsYqZkoulcLPChoDgGjX48NVOyVTZKbOM+/5nELQYBIkhimKfCHE6
	 AARTUDjcNzaXKYdvu3tqG4M+e4r9wfYbi+ROyqrME6zJzyOUHEGS9sF4WC2jAc9+v3
	 SeXNHMn2zwmBMx5ZqShOmh8GH3bu30pS1dMdIDt+ftvpkFd8El4Ucf0beRuQqUDb9e
	 quA+69q2SponemBzUDeuz8NV+HVLdusTpqO6E/YCzy24lSKv3kfrfdce+JKEBeQQSM
	 7UAiamNEuCbGeLN3ErZIWXCUv4LuSDJ4yYU49tWyBVLLoujHHVUen0uX/eoendfaOm
	 tgXpR9ggwZxyw==
Date: Wed, 17 Jun 2026 14:22:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] Revert "ASoC: rockchip: rockchip_sai: Use guard() for
 spin locks"
Message-ID: <f9babde8-4012-4fc4-a553-101fa94ad50b@sirena.org.uk>
References: <20260617-sai-revert-v1-1-e46adda2213b@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ESdZ8J34ZAzYqCiE"
Content-Disposition: inline
In-Reply-To: <20260617-sai-revert-v1-1-e46adda2213b@collabora.com>
X-Cookie: Absence makes the heart go wander.
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


--ESdZ8J34ZAzYqCiE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2026 at 01:46:04PM +0200, Nicolas Frattaroli wrote:
> This reverts commit f7fe9f7073602958d6b63cc58a144094533377fa.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--ESdZ8J34ZAzYqCiE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoyn3oACgkQJNaLcl1U
h9CBjAgAhKORSNAME5t9lOsbE4Y5E6rTqR7dHYVslJY3f4/5X3t8jzzbRa16RPo3
CL0S9U+e3BUYT1LJ2YSoVDzwfsUmGyCE3QAU2pMqhitpJkcs8OxZOa/v4e/I88xM
8YxLphLW1o/W3Xnk5cPFOceqkB7YBfq+OzzauJNjbZJkv2k5n98/no72MN1tLBh0
ngDse4ZfUvICI9EzWQFyZ24EW2lVT6kzDIunp7iDZJBoa4IDtWhFAUG+drZLBYZ7
LdRsdbbEeRqY/CrDSxAU1Xg0HZSa3nQKQ8IR7PRyKOE7qepPRscZ2BNncrInSdHX
2a08NtpGTUfT+kMtxhQkoGRvQoOotQ==
=RJhn
-----END PGP SIGNATURE-----

--ESdZ8J34ZAzYqCiE--

