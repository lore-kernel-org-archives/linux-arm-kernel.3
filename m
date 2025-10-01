Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09142CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 23:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTRNgFb/uXFYWdnXboNRWVcBZmcEx1q5hKN0lJrIGBI=; b=oC236z7vglo9d20bIy++5N9sEL
	oa1ApEXZ3dCPaXLzeaOrQnvoemBCM/evQCMx+htRJcI2NbS/rZtSTv+jYhyQ6hgITHIS/3V9SaBRq
	LbfryDzB5+PNjWd4Bn9N5N/XfqJIvssu40VW235K7XsjbQfbDaN+GFWGi8Wz6xOKqDQ2aFyVq7YiW
	ZJDTsRfGNnGa58HK+rEC+RMOgnq2bsIfsl/2mMGwSElP6r+fPWx+1a6vKqlo+YN2vFlzYK/Rs/v4u
	uAJVwpSeCs/3XsAiB4oeoxr8ng6a1gcq4IvLRkdIshvW0shtr56oS3ki+6ZQ9AZsaZ4nnFV4jJI3I
	ZrwGsIrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46IR-00000009FNT-3Lzk;
	Wed, 01 Oct 2025 23:31:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v46IQ-00000009FNL-1sx4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 23:31:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9CB161D70;
	Wed,  1 Oct 2025 23:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44208C4CEF1;
	Wed,  1 Oct 2025 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759361501;
	bh=OGlK5L3ggNTJFXop7r3keERa3EKrM29ZMElxPIYJMHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5OrcNnJRZl6gflPLlO7LLBZEmOdJ3NXgYQ6CdBf0v3BaHJ2P+n2N3PvXwMTW9gUr
	 6EtiPCgl/JHF1O/UqUSAQpR+II3zPB4XAACMoDGzV1U309o90SzIVHUZyZGJePz0NZ
	 thzUy7XLC2KYkrjk+yhbYcz06jFv01RJjA8bbjrhyofxtjg2PQP/vFv7ik+PoVR6ci
	 fpouJohZ0OdV1MOe1uKinrV/n96glTjZou5zhNpgdGw8ha02geNWO/KBnM+N3U4xZp
	 3xYqSDeuesYjm5rRBIRiY3w5+R5FiESXDdUAxJO61jjztSAgyVQ291xNYtqdYvWHex
	 1kcqbBWu67kog==
Date: Thu, 2 Oct 2025 00:31:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, Will Deacon <will@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
	Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v3 4/8] MAINTAINERS: Add Jonathan Cameron to drivers/cache
Message-ID: <20251002-strainer-kindly-8e654868337a@spud>
References: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
 <20250820102950.175065-5-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O121PAwtnwfexBg5"
Content-Disposition: inline
In-Reply-To: <20250820102950.175065-5-Jonathan.Cameron@huawei.com>
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


--O121PAwtnwfexBg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 11:29:46AM +0100, Jonathan Cameron wrote:
> Seems unfair to inflict the cache-coherency drivers on Conor with out
> also stepping up as a second maintainer for drivers/cache.
>=20
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v3: Add lib/cache_maint.c and include/cache_coherency.h
>     Conor, do you mind those two being in this entry? Seems silly to spin
>     another MAINTAINERS entry for a few 10s of lines of simple code.

Oh damn, I just found this randomly while wondering if this series was
going ahead - you forgot to CC me here! I don't mind the extra bits, I
think this makes sense, splitting it out would imply a different path
for merging.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

FWIW, I don't mind using some non-personal tree location for this, but
that's something that can be done independently if it's needed.

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..039d10ded9e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23967,10 +23967,13 @@ F:	drivers/staging/
> =20
>  STANDALONE CACHE CONTROLLER DRIVERS
>  M:	Conor Dooley <conor@kernel.org>
> +M:	Jonathan Cameron <jonathan.cameron@huawei.com>
>  S:	Maintained
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>  F:	Documentation/devicetree/bindings/cache/
>  F:	drivers/cache
> +F:	include/cache_coherency.h
> +F:	lib/cache_maint.c
> =20
>  STARFIRE/DURALAN NETWORK DRIVER
>  M:	Ion Badulescu <ionut@badula.org>
> --=20
> 2.48.1
>=20

--O121PAwtnwfexBg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN251gAKCRB4tDGHoIJi
0toUAP0dOcmtbXnxZnNoXXCM7kD2Nsf3MpJIf+ZHnwEDwUNU6wEAvn+n1seE9hkC
hVZLo8CCugs4ulT80RBNTP9Auu7ODw8=
=p30I
-----END PGP SIGNATURE-----

--O121PAwtnwfexBg5--

