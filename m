Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A09D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ad9oE+xya/MpsUvlYaHSj/pWSZ2u59IeSaNdikPKrc=; b=U6yFH7gFey56l7zgJlim8YBkXo
	EOz0OQYnx5Fowdi2rMfV7KFSjC6ApWmZ8AC5uJaQWdIwxXq2wEkAOGoiMnoHC1w2Au2Lt+63v+X5B
	zAbVsNG0LjKs71z6Vez98D4zdJ4RjP8yLBP5n8rEN5NeZqnk6Tkbogfjwbx+q+ADFxGGlHVacwm8e
	uaZFzzukc8zrnF0s97O0scxGCU+WD9JuYk2/KznyHMO5y6oU+Y9XPWwmvC5jBb634PfhbMF89zBmn
	2wqLS453mRN4XPHjKBrVpAwyP5eVUg3DAXzHmKzH/Ftb06pff9cU+bVvaZPbYcDyoYmhVd78nOMIb
	MoZv1gCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApgr-00000003LMz-3xi7;
	Tue, 12 Nov 2024 12:08:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAp3n-00000003DrV-28Ek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E448A419F6;
	Tue, 12 Nov 2024 11:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B73C4CECD;
	Tue, 12 Nov 2024 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731410870;
	bh=f0VPYp2OO3whp5YDsd40TwogfCDX5tumV8g575tkc+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9nO8jOwGdE2eJmRA3VqYyeS0I/abCFyhLXCKxSVUtBqc5I9rp6fKuIQeWWgKUlQF
	 Yu9hfER2m48nJ7yoKInSMkfmDi4ozET6F4JiZ/caS/zH32FBGXCArEpWncOMj+Ae4R
	 iuP73/ZkYIVkIDGFKdw748sTjNVGbwLGUgH+DJSZWhsxNwgJM69dUgzgGtAbU+mBLS
	 ChDQAQnxu0R0jLxg2pCaUfYNzhYaZcjlcycaUcqUnzgkm+FaXMBSgozj+g+6apA74c
	 DW1ZL3dXrVuwbslORr9fG+ES/JukXbcg/bUjzmAu8YvcwkqHWUyu46kwtV0FTT4Jxc
	 J0gYYPn0sf7qA==
Date: Tue, 12 Nov 2024 11:27:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] kselftest/arm64: Use a define for SVCR
Message-ID: <ZzM7shsAlpOks5pp@finisterre.sirena.org.uk>
References: <20241107-arm64-fp-ptrace-fpmr-v1-0-3e5e0b6e3be9@kernel.org>
 <20241107-arm64-fp-ptrace-fpmr-v1-2-3e5e0b6e3be9@kernel.org>
 <ZzKUaqv_K-MRTti4@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gcR+M1ygfRDpV8Bq"
Content-Disposition: inline
In-Reply-To: <ZzKUaqv_K-MRTti4@arm.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_032751_632643_184EEBA0 
X-CRM114-Status: GOOD (  16.04  )
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


--gcR+M1ygfRDpV8Bq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 11, 2024 at 11:34:02PM +0000, Catalin Marinas wrote:

> I get an error when trying to build this out of tree:

> /home/cmarinas/work/linux/tools/testing/selftests/../../../tools/arch/arm64/include/asm/sysreg.h:132:10: fatal error: asm/sysreg-defs.h: No such file or directory
>   132 | #include "asm/sysreg-defs.h"
>       |          ^~~~~~~~~~~~~~~~~~~

> Probably sysreg-defs.h has not been generated yet. Too late to figure it
> out now.

We can just drop this from the series and replace it with dropping the
FPMR define that we did this for into the patch that uses it, it's just
mildly annoying.

--gcR+M1ygfRDpV8Bq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmczO7AACgkQJNaLcl1U
h9CHBAf+PPh7lLLzU6GxFh5DqMg1ZlACdjTyDjhV8GK64oD/SfS1snUL7DX4F4VN
7QOFaexuWZdXC0zQn3Ln72r9Of59gxIbRyK8X5mljc991QGuGZln3VyiBXcnPSYJ
HvLAX8eqp9q9s50l+Awsl7kC1WxpfLTpDtmsiXcyU2o3Ap5sCZeWDxrQgx08khRD
cTdiO0n29BH9BJtlhuQCSflcl2A5HhrmcC2F8p474Ms81OtGpEuw6Rc4A3z3juX7
8jsDaMGM+kz2y/S9oUbPj4ss50vbfkmM5C9GUmEuZdq67RrTSikz6nr9xejxzpXB
gaRlRgv5pzWJEnCH8AN4+A0qphOINg==
=igwC
-----END PGP SIGNATURE-----

--gcR+M1ygfRDpV8Bq--

