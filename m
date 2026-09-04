Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E87C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA6Z2/LU2nu5o8uMhRKWPli4CzL+4jTmOudkvcs6Nvc=; b=aJ9EzKJbbFMakBVhsnMHhI2LQl
	t1j9o4O3Xg9kpzLhehdccj8tzw3y/fCRVAKPYwx/pkH/EhRwGnOlek5dX1AkKks7YtLrKQf8zPovk
	jYadZ5UYHxqanjSlyKXkQ/pyfY7bTV5fGOuITI/ZPi31yE07bTZ6mbHoYmEcJCTQZz/rCXQDvyRe0
	u8vOH61mQdb0hLMNO2NJgASyHKOJFM+g8VOUAaoVNewVEB9K89OyCLCOwIacM7qAlf5W7PczpWfco
	bGQYe0mW4DG1poPGWUT1IOcg7ldoKHJzmFMQ8DGGpnZQ7MjbrqLVXGCUJ3BLFk4jDkpG5pXUhKaIg
	4O0Eehtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2REi-00000001fz2-1tf2;
	Fri, 04 Sep 2026 10:33:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2REg-00000001fyc-3viK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:33:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE8FB6020A;
	Fri,  4 Sep 2026 10:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323F61F00A3D;
	Fri,  4 Sep 2026 10:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518009;
	bh=KA6Z2/LU2nu5o8uMhRKWPli4CzL+4jTmOudkvcs6Nvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kFuGwZ4htkAaxQDnVGD3u1NcaOHnoTNSbBzIBHfIMlM/r81LttdcFdSdVzog56lgC
	 F4LfKaclWVS6r3c2xzyeHkHtEQs6HlmLKPN3ypnJF7sNqMavkmSuBFAOF+eyT50rR3
	 YtOnugjv7rNuykj+n4ws9+JmNHXzHUPIc+5qLfuYwMaddkG21QUsqJmI1gTmuDZel5
	 7YYHe7FyCz6n6eSjUXRsKbKBAYF2vwPhgJbWspmLOa3zK2RbzQDA81OGjfrlneGgAh
	 o1qV/uUMw7SqQNOuPxtqYjbSGAXaT7DR7xRkJiyt/Kvd8zPsOpJNLhCjWqS4xyqx5q
	 O4YjNEQ/ZFv8w==
Date: Fri, 4 Sep 2026 11:33:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Enable S1PIE for nVHE and hVHE
Message-ID: <eb788ad5-5bb3-4767-87b8-d35d9e3ab220@sirena.org.uk>
References: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
 <20260904-kvm-arm64-nvhe-pie-v1-2-29d59f245e6c@kernel.org>
 <86pkyt4gvt.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SRGhXbx+xRQ2WZrs"
Content-Disposition: inline
In-Reply-To: <86pkyt4gvt.wl-maz@kernel.org>
X-Cookie: A is for Apple.
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


--SRGhXbx+xRQ2WZrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 08:25:58AM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > When FEAT_S1PIE (stage 1 permission indirection) is supported we
> > currently enable and use it in the hypervisor when running in VHE mode
> > but not when running in nVHE or hVHE mode.  While systems with
> > FEAT_S1PIE would normally use VHE users can configure them for nVHE or
> > hVHE, for example in order to run protected guests.  Enable FEAT_S1PIE
> > with nVHE and hVHE.

> No. nVHE is dead, and I'm not adding support for random stuff that
> appeared over 10 years after v8.0. If you have S1PIE, you have VHE.

> If you force the kernel to run with E2H==0, that's your own problem.

What about pKVM, my understanding was that that is very much an ongoing
concern and uses the nVHE hypervisor?  My expectation was that this
would only ever get used in hVHE configurations when people enable pKVM
on modern hardware, actual nVHE mode was mostly just carried along with
that.

--SRGhXbx+xRQ2WZrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqannMACgkQJNaLcl1U
h9ClCAf/VHBLEA44WZBa2i3kDIYbv8kQYBTPQtGFRc4TgF8ppyYGd/1uG1a4oLwT
OnnTBuAmQtfxIYsQaUpK48EjYRr+nqWVn7prOwftXyzvFeNaWchCJwjYNMjfndHc
qBQZkER5xOLeQ52Np/XMF0UarDT0VGkZinLql+a6bVd6VEYiYsvCH3dUs6GQ1ACM
7+XetScfgfE95q1hBBiwz5nqaNWyrPE3omzHq8yLZ5ZVDG7S7QcG8PUsBrRUKmFb
ppwT6bR9zQwshxF5OBkfp7uKA9t6h2+ueCp8LErLEx1KyiOy63w1TSpkCgKxyuMw
n+x1qZTqmQx95z6mQSHoijN5M1/3uQ==
=+aEE
-----END PGP SIGNATURE-----

--SRGhXbx+xRQ2WZrs--

