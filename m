Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FCEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNbGIpTR9ucHUcd+V1m67aWIvcPZWpSvpzY+Npzf1hg=; b=CFBS63tSowUFs/8LJ+oMjdtggg
	qLUltwKADxkXt3j8SjC70vqaFwM0JTauqAkqQTBNBf5WdmcakXe+qVmazh6BCCnFG6QGvP7KpHX0l
	2sLDXiZ40wJLC+9G8Mplgcz2U6wCPAT70bmnxsjOqgkTee5ndpdpedcmyen/V2GZMXeEZSdJ2B2m+
	XU3EgoIm83YDf6FTcPqhfoQdxZ1ocXrD+3hFwE5ZSmmtPFc70aoWSa52Na9Fo/V2JRKIQs/28W1zD
	c0CnvULyIvR5HId6YDtpko/qMn1PirNeL5ep2XLMHcvD64mHTSbrkZgUPtf+i4xB2IHLGvwUgkSo2
	7i74JBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXOK-0000000DWpO-2dLF;
	Tue, 17 Dec 2024 13:13:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXN6-0000000DWPA-2U7D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CEC65C6491;
	Tue, 17 Dec 2024 13:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FC9C4CED3;
	Tue, 17 Dec 2024 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734441139;
	bh=NNbGIpTR9ucHUcd+V1m67aWIvcPZWpSvpzY+Npzf1hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpysCSlePkJabnerFbvi5fPnVnRCsBQ/1bTUFJu8J4tWaWLIviqnLkqtPGY6BClp7
	 nahp7nmC85UjUJ9P2M8BYeG84EqGfgYEi2jbLHssRRmDUVM4+Oqrc0j8JVEluhUsoI
	 3bQaU4ZAvRCkpglFE8vnsmETULygZTss1raEhiHx/50+3nt2euINfS2/Yd/NalvkL5
	 EHyCKQHLQ1KzinISRtBB4CpkvKBRsaZX+1+n3uEOQD9QSSsYvjgCx2Y0p6nUh0miIv
	 zBFRkVLFvjwPVYG3ac7TfMN2pJsfOHVKnkecBCblUKLO9a+AduiIdszSQT9wc6IhJe
	 RLzpoYJwEYvNg==
Date: Tue, 17 Dec 2024 13:12:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix set_id_regs selftest for ASIDBITS
 becoming unwritable
Message-ID: <53b40aa8-f51c-4c4e-a4ad-e6a9512e5197@sirena.org.uk>
References: <20241216-kvm-arm64-fix-set-id-asidbits-v1-1-8b105b888fc3@kernel.org>
 <875xnisocy.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dtQUalAAlROS9KmZ"
Content-Disposition: inline
In-Reply-To: <875xnisocy.wl-maz@kernel.org>
X-Cookie: The sum of the Universe is zero.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_051220_676703_F48CDDC7 
X-CRM114-Status: GOOD (  12.36  )
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


--dtQUalAAlROS9KmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2024 at 08:30:37AM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > Fixes: 03c7527e97f7 ("KVM: arm64: Do not allow ID_AA64MMFR0_EL1.ASIDbits to be overridden")

> A patch for a test doesn't fix anything in the kernel.

The selftests are shipped as part of the kernel source and frequently
used for testing the kernel, it's all one source base and we want to
ensure that for example the test fix gets backported if the relevant
kernel patch does.

--dtQUalAAlROS9KmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdheKsACgkQJNaLcl1U
h9ASOwf/S1R7+IQSKi6x5xNzlJGe1wq68D6eyCvxwgq805v6KbH1QY48zzqkVGtl
PlLhzdq+yIrf/DZDSmGACc323zLxZ28Arzca7+suyV1hNjJWtOEqktVZmgZCerrH
ghLZlctH8YxaGc7X8OD7IrhE6js2ZmJu3+A0vhj5355BOKxR+PuWAQo3hkAvpZxb
uk1rN/58DEIEOkX08nDV6YBAQzAHtzy1asI5EoUxA97gqWiLbVdPL5iog+owQ4Jr
IDM5VdwYPZOLOqiLRhEzBTxOY030BKwXeh1bzP40JlyFPcJn60Lrqa49Rz+eLaeE
l72maJr7HKHCyM419K5Seww9Byak5Q==
=eH+J
-----END PGP SIGNATURE-----

--dtQUalAAlROS9KmZ--

