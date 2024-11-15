Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9070D68BC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r1IRfz41JLETosbDDcPaOgU8fD9Vh1HzBQ3yygD4tc=; b=MiCD3CCfKgI97g51CDFgpOrSA5
	rZh6xJB1IfY+BzcMzHgaaxgQYbF3mRs2ntaOowge6T3P4QrtZC9vGVKnPa1g1+KgQpvQIAHE7DHYm
	3ZwTPyFeixjfBgFGW/xVmFbzd6MW3kkThLfER0+82aOMPfj1Zw6H8bPQ6Ys/nIHQDFc47Bn+fNtF6
	jmsrg0Gmeu4ecYCmFEkER156KhoU8XcqLOFUEveUjcBpLPAwzdCRlqGE12QvPz/WKZTiQkrbm9TwQ
	CdupAjGx8jnAc78b6+rzXL2vhyHfrdCef1UnFtqu19ISVsSwgnlVEVkNsoKUQ1l04SCuK8ABsBeGq
	CIIh3kWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxvW-000000036Ru-0jkh;
	Fri, 15 Nov 2024 15:08:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxub-000000036FT-0vvD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 15:07:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67EB4A42641;
	Fri, 15 Nov 2024 15:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E5AC4CED2;
	Fri, 15 Nov 2024 15:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731683224;
	bh=488LeDMT03GJrMxbHp32JdOvGZEH1XPQ5yO1aJUMtrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Co6tX4Ce0VaVN457Y6xZQmCTc8t+xi/xAm+t+3InloQINTJh2BpB/nwZgf3oai06a
	 f02yy9DrXsJVjdJs+lDhPqAQGlqA0DvdCa3UquyRZBmNYIAy3SXtjG6oNpabz+RAY3
	 V/IRL6sP4LBMG6pop7ujpqTnoIX23FYhsceHWpFMYQ/R1oztbtFc9NtPLsBluf/a8r
	 MlBgjtKTbNUKIynZLJKvBlKF6yxoBnD53h4SdcxrBcOwAkDm/RNzudoosoqcKiM1Zn
	 rH8XL/yQL3ORJGnUTOfNgYMjyjlcttz1dD6JWaw3MtO9NuwFvF24656s3dLKtjw/ah
	 Z4Z1EsPp+B1VA==
Date: Fri, 15 Nov 2024 15:07:01 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v5 0/3] Add support for codec of F1C100s
Message-ID: <ZzdjlbelMywpXOAI@finisterre.sirena.org.uk>
References: <20241102125712.2647325-1-csokas.bence@prolan.hu>
 <594b2929-f7ab-4d30-a97c-1b1b31258d25@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ep0istO153xYfToL"
Content-Disposition: inline
In-Reply-To: <594b2929-f7ab-4d30-a97c-1b1b31258d25@prolan.hu>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_070705_329198_9C1CE4F0 
X-CRM114-Status: GOOD (  16.28  )
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


--Ep0istO153xYfToL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 02:10:18PM +0100, Cs=F3k=E1s Bence wrote:
> So, if there's no further remarks, can this be merged? The next window is
> coming up, and there's the DT addition still waiting in the pipe.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--Ep0istO153xYfToL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmc3Y5QACgkQJNaLcl1U
h9CPLgf/ZgHaaghsRbFT07zKYB2H+48YxD21K6sLJgxlXtbMMZxTghpDMVHRI19W
mt1JU3JUgIXEIyrAT9ya5WZlvPygJWxblECU0+Qqg/MXR19qGco9nQ/roMTS1xIE
GbkbECeHM1V21BdDIQt0Od3a0fwUBgrqV8IsJfpsV2FI51+1IeMmZ8RAeBCnoE2G
EjudHbRo4hmY7+J/deS3+eZxCK9eKYsmasrrfFXejlr0JqHEan1uPyLF8oqRdf5e
ZjEi97j4fAuladvktKKzAADVuVMa0+exvloFO1HUABgUgY7T9xkWAOzy5q/rOScJ
4gDyakjE2bFbI9NDZE65L6Q5FdGctQ==
=r8ND
-----END PGP SIGNATURE-----

--Ep0istO153xYfToL--

