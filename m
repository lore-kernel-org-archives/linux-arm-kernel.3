Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BD7EC111A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/f+dm0UqU6K/29r/WH7byXsDayVcIursKuChjoOWBM=; b=BCvdyliLeil9pxCA+Yw6YTsFHG
	V/U86XB+pU/JQ9kKfpGRKMVc5XzKh2jnGcvkqRCILXsCXYU8YrBbPuPb2EUuYKqC6yT79ELjCjJDm
	tUZ3IalicdBBA4CZravANCXOCLb7RchiToqjPuNZ5OEFOhpT8Ja/F+HtSctADLlv5PQ7hDmRaAy7K
	9wsKuIQRwUeqTqzq37OZBtqHjQEYiJs/BeVvxZF3GyPRPg0HGgBD+Q4UMupcokpSfVUmVhKEzHXtA
	HBVXXNHFYHiSKqJTRydMKFPdKXisImwJ/T0iK4rL9JT9iOf7MKGGl7P88hM3uGb06nrbfuU4eD7NH
	on/HcEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuayi-00000000tRl-2Jo5;
	Mon, 23 Feb 2026 18:48:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuayh-00000000tRV-1RFV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 18:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8509360141;
	Mon, 23 Feb 2026 18:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA245C19423;
	Mon, 23 Feb 2026 18:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771872498;
	bh=X/f+dm0UqU6K/29r/WH7byXsDayVcIursKuChjoOWBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nk5N6epMPMmUFeV7gO92zlDDU1jiW17/DxHL1PgMxdCrvm6I4DOkNV+TY7qWjC6ia
	 THKPhTWyR7Vw84sCP0/sO+Kr7JqFghNcn3Z4yLdhx0X5++68bPffzK5WXMFWzeVHdM
	 Yui4mLXlVjvSYMZKyKLV4Oc3r6CEh0ifLTYQ4Hppygpvtaph6vIZGFu79z1QqlDfOU
	 ojUNG5JllnI4vfwyCtkzTPbi7pLe77tXeRGi4x6C5ic3WSo5WKFSDdkMjPRULTAENl
	 gOBN7hMDSI59rS2VRbfE5VQYj/Y3Ax2PbxkFJHxgFM3xb/1xmTsvU8j31vaAI94D2H
	 gw4c207S3GZeA==
Date: Mon, 23 Feb 2026 18:48:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 3/3] kselftest: arm64: Check access to GCS after
 mprotect(PROT_NONE)
Message-ID: <62e04d63-612d-461a-9abb-35e247c8ed3d@sirena.org.uk>
References: <20260223174533.1478164-1-catalin.marinas@arm.com>
 <20260223174533.1478164-4-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1wjWt0ow4ShAiWdc"
Content-Disposition: inline
In-Reply-To: <20260223174533.1478164-4-catalin.marinas@arm.com>
X-Cookie: My LESLIE GORE record is BROKEN ...
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


--1wjWt0ow4ShAiWdc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 23, 2026 at 05:45:32PM +0000, Catalin Marinas wrote:
> A GCS mapping should not be accessible after mprotect(PROT_NONE). Add a
> kselftest for this scenario.

Reviewed-by: Mark Brown <broonie@kernel.org>

--1wjWt0ow4ShAiWdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcoOwACgkQJNaLcl1U
h9DuLAf/ZJ9ays4xlCj/9P2Xvb0p3dhxOnqKWPFlydYgpgPgruvDOT3/nscYrrhT
4BL6vzHB1nZHCelzyfGaKZQzycACiJBmcpeGvtg7lSEVFWVXvWEEYgj5nskd79Kj
IShBd6mjJkQ34K43ybbXH3wfEb7NJEnbnqVctc1fzq5RvYCVzHuclqb6GMmGJ5yx
Sk43BB1+Uubrc1yQtXMGT/AA9zZroyAIew1o9SaEDcGsxic7QlYGlAfZLPD0cC67
c+TwJiOuH8IgBF724U+6rHjFtDF+GnEjiBr8LLxJ8aRrWJ+MSC6baxuXNzeN1if7
HnrwVJnBNhj2EHX8vjflmkAh5wA1mA==
=tZOB
-----END PGP SIGNATURE-----

--1wjWt0ow4ShAiWdc--

