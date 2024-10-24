Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05900CE8E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwvrfTv5gy55jcjI6bin8pxUAiAuiFQWvOFHXr8Y7Q4=; b=oHnFbyYfeiSY9MgllqHdcab9QY
	lzz3fCrRjLlwAK+MG9GWhhD73QCebzqXkpQJ/YFjfS89j9tJvUYzNATVont/4YscZD7cHB1Id7swl
	VG9LzGkyLXR6sG6x1iTrsJr9EiFUm/vK4cpnWMkRn7IkTEtqCWKnJLa9ERFRKTGggbeiFgXibuOXx
	lZVTxg1/u2tKn7B6vHepP62hGJ7WK9sqGynNg2PbQXyOqlq/bOE/14ATQDdho5NQzQ3kF1qZlBeGP
	0cm6WFQi9EpntGgs4vBdfWF0X2Azhn2kHr/3WmfJo58a6bPhtYgUR/URByMPZ2AvDWS/NUwkggY7W
	5z0lsO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wlX-00000000Jfh-0pZ2;
	Thu, 24 Oct 2024 12:16:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wjn-00000000JWS-0R9l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE0E45C5682;
	Thu, 24 Oct 2024 12:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554E8C4CEC7;
	Thu, 24 Oct 2024 12:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729772086;
	bh=RwvrfTv5gy55jcjI6bin8pxUAiAuiFQWvOFHXr8Y7Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lj2WbXBJG8ht/k1YpD0VwMgNrwJ2KCjua6xaK8o6D5JOtrD7zh1mKBCcH2SgolDXX
	 +4eOPGye1SYhax6qrs2QStyUecKNqKV+mtE3MKeBcclXhvNWMav+gm3vsUogOaveUT
	 2pjvoh+80OOKNH0qbprOJ4byFsZ6WwWc5YwlZ5VFhFwL2oCcX2yAYk88xebmFj7Usk
	 1QfZBxZDfQBF6szmuQadR1IQv+z8cDgJD9rmDHksZYvARwE+ANyOIJdvFWZpJiSWHC
	 RhW/b8WNbRc9zkAOimh9eYE5y5Ze8P/1zW4GV1cnqQAvSMXcaiiXFFhayq98Z6OeX8
	 qOM9d5RIpflKQ==
Date: Thu, 24 Oct 2024 13:14:40 +0100
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
Subject: Re: [PATCH v3 2/7] dt-bindings: allwinner: add H616 sun4i audio
 codec binding
Message-ID: <313c922f-9967-4958-a438-11528b811baa@sirena.org.uk>
References: <20241023075917.186835-1-ryan@testtoast.com>
 <20241023075917.186835-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wE+qwdJsGOAxZKMP"
Content-Disposition: inline
In-Reply-To: <20241023075917.186835-3-ryan@testtoast.com>
X-Cookie: Real programs don't eat cache.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_051447_206959_B7302931 
X-CRM114-Status: GOOD (  10.31  )
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


--wE+qwdJsGOAxZKMP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 08:56:58PM +1300, Ryan Walklin wrote:
> The H616 has an audio codec compatible with the sun4i-a10 driver.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--wE+qwdJsGOAxZKMP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcaOi8ACgkQJNaLcl1U
h9ACCQf/Vm/4V34RBhEzAfgM1hSjkQLktpGxHbr9DlKWSpqCJMx+c+s46N3znXmQ
gVT1WSZB4W3AbU4Qa0wKDG1JKOuaa0bAKxoDAvqFbOBfrlC8R74mDrqPt2Fp3oxn
8hBkr1i+z23WsViKXF4D74+UBctx2NqwSfyj0+OOuouSW33YBCdcyVof8QyzEqWn
kDDJG6GEQFDt+TSCdAOMr+NzeGiuxUVFgpPN9Eg1NxMr5Z4XpongwEo46u/SoA/Y
2+y6+3G+0dOI7oW6ehXC5Tx4RImmtmJUBYFfLnxzC081W/cMkKEgSbcRr8ffzfXJ
OIRUuO+CKBuwnkBKIYOsaa6+7G4Zeg==
=YLIf
-----END PGP SIGNATURE-----

--wE+qwdJsGOAxZKMP--

