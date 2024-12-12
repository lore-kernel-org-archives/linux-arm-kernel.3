Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6F5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yagcdRdfLM6WTY68krGF1THnfyrMXzSw1PM7dXa8c2c=; b=4KiJ54R9x4PC4jJV6LPKvCbdgM
	9dCoHNBW6nGT9ff9+8T1kb9VZ2Z1r++MwIckdQRYscyq3OULp0hi6a87xG4efmCdLnCAYaQsk6yIR
	hcJX5m37DFE6u4Jwp8udiLzTBPVZGOaxQIWfstKoj/Aj6L+kesIgY4xE9MFI895cE/UEfoXH8TVlp
	ZFSyetKEtSkBGkCS7XXZLime86Q6/iJsYwTMlOFAvoFRBm1gMmggPKz/L8oebu6X33gEYogqb1ovA
	DEDvUdw6vYAUL2R+D3+lA7CXoXy1UuRxghpweBy22t/LrAobO/UF7CUkmD45OTntSM0G4ENxay5JD
	C4YoYXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn46-00000001CJK-3eTN;
	Thu, 12 Dec 2024 17:33:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmLw-000000012b9-2eJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFC875C67E3;
	Thu, 12 Dec 2024 16:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9278BC4CECE;
	Thu, 12 Dec 2024 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734022070;
	bh=yagcdRdfLM6WTY68krGF1THnfyrMXzSw1PM7dXa8c2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIrSANyt/8FAWGBlCqjwox0lusGsYv8msDnslZdshldjiacA2IrBhz7RE8R9SL2lg
	 cT03QORfe4Esl1gVz2pG1KKEKVyCnLd/tfx0MNAnhvI0EXhVvvzxokhDLycGLdRvLt
	 LutdYqpdozii/auSMuRZB9VY/e/Fzc68blrHlbrPF6EOBrvG3FWn8uyv28BYQKz9Ea
	 OF9wgd5TiVi6N5wC2XMg/mHxG1GTRrzRMu5W21LEsHikWhX86zClrclFzHRc6UVfvY
	 wkQSJ5sOmtvMLFdB9okKPyW8mcSkBmsc/4jlXasvjiF3/iQiKgB3N2clYgu/AoV12l
	 BVGslo+zO7f9A==
Date: Thu, 12 Dec 2024 16:47:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	Dave.Martin@arm.com, will@kernel.org
Subject: Re: [PATCH v2] arm64: signal: Ensure signal delivery failure is
 recoverable
Message-ID: <5db7f7a0-1d3c-4bbd-ad2b-124bf54f49ef@sirena.org.uk>
References: <20241210160940.2031997-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WMxMNkEqfD4kSm9Y"
Content-Disposition: inline
In-Reply-To: <20241210160940.2031997-1-kevin.brodsky@arm.com>
X-Cookie: All is fear in love and war.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_084752_709911_7908784F 
X-CRM114-Status: UNSURE (   8.61  )
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


--WMxMNkEqfD4kSm9Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 04:09:40PM +0000, Kevin Brodsky wrote:

> While at it, also take care of copy_siginfo_to_user(): since it may
> fail, we shouldn't be calling it after setup_return() either. Call
> it before setup_return() instead, and move the setting of X1/X2
> inside setup_return() where it belongs (after the "point of no
> failure").

> Fixes: eaf62ce1563b ("arm64/signal: Set up and restore the GCS context for signal handlers")

Presumably we also need a Fixes for whatever introduced the above copy.
Otherwise

Reviewed-by: Mark Brown <broonie@kernel.org>

--WMxMNkEqfD4kSm9Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdbE7EACgkQJNaLcl1U
h9Dx2wf8DhfwIBaHWwmjMKOWFAFx8k6WzmTXjnzXa7c/p9diV256p/fjK+0s0EiJ
ZBB1WCED0JuYERlJXHa8hekoZPRIv8aiRs1Xwn/hvDPrUsQLpzgKl3161WFTiAz7
3PRVamhUoYFdRs6yGxcxRIHeqRZj4Dk6CIp4FHSTWxI0G+EsXGqh7inQq0jtUXSE
TZzPJiJ1v8hSukUUhiidips2lgRxXOXz422m24+suKH8Ulf3q29tlh7baKrqXqyr
VBWWGaPOBikKSBbGbsZFk4EvB3mMnwO5nHtduVgmOkyAJapikkVGEFHfupDgC4Ac
xERk++H3Zb8IIP9rxlQbr0luSQB2Xg==
=RKm8
-----END PGP SIGNATURE-----

--WMxMNkEqfD4kSm9Y--

