Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DC8CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaDExXeL/34UENiB9oEbazFZaj9laAcFWPbmwXdDets=; b=Rr5w54fwEptvvQEDeeFjh4WQcc
	yGwZKZxiiM9q6VRIB80pO0wK0iCh4tF3JZORG8MgmIF+dBFppobv+AKDERnKPFIG8awUA7WFOrh/4
	/6pWsidVgcCjtSWKempLtraKebxPXdQnwCz82hwW3+WrCeksV94Ae1d7pXipL9qs/O5RQssCh+ceG
	B9B/7NtMDHx15bS7AQTBHrG3rMU9UCPtSiD68hr1xI7KNNDdLkfvriehh9I3jwcM5GdyrBsii6MjE
	Qdy7WnLv39p2TiywuERBezxyXrqN/P6PENGCFyDXzcFHZ8lUUYgABllnlcHE/cHsaW9eN/ghe2GGd
	OlRoJt+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDJc-0000000HJgo-3oo6;
	Thu, 18 Sep 2025 12:00:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDJa-0000000HJg9-3hlN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2180A43D2B;
	Thu, 18 Sep 2025 12:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5567BC4CEE7;
	Thu, 18 Sep 2025 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196842;
	bh=uaDExXeL/34UENiB9oEbazFZaj9laAcFWPbmwXdDets=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mDj3c0ImOBTRTsZRIde5ZCK1uAHycNbTl5sgkvFeIpdF/A8yKtzFyUj1Lo+LET/DL
	 G8hTXbzye3PkKcwwep9JJ72BQAdirttpadB1/jkal6vpAWTWhRzRu1J2wwE+LxBkzo
	 b1htL3aUhflHSRh0Z1oUqnYoJ+4Q+uvpj1ePUmW6ihPNfRs4eJ2Bkd+X+7UdBJ+jAY
	 PhIFsaTsck/eo3+xsTGL8MeqcYieLWzhrLt/cRQnVUXY+H3T6klGJddQydEBP3vfzv
	 B6RcFYtocMWIAnbUM2rJnhjMmkwgl0WNbCouEq1G7Sfcv70Co+fl6IvwCcQZgogdzg
	 w8yDq0I01L5hQ==
Date: Thu, 18 Sep 2025 13:00:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Oleg Nesterov <oleg@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Spickett <david.spickett@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Luis Machado <luis.machado.foss@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64/sme: Support disabling streaming mode via
 ptrace on SME only systems
Message-ID: <8e99cb8a-cc9b-483c-9b71-22fd640cc1e0@sirena.org.uk>
References: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
 <20250820-arm64-sme-ptrace-sme-only-v1-3-f7c22b2871f8@kernel.org>
 <aMvxkzg_LT4C4Quh@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bvjGEp7kODe4zFUz"
Content-Disposition: inline
In-Reply-To: <aMvxkzg_LT4C4Quh@willie-the-truck>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_050042_941300_798F7BA4 
X-CRM114-Status: GOOD (  13.37  )
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


--bvjGEp7kODe4zFUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 12:48:35PM +0100, Will Deacon wrote:

> It would be good to have an Ack from the userspace side (GDB?) so that
> we know that the minimal ABI change you're proposing is sufficient.

Yes, we need confirmation from the userspace side before this is merged.
I've had some informal feedback from some of the Arm people that was
positive but they needed to do some more thorough validation, and we
need feedback from people outside Arm too.

> In the meantime, I'll pick up the first two selftests as they are
> independent of this part.

Thanks.

--bvjGEp7kODe4zFUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjL9GMACgkQJNaLcl1U
h9C86gf+OjW6SC1j2hLmMmr8tVWsSjMpw6sm0E+0BYO1sNqhyaVpq7tZ480kgRuG
Zun/blkfFADtOYns4v0uejGuAgUPZh1rUd2PPsrpJXCgzIZ8l7ybYHSNcDp+O6sv
4tvtC63ooo4Hw4so+ldcrx790Wm9hQbtdcCbCLrnr8E1mStPjGevJ2Dl4oczpS9Q
59XgVlzbsimHPb6DgRPziNyjo/k9DGYMr+BRO/Ysqq5LLNde6X1bT1gpozjytV+h
UgQr5UcnPjmwgBedNGnhPntpno5xXusX3pp7LH6AJUzWI9G+okL4dMIL91iwhk0I
6vjx6PdurHVoAZHfRnaPgolpi6lnUw==
=BfEc
-----END PGP SIGNATURE-----

--bvjGEp7kODe4zFUz--

