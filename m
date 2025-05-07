Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD074C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGW9n25NRi9hTGB2Cn9hyUz1mWoq3WjLtvjVPwyFdoQ=; b=DIT99hUx4YiT0SDAKG+DCe+tXR
	15FZMPi+qZaXorTacyxHb/Sl/YACtiFqk3bnFhkna9Z6I1N0+kd9jh5K6PlQvulJX+p+20bgag2Ln
	erXJocwQu4MwrlkAVScbCx0k0p/qVPprqu2EuGUTaYUQKjIOE2i58EdybUV7ZzZRkdUr89wsFrDa/
	1iKn1FgFV6vOwwhuKuAgXLmMyamCh7bsdm2OnSwAi0oXga98x9zzfgP7O2Sa73+r9C1oH/w2At29a
	MPh4bnKyStrWpvPlSPB1/e4qs634ICBOwGTqZ8QZkOV291xUC5cWga6drL7bMWLt5QqgpAQOlgWta
	YHlhtQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWuK-0000000EDT4-4BkL;
	Wed, 07 May 2025 05:01:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCT8V-0000000Dp0G-3fCu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 00:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E774D5C20FE;
	Wed,  7 May 2025 00:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA59C4CEE4;
	Wed,  7 May 2025 00:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746579586;
	bh=EGW9n25NRi9hTGB2Cn9hyUz1mWoq3WjLtvjVPwyFdoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ob2KlHM8YF0FfrZEdaT/OOBmyWHABRUoGqywLXLekJCLRGV0p/lYauRP9iwTOoKDd
	 UR5BBgCnkIvdD0OUpM5duC4AG2d+FimYRNWtslknvMzSjcOQzL+x6KjVwwvLD6gEFC
	 uufnySUwNkswRKGBXpiTNomcWvAy472K62BcXO2Bu4PVS/10RyVq49FCM3TuYKatPJ
	 GQvcXw5Sf253zQrS87+XzvRI3qTwBE1ZFHcUKb9lFAAV/6/X8/nIzDaYMwREaJiN4Y
	 1mKLZSKPrf/ef5l+C2BJtyISb9PwwfzoTVu+dVFZ+3Ayhf1juDo4WzDFJKYsXve41G
	 nGulHVELrMCPg==
Date: Wed, 7 May 2025 09:59:43 +0900
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	daniel.kiss@arm.com, david.spickett@arm.com, luis.machado@arm.com,
	maz@kernel.org, richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	will@kernel.org, yury.khrustalev@arm.com
Subject: Re: [PATCH 04/20] arm64/fpsimd: signal: Mandate SVE payload for
 streaming-mode state
Message-ID: <aBqwf6PlByicvv87@finisterre.sirena.org.uk>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-5-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ed3vGN0CxxGjNtsa"
Content-Disposition: inline
In-Reply-To: <20250506152523.1107431-5-mark.rutland@arm.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_175947_970457_77A3CC56 
X-CRM114-Status: GOOD (  10.20  )
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


--ed3vGN0CxxGjNtsa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 06, 2025 at 04:25:07PM +0100, Mark Rutland wrote:
> Non-streaming SVE state may be preserved without an SVE payload, in
> which case the SVE context only has a header with VL==0, and all state
> can be restored from the FPSIMD context. Streaming SVE state is always
> preserved with an SVE payload, where the SVE context header has VL!=0,
> and the SVE_SIG_FLAG_SM flag is set.

Reviewed-by: Mark Brown <broonie@kernel.org>

--ed3vGN0CxxGjNtsa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgasH8ACgkQJNaLcl1U
h9CNfwf/cgL4sUOb1FLJb1oDT+hUEPQNxpEekt+GUHSvtuBAVwWiPZE1FLV3LyoD
mVxIfKy6V/oCKF0ukfA5OBVz0v1kY+X+8G2ssncTY7kdyGxIZzYxdANu8Dbp1xs8
CWiWK5qsPZxwlavjThbt8kAHeJ2ZdyILpAZkQrP7O4qdffyOyMdhTLCzDA9Y87lr
RLJaiJJoB7VflpaUXklfDctEELcMe54eEnFjBEzDu0P2Mx45nzisaPxqAzXF2Jhx
9BpBrX085zfkbRiCfyFB3YgtW2zpBqH0ORDn6Eqy4IqqkD1GGfIXVtxLNN3n5eDT
Xt4yR2UAcWp2vWHfKxnhJnycViXavg==
=gM3v
-----END PGP SIGNATURE-----

--ed3vGN0CxxGjNtsa--

