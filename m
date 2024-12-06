Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBEBE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gs2ec38XFPz86Jk4Qi4EGjPA32125hNqYFYzOizGgA=; b=ds7Cn0zV+GAp57iByMyjRUg6ev
	4ziFf5BX0cBoiqw+J1WGn+LzBp5S7NZ6dD76m8QvYYsHX8m2ca9rNPpZSYoUKZ97OpP4Cvm40BGH7
	xsemyGe5vrDvKN2VhZ6wY/xlc8ZbW9bbYuibqR058IiY/L/XqPcf3I3wvc8eO6J6U17e0W5mITQUS
	q+TEyCiQrBf4M9ZnpkHkygZXpm/zJOQQh8rw9zQHxExH6MAb5ZVk6VGttSTFpisq5jkQJeGIbai2H
	5PeNzvFfDIkceDXrU6Yr+gkQ+g1rudmRovanD4j7DmTN42bALRYnuMWyTfC77vUwk2eHqXd8V9r/+
	iCrlBaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcNp-00000002NNr-2HB2;
	Fri, 06 Dec 2024 17:44:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcMn-00000002NJ2-3AzA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8BC9AA41D08;
	Fri,  6 Dec 2024 17:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEA8C4CED1;
	Fri,  6 Dec 2024 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733507028;
	bh=m36ms2felAIm8ttAb0ORtpc8vmNP200R40r2sWRfe6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZXDzbVvYAfO1SbeJe/TLE6CMGABko/B1N+zOIs/vX9f/jOKXNSmLyrESFHJ3Lzq/
	 S6z3Ln/Sg3f2Vkwk7Vx+EGehY5smJgnxQaqjDMjOjGz91Y8qnCXpREmvhauXADpA+B
	 6WAXrsk+itZqusmlmcR/pzWdapVbT2kthDUvDroOmpALoFq3SXjaiRjSAZaXNG29rE
	 Dpsl/CIZEtEnoRMf86D7rm/moNHFik6BGNsbQfxsvfzY3ab0SNh13gnSbrr9rbnQFJ
	 3Hneqbu7YGavvxZgKe0N04fhjeVqgrUA/rnZf8bAOIGrJk8R49nRYTtNAwwgT6o+Zl
	 Dwe9OFYWXHLRQ==
Date: Fri, 6 Dec 2024 17:43:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, james.clark@linaro.org, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, kristina.martsenko@arm.com
Subject: Re: [PATCH v4 06/14] KVM: arm64: Set protected VM traps based on its
 view of feature registers
Message-ID: <70992791-af72-43ed-88cc-1bb5a8acaf9a@sirena.org.uk>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-7-tabba@google.com>
 <Z1M1DYbvuqAEU5c-@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4iR098i89+hFApT8"
Content-Disposition: inline
In-Reply-To: <Z1M1DYbvuqAEU5c-@google.com>
X-Cookie: Sales tax applies.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_094349_861389_82146B67 
X-CRM114-Status: GOOD (  12.46  )
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


--4iR098i89+hFApT8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 06, 2024 at 05:31:57PM +0000, Quentin Perret wrote:
> On Monday 02 Dec 2024 at 15:47:33 (+0000), Fuad Tabba wrote:

> > -	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_RAS), id_aa64pfr0) <
> > -	    ID_AA64PFR0_EL1_RAS_V1P1) {
> > +	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {

> I'm admittedly getting a bit lost in the kvm_has_feat() macro maze, but
> should this be:

> 	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1))

> to replicate the existing check?

kvm_has_feat() checks for a value <= the supplied constant while the
existing check is just < and the values for the field are:

UnsignedEnum	31:28	RAS
	0b0000	NI
	0b0001	IMP
	0b0010	V1P1
EndEnum

so they're both checking for the same thing.

--4iR098i89+hFApT8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdTN80ACgkQJNaLcl1U
h9BWPgf+IQiyhQrKBJvuASNYJ/HHdApW24+9RZSV8wxRm63d5lAl4Wl5Mh78cHTL
P9yv+xL4VRJ34d9S9Vko6160kelDqIf3oMuyEJYMluKpGEy5L7fazjPdusj3CrJP
3moUCZDvr5TvJ64mXXlTyU9VKsC2miihqrnlPO0siYsWP1ZrmvmbzS6rSh7dZceg
W82rM4+3wTQj+hAzP26UHRRPneo+n8prEb/qrZ6eHjCYkKQdB3usSyBwsvOdRebR
GSiXe33WBxpgL2PYc8sNM53Qc5jir2U2t2ivinp9wpNQHzzAfibP94h/s7Z0rRAa
SgPzixBbmLmWFsOHYwa5U0IcS+5uVQ==
=+crv
-----END PGP SIGNATURE-----

--4iR098i89+hFApT8--

