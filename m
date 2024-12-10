Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC76E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsRWd4XpGmQt04H39BY5vEC82atw+VIlFLWx6YsWO/I=; b=IUgfzHaKOy4UwNKOfmU7n57vHI
	XvuwemFv99mxzya+YZ5+IsXR8kYMdtAg82kVeGD8bM/Qs37zf7YF2tp4eCokuNDL8OThIXO5LsKcB
	EnY0ott6MLtuDlTzvqUFLK83FO0bsoxwU12Ks//ZWCgEA/bHHFZNF6NObTW2fyREl8kcWjLnDTouy
	U+i9b7q+aGNH/0lgwK8o72YUpmSM1MTOxaLhLWz0b3ees6+CD5lDQfhH6W5TA/RsHS5ksAT7eMOVQ
	MYr2qMTMA7ZTb7y03opFPaCRSyYKGt7zxNkOSyx9Rk6K13dsmMQ0N9hyVpRcmtequArpqvS3d4chh
	rG80hyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1XL-0000000BqJ0-3abK;
	Tue, 10 Dec 2024 14:48:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Us-0000000Bpo6-2Qiy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F5E6A41905;
	Tue, 10 Dec 2024 14:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E93C4CED6;
	Tue, 10 Dec 2024 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733841957;
	bh=GMYrMpfwKSGDucGIkOOyekDt9RHScYPq0EWm9Q8WkiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzXvF2eThXHwU3rAjHNMrf4VIL9uJpQDhOl+3xxAuzv394F+6QqczY9KtW4lWksJy
	 wiv7nYvPWK6AGkcj0b3jw/d/7XvtOk750NzZUQlv0NCkJq+5paMdadCa6QkRLscnok
	 dEvl3S1VDPLI4hULXsCecaLB0rrDBCQ2OTyNDOqUuBjBPr9TPpBAKQOPW3U+/YqZE/
	 RWpato4HeAFvQYlbS9T3db0Ko+/v74iOttwWhHrlK0RH+6dcvoyYZ9PoL2gOveoumz
	 SHlP9QI/1s4zGxUujQwbECbmvXhANkmGjBjaXEqm+m8xNwZnTRrM+fv94ZlfaYQds5
	 v8TWkDxZMnKbw==
Date: Tue, 10 Dec 2024 14:45:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64/signal: Silence spurious sparse warning storing
 GCSPR_EL0
Message-ID: <755660a1-0536-4520-8c01-9c254b02fae0@sirena.org.uk>
References: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
 <Z1hNllCWa4u-IxrH@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ey7ko7zyVLfp6lHg"
Content-Disposition: inline
In-Reply-To: <Z1hNllCWa4u-IxrH@arm.com>
X-Cookie: Leave no stone unturned.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_064558_676872_FF6AFBBF 
X-CRM114-Status: GOOD (  10.32  )
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


--ey7ko7zyVLfp6lHg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 02:17:58PM +0000, Catalin Marinas wrote:
> On Tue, Dec 10, 2024 at 12:42:53AM +0000, Mark Brown wrote:

> > -	write_sysreg_s(gcspr_el0 + 1, SYS_GCSPR_EL0);
> > +	write_sysreg_s((unsigned long)(gcspr_el0 + 1), SYS_GCSPR_EL0);

> Would we now get a warning here?

No, like the changelog mentions converting to an unsigned long is
regarded by sparse as a (the AFAICT) valid way of discarding the
__userness of a pointer so it's that change that silences the warning.
It does the right thing with whatever sparse I have here.

--ey7ko7zyVLfp6lHg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdYVCAACgkQJNaLcl1U
h9CsSgf/YtXlOQ/FWK5sRGxFr3DCs0csSiv0kz4bc8U5saalD7Tf7Z2hk/HyAcmM
VQWiUCuKYnysyju9p2hKfQKM0PrWgZ5Fv52dMF5omVBLQpfSCrokqZTMpGlpOgqP
zHfuKIcHC/Iby1wDzevxfHJUkmVr+MkdREIb+x67guEMewJF4eri8cE4n22kZtQJ
2Lhky5EYP8TzS8qd6SAYGMRkGqF5RRjPlmuUghwlp3KBypsdEqhWN4sFFS5lnp9I
EUKULrAuMWD4yI3T2o0X+M0iGF5OkZNWbrGnvzi4To674f0J29w4xS0hqFZEOyCC
LmUYGWEdQe8Gd1NewbwdnuQgwDPoXQ==
=UPH8
-----END PGP SIGNATURE-----

--ey7ko7zyVLfp6lHg--

