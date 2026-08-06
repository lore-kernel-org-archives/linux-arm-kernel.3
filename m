Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8484BC56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bG/+1c+prL+c0d/X4aPTc5uYn6Pj3WLl3WBugC2I9aI=; b=hdCcbAXcwZCoU58Fp+sQlnjYlB
	mqZbcRTO2RAy2Tf4e/ZaU0E80K8egHnas2LRpRpgk4Tly+RnRbXlPLWaMOmu59/7RqU/TntPBw1HI
	wJ19hXesbBmiMEB6xRN5FFnNs7Cw8VxUSFBpvuC5YBnyUm91Xyvb/YDLwBOuJmS4M9sAmlJkIq7YD
	7ky0BnqIDcJrY1kYruxlm9IWURemSbc09kdl5tyuI6utiq8EUafYGtGES9SxcH/8R0F14Xk5OCQci
	mt3bYKcVgkO8w+Cqf3Oz4x6/DEg+i0M7DQfWDl0vFjpVrFsvEfJwgIs84BOFwxAHx1a9i30OsXghA
	sLkttcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrx0X-00000005jyo-0FWy;
	Thu, 06 Aug 2026 12:15:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrx0V-00000005jyd-1KG6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:15:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6474360A5C;
	Thu,  6 Aug 2026 12:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B71E1F000E9;
	Thu,  6 Aug 2026 12:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786018530;
	bh=bG/+1c+prL+c0d/X4aPTc5uYn6Pj3WLl3WBugC2I9aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lTllz68xCe4f1rgksWmtWWCvTofKNstA7LECnUYwBCh0SEIfNCBGrJs9Hizz4SAdN
	 44RYFVBqY1x/2hQaxP07kcrPewf+6iNO0CTOoIb9I9Yt2zmvVC3da3mpc8NzuVpbuL
	 l9vO8rP1R/LmTC0hipYCCTtuQSbLvJUaEZYI9qvieQyz8wAl8Oa4XdZiA28OWohlo+
	 UlrpR8g8NXeRKDKJKpu/WV/4XO50wcjcG3VoFCVlk8lMkeYsxefy0xJ0F7zVNl5zmI
	 Cck2eEvuWOK6ABLOQNEluL9XAo15oEXorD0IOoMJ7uOOeTNuUCsKlsnMHj781vobSW
	 iPih0d9JMvVZg==
Date: Thu, 6 Aug 2026 13:15:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>, kernel-team@android.com,
	Mark Rutland <mark.rutland@arm.com>,
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE
 regsets
Message-ID: <be47f939-bc44-46b8-ba38-988403dd87b0@sirena.org.uk>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
 <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
 <21702e5c-2dcc-46ad-bffe-26cd76d844b9@sirena.org.uk>
 <anRoiIbOFVjj7qPN@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xDS/6FBQB0QLC0Ie"
Content-Disposition: inline
In-Reply-To: <anRoiIbOFVjj7qPN@willie-the-truck>
X-Cookie: Brain fried -- Core dumped
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


--xDS/6FBQB0QLC0Ie
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2026 at 11:57:12AM +0100, Will Deacon wrote:
> On Wed, Aug 05, 2026 at 10:27:18PM +0100, Mark Brown wrote:

> > As noted in the changelog applying patch 1 as a fix and this only for
> > -next blows up the fp-ptrace test rather impressively in any
> > configuration which can generate headers only reports:

> >    https://lava.sirena.org.uk/scheduler/job/3075737#L3231

> > for the release.  Both patches really do need to go together.

> By "blows up" you mean the test fails, right? That's the same behaviour
> if anybody runs the test on a kernel without the fix. Both patches are
> merged in for-next/core.

Right, the test starts reporting 96 fails which doesn't look great in a
dashboard.  I'd misread the original branch as being merged as a fix but
I see it's not been merged into the fixes branch, sorry for the
confusion.

--xDS/6FBQB0QLC0Ie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0etwACgkQJNaLcl1U
h9Cj5Af/RbhK3IBFPx1Y04cMjPSnwL1Cn4ML+QhLP/52CHHOMTpnRcP1+VnW5dAn
zcHezU4q3urEGIfdn0/i2LE7ZoigpjxV20tEyPlzVbG37e4+Ofd+kZS56fJuYiC5
NVtv6M4JSeW/+sn83mTYmgGMZHAKCLufpqfUXDlWCLuZvnqIzCM0FpqyUEem2rWA
r3EMTFd5fGlfyMToQEY2V+EATPL9ivAcgLoh+vJkPyAs6dAJm38tU81llNLGFYQA
xgKzFf1CmDmf+fxsnjksO0Hgb5mlU994v6r7C6IapvBA3x2o8coL7bZnK/BOkLIQ
wg1zPZ676mCKUVKGLw7tm5AGZXGJuQ==
=8cS5
-----END PGP SIGNATURE-----

--xDS/6FBQB0QLC0Ie--

