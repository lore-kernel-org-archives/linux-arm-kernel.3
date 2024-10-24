Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90702CE8E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ER/K+ouoL03fZs2JGJmCg00En2SpIQKq37ZYN77bpp8=; b=WfvEa3HqSgM8Vs1yrm9TDz+y61
	2FzzN12hG2gpA63IgQSgogmTX/arH27Q4BjOJ1y83Bjoo0IhTnqH024UMNz6Pg4BFBk2ZmVSZtbSl
	wdz0ZqhG7WKzjkbJykm0YJtE67ulETUzaSzlJinXCYUXGqiOLZ2PozK685N5+XCByuqtqL8dK2Ao8
	cnbgEcRySMN7wv/eHs+5+R/4xcKqgwePoN918pfUArHneou5DZBgrFTaCrG4UXzRVOBjEm46Z/Aal
	93MPRlUVXuP8+fcQmdBB0qf4C3ZFEOZbtxuYDp8PA9hYgfOAuGGklcywp9VmnAIB4OX8Ku9aAlok+
	AXPeEe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wn3-00000000Js6-1HZa;
	Thu, 24 Oct 2024 12:18:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wkm-00000000Jcx-3RfR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:15:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 818FF5C5AAC;
	Thu, 24 Oct 2024 12:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DF1C4CEC7;
	Thu, 24 Oct 2024 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729772147;
	bh=RfdjdiQYotlIUhZ8rHFChi1FV177D7ZDIqtYjtsWyw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGI5GtDdhYHB3Ie0tMKjkC4qM1M44gkbtu2iUam3ftfeLWXQIsYAlAyEbfhezwBGF
	 oSwEqq/kgAJjMioRW7ExqT0BwR7Gy3adP82hdl/AnXDyq9yY1sg2DEVJeLdx//O1Ja
	 KNYFxsJsP2KYEOloEXiDXvludUaXRLMoPwSDn4gA20cNJNL8e6QIlwDvT0yEfouvIQ
	 v0LDvwQdT0GXkus6JbiJAj/VOpu2LgK/06iPsl9gcEDiQpDOVep8omBKNmqfVHWc5O
	 w8xrkfr1wg0VTJQOLomnFfQCEpCRmrKQF78OoBErm19ekPUrADWpGOHon/AP0YBQjm
	 kO9RK3898aY3w==
Date: Thu, 24 Oct 2024 13:15:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macroalpha82@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 0/7] ASoC: add Allwinner H616 audio codec support
Message-ID: <8b902b84-6199-4149-ae40-725fdbc33a5b@sirena.org.uk>
References: <20241023075917.186835-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/yr4JFcgoKNigDoS"
Content-Disposition: inline
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
X-Cookie: Real programs don't eat cache.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_051548_927879_9335FF6E 
X-CRM114-Status: GOOD (  11.36  )
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


--/yr4JFcgoKNigDoS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 08:56:56PM +1300, Ryan Walklin wrote:

> V3 of this patch adding support for the Allwinner H616 (and variant)'s audio codec. Some clarification of comments, particularly regarding the clock driver changes, and a small fix for the device tree binding (apologies I forgot to re-run dt_binding_check on V2). Review comments otherwise addressed and reviews noted.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--/yr4JFcgoKNigDoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcaOm0ACgkQJNaLcl1U
h9CjYAf+NQxORVWrFlO5dvxx0/C3SPj6ZxsrXWYL8XAnrgib9VRazo1qHMG58PP4
rqogcBGonb3iWkcRL1Nlnlme2Acw6sSYJDW3bnHtMbDT46qs+AjZlem5hOrts1RU
lLx3mRCwgYDYOaBKCKB/Rmis8Uxc3jNyC9jlz+dd9wgDSDEkdBPafRi/29hlnAYN
MnqOYuSIovdCbLSFtaTlY/O+aLeU0rA1vWkIrXiTU++hN2Z1SMtMCXSfXR20Ihem
noJVhgWBwai4QZ3tEjd+0cFHrO+OHfsvq7yw/etcOGog/1CRFQUvWeVGJ47JKTOe
DrBkGHNVC0VSG5p5PHxuzl6T565c6Q==
=ZTjS
-----END PGP SIGNATURE-----

--/yr4JFcgoKNigDoS--

