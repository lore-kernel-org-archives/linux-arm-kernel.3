Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D45E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX2zDB4T8Xly5VELrzq1GaY2HWgMuYNMWov0wbpw2zc=; b=wJxxDdUy/eYdF4GnJheEx4JmEY
	vArtmJcXhuEX3Br5QmytrVnpUY3puXolt8/eoqNIBbdPN80H84EDdaj/RSO8+4Y5XSJY6+MM6ahtw
	70ev468nXfYgHEBCQOswf0IgRLIrKAalkOAFtzA2Ta+D0WrkZ+KGC434JPPXOJ9DWX9e84Rr8gesm
	4DVSZHwRCP+k/w/ODI+Vo51UgSwqA3EaF9Yj39yPXYOu8kCFiZmAkTQZFA/JYCHBxKyOga0w87UnE
	1wNEzAc5WAGYEKGaGdxtFkx38KxJYv+PsZednbyWlZEy8oTYFtyuzWlHpxi6hQFO14ke6B3xc3k/V
	HiJTkYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCgU-0000000ALlX-09Qg;
	Mon, 16 Dec 2024 15:06:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCfN-0000000ALbx-2gfc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC5945C562A;
	Mon, 16 Dec 2024 15:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BDBC4CEDD;
	Mon, 16 Dec 2024 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734361548;
	bh=tIdFuiLb3rusJpAdSMP7WjnLxa5HWfHnlLwtg03T/JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZMKhukKWnoBFUlSjwHUQUkCf+Sxv5EBpSNvEqrsh9wzufQiR3BXbv+98ABYURrHE
	 uarkrXb0TDr4MRrX1zCV5a3MW8XAkpCX6Ef03LbJ3Cijx+8pI31/TawQ2DtNNdF4vu
	 JtpIiVQRWcAIWl5K1RoaMRWLy43Iv1AosC03BD8WI3wes2/8hlENJCLY5NYONkF3ZK
	 /WuXf7zno0laeVB0SpZBm4p5mGZg0/3kCMDFpwWJnM9w8HRKDAj70Kkreumu5VsHco
	 z6m9Ae9yWH/qNvhsY+9/LY6fxbsh9pzithCNd1wYkiW/cCrwFiiJT2f72jORBBSAJS
	 uc7byt1/Od7hA==
Date: Mon, 16 Dec 2024 15:05:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <c0501e6c-7657-4885-abfa-1c0753c0e063@sirena.org.uk>
References: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
 <87a5cysfci.wl-maz@kernel.org>
 <Z2AfOZ82QG_ukWry@J2N7QTR9R3>
 <865xnjsnqo.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rYVWTQ29yACSStov"
Content-Disposition: inline
In-Reply-To: <865xnjsnqo.wl-maz@kernel.org>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_070549_720979_5966BFBD 
X-CRM114-Status: GOOD (  18.65  )
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


--rYVWTQ29yACSStov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2024 at 02:31:43PM +0000, Marc Zyngier wrote:
> Mark Rutland <mark.rutland@arm.com> wrote:

> > I understand that we have to do something as a bodge for broken FW which
> > traps SME, but I'd much rather we did that within __cpuinfo_store_cpu().

> Honestly, I'd rather revert that patch, together with b3000e2133d8
> ("arm64: Add the arm64.nosme command line option"). I'm getting tired
> of the FW nonsense, and we are only allowing vendors to ship untested
> crap.

I'd certainly be happy to remove the override for SME, the circumstances
that lead to the need to override SVE are much less likely to occur with
SME.  We can add it again later if there's a need for it.

> Furthermore, given the state of SME in the kernel, I don't think this
> is makes any difference. So maybe this is the right time to reset
> everything to a sane state.

I'm not aware of any issues that don't have fixes on the list (the fixes
have all been on the list for about a month, apart from this one).

--rYVWTQ29yACSStov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgQccACgkQJNaLcl1U
h9CjQQf+KATDHPC+FxibIGuzocFvYNi2gMtyaa0fWsGVNddEp+BzHwP015ssdDKl
JteEjEknFyE7l9Y0F6bePJqYx/L/MIag8IweEZ5XWLAIOH6aMAameWJaewCa9kLW
PqVq30dEYb/pcV0GcuntAsVUekhHKf73mZui0RXugGWnwA6Bbz0GSE5OYig2vhsX
E8vc/V/SUm1eUmfAno7lV0cesuM31qtKlppJgxtoTELP/WbRwCGCIzVz/xZ+LtWP
5N2NxHPjOeZefcRfu6emhVpeWiAjB9lLsDiB+4q2mLXe1tngZKjVrdE8ZEHuFpBe
9n2oYo4dQRPsmqDsgByqvKgusClUGw==
=xWKA
-----END PGP SIGNATURE-----

--rYVWTQ29yACSStov--

