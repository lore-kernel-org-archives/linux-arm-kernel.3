Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC86C71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doqV80or5FFXZrFJ4XVxJqCcisBBjET6FQ2n9ahub0A=; b=1kUPI/vai0rnrt4emiHCvhyYN7
	CJyfs2mZ2TH6KheNQW6WctQET8kRa2ohJFcRHseMFn1GAJJEblYd9BTcMLy/0N9CM1tU286D6ghid
	j25iJ1eXb97CZBCet066tX+G4/g8M8H1Jz3ooorm8EyfruZvFTLM1nej1ZTg16X/ubyAVxa6lEnxh
	uxdYwmAY+IFoDPXuNAlPTYjp+eH/uHOUh6X50L+jP7PRc7pxjXZwWTvfnZiBgyy0zIfhRIpisWxhv
	pXgO/TpGm+cfJRUPKWspGUwTDfxSTSZAYBvsBz251STDGvEg4YYbH70n38uNuP+Eu4A6UUqyh+UWG
	wwvZsSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRXT-0000000B2kU-1NLw;
	Wed, 11 Jun 2025 19:55:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNFd-0000000AMvQ-3Q2U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:20:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44FDF44D91;
	Wed, 11 Jun 2025 15:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AAAC4CEEA;
	Wed, 11 Jun 2025 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749655229;
	bh=doqV80or5FFXZrFJ4XVxJqCcisBBjET6FQ2n9ahub0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBfaOG2dCW9MelJdcsJ7M7PJxO9mfCeNhStKdABckr06yt5avy4OZ9JbI9B+2JOFq
	 oZKZx/6SQCU4g8bgG10/PyAOsU8wnCnvL6gu88omNVcfvFl/p0R5jQP5Ygfl2b3GLn
	 vxhV0CI60qhadkL3doN/eC3pOjMuLJ34qJuA7wTVxVBP42KrwhccjUffIa2NzUbl5F
	 eVDa3XsBm++zsKzJOen29QAwvzsiVW4McAbE/T6q/FjdEd7zKEug+aKb7f+J41Lesr
	 +sPFvEOXwHchTcJ5IGHazcEt3P/dNDGtrpn7uPfe0gQggTdnUypApryeEu45PFztys
	 k1QutgF3XktBA==
Date: Wed, 11 Jun 2025 16:20:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 5/9] kselftest/arm64/mte: check MTE_FAR feature is
 supported
Message-ID: <319315bf-48f3-4482-99f0-e8cb03ce049b@sirena.org.uk>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LLcsBgYhYhSy6VHW"
Content-Disposition: inline
In-Reply-To: <20250611135818.31070-6-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_082029_879242_5F7C5542 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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


--LLcsBgYhYhSy6VHW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 02:58:14PM +0100, Yeoreum Yun wrote:
> To run the MTE_FAR test when cpu supports MTE_FAR feature,
> check the MTE_FAR feature is supported in mte test.

Reviewed-by: Mark Brown <broonie@kernel.org>

--LLcsBgYhYhSy6VHW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJnrYACgkQJNaLcl1U
h9DTogf/XEk8iMJBi79waQjbN4WVhdwRu16ZFgYl5bfzdpd2P2Wax05Rwfiy+Heb
jCCSLf3+Z2KtUWm20Qavvb86/tnscSg72xIrc8piejxltT5yJeJwJzCv8tcRyJdf
+s0LMSfwoNVePKIQkldVgUQ2Dxukz+0xVE/tN/62dgxRU+/fCKDuiU/K3zZphNfo
Da8ps0g1pqHwm7ee45Q2AW62x83TYU2+Wfj0keaAj7rJ+EgAezJ8WybmtSQpA2XL
SUhttLWjlqG0eHt4ljxpz+8raoXbClNu48CwJEVYCHQS1hUlBGOseUOOE6KNYNxN
Z1bNUQVdjn7hzOSL1zCJ/iLOtOrDmQ==
=jV/l
-----END PGP SIGNATURE-----

--LLcsBgYhYhSy6VHW--

