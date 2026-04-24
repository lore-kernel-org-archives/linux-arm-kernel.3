Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B828FED3EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyHCFSXpfdyK725XQhorfE3+2d47M/278DlTUvZYI9g=; b=KRUem3gDY9yHH6c3Xdv/JzIGQM
	Gm9xZKflNFPr+8RWzDXP/dmQ2ppn0k2e2bGzwfkLklC6TJkDkY4RBoyWmcuZzEFRXWNkBNZVz5mSe
	pGtjikXWs+IFdi+ePmsn+hCuxJs4NPg9AEkgFDNzBaWqUlqzyQQdHMY9AaxYnO8zlfgeHM4tVU/v5
	be9TiTullmw3QBbe2xVbWUZLhMWX4SxIwcfdZLumhO5J/MuayHjbQQU2cz3IRhrM7ziM3GgP2msfR
	hhimyeyrtHRgifG5kMuDV+gHj3eeMxrvnFT4B9u0UREMmGQgciUYvNhuPg3/1ESBNAdENzKYCJLAl
	yWjDyoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJ4H-0000000DQqU-33vI;
	Fri, 24 Apr 2026 16:07:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJ4F-0000000DQq6-2GTr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A619A44489;
	Fri, 24 Apr 2026 16:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83ABC19425;
	Fri, 24 Apr 2026 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777046866;
	bh=BR4nqODHdCgirkaG/hgtBFtkqB80B7MFxhUj/ibJi0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+Fn5p7E2mN5Mic0TLYajA1XWAoIXI2mJfKi8b0EoxPNnaw84eIRSoI+GbMUG1HGL
	 bzH2Nv64Hg7/C9hDBuIOEzyeLJe/F979kvHcGUsXNkmgv8iKIgMMAqMwwEdNBY4BqD
	 Jr9z83zhPLFyUTwlVJOW+3wCNflLBEOveaUB2nZnMc4Z+/YkhjceuzXLm5OM3rnXwX
	 7VG5R0lR54fnJoTj3d78kIkGdNm59QCSv1872DBVEkr+SUl1v0/vfbmtr4UFzVzA6X
	 WtHm83cDEFEKdEAmTEsokDtiJfsV1z6KlpkURxegNnw5CD7V4ULuuVchA77nn0Ar1d
	 ky2ZnEiBoCvNg==
Date: Fri, 24 Apr 2026 17:07:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
 <aeuRfEeOUWEHzPix@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RtU1zfulaMlWAB9P"
Content-Disposition: inline
In-Reply-To: <aeuRfEeOUWEHzPix@arm.com>
X-Cookie: I can't drive 55.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_090747_620339_487DF508 
X-CRM114-Status: GOOD (  13.87  )
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


--RtU1zfulaMlWAB9P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2026 at 04:51:24PM +0100, Catalin Marinas wrote:
> On Wed, Apr 22, 2026 at 06:42:54PM +0100, Leo Yan wrote:

> > Building on Debian sid with GCC 15 fails:

> I think a better fix is to always define struct user_gcs and only
> conditionally define NT_ARM_GCS (IOW, move the #endif higher).

I've not actually double checked that everything is wired up properly
but I believe these days this should actually pick up asm/ptrace.h from
the headers_install target so a current kernel copy.  We ought to be
able to remove the local definition of struct user_gcs I think, there's
still some weirdness with the NT_ definitions I can't remember but the
struct should be fine.

--RtU1zfulaMlWAB9P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnrlU0ACgkQJNaLcl1U
h9AxYgf7BOPVG3eQDCLMYm/VdAFnMAnm4vr8ZWmUpjNri670GAtZk+L9mzA7FpG3
ixGB1i1CGccPnJfmkcOrXF1y6EVillyp6iW6VXISPuz3ISWBQ0mLiDol8j31KovO
D8B1eafYxOJPO0jyMF/faevcSmq2cqZN8XUkoQMSl9tfwHgIqxNgHhWSq95eZuox
BTHrxhMfPNAuUyrDmCHd1iwuYFInf+HPuoc/Lphtfk2HVp4g+ZwEQKiJv69X+zlw
yt9v2Zeza21CCjPWJ2Dc7nn8fjirbSPGyOgcGDAnfE15go8ym2Nuiy2KmnxfeJXs
xFPXq25N5X2RwFQLeIL67+m7XG72lw==
=J4TN
-----END PGP SIGNATURE-----

--RtU1zfulaMlWAB9P--

