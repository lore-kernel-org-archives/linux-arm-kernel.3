Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03408D58D72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HchR7eqLEhGdO5syyKmCBTdvwApjTTWJf4CXSLg7iYY=; b=LMHqQO2BshMDM3l26/7vu6766/
	jziEOD6AQxas6CrEYcW7zH6qJObRRpHHoaOjRvD+GXFB8d31jd7jIC3JATtM/1AIX45x7b8qvsbGY
	JJ0tIG+fxUSNcMeg3/bodpIvYTHZronz0f6MEHvlXJa2rGwwpcGMV8BzQDB4/rYs9aIRs6+IF9Ykg
	XvcrGVtUUrHwOZikgwW3mAdX+qQqzINZ3FrZ21FTjQQue7ASAukiLdUB1IE1DR7ZLUzdMa5lkOdDV
	Y5DQblLIKHxJXQWhTH5i1tnnSkZfzOhIq+wy17KHNUygQKs1P/FkxHIyoD7sfkL4C8oyohSCOHwHq
	0ubmy/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFd6q-00000008m8y-3lH8;
	Mon, 25 Nov 2024 17:42:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFd5u-00000008m49-0Gfx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B78175C5B6B;
	Mon, 25 Nov 2024 17:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F6BC4CECE;
	Mon, 25 Nov 2024 17:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732556512;
	bh=HchR7eqLEhGdO5syyKmCBTdvwApjTTWJf4CXSLg7iYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWVhjoTdSNKsn5Lj7hc2ilrvggXa8jSSI+Oo4tgKNpU5RBv6rWn985Ah+cLcEtAWD
	 3/aWfAam33Lj3TfVBYKBLJG2tG8mazASWzVvHaGps3BaxH86NdvjQ6uvqLZm6g2cl2
	 m7R5y0I6xA17vPl0eZ1DNRgbFU79F3An+qlToksJ41ZL5wsMsq7qzwmer8j+LF2s8V
	 rjME5hAXGSdzr7T4OkxVQTZRGFzf1kNVsRNuXo2Xt5gD9TDvU2+5G0i4h1H5J/NXGv
	 nqm65D43x1vqZoz8aTgxb6S1zUgpxGXdtm0I/DPEA8H9jEKpD+sQ5Im24NJGpRv9IZ
	 mctRu3wpTufKw==
Date: Mon, 25 Nov 2024 17:41:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, sami.mujawar@arm.com,
	sudeep.holla@arm.com, pierre.gondois@arm.com, hagarhem@amazon.com,
	catalin.marinas@arm.com, will@kernel.org, guohanjun@huawei.com,
	Jonathan.Cameron@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64/acpi: panic when failed to init acpi table
 with acpi=force option
Message-ID: <bcd83518-8652-409e-b614-30edab6f9b16@sirena.org.uk>
References: <20241125170758.518943-1-yeoreum.yun@arm.com>
 <20241125170758.518943-2-yeoreum.yun@arm.com>
 <CAMj1kXGBnYQi05qh0QZk2hVLjVhS774-nT=HLdL_kW1d7nxMVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHRh/nwM6yH7lXJH"
Content-Disposition: inline
In-Reply-To: <CAMj1kXGBnYQi05qh0QZk2hVLjVhS774-nT=HLdL_kW1d7nxMVg@mail.gmail.com>
X-Cookie: This bag is recyclable.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_094154_144102_2228A29F 
X-CRM114-Status: GOOD (  18.37  )
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


--hHRh/nwM6yH7lXJH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 25, 2024 at 06:30:06PM +0100, Ard Biesheuvel wrote:
> On Mon, 25 Nov 2024 at 18:08, Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> > when the acpi=force option is used,
> > the system does not fall back to the device tree (DT).
> > If it fails to initialize the ACPI table, it cannot proceed further.
> > In such cases, the system should invoke panic() to avoid contradicting
> > the user's explicit intent, as failing or
> > proceeding with unintended behavior would violate their wishes.

> Calling panic() at this point does not achieve anything useful,
> though. Without ACPI tables or a DT, the only way to observe this
> panic message is by using earlycon= with an explicit MMIO address, and
> it might be better to limp on instead. Is there anything bad that
> might happen because of this, other than the user's wishes getting
> violated?

It does rather depend why the user specified acpi=force, it's kind of an
unusual thing to specify on most systems...

--hHRh/nwM6yH7lXJH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdEttoACgkQJNaLcl1U
h9DzsQf+IGMIeshhv77ZAquZomdaxPmEtaA6sYAZAjvbcbHh3BECtKQT594GUARe
l/ju3Ag+xrsZEUqjoZqwdBaI/EZ7S8IIO3syZOz+nEN+sDQ2uyGMNyPR9MkxUWjT
0114DNTF3uc0w+Jb6mAxg8WzL7xK1B59hfnpOomc/wHeAiQeBc49EAViE4eKUYRb
4csUE7hcUdoS9uL5VEt6tbTcn4HWpe8zsM4wf3F1bjzpadmVMIkzWYHDZZULwDfC
9T05CbGuMipEmhtC2OOI5EwOYlt5LHN8CgG+TElPNWV8UzMetEqNGnZ8209SQrav
oi4SPhn+5DSyI5CiF/yvqhNgkha8Wg==
=M7LL
-----END PGP SIGNATURE-----

--hHRh/nwM6yH7lXJH--

