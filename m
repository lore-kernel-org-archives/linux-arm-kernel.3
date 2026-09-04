Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BD7C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUcbjHtpqvnR19LCMXErt3m2uz8G1CLJI7LE3hWN5XU=; b=kS5c8mcM/t/+JvfZMZmW4h6Mmf
	LdJia/m9vThKxiq8te4RMsLPjn6B5rUuD+TawfVef/4CpmlCbfWVI7HKXPJoRGTqyPTr+4IJ/cdiz
	UCcR5dIXAI3nWrJn9NlpF/oIiuvcj2vUfu9joN8ykyJY4gkzrRQUrEed2Htx6qXdnO50qXbFme4Ot
	wqtZVhOzwrXA79ZLH5o1DuNXJX4uVziu1oHBAf6zb5VmtUHkCcXWDkHsfu2KD/rMH+XeRqgdtEcLv
	h3IjPkfWXWMxuLDFBy+3OG2z3rEpAWLxix95hRLOfDzGUYzoNN9MDR37H2g/IZH8wBR4oYJj4/yWY
	h9b6YXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SCh-00000001q2L-42TD;
	Fri, 04 Sep 2026 11:35:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SCe-00000001q0m-30gv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:35:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D03AA6020A;
	Fri,  4 Sep 2026 11:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FE01F00A3D;
	Fri,  4 Sep 2026 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788521727;
	bh=ZUcbjHtpqvnR19LCMXErt3m2uz8G1CLJI7LE3hWN5XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f1wNJMQZQpaMfwMSt//b2NK3WwCIF4TZMpjRTGg86K+QO2giKzdQqV8WoJsL94oJu
	 rpuG+kw/6Ra5KaTiQQiQkfHya4RIKSKzat0qJbtukFyqBHyj4FQ983QB8FiamymC2E
	 9li4sTEkbPocDa9gS/GvOYjAoAnhcscFzlTtHJ0JPvVAgKSLtYlB8o/nzJGgP5aHvk
	 Ulrb+7S8n2DX5AobdL6y2EqRclbRRPtovnbEF8xaOAH0fbb0+1YDl5QnqIuTQc+5ET
	 nY70DULvOseupl/HUMwQLQygVP9SN1XZlOjdp0iPrxIi3h0uZ8sJOTEOIUggDaZITL
	 89dSivkNIC3PA==
Date: Fri, 4 Sep 2026 12:35:22 +0100
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
Subject: Re: [PATCH 1/2] KVM: arm64: Initialise TCR2_EL2 for nVHE mode
Message-ID: <d9c3a882-fcf7-4cd3-93df-b0218961e145@sirena.org.uk>
References: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
 <20260904-kvm-arm64-nvhe-pie-v1-1-29d59f245e6c@kernel.org>
 <86o6ed4gln.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uSnjEPzp0Lu0fcB"
Content-Disposition: inline
In-Reply-To: <86o6ed4gln.wl-maz@kernel.org>
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


--4uSnjEPzp0Lu0fcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 08:32:04AM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > +alternative_if ARM64_HAS_TCR2
> > +	/*
> > +	 * Disable any features we enabled in case the next user doesn't
> > +	 * have TCR2_EL2 support.
> > +	 */
> > +	msr	REG_TCR2_EL2, xzr
> > +alternative_else_nop_endif

> I don't see the point of this. The MMU is off, and if the next piece
> of SW can't correctly initialise the HW, that's its problem.

So we don't care about reverting back to users who are just plain
unaware of the register?  In practice for Linux that's fairly old
kernels, but people might feel adverturous and try or try some non-Linux
thing.  This stuff is all a bit edge casey with what we support.

> And with this hunk gone, the rest should be moved to the following
> patch.

I can do that, I kept it separate since TCR2_EL2 has some other controls
in it and people might want this independently.

--4uSnjEPzp0Lu0fcB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqarPkACgkQJNaLcl1U
h9AePgf/auU0op5L5XAarh4ZglS+Q/pFf3liO41gDHvtvMd6TU7icHKGsNte0eXg
z/lPZIM3VvPMiYuwv54MQ41GMD4gltvAGRFd06CvOgSp/4nK7DbFLSh7sANjO9yq
bP9rYA8oD8ZG30rtyDL7cyxSzoYwju1IV+A2OQk/rcgKzY6a+ccKAO9qtJgVo6+H
uWUVEBIchyKHOsCprtnksi6ux/rrcsXTXW54m9EWN05U69za6QB0HtVUeqbyoPJm
y4PLK6MpJ6Dtb5uSpuz522EXJ7OCdm+ykfZturrHz9VjgsLeUH2Gm4tSlud0uGca
ciQnyl3g6k8lftMcfutdVHbVJ85Uzw==
=lvvy
-----END PGP SIGNATURE-----

--4uSnjEPzp0Lu0fcB--

