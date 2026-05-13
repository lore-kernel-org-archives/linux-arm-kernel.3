Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1B8CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 01:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nnvr1QfUiI/1L0M+F2dbf5MSadPBsbA8UnndgUxb2TM=; b=Pslnb+6Q15ZnJT00DEaZwaBzEV
	9IKsmAmilyO1NijiNNdY9813umktLLdgxeVcmRaDSdrQ+5F4ohdu7rkdTod6GEePd0SE0+c5QWKGH
	d+10bPVOgVPz/IyUjXw6fF3A27X//a/PUbR3TkPkH6RTm2nDrISq9/ehmF0bHac7mgLlgllzJg/19
	K+vU8bOxTghHmdQytbceORgVX4UGpZLPC+tKsOuurOzQuOblityKWEL8xbwVamH2H8b5PlOmJrc6V
	EVm8IjW+c/s7nLVGAFl2E/jTvOpPWWuluDBYOW4bzgZ7T5nli7iB5R2+mFbEfyS1M6Jx+wFIeYm4G
	8e0jyVPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMyFY-00000000qZn-3mqi;
	Wed, 13 May 2026 01:19:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMyFX-00000000qZg-2eEO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 01:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4186160120;
	Wed, 13 May 2026 01:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94EEC2BCB0;
	Wed, 13 May 2026 01:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778635137;
	bh=E+JWPPBc7bsB6Ffqs4uC6QTuO+REotZfurer97o3dSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIMNb9p61FcVEvKXabsO3328w87b5n+VSdC8+EpNl42uGChJiYiVjLMBy72O/ttOC
	 qa5/g30pGgCf778Gt7VAkyJzISS00BxZ1doB11r9Scp/jHpd14kqbM5zQa/N1RLsod
	 XB55ZdytbWuinbQ6bng/bZgyaoWN/T5XK2PyPXTR/+1PCBznlfxGJBA5mCLefKzpKR
	 bqsWCgJAzTVvKQqIQphx80dJRfavVSNqeypTvZEAC8m8mR/Py5l3IbUEzMHrgpczGq
	 MKm+lnrAW2C/kX2rzAuVMGMQjoCnmHSc/yKF9hEH6dvsoXovkb0V6KDU2AguUjvO64
	 yDfgh7gtzoIOg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id D78CE1AC58CB; Wed, 13 May 2026 02:18:55 +0100 (BST)
Date: Wed, 13 May 2026 10:18:55 +0900
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <Mark.Rutland@arm.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] arm64/sve: Performance improvements with SVE
 state saving
Message-ID: <agPRf9XTQPwyA3n_@sirena.co.uk>
References: <20260320-arm64-sve-trap-mitigation-v8-0-8bf116c8e360@kernel.org>
 <agM03CN6cX2JNu62@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DI6dvZbBOgCmkDi5"
Content-Disposition: inline
In-Reply-To: <agM03CN6cX2JNu62@willie-the-truck>
X-Cookie: Truckers welcome.
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


--DI6dvZbBOgCmkDi5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 03:10:36PM +0100, Will Deacon wrote:
> On Fri, Mar 20, 2026 at 03:44:13PM +0000, Mark Brown wrote:

> > The two patches here move to using a time based heuristic to decide when
> > to reenable the SVE access trap, doing so after a second.  This means
> > that tasks actively using SVE which block in syscalls should see reduced
> > or similar numbers of access traps, while CPU bound tasks that rarely
> > use SVE will see the SVE syscall overhead removed after running for
> > approximately a second, confirmed via fp-pidbench.

> Have you looked at all at applying this heuristic to SME? I wonder if it
> would help with the recent DVMSync erratum workaround, where tasks that
> use SME once/infrequently end up causing IPIs for TLB invalidation every
> time they run on an effected core.

I have not done so myself, though I did discuss this with Catalin while
he was working on those workarounds.  IIRC he wanted to get a better
picture of the system level costs with actual usage before deciding if
it was a good tradeoff, either to do this at all or to see if we can
skip the timeout based approach or could just reenable SME traps
whenever we see SME is not in use.

With SME it's easier because you can directly tell if the task currently
has SME enabled so I'd expect the checks on state load are enough and we
don't need to put anything into the syscall path, it's likely that the
tradeoffs for doing that don't work out so well.

--DI6dvZbBOgCmkDi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoD0X8ACgkQJNaLcl1U
h9A3oQf+PsILwAYAvj4KguOQVxSaBxU0/ypimslkHq6oULGJJJ+90dOwTf0oawMH
zR/hS4tTkas3rauaO8ej0FdFmhg9bW7SwuKjC4oKgi93JGIaemVc2GODHGmrdKiO
gxnwcM7yGwaDKrvliGDeiiK8iWVnQ/Aw/PhTvMVOav00IcgY2tVLU1ZlSoKTtyqz
TTITcrcxsv3a/2LxNYx6Hd9aj+/kqHbwkXiFV4YZ9Ae5tbR62DEdSXUCWAr1oJED
sAgvgerMfwTOUcmEhkvj6eFu2cfhNdGRHdu/SB8rF/0tAHkNX2my3JmJvZpVZRKl
ljCt5IJB7srYLXApXiORxV5U0/py2A==
=b6pC
-----END PGP SIGNATURE-----

--DI6dvZbBOgCmkDi5--

