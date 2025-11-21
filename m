Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B230CFC27E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/x9XVW86+2s3jlErW1DxxYPeq6kQMcfnJyAcrji943s=; b=tMqzKkIf622ubkdDtjPtyWcsZm
	S3sCpIYUIEccGazM76t/9VU3sgJsnPXfaW+K6LWc1o7QbirriufSoA6/ULzZfJKgJU7zZmRTQeH1p
	TMAsyxAaBhzJ8s4KaOfu+1HSwR+FCf4e3iBUoHJ8fnJKKQFzEm9FDFlqx6j/QZxClYuR/jNchrp0J
	ACku0qdEQewI8R+O/FyLtiAZ1Nx6NMwaayP0fofxnWmjp42jVhF4Iz+oIHCOyJ2nzpgT7Yi/LWOod
	EELpPJEY05Ogt4XrMxvZfYKRwTOilH368jTIc3M9MgYaK/qlqPVAuwmkhtYiffsi+0WhJpQjJayNq
	b3l1ixag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRv0-00000008V8d-3Vho;
	Fri, 21 Nov 2025 14:15:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRux-00000008V8B-30ch
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 14:15:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3762602DD;
	Fri, 21 Nov 2025 14:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1FDC4CEF1;
	Fri, 21 Nov 2025 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763734518;
	bh=/x9XVW86+2s3jlErW1DxxYPeq6kQMcfnJyAcrji943s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RO9KnU9BYDkrKXGlvOl/ypTyhmyvako5YfbMggcazRk3FQXuUavtIkMQF8Uzd+VaH
	 dmxHSq+Vp4zvq0nPr43OM/w9P9aLT3BnDoTX2N9EARRVzW4qWJc4LgBgzluILdes0+
	 RWspvMxNecFCI+J6OoYGL/5kcHLwPl5qJ9hh+fi3gW9qMKNgO3iYQ8eCvo45CmHHX/
	 9wL4TN4TO3up41kkVb/XPWmdf4x6jUUq9i6kUuRJw6zd9eQno4AL4VitkzC7lRXDBb
	 AqIvmY48uJSVk0r5Ox9gsNOePiu1DfIk39j37FTOl803KaV9ZxiQjvnNkT0CdQaXwI
	 kUo54IFnjU4fQ==
Date: Fri, 21 Nov 2025 14:15:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v4 00/49] KVM: arm64: Add LR overflow infrastructure (the
 final one, I swear!)
Message-ID: <71adf5c4-5c12-4e06-937b-98fd0bcbd26a@sirena.org.uk>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UQ9PUqRNEd+h0QiL"
Content-Disposition: inline
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
X-Cookie: revolutionary, adj.:
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


--UQ9PUqRNEd+h0QiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 05:24:50PM +0000, Marc Zyngier wrote:
> As $SUBJECT says, I really hope this is the last dance for this
> particular series -- I'm done with it! It was supposed to be a 5 patch
> job, and we're close to 50. Something went really wrong...
>=20
> Most of the fixes have now been squashed back into the base patches,
> and the only new patch is plugging the deactivation helper into the NV
> code, making it more correct.

I threw this at my CI and it seemed happy:

Tested-by: Mark Brown <broonie@kernel.org>

--UQ9PUqRNEd+h0QiL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkgc/AACgkQJNaLcl1U
h9D+dgf/SgfgT62MCWlP6mY9hXQ3y6PsSwyLB38B4n9fZ633Gi7hKM3PCkM6PH8p
YpVOCC8fGV5dZ4x1DDCMGOmHWG57bFXP6RLGK2a2GhQWgCgj1qgERlprpOMsjItu
scfc8/LybvMd/8vw6xH/8hI3IvI4Jo+8K6abypdZ/k7ydwQWT7Y9/6TshxsjPvEB
tqrraYLtiEEVRUyCKMCUToQqxC2+XbQEoIuE+tfW8DBBGW5DEsMWVQgdNvlULDph
8/7OsrIKC2KTDiC3I6y9K7mLdc93ab/nYFiTu4oHxaotp18Wwb98NxAKTEGGY9O9
7P6EGq46SyLAnz+Y3E+YXUIRdFSZyw==
=r/t9
-----END PGP SIGNATURE-----

--UQ9PUqRNEd+h0QiL--

