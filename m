Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14363D462CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6boPVQNKRLctRYv+g6GO4ox715cEjwUVoNwnAJB3SQ=; b=vRE4XxmLZx+SOy/Yr6SJrFDZLq
	IORaw9g+jyRluIh3tNyk6XHD+ySqeixox9r8maqYk49gF+G5IpP+m54mlLetSLQd5Ai7sUU3amBme
	iUQ4k+chQWXstPVPKYcVZLAkASRAbtty59gsWMf3/IB/9L7SUCfWrPKRH27zwV+O5bIwrs0x/AEBC
	KWBezY8k8BpfthlUWDcP1DyoSnlvXPCZBs+uYUdrJZahvqrgHjH5Or2hSLhdTzk9S1kmfOzfFmF4s
	r8C5nSbXJ1JIzukWHxfc6uSdwSXmgF5ENSxht9SKoiOwQzmwYnb/mXDJEaQz6dNlQc/ZjrILF2IBV
	w+AgPjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFgm-00000007N92-2NwS;
	Wed, 13 Nov 2024 15:53:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFev-00000007Mkz-0UzY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 15:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6B695C5787;
	Wed, 13 Nov 2024 15:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED27C4CEC3;
	Wed, 13 Nov 2024 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731513115;
	bh=f6boPVQNKRLctRYv+g6GO4ox715cEjwUVoNwnAJB3SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3TnfcT7FdxqejKD+JvSrRwythvWJ67tRIIqXYX/p+LS6hBmH8rJ8HAipRaz3p0F4
	 A8NyYXSf4Wa2mNl1Uz3G9B9RyafXd/i6+1KS8y8MxeijrJ6tbOr9dsA/56IaWCVwDV
	 nj3vRULR1d2y/hHa7y6XYqmBdlO5CK61NNrnI/ZrfYAfpRPKTWLY0hktYxRVEWQ3jL
	 iZ8kPnDVljwXCAzf77dJgcBoaYZ96uK+FLCUK4WjUsRLoH9bZO5n7BgucppKU+llKK
	 OhvZR+tQ3q3+qk+xRFSgrUbWt9gnt8OAKhv3jslc1hS0C0wEaTgdMqCaFegVzq794p
	 DZAiMq/Me8/fg==
Date: Wed, 13 Nov 2024 15:51:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: will@kernel.org, tarang.raval@siliconsignals.io,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Refactor conditional logic
Message-ID: <ZzTLGC5bBlI73-1S@finisterre.sirena.org.uk>
References: <20241113051852.4806-1-hardevsinh.palaniya@siliconsignals.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JU7scIxsFVzaC9uZ"
Content-Disposition: inline
In-Reply-To: <20241113051852.4806-1-hardevsinh.palaniya@siliconsignals.io>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_075157_226804_AFAFCDA9 
X-CRM114-Status: GOOD (  11.44  )
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


--JU7scIxsFVzaC9uZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 13, 2024 at 10:48:18AM +0530, Hardevsinh Palaniya wrote:
> Unnecessarily checks ftr_ovr == tmp in an extra else if, which is not
> needed because that condition would already be true by default if the
> previous conditions are not satisfied.

Specifically the first one, if you revise it'd be good to be specific
about the logic here.

> Additionally, all branches set the variable str, making the subsequent
> "if (str)" check redundant

Reviewed-by: Mark Brown <broonie@kernel.org>

--JU7scIxsFVzaC9uZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmc0yxcACgkQJNaLcl1U
h9AQHgf9GDmwjoGryRvf8WhPPBIs4KOjwxushi0PvM0+lp9VqbVlnoPMNAPznE+z
DRJ9J5BusELvR0hKCGwVg+VMCqG/9Ng9wau6LHQyOVI0Ivoxl8iLPek0BkiH3MLl
6j2QBmw47Ok3KTDwW1ZwpsHaC3q1WnD+WsreeBu4qrbSBlJl9vq5KfdL9+GrqX/U
T76iQwGG67Fi0NbPjhwRXxDITcGSvhLe9O1q4cqgSDDODh9pxQi78HyPc5rzlC87
9JoJ2nKIShnj6azpHq9qbXKXQujCH/RyDVlZUjEBTJA7IYLJu/Bj2tMSOZtLgkFK
PtbjDGw7+GonbdtRjlzltdUvQKB0yw==
=MyOo
-----END PGP SIGNATURE-----

--JU7scIxsFVzaC9uZ--

