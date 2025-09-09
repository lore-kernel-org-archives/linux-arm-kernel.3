Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE15CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UlYFlcxhjTJEdD3iSUR6EuiT+UanfbOHPAakvdwWCY=; b=JEGAC3LGDa/JRmBOnEIcouCCox
	OusBC4k1aCzjNcVdI9LeGF2xVvnsXyUyXCvqWmvyJ/UPOu31vG8yEQRSo7W9hU0C2AO52EcTRO2H6
	PadNBQ8tJdOswtkAh0ctAaqJpYvF0Jp/JOyA09nuu2yAVhbCIqdEllVvMRWWj62Qwok7G9ZdASf5+
	MxiSfSbQ6OLfkdPWFGrFOros9RRg/GvQrG176vLCdBjQqVN3agrpI4NGxNoIaFlkxnbZmizl1S3NL
	2QkCyYjKuNkf2AYzi+E9vaBGWVUCp+FgeRQKonhUwfN+NwCMVHXzAkgZ/F37e5IAZK3JF1TL8htHI
	jtXk97Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5i8-0000000AKYM-1v3K;
	Tue, 09 Sep 2025 21:17:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5i6-0000000AKXt-43SW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53ECB601F0;
	Tue,  9 Sep 2025 21:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A87C4CEF4;
	Tue,  9 Sep 2025 21:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757452626;
	bh=wqTbrEtUcaaZKtYI4r3Vm9Q8FnxOd4Fnxqf8dwa2ri4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kogutVuxlqUsh2U+p5ULajqFEYQj1kyC+8BEHJzkOo4T0ba5gwae2U6SCcmwg/wrD
	 qo/DoaDvhZnyyJ29/7zPEdqJ8wk6fpwKdoXJbNNimyEr1YZFHzlNwZIfj/fACfkja3
	 VLZVwftv+Hcj86iAhqW/8jYFw/ufmEnTIRt6SXac0pUOP5Qb81OVp8TXXvZnQGxYen
	 xB4rbETCMfasnzjGJW5WnhSioz0WDy7/cslM15Bn2m57rwerL4LM1DynkOSqkZ7UAn
	 8dqjgd1eeLuu9jdCI5k3Nd1/uVKE8m3IzET3/z/gClfhUnH6v662ngfFE5DPpqXOu0
	 08XwFWsyEyxeA==
Date: Tue, 9 Sep 2025 22:17:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com,
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Subject: Re: [PATCH v4 0/9] KVM: arm64: Reserve pKVM VM handle during initial
 VM setup
Message-ID: <5f26bc44-8bd6-4b98-af1f-0af828df9a4f@sirena.org.uk>
References: <20250909072437.4110547-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XMFfmpfGmrVEKPJz"
Content-Disposition: inline
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
X-Cookie: Ma Bell is a mean mother!
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


--XMFfmpfGmrVEKPJz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 09, 2025 at 08:24:27AM +0100, Fuad Tabba wrote:

> - Fix bug reported by Mark [2]. The existing call to pkvm_init_host_vm()
>   wasn't gated by protected mode being enabled, unlike the call to
>   pkvm_destroy_hyp_vm(). This imbalance caused failures in non-protected
>   mode, especially when creating and destroying multiple VMs. Tested
>   with kvm demand_paging_test using nvhe, vhe, and protected.

I fed this into the testing that blew up with the prior version and it
seems happy this time so:

Tested-by: Mark Brown <broonie@kernel.org>

--XMFfmpfGmrVEKPJz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjAmUsACgkQJNaLcl1U
h9BIwAf/W/HLf/BuWBlLw2ke8IEN1N6vfqr9YguXATzWTFzruv/nEqnHXlSKA6WL
sguYK+Erg+Or2zTKvDDFo41gU/7nxfpR9vS5HKpqiz4LwTD4XJ064aYvhZT3WJzA
OPDAKLz5t9dBd0yDrWLSsYHBU/+R8RriWlydK7iwe2Iu7/xXE6GwOJVfEnIkXGH1
YeC+QCHmnD6v+Z58iSmRBPiwTO7kD4e8dJeYAESvucQRfDR31TStlpDC5RmGqjFd
RwXam4U1pMsWqtHOi6HsZbIlcDMQlKqqIDILajVb4JtPxGcJu4HgB6sKfHyrY7rq
r6o16HtoDGVxCfoLs3RsTXouM1NQbQ==
=ipmk
-----END PGP SIGNATURE-----

--XMFfmpfGmrVEKPJz--

