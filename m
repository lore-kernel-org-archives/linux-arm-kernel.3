Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C22C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pS0YocoYUe8/7v1wcc8LU9e+GKeJkhAEuyb1JHs8wc=; b=UQQSwePXdGNH5TRpD1/SMrLDye
	ld9H9UeplRv8ScXbFm+P8oQQHh4Rwg3ajZ6mUNzzRGGMFIhDHYRFP3vhClaacm863bKqNa8/7EkUI
	p3xYvD2Kx4l6CgkH0dhJEKeH7XsAcd2TmJj5IA7r8TFmoNCX6RkY7Y6XRQB/JANpSCl37lQpIFefM
	KJZSgklRmRVbR0hKUD9Fs2ZYxzCE+q6/GxAN0iiNyACfNQ85DC6UgNog2DK8uf797l7tXq6RugsI/
	P9V0PvswJNdPetT6btJkG9TihX+0IIzcyoBF1AxXDC/+UuR24DJl7uqmMbXlluoskDcQ/AZ8Rp/6U
	HCQQXvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0m5J-0000000CYRf-3VPh;
	Fri, 04 Apr 2025 18:48:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0m2N-0000000CY7O-0YGV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 18:45:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FCCE5C5A34;
	Fri,  4 Apr 2025 18:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32773C4CEDD;
	Fri,  4 Apr 2025 18:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743792306;
	bh=5pS0YocoYUe8/7v1wcc8LU9e+GKeJkhAEuyb1JHs8wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oj2Dt0eLeyZNWJg4aqmSZZ6KZap7XSa9gIlb9Hugsd1Q7jTWSfbLBZmB4ivwLomas
	 V46544iAkFMij9o+myOASQPmYFONw8jyPv/XlP7PFkzXrATg/Fm3iV+DFpj8pTWh/+
	 4JGUIhtWcHPSOPoUKA5mXBxCDcPb0omPqfRjQnL2FlF6/iNQ9Tosmluq1mj0Z0APUI
	 MPxJiZpO2Il3cYHHVDuiqL4oh7H+fyaMZtv0okXcypLdTSQEI8YvagVR6YQyn1WWI+
	 6JByznePJ77O9ZuTHJVmLf8vDFNq60OfxULX1XS2CpdNPAP0aQb/e3TYbnARwBUlC3
	 SqR9R0b7eRkQg==
Date: Fri, 4 Apr 2025 19:45:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 09/14] arm64/fpsimd: Reset FPMR upon exec()
Message-ID: <93205ec0-0c27-489c-8455-38089a493544@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-10-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="20b6WoJE57W/nqNf"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-10-mark.rutland@arm.com>
X-Cookie: You will soon forget this.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_114507_229826_89219EE0 
X-CRM114-Status: GOOD (  10.39  )
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


--20b6WoJE57W/nqNf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:30PM +0100, Mark Rutland wrote:
> An exec() is expected to reset all FPSIMD/SVE/SME state, and barring
> special handling of the vector lengths, the state is expected to reset
> to zero. This reset is handled in fpsimd_flush_thread(), which the core
> exec() code calls via flush_thread().

Reviewed-by: Mark Brown <broonie@kernel.org>

--20b6WoJE57W/nqNf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwKKwACgkQJNaLcl1U
h9Av4Qf/bqCx8/KneX073nTn2oL3ckxydoaLwJRilZiVbDUwjhDtz+rOwTcCm1+L
s/fDKiYVQozSaCiofyzqURv2zsv2pfWX3M5bT15S76d1zVyvdHDGLlx9NzNAen/D
wRcgTRFQ1zKRZG6dHRQTImj2cmnxzSr4DdkWPrjvSwrJRISE6SuNDqgT/MJWvQ+z
Pw7/6zCxp3afqyl1/HOn2r+guF4Fk2GbUi9lA4q+rejqrMDcf8foxoiOBBJhFH+X
uTbtrbK7t/Lb8Yev/DA+mwG9LrrTnVvAP0GsnhyKLKpuS0aVowaoVgraZ282mxSK
V1MRNd2dfY+7C/sFnLz9NEPf4EnxiQ==
=Hgmi
-----END PGP SIGNATURE-----

--20b6WoJE57W/nqNf--

