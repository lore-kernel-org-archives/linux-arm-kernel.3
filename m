Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18128C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuL6duWr+CYzX2VNv28Ah9jjzSSNSLqAkLn62+Nh1qc=; b=zd5DY5cWKcn9+6RMkWtju8bQAs
	ylflujv/3Tu5j6pWExY5DNslkDFAGa82MqXsGrQklZnNrcN7Xcs3WvDnENWeDl6dylaxf32k2Figd
	N5waeJx/FNyWo6qZFb2HU9ahZC9GQjO3QrlJOMtArXuy+s+JoJBX601uVFa1MtbnmhH3VpQx2e2TO
	R65uMeX+LMga/ZA+K7au4fVYngAqbhrhI+WENg8hduMTKzmPvH4uUmjiIFKq3ES1YsZiJcG0V+ETy
	7vq2K/lIqthMKFlOr4ZFOpMU9cxV6RuqPQ1YP23PPJP8OreloWwMnwhUemvF+OBLguKHdpF4KYtIW
	HKnFklvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6qO-0000000BzGU-01Sg;
	Thu, 20 Aug 2026 17:46:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6qM-0000000BzGM-2YuY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:46:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C848560A58;
	Thu, 20 Aug 2026 17:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650FF1F00A3D;
	Thu, 20 Aug 2026 17:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787247981;
	bh=IuL6duWr+CYzX2VNv28Ah9jjzSSNSLqAkLn62+Nh1qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sgo4pIwThzrHFDsns964yrkniMujs5PZApj4wsrhwvpaMUaaWUrbO30PuBEkq9Qg+
	 +aTPa45D8Xp1NZX6rxPbxC9HO5u0pihgvOuvqmlhZaDuMayY+uqAKfUneQBEfUnzbr
	 Se89N4zlfh9chg9Du3nBwigNwHQaLS49vvIqCuyAbdzVDBx5x8ZLcNNc07Arz2tnQI
	 i5XLX5qcNpm0CmrPmMZ0vKXFHnVMuI751MGLZjGUB5GknRIQfrcgGEb1fmbdO/8Gow
	 LB7MB6EGiAI8Njq5ZUgRchO0J2+LbBizsJNkbX7FlAYeIePcFr3QIQO8S00oYa6fu8
	 F50xjqYJ5cQtw==
Date: Thu, 20 Aug 2026 18:46:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 05/14] KVM: arm64: Set PSTATE.EXLOCK when entering an
 exception
Message-ID: <328346e2-3ace-411a-87ac-31d4d71fb66a@sirena.org.uk>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-5-9105afd828ac@kernel.org>
 <aoczkgxXzqtotl9G@LeoBrasDK>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xPTUhSm0fjJwoIXt"
Content-Disposition: inline
In-Reply-To: <aoczkgxXzqtotl9G@LeoBrasDK>
X-Cookie: Do not try this at home.
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


--xPTUhSm0fjJwoIXt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 06:04:18PM +0100, Leonardo Bras wrote:
> On Wed, Aug 12, 2026 at 08:12:04PM +0100, Mark Brown wrote:

> > +	// PSTATE.EXLOCK is set to 0 upon any exception to a higher
> > +	// EL, or to GCSCR_ELx.EXLOCKEN for an exception to the same
> > +	// exception level.  See ARM DDI 0487 R_WTXBY.
> > +	new |=3D compute_exlock(vcpu, mode, target_mode);

> we have here, instead (naming is bad):

> 	if (is_exlock_set(vcpu,...))
> 		new |=3D PSR_EXLOCK_BIT;

> this way it looks more like above sets, such as this one a few lines=20
> earlier:

> 	if (kvm_has_mte(kern_hyp_va(vcpu->kvm)))
> 		new |=3D PSR_TCO_BIT;

> How does that sound?

I have no strong feeelings on that TBH, I can see preferences either
way.

--xPTUhSm0fjJwoIXt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHPWYACgkQJNaLcl1U
h9AwsQf/S3inTcyT1hgfbbryNePusskL/mmJx87RtuQbYbRy7diJF/0tJ9xVra03
qEGdF968NEAo0tQ3c8ufBUdLaeeHZPdm+rnaDMLJPGGj1O9Bj1scUrvA2oxx7oLt
jzTSO+ZFh3u3518O/QyUApNibBHtJdazfSZfaBkOFUcwJZN3QBO6hhfNKSlCpD1/
OYNT2Y5yuhgdIgWgCDKwH5K+Cd1PtvLt4cFqT5T3slwMcPiAtU/eCZZv96Wgu+Qu
O8+7FmKmryrXBmmHBr36WzkzsOskNyZ6FOzvkFN3zokCEoHcZm8ZKJtE53pxIU9p
uTqNNqstrEWAcMGEmIdNGRkhZopBWg==
=Ma8R
-----END PGP SIGNATURE-----

--xPTUhSm0fjJwoIXt--

