Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64980D42B80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7Kq2dU/HQi5PC2gsnrhfUKy8NejriTh91qF4oKvHoY=; b=DUTkwuQaoXemplbmlkHN5dX2qF
	OXjhP7sE2cJOEVlJXGAWeJ9O1c98sARmn0MVvZdkI2NHNCwC/WEvVscfNkmeC+wq2h6gH+FQCsgAN
	beZPFYEctfNY+rV5w9XvbQm+qLWhkoQ+zlAJjz6pZOGiUotB0Lq34mjBSlWVFjW2o9dyJfehiTDIY
	M3x3snhzb1auE69g2mQzaGnAtel1cE6EllPzJyi6vLPJI5vk2+wv0EFrhPeGmL1annP2n6zOJvTGO
	G8doMDSB5s9R2hhQ+IEGDaY5fk/qR71X5CoI76lxDpoUKfw+FB2Smbyjjj1TP+ZRMV6cLQnIxZOmQ
	aKXMwTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArEH-00000003dmm-0OOx;
	Tue, 12 Nov 2024 13:46:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr5o-00000003bsg-2ne4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:38:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACD2D5C4B8B;
	Tue, 12 Nov 2024 13:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542CBC4CECD;
	Tue, 12 Nov 2024 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731418683;
	bh=pAVnpThhWdYJeNyxXAkFL3AIKR99WrRrYPiq8nNjjd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7skn3KboyWXib0zh2vjY77DelF5J0MYbRjN/MXavNECa9pjUt6HHvv4jkcoTpJMH
	 j5G6PNm1K5kersBkmjwFfx4G07hhVmWcRpO+80MlHnrrZHgQCuuDdA76J8pGrNuJ8u
	 sYBF0Mdi2VdzNLk5WKYBWPT0BUMmyRGueZexG4FbI2QlQm7RPVIac2h7GJHd/G4oPu
	 mHjCcETvIaZWf78XArHChMzeRdl8nDZowzaQ1vaSVzxBdtyIfjezHoru3ZJOWHHhD6
	 4kG/uBPedRMl+VZ+WJuci8S/25tj9usoIpC/l2zetr7BDyuIVCpNAKxb7fnb6vza64
	 zmyGiI5rRVKhg==
Date: Tue, 12 Nov 2024 13:38:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/3] kselftest/arm64: Add FPMR coverage to fp-ptrace
Message-ID: <ZzNaOSjRrO5bAJ46@finisterre.sirena.org.uk>
References: <20241112-arm64-fp-ptrace-fpmr-v2-0-250b57c61254@kernel.org>
 <20241112-arm64-fp-ptrace-fpmr-v2-3-250b57c61254@kernel.org>
 <ZzNXnJ3Jc45CctCs@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xLlvf2gTixCAyurB"
Content-Disposition: inline
In-Reply-To: <ZzNXnJ3Jc45CctCs@arm.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_053804_769119_13150F32 
X-CRM114-Status: GOOD (  14.12  )
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


--xLlvf2gTixCAyurB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2024 at 01:26:52PM +0000, Catalin Marinas wrote:
> On Tue, Nov 12, 2024 at 01:08:16PM +0000, Mark Brown wrote:
> > +	// This has to come after we set PSTATE.SM
> > +check_fpmr_in:
> > +	tbz	x0, #HAVE_FPMR_SHIFT, wait_for_writes
> > +	adrp	x7, fpmr_in
> > +	ldr	x7, [x7, :lo12:fpmr_in]
> > +	msr	FPMR, x7

> Did this build for you? I may not have a new enough assembler.

Yes, it even ran through tests.  I suspect it's picking up some
(possibly stale generated?) header file which has the FPMR define in it.

> fp-ptrace-asm.S:149:6: error: expected writable system register or pstate
>  msr FPMR, x7

> I changed it to REG_FPMR locally.

Thanks.

--xLlvf2gTixCAyurB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmczWjYACgkQJNaLcl1U
h9AK0wf/aSgAZAm9PsjG6AMul8uMPl9LX5dIhjhyUsdde7iFjz8U4B7TvxrqBZiR
rr+rca1ee3yjWRcrQ1UsXuIbDkYhI/Ecg+sRVj/dwnVLRwS9/bbqqinOiqnZ/c91
b+NXock5wFZqFH29iHs/mKXqWoc8uvYliS52YBTpYX1wyyQPPvYvxsftEEgMiS2r
mSsqdwrmIbINgAXcXY1SnhJmfyhm4P1pkMpb1VP6z8hGO5dJclyJM8unkWCpPfvE
JAHyzFbGC8HvKO2ULXiRHJa4H4SlCfg3Y3zvOF70aF8X1x/tw9KHFLDlGUh5eJAL
APX15s2e7Jv2beg5d7DxA1wKcU6rng==
=D64q
-----END PGP SIGNATURE-----

--xLlvf2gTixCAyurB--

