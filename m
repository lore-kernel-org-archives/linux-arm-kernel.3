Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LmLKTXhV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PRGVRqwi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R+Lz59YAmE39OMTr2JsinbD50rhC0BRWVoCOCQ0iRIk=; b=LmLKTXhVpVs9a2kxfUh9M4sQl6
	Gir+LSzeOBe9gFCshnUO3Tvk/99NozuuylpP00wNhIeYpFcyMcMywipv+zVbSOmu92Qly2/aK3TYf
	9r8ZSEmvnEZ6izWQV57MYDJ8eTtiW6AfE0eJ/aLaZr6HmwA4Ul5KfDHe2rSZ+LA08N2/sR0Zvsd/9
	ARzuVMKHIbr5B4FSyS9HIl+mSnLOpeCFF0jI5oG4zkRALGY6fEE04asYwUlItf+vUz1TBRCbZqWDq
	O+D9M9byuTKN/87OhRSHHeXMNqtqmt5GPNxiGrK16u7cH33tv3UiDtO1HpDj6muJ7sTtVzI70hArh
	hD+nAelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF0E-00000002enB-1Nvc;
	Tue, 03 Nov 2026 13:56:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOF0A-00000002emL-0XvK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:56:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CB8E6061C;
	Tue,  3 Nov 2026 13:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2751F00919;
	Tue,  3 Nov 2026 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793714196;
	bh=R+Lz59YAmE39OMTr2JsinbD50rhC0BRWVoCOCQ0iRIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PRGVRqwiv6MTZLxMLY48nxHMWgsFAcHVQqSjW+03fKfFTsD8J7XY+8asguReA4+9l
	 snQCwXIRcT2lHftHDW+j+YdpQHpcc5srRgKCGzH6x7BSYlcdDB49Kos+3hHbpdzNHk
	 ASQNL0hGSSQY8OOqCvRS9PE4W/Hqayx/NDf8tVmYbRwktPhqDcX3R1fu7bbqxvp0xj
	 31mVkymrskroU2Jha52BCjuf0QoIlRgezvjuUqnDqHgkLwSsHxQpe7qjkntoITzsP/
	 MEwiv1hroVCqQKqyz0xcFcAdk1qJYylCzNHzOedSkkEI8WnvGjfAuAD3gXRsrICO/K
	 YxYPo/kMew9lw==
Date: Tue, 3 Nov 2026 13:56:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Wei Wang <wvw@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	wei.vince.wang@gmail.com
Subject: Re: [PATCH] arm64: suspend: Save and restore TPIDR2_EL0 across CPU
 suspend
Message-ID: <8f1ccb65-e4a2-450b-944c-9883ff12bc37@sirena.org.uk>
References: <20261102234813.1069156-1-wvw@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6IYMj8soJ5dhvHDN"
Content-Disposition: inline
In-Reply-To: <20261102234813.1069156-1-wvw@google.com>
X-Cookie: Small is beautiful.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--6IYMj8soJ5dhvHDN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2026 at 11:48:13PM +0000, Wei Wang wrote:

> On systems with FEAT_SME, TPIDR2_EL0 is part of userspace thread state:
> the AAPCS64 SME ABI uses it as the ZA lazy-save pointer, and the kernel
> context-switches it eagerly in tls_thread_switch(). While a task is
> running, the live register is the only copy of its value.

Thanks for catching this:

Reviewed-by: Mark Brown <broonie@kernel.org>

but I think we're missing some other registers, I made the same mistake
for GCS with GCSPR_EL0 and GCSCRE0_EL1 and I'm not seeing where POR_EL0
is handled either but possibly it's somewhere I didn't spot.  I can look
into those incrementally once this gets applied (or if you do a v2 and
roll them in that'd also be great!).

--6IYMj8soJ5dhvHDN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrp6A8ACgkQJNaLcl1U
h9Djkwf8CKSaRV2sUPe1CvYTnDySz0g3vSKK7JXAzIRm7/VW/CeVsU7qAR2VxvOQ
os/IemWfB91LhdGiI+0r7iVCLjU8tgnMmj6w5Yj+KZU15W7QeRxeYYC7orlzQbgK
Uy/pLapQrvXwIu7ZxyE9BlPAvKyqTe3uHhJVZHyl8sGZ0vTs4+5osA94wsUG+ouk
Ab9Qa8ycZf10jI8DUDVsWpZyXn704V81m+PfUziecTQp1FRQad8pDLcPcLk1oYf2
9Bk4ysiIbRYzVzi+5EFH2n6BTpKkw0nsUS6SZv2dxzX/dlmSb20Rd9kyId4WTWYS
cmkbN8UklQLpeHEZFnpKhyVgOAtQcA==
=zl37
-----END PGP SIGNATURE-----

--6IYMj8soJ5dhvHDN--

