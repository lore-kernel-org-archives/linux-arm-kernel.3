Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C6FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi/UkauFoiUyMGIBZ2owYvF+yBK4Cu7F7Jc1eQUSTtk=; b=cKh+kRB13ueHsVNK4ulRgZzzx+
	cGJ5ZhLf4MLNG6BqnBiYaVsxiAErEAqXnu77laU1TsmH6Y0y+02R3LSsprOAuK2af/6tfTYZ0WPGH
	rES8qj2dJEcZ8mjtzbxvRfTXETD9JdrJHELViLAUDr4PfExEyDncQFtGpje71Xf9HoZDUVnRKDPuM
	4qZnTweyMuhTI0YDNrv2oowTQy12f/9xI1iTQXepHMt+GiBpQ+pICkRfubhbGZsRzp/OWHUSULLr5
	/CoH+LvV/fDLcQjUCvgzqDQYGS7hrhG8IpebFmSR6YD3cT4hzR3wLsEYJnaF2S2o5n3q7OlfNPK32
	OvhyMk9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0leC-0000000CWKe-2oPb;
	Fri, 04 Apr 2025 18:20:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lao-0000000CVx7-1G8R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 18:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CF855C4B1D;
	Fri,  4 Apr 2025 18:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56A8C4CEDD;
	Fri,  4 Apr 2025 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743790597;
	bh=yhKkiHtrlRMjBORbkVfYWwrVgTyZFMrofYpiCelLA54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0CqueeFcdocBJG/qjPc0M+EiNDR4JMp+EAVBQEy1jmlQHySUxBAxGNNyYjXIlZ46
	 yogNVhhniaX8t1h9wb80KFrpAL7nMWqbQ9x3QwvC3oqlMUg3Jy99gnENP8l+C4bRe2
	 0HIOAClv7W4iPrLnLOBQvU29yA0jg0oKHmEpj8C/20APARApnqiiXCPw9GqKWoYqF+
	 HMAdTIARu4KH7mX6FtXUCL6q41qREEUDbReMY1kft+QzWf0KriuPuYZ6Hq2T68Ezu9
	 GphAAysjdzpCJGin7R7Bqp7UrlPCUKR7dDbuv0fGRnn0NO7mntp7pnw+iQG+aYetYS
	 h9XBM1kO1pq2g==
Date: Fri, 4 Apr 2025 19:16:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 04/14] arm64/fpsimd: Remove redundant SVE trap
 manipulation
Message-ID: <233f8895-3c74-49c0-9773-f722f3e9e4fc@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-5-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TbWElppX49OyZ5eN"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-5-mark.rutland@arm.com>
X-Cookie: You will soon forget this.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_111638_385521_1D7389FE 
X-CRM114-Status: GOOD (  11.37  )
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


--TbWElppX49OyZ5eN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:25PM +0100, Mark Rutland wrote:

> All calls to task_fpsimd_load() are followed by a call to
> fpsimd_bind_task_to_cpu(), where the latter configures traps for SVE and
> SME dependent upon the current values of TIF_SVE and TIF_SME, overriding
> any trap configuration performed by task_fpsimd_load().

> The calls to sve_user_{enable,disable}() calls in task_fpsimd_load()
> have been redundant (though benign) since they were introduced in
> commit:

>   a0136be443d51803 ("arm64/fpsimd: Load FP state based on recorded data type")

> Remove the unnecessary and confusing SVE trap manipulation.

Reviewed-by: Mark Brown <broonie@kernel.org>

--TbWElppX49OyZ5eN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwIgAACgkQJNaLcl1U
h9BbOwf8CkDJeOYjMV4IwhIguUX+KyVaVM4z4Up0apznl200rNXtnGzq2BsshQnD
dVdRkOYuhBuhzT/nIrcLRJHkcWOeePVbqySrHdMunxPvMkogA+nAa5vYdms42tqa
CUdDU8nXMBXnPhZFjYrofJL0D7b2sdGj5yv+5C5EZGNiYQwRbZ3y62T91Jko0jsu
ezNXp/zYpsxWos85CXDu045oaDOB5eJA/hzyAqDKFsW4+bqCYUIC52ZSLDbtJdYh
Wa4KXTt96+YZUJJxowW2ZFvQEpdzZVFKK++F1ab9fscSSkv8vZC7y1ernjMB8MDS
6Zn2+RVItO0SJ9ArdXX+UyaGNnw8uA==
=DemQ
-----END PGP SIGNATURE-----

--TbWElppX49OyZ5eN--

