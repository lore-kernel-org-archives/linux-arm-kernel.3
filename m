Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2AACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10CV05B4Bf60Y+fl91AsN6EkMAQfJuECfWP5Qoqx3dw=; b=ra8qmaEhLtETW1/7EGSomNOSZl
	VyMey2aXD3b7XkHx/sG/hh8Klw7wvVdfF4H2T2T356K9B8DMCavBxV0sWcbct8JxSpFzVj8GyJwRQ
	xZbQmI528u7TGvfcvdLV/oQNiUt1ls0qDCnzHIspu7U18Tpo/YDrknH+4gBUr56yzraUsPHF6GIq5
	xrQgkLjlNCVcxXVdbVGFT4A5x7Rp0T5BJ1wQObT4zLLQ3A4gy3Q/Zmj/u4+R3RmxfEWB7Sl3rfjdI
	Gxh4ai7BpP0Fkh+Fr17vCD5M8rd1eXc/UA/syvpZWhAKpj+kzxpdbW3EHytvhHV+c8IxjCHN9RpzI
	ZftxZr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRudp-00000002Vue-0tpn;
	Tue, 26 May 2026 16:28:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRudn-00000002VuN-0or2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:28:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63CB5600B0;
	Tue, 26 May 2026 16:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEA01F00A3A;
	Tue, 26 May 2026 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779812906;
	bh=10CV05B4Bf60Y+fl91AsN6EkMAQfJuECfWP5Qoqx3dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FPdZliYwuVlDWy6WguEg5j7Ifi+sw6SQH+mdJ62hz5/5PnobN4qqNIt2oxAK2x+Y7
	 fnq2jy8k+4CUP1NimKrHrNIvdC34p3j8KV6khuzhBN1CYolTty7nrPgRHUmGlTziLz
	 r95NV0dHvXFwwDlxj4ZGqMGFeBn4uX0ogkCsF61sGTzxDpmwNNTNy/6TDflqzmdtJI
	 JwO6ySo6VJLSYwP/gAA343CAkDkedXKyFr6h6XmJb5VHMhLYyYSyyjkeranT7XsiNP
	 kp8FsbIoAb9vNyDjHN6TQeY7vXKIXFvFf+bPWdFFvOyrVlFNz2YHkE+AR66uY8tG+W
	 hY0xGsOoRyGrA==
Date: Tue, 26 May 2026 17:28:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 11/18] arm64: fpsimd: Split FPSR/FPCR from SVE
 save/restore
Message-ID: <0b72df66-2914-4537-811e-2080e0a7ce6c@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-12-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mfin5GylmbypkmA0"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-12-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
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


--Mfin5GylmbypkmA0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:49PM +0100, Mark Rutland wrote:
> Regardless of whether the vector registers are saved in FPSIMD or SVE
> format, we store FPSR and FPCR in user_fpsimd_state::{fpsr,fpcr}.

...

> Note that the SVE assembly sequence for restoring FPCR uses an
> unconditional write to FPCR. The plain FPSIMD assembly sequence has used
> a conditional write to FPCR since 2014 in commit:

>   5959e25729a5 ("arm64: fpsimd: avoid restoring fpcr if the contents haven't change")

> ... but this was not followed for the SVE restore assembly implemented
> in 2017 in commit:

>   1fc5dce78ad1 ("arm64/sve: Low-level SVE architectural state manipulation functions")

> ... so I've assumed that this doesn't actually matter in practice, and
> implemented the C version matching the existing SVE assembly.

> For the moment, fpsimd_save_state() and fpsimd_load_state() are left
> as-is with their own logic to save/restore FPSR and FPCR. This will be
> unified in subsequent patches.

There is a possibility that it only matters for older, FPSIMD only CPUs
or just that nobody got round to benchmarking this on physical CPUs with
SVE and in fact a similar optimisation is also useful there.  I'm a bit
wary of dropping the optimisation without any verification of the
performance impact, but equally I'm not aware of a specific benchmark
that showed the impact or even if there was one in the first place.  The
changelog sounds like the optimisation might've been written based on
inspection alone, I don't know if anyone will remember more than a
decade later.

Having said all that given that a conditional update is simple to
implement in C it seems safer to add one in the SVE path than to drop
it from the FPSIMD path.

--Mfin5GylmbypkmA0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVyiQACgkQJNaLcl1U
h9ADfQf/e+eVCysek/Rk2yi/gjzQrzmJD/scHCF/WIVmFPhoPMHVpAMAoBCemkrN
rscyp8YRk+C7EWrLEsIImV85M8hnqCGrsV0kFPTS8d7TDhjcblV2jTyGrHT5Z35p
T2Of9t9EPEyPq2pMVgjO7L17PzlKenBUVL9HEBqhEumPFE7GuWPWLAHr27ZwkfM7
ySJl1QL/2nMjVMoSehbb1MADUX7CkEKF+G8TpEbkElUtGE74VxVmfseDG78O43Dj
AMOCsO+4VQ4o+/ZPz6hjtWEhq/bdLY5BKeTc4+dXgbuzaMKBKzqzT+ZWKWBhjYas
uLiJpyzi8VVmDJuS0JOxq1sA7wshnQ==
=lmvM
-----END PGP SIGNATURE-----

--Mfin5GylmbypkmA0--

