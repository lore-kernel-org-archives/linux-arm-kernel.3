Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD80C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWMOa8RmO9jpoN2Ud/1SRKZL8yZlX2jyFLFqSrdjzG0=; b=CcNAWXwd69HWKOojPWJ9QipTjw
	Q76TdF8m5QL/An1kKwkEIJz9KMrjqW+dfrRdDYXp7VGP4B3zLAvFAzjl/tDbtHchTXR/RiYWi4r5Y
	wdQx4RVxoMeAnEkkQxAKA6o206m/CSyR18SIAq2EtQn36N7a6v+DYuvETPe1xuj00ITtn+/qI27kU
	BndrhUSbKPaQDUX6pBwgdlbWFzAkYbC22ClmCX+W4DE8vpstDirmP2rZKseETbZPvjZHs4r1SieCE
	ZZ5PhWm5WkrQiNVqWJ07/59j2Uo0pKmjjvMHMqIyaRLbIrxaOJyXWw8y5DTVYQ+UlS12yyzK/1pQK
	IAYATVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjx3X-0000000EU7M-3kRA;
	Wed, 15 Jul 2026 10:41:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjx3X-0000000EU6u-13IG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:41:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B66D341745;
	Wed, 15 Jul 2026 10:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257531F000E9;
	Wed, 15 Jul 2026 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784112094;
	bh=UWMOa8RmO9jpoN2Ud/1SRKZL8yZlX2jyFLFqSrdjzG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pb1SVBvQEnQdCnEA4d1ZJbdJtVz9dqsYwMn0rYprhqu25XojSgUHMqOvvRnCh6v71
	 8YzM5r8VwzFZ+TSozHwfJ74ny/7EbeDG4PrSR3U5hglezbjHkGp2Yg7YdGyYqQcSLN
	 U+THj5ZpLIYWQ4PO4lWn1buLFLoUsM7+jSvmUDR19PVSbLiHxanYv8Za+Dg19N2I6Z
	 nolYM0tr8gAPhT7nhn6zF0Mc4wm2xWMbMawYMoivaCDPrImpWc+kvbQfV+W+eAH5SV
	 KHxYJM3R9Kii9uJH1ION6Yi7O4EZPxAhMkz1/j/nR5cNONttYwOPiyocjg8lOGTCYp
	 G2xOzpfRMWauw==
Date: Wed, 15 Jul 2026 11:41:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"afaerber@suse.com" <afaerber@suse.com>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>
Subject: Re: Add the Realtek SoC tree to linux-next
Message-ID: <b1536553-af32-4a33-9fda-3880ac029bf4@sirena.org.uk>
References: <555485abc39a4ad1b252b4fd7c5bf706@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GhOrWfz6I3jQbq3f"
Content-Disposition: inline
In-Reply-To: <555485abc39a4ad1b252b4fd7c5bf706@realtek.com>
X-Cookie: "Speed is subsittute fo accurancy."
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


--GhOrWfz6I3jQbq3f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 06:25:14AM +0000, Yu-Chun Lin [=E6=9E=97=E7=A5=90=
=E5=90=9B] wrote:

> Could you please add the following to linux-next?

> - Git repository URL: https://git.kernel.org/pub/scm/linux/kernel/git/yu_=
chun/linux.git
> - Branch: for-next & fixes

fixes was already there, I've added for-next from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--GhOrWfz6I3jQbq3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXY9kACgkQJNaLcl1U
h9ChMAf+LZ1wlVvoNZcbfgsS8CU85tTESQV3LyeKXRqPajv/BazYrgnAxfZu8tvb
Y0ykGu1hhAufpN25FfU5Us8ZOj1hYQM/L8ueeV+8wDSn89lalQ9vjwww8BrvPL4V
/PJ1NpNr6BV1DZPhUvacwJdDas+68mmetTV2Q6LqVxrWcJbXj+VACYWDe5C+rLgs
CjGLfrcx9bC9rnjLyOps5Eg/C5+8M0sojyNXhMzVr2wyDwr2KZYed5XLhzGL1BfG
kb/VLJRcBeXTPcgsufetODA+Ggw8c5//pY5UtFGxGLB6V/AIS7Ys0AIIopk1bSBN
i6F/ckkAbI76e18KHom21B/8aIkmRw==
=j/6K
-----END PGP SIGNATURE-----

--GhOrWfz6I3jQbq3f--

