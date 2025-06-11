Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB1C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ln4xBEXqurxVEYQzpYqGDF+v7OgDd5y/o/q+EygPxDA=; b=VQY0J67gOPK9JF7Or9EzAZsvjJ
	jy2Evo2/DfUBKYnfzYTXvAnMvXJv8K1IlGvsisO6r98UM9fb9I0KTOKXxHYicfkhpCn59AEjmNVcH
	4BkxS8LGrKqM3J6OzLZcTJOTJa7Uzv5WvyKdCySKDouI9GDvsRkBqQK5/A37w15C9O0srv3OTIUIl
	xifh83VhMJtQk0mpwY2OJjakaS9CtgoNT5rcob1ylcNyoU33MzPra+JMBf9iYbxLNOdEcL/YG0LFc
	8RpwcIx+PBqaMyWf08KZ25S+4hP6qyyeTwxKttS+YaxdmPfoJXBaM3n67p9LsLVgeD0AgyEJWVZgP
	yS8nJjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNAZ-0000000ALqy-40ly;
	Wed, 11 Jun 2025 15:15:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPK02-00000009n6b-43K3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1CD75C5687;
	Wed, 11 Jun 2025 11:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2839CC4CEF1;
	Wed, 11 Jun 2025 11:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749642730;
	bh=yRUOxSzAEsyPznAdZauQ9KUp0U+dAFLZRw5w7dRb1dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/SNwwcBNVy9WtNXlS+ukaNk4kvWMnm+0H2icsJm2l8op+95XwndnLLAAdaGIHSDs
	 y/TY/N+jwL35zg3VLajcV81s46l4LtnR0wOAy06FSGB0YU/pzWYq7j3rFnm6C83bsb
	 RJadRfuSGrqtsWccFPDmg7mmc6NGV6c10ToYL9HY6AZIZ0ERpfISEz+YKHS3zGuf0V
	 +kroL4LlvCBXC8yB8BkvhVoiHpJxBaejoyeAmGmVognLbg3EWqBvTCBQYuRN0c8x6b
	 KUNQ8lH25jzqLtAnXacwSb+WAY+UfWV8oxKC3GEfOUvLsFXwv0sil1+VfUTSKFpwoT
	 xVgS5LKryILQg==
Date: Wed, 11 Jun 2025 12:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 5/9] kselftest/arm64/mte: check MTE_FAR feature is
 supported
Message-ID: <916e2064-efa9-4b69-b561-51b0378158c0@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akue2bSXBTy4Umo7"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-6-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_045211_050831_CCA0C8BD 
X-CRM114-Status: GOOD (  14.72  )
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


--akue2bSXBTy4Umo7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:41:03AM +0100, Yeoreum Yun wrote:
> --- a/tools/testing/selftests/arm64/mte/mte_common_util.c
> +++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
> @@ -6,6 +6,7 @@
>  #include <signal.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include <time.h>
>  #include <unistd.h>

Not sure why we'd be including time.h here?

> =20
>  #include <linux/auxvec.h>
> @@ -26,6 +27,7 @@
>  #define INIT_BUFFER_SIZE       256
> =20
>  struct mte_fault_cxt cur_mte_cxt;
> +bool mtefar_support;

This is a non-static variable so won't have a defined default value...

> @@ -273,6 +275,7 @@ void mte_initialize_current_context(int mode, uintptr=
_t ptr, ssize_t range)
>  	cur_mte_cxt.fault_valid =3D false;
>  	cur_mte_cxt.trig_addr =3D ptr;
>  	cur_mte_cxt.trig_range =3D range;
> +
>  	if (mode =3D=3D MTE_SYNC_ERR)
>  		cur_mte_cxt.trig_si_code =3D SEGV_MTESERR;
>  	else if (mode =3D=3D MTE_ASYNC_ERR)

Unrelated whitespace change.

>  	if (!(hwcaps2 & HWCAP2_MTE))
>  		ksft_exit_skip("MTE features unavailable\n");
> =20
> +	if (hwcaps3 & HWCAP3_MTE_FAR)
> +		mtefar_support =3D true;
> +

=2E..this will only set mtefar_support if the hwcap is present, leaving it
undefined if not.  If you just make this

	mtefar_support =3D hwcap3 & HWCAP3_MTE_FAR

that should avoid the issue.

--akue2bSXBTy4Umo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJbeMACgkQJNaLcl1U
h9AQegf9GTZEtRZRq4VmKPmCvxZbca11FXmJiCJXXo6fBei39grcVd813PQRHtP0
4T87elMNY80ujcy8ezzOV84yn0gKXeVGxIdKXAgKoZJj3xtQvKOs8Nvpa3l7XRjX
N9dGiKEoHwLAWWUGcyyzWIq6mUDVdXpqbV42FH934pnPfSlqv87fQUcP2bO72NB4
3NvtdC34CgDvoE2VhftMgBw0tLXo3qX55Vg4otBsrb8xjNzMbPDQzj2EenzdndIG
fIbbH1BRUjox+zP8fCXiHT/z2h5XV0b3sA+qudODfkZa3SPr89R4kDI5+sY5Bia1
b3cPtWg1yqrTMk393FYfLdS3kL93fg==
=THva
-----END PGP SIGNATURE-----

--akue2bSXBTy4Umo7--

