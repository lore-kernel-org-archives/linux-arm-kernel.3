Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABEFCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 01:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=av3oqOvtB2ThwjD67LDV+aOPf/pCLtIRK9+HfjgV6Tc=; b=mcBS61Kza4wo1poVbGBcyee7Qj
	6vwj8qKgJbZP7oSgRH2Yi1UX1wRsPL+s22qc5Tg4ob6q4MjJpWg6JNBNWiumqeh22M/sy7GCNN2VT
	+jDqnyjyd+klhRJyAIaCxRNrovwQwgMyug0t3Eu71k/su7AtKUB6fRqrphcLYHlyFRrszFKn6mOLN
	oIAxyLalsY9DcjLg99QWM2ukdSSo+KpVhMJHJXVdWKq8aHZAL56JHY5JHkjIhFUoVMoA+CxbOLwVQ
	Oter6zBMyoRhxrlbs654EK8uYW1cjDu10nr0/7o0Fk3kg4wkEOczMk3sbdGTCjTE/CGaj1e5k5lE+
	aBN+uiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uou1m-0000000FRSY-1ZgN;
	Thu, 21 Aug 2025 01:23:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uor4B-0000000F47d-1uw8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 22:14:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 851B844618;
	Wed, 20 Aug 2025 22:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093ECC4CEE7;
	Wed, 20 Aug 2025 22:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755728037;
	bh=723mCQUWr4vd81W677iTRLHJxWJWtzlIUtHlOa32V2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSwEfGU/YJrPF3PALBhfdolw0CHUjRu08AInSQfl2oOFBo69/fuTXpzGZwvjoaJdB
	 rQYI4nMpqDfU9sxX15xmXjazClgIP2wxPYwwNa6I0VCbVYMGpWY/PEqRV0l5UXVrs9
	 U+Nci3ttrnIrMHvMkF/mWu3GjYDDzWJ94MN16eC6x3t+P6XGjoBLVQMsA9yU3e5Sm7
	 kPZHWAGTE1vGTiscwRLtNeTW/7xBYsZValPSquuhueO9073mlb5tWJW20d9g/AmkO5
	 bWu3H1/p9uEmQiEOvmob4rT6gGAGpSJ6Is7CdXGrvAwEHi/pp/xZCSHYBKLXZP8piE
	 NO7XFUVIJnmTg==
Date: Wed, 20 Aug 2025 23:13:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 2/6] KVM: arm64: Manage GCS access and registers for
 guests
Message-ID: <6ea4127b-813d-49b0-9922-b5f298ca5f0e@sirena.org.uk>
References: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
 <20250820-arm64-gcs-v15-2-5e334da18b84@kernel.org>
 <87o6s9k8ie.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JKL6PMQq5ZwIKYYm"
Content-Disposition: inline
In-Reply-To: <87o6s9k8ie.wl-maz@kernel.org>
X-Cookie: Whoever dies with the most toys wins.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_151359_517008_6CAE3CF1 
X-CRM114-Status: GOOD (  16.74  )
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


--JKL6PMQq5ZwIKYYm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 20, 2025 at 10:06:49PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > In order to allow userspace to control availability of the feature to
> > guests we enable writability for only ID_AA64PFR1_EL1.GCS, this is a
> > deliberately conservative choice to avoid errors due to oversights.
> > Further fields should be made writable in future.

> I'm not sure what you mean by that. Making the feature field writable
> is only allowable if we have some level of support (and otherwise we
> should prevent both the feature being exposed, and the field being
> writable).

> So future fields being writable will only happen when the features are
> fully supported, and only then.

> Please clarify, or drop this altogether.

That's bitrot from earlier versions where we needed to enable
ID_AA64PFR1_EL1, the other versions were similar.  I'll remove these
stale references.

--JKL6PMQq5ZwIKYYm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmimSJ8ACgkQJNaLcl1U
h9ArWQf/eQm5fVrMcWS54gUdtfiVe/qKLMrda9FKLpovpB8GsKqKDBef8b7Mo0GZ
wv/jvtET+UErD1lSyfeYcMoKrjKryCkuA9/vbNs+pB3j/wo9/DS11IgYXyj+fy/h
EpFn4aJieXOnKMBAngpXM3ZcSpio/ZPVASw28Ux17L8gfmYcLmAgNC1XaxD6bj7x
+IsTvk7ekqeUGzFYeZVZetm76oozpkKRKV3N8X4d5YfPukP83y8HrDKJZp0yIklF
+tLpcqGjMgmEb8XMWdGNY5PwHzPeQou/Dx4Tn0+lilEJV8vOZDyJKSHeQDvjeZnV
EVWu21kCgBmxXm8RxEmGCalLJpYV3A==
=2ze9
-----END PGP SIGNATURE-----

--JKL6PMQq5ZwIKYYm--

