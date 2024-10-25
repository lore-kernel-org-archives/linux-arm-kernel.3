Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53895D0C613
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcgSLO9Ndsh6+YlbmmV4d9uuj5L/CYMsjacv9xI54Ns=; b=NbLTwQXpXOQ94XZFwtxoPM+8GZ
	jutqZ0fN1r9QkajNtUwu7n368fZC2CEavbTZktkjnJOxVdPbUp3WejbHeHk7DbNGS1h3/Vt2jd5VO
	IvZUIxj3w7OBThh5K+veDvVZ4UXrueXReZWZGxArl8LEhq8bvRVPKnCBxPrIgpezJsz+XjL0q4bRQ
	48AW6/8uxoS7a49IiOvpodgeSa9pDaAoajlbre5GvbYzs/D5ou3nXt31PJg0hTd+ksBeNubin7lxE
	4BqPQRcOVe/68RhqbXYFmTTjYU0YxTHt85hVZl1jHTC4YlAdwa66Ky57Kufxpv2eFPCOyctsv5/32
	gmUa568A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kqa-00000003uZ2-491R;
	Fri, 25 Oct 2024 13:59:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kaw-00000003r2z-2Kq6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:43:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBEE05C1039;
	Fri, 25 Oct 2024 13:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAF4C4CEE6;
	Fri, 25 Oct 2024 13:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729863793;
	bh=QcgSLO9Ndsh6+YlbmmV4d9uuj5L/CYMsjacv9xI54Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZdELT36wIwde8NN0+Vp4FTKs2GYP2xckmgZ6rM7QUL9PIPomICybM+igyCBVPWlhD
	 YqoF+xq5Tmm5CFFUtbREbySlnNP29S6iJz1yKecQFyMEfaSYeX57cYmw9TDZ6E3mjT
	 MZoCGLWx0KtFurD4yQyTQORUxGtT5ApJHkaNrpPj0P+51fNF8+mXHPEAd7jipmhi0q
	 bgGgJdLqEUsJpVMIT8TF+U3jieIPyMDH738ZuG2CFYmhpsgJ/MC+yT1WCJKxTt3vN6
	 fuph75paFpnuTIZNRGyWWSdpgFcpHPcX9k8ZRHlzOtqsZGkSBPsyO5kn03UEjm7Z6D
	 Ju95QRcYQMnnA==
Date: Fri, 25 Oct 2024 14:43:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>, stable@vger.kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH] KVM: arm64: Don't eagerly teardown the vgic on init error
Message-ID: <ZxugaK5Z4_7ula7n@finisterre.sirena.org.uk>
References: <20241009183603.3221824-1-maz@kernel.org>
 <3f0918bf-0265-4714-9660-89b75da49859@sirena.org.uk>
 <86ldyd2x7t.wl-maz@kernel.org>
 <eb6e7e29-b0a8-47b1-94c4-f01569aa55cb@sirena.org.uk>
 <87v7xgtjs9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oaU2WkJ14yfoCs6h"
Content-Disposition: inline
In-Reply-To: <87v7xgtjs9.wl-maz@kernel.org>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_064314_661240_263B1199 
X-CRM114-Status: GOOD (  19.02  )
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


--oaU2WkJ14yfoCs6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 25, 2024 at 02:05:26PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > I'm not even sure that's a terrible fix, looking at the changelog I get
> > the impression the test is deliberately looking to do problematic things
> > with the goal of making sure that the kernel handles them appropriately.
> > That's not interacting well with the KVM selftest framework's general
> > assert early assert often approach but it's a reasonable thing to want
> > to test so relaxing the asserts like this is one way of squaring the
> > circile.

> It *is* a terrible fix, since it makes no effort in finding out
> whether the VM is be dead for a good or a bad reason. In a way, the
> fix is worse than the current error, because it silently hide the
> crap.

I mean, it's clearly not ideal or finished especially in that it's just
allowing the error code throughout the program rather than during a
specific case but the broad approach of flagging that the VM is expected
to already be in a bad state and not support operations any more seems
reasonable.

--oaU2WkJ14yfoCs6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcboGUACgkQJNaLcl1U
h9C2MAf+NELyDRQOR62AbhGylzzEH1W+It446W3mJYfqiES6RyzIoyd/29BoQXp7
5UvyDyrv4lEPvmMFIGOlcloHTTkCIOCsFviPgW9Mwm7/1RBaOomD/mB5GfDkyx4e
96VmsYkg+RfFyVychhYaJBKI8lzDO+9jHL/cwxTBdOADOZZeNrvA2eiv0sLAibHW
PO3KubatGXvf+Oyh6f7EGK1kZeok7MNnNwa3b9Mj558n3LbJXcBoBB0iPDHs0bwC
Dgjl3VaESLv86vexhAN+eIJZDTinTzXJJS5nFF0E4kKzC4ttB5PZ9DlMcUFqky9s
u4Onph+rXiYNZ6uRDoL9+emHnnLfhA==
=F9Rw
-----END PGP SIGNATURE-----

--oaU2WkJ14yfoCs6h--

