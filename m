Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8BAD12D51
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 15:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFGeqQSALv1HbFC+QUJ7pIa07ju7rXBNNdJ8upsoMrI=; b=4Mdqvoh2gfhg/74VSeF630O3jn
	RmnRIdu2I4Fda2uTfyfs+6xJLH2fL+I3jp4Kuh6VGSjAu2yG2HltLEa4jMY/wc2xTLgKlwAu9Xq2i
	lL5ry9rx6ZQLfJb03Pk3NvAKtBWaop5vkq5E6+1lfJ9bEFsWGn56tFESHhmHk2ixAMO1kOnpK4CpP
	M84g++4+Wd4GWwdJdPQOQloHscr0tgtHvizRm3iLCY7owLLWCsBv3rrXXWuCdlp3LHhN8OD1my5tZ
	DnDtfJBdixoQA77dFZwRxRRgqEr/h2oy+43IiEtBtcUL0BbAsO5iqY7chqgM8Sw3KkJJ2KOx/zCwd
	s0x91Xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAW2a-00000000Pdq-3wyA;
	Mon, 11 Nov 2024 15:09:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAW0n-00000000PGM-12MC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 15:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 147825C5AE0;
	Mon, 11 Nov 2024 15:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F9DC4CECF;
	Mon, 11 Nov 2024 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731337648;
	bh=EeQ1W77WnlhLgrZ8umVogm1aMhCQjYm/zHBcOXKxA80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVRaDlbhsVKjtVfl34ePsC+PPF4r9JoQjFH47RcRNgvxU2tHudiagyjXObS9mXos0
	 O1ADP0P49hJZ3yw36ciNjrppXqRRiD6e5VpvVtr0rdi4QfECDA0pRSHuEhCe2HhnA7
	 uvcWOANKk2xHmCb6QPTnH7CYE/NdieIU2uodIM4hRSXNW+u+eqZHopVs8CYyn1rHBZ
	 3Ulgu8KKs/Qsvbc6lVPQQIGph9u4gMs/VVVedNjZQ4Mwja9DiRVVeymeOeHyMkSwR5
	 JGvPGMY1rT3vxvmif1k7PCMn6aVwilc2sBwVgv8B8IH1xQtEj2UwrlsVYXZa1mI252
	 7uRfnWhXVxcog==
Date: Mon, 11 Nov 2024 15:07:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: will@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Refactor conditional logic
Message-ID: <ZzIdrLFldf_L3X_V@finisterre.sirena.org.uk>
References: <20241111142204.67751-1-hardevsinh.palaniya@siliconsignals.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jLaKpQKhPiD7qWCe"
Content-Disposition: inline
In-Reply-To: <20241111142204.67751-1-hardevsinh.palaniya@siliconsignals.io>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070729_355294_D174225C 
X-CRM114-Status: GOOD (  16.15  )
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


--jLaKpQKhPiD7qWCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 11, 2024 at 07:51:45PM +0530, Hardevsinh Palaniya wrote:
> Unnecessarily checks ftr_ovr == tmp in an extra else if, which is not
> needed because that condition would already be true by default if the
> previous conditions are not satisfied.

> @@ -989,7 +989,7 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>  				/* Override was valid */
>  				ftr_new = tmp;
>  				str = "forced";
> -			} else if (ftr_ovr == tmp) {
> +			} else {
>  				/* Override was the safe value */
>  				str = "already set";
>  			}

Your changelog wasn't very clear on this but the tests in this if/else
tree are

			if (ftr_ovr != tmp) {
			} else if (ftr_new != tmp) {
			} else if (ftr_ovr == tmp) {
			}

so your analysis is accurate, the first and last tests are the inverse
of each other so onr must be true.  This should be clear from your
commit log.  Also all of those branches set "str" and we then
immediately test

			if (str)

before logging a diagnostic.  If we're looking to reduce unneeded tests
then either that one is redundant too or there's another bug in the
logic (I think from a quick scan just the former).

--jLaKpQKhPiD7qWCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcyHawACgkQJNaLcl1U
h9AIBwf/S4sIzyv0MYLeiGMOs74lTFYGTLaaUiWL+raT0oiKmEr6z1uHARM3BURo
CcYib2NgF0ggHoxTAYp9T4C2IslG7PRWkZQlqfd2rEpSXzp4NTqhA1FCDVDGw+/j
NFkg113XDJupC+/+ZVNVRzeP6zS5FtBN3V0NxYtJRQb5ibD31UOJtUS8Lfh+jl/b
JL42EpVAToZFhhjgbJ7odYRZflKg0fT1SwWwIb+fOhg9N3Aw+yPdVHm5v4wBAXq6
G/PLBGoi/Khw2CV1b2pHDHmTqzIY7EecoO0LMwdq1IlxrxuIymDHcGUVK64ovC/h
5YWVzNz7gaq29oZAoneZ3Wpb283iFg==
=oJTM
-----END PGP SIGNATURE-----

--jLaKpQKhPiD7qWCe--

