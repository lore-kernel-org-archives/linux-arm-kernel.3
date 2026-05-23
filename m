Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891F7CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+ubvDUlSsvQcamv6R6/8JNc1sEXNBLDKT0SjoQyXvM=; b=MkQRypCwKPMIwbsGSN8TJt0ahQ
	SbPLMOFXPb1CsXqT+tJ27MTwgTJOUNBMrUwIEmFxNscqABu5rQLXmnyvA+vy+71bUkuE1n/BLtB0d
	zeL7X/ksf6qCZPQTWfRPQSo0iUgJyq4tBhImqLWr9zugktSJbw5MfFrMlIDlz9Kjb/faAv8/qR/ln
	qHBbWO/GFdiK6swGKL1XfLmdQdFxaEdAsZElLo7/ozWCeeUjpI2+qzVZiFkY3HDs1lPcRaJ3MRmQ6
	CTcU3qMRBT7qeaGul3BY5QDZq5CwdmWJYRx20dSddPi9zFGz7Hyw9rs0nHTq+HBK7XcLh4+3CGRGz
	RuNYqu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQnUo-0000000DQRg-0TLY;
	Sat, 23 May 2026 14:38:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQnUm-0000000DQRT-2AkB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 14:38:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92D7460125;
	Sat, 23 May 2026 14:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20ABD1F000E9;
	Sat, 23 May 2026 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779547111;
	bh=/+ubvDUlSsvQcamv6R6/8JNc1sEXNBLDKT0SjoQyXvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KcoMatwxjKddir3IoKztxEj1GkTKlI9B5yeKq8fTprt/TMC7Dz7ZbiTzP6NKuRXML
	 NpcfWdUBHoxrK2CNpmviC1IteTr1V8SCcGf65drd7glqzYhluE5NreS/CXC9MaS0hf
	 jAr228hK1ElQnPhI9MHXrQg1Eo6SsWcF0NOho+MWcGEQ0qC/oTZZIbaBG1CTzu4uNM
	 X5aGux7w36uixb7IMB47COOBphy1CcLRWZ48tYae4DIppHZnUuCilWEW57jOmBkCEN
	 Eq7smvv9A4vTqofgtSMeA9PX2IbOkkJQsOX5NwcKarL2wNNJgAvGEog3vG/TV53hBx
	 JG1PcXv6bwjyQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 31D2A3036D4; Sat, 23 May 2026 15:38:28 +0100 (BST)
Date: Sat, 23 May 2026 15:38:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Preserve all guest ZCR_EL2.LEN values
Message-ID: <ahG75BY6yvaePj-B@sirena.org.uk>
References: <20260522-kvm-arm64-fix-zcr-len-nv-v1-1-ec254e9078cf@kernel.org>
 <87h5nya4wl.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fl2vJPm84SLt6fHJ"
Content-Disposition: inline
In-Reply-To: <87h5nya4wl.wl-maz@kernel.org>
X-Cookie: Don't hit the keys so hard, it hurts.
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


--Fl2vJPm84SLt6fHJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 23, 2026 at 09:47:38AM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > The reasoning for the current behaviour is not specifically articulated, my
> > best guess is that it is intended to ensure that the guest can not see an
> > effective VL greater than the maximum that has been configured. This can
> > instead be achieved by configuring ZCR_EL2 when loading guest state:

> >  - When running at EL0 or EL1 configure ZCR_EL2.LEN to the minimum of the
> >    guest ZCR_EL2.LEN and vcpu_sve_max_vq(vcpu)-1.

> This is not EL0 or EL1. This is when in a nested context (i.e. running
> a L2 guest), as EL0 exists for L1 as well.

Sorry, this was intended to be specifically for a L2 guest but didn't
actually say that.  I originally had more verbosity in the commit log
that I cleaned up too much, making things unclear.  I will clarify.

> > Currently all other bits in ZCR_EL2 are either RES0 or RAZ/WI, values
> > written are sanitised based on this.

> Only for the direct writes to ZCR_EL2, as they are trapping. I don't
> see any sanitisation for writes using the ZCR_EL1 accessor, which is
> the common case. This needs fixing at the same time.

OK, I'll convert ZCR_EL2 to a sanitised register.  As I mentioned I was
a bit confused about why the existing code is the way it is and so
followed it in only managing the direct writes.  I figured it was
considered OK to rely on the hardware for the RES0 and WI behaviour for
untrapped access.

> > -		if (is_nested_ctxt(vcpu)) -			zcr_el2
> > = __vcpu_sys_reg(vcpu, ZCR_EL2); -		else -
> > zcr_el2 = vcpu_sve_max_vq(vcpu) - 1; +		if
> > (is_nested_ctxt(vcpu) && !is_hyp_ctxt(vcpu)) +
> > zcr_el2 = min(zcr_el2, __vcpu_sys_reg(vcpu, ZCR_EL2));

> Why the change in the condition guarding this? Given the definition of
> is_nested_ctxt(), this seems unnecessary.

You're right, this change is not needed.  I had misremembered what
is_nested_ctxt() was checking.

--Fl2vJPm84SLt6fHJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoRu9sACgkQJNaLcl1U
h9C/VAf8CHZI6LDLsoBR45fz935sHLDY6GBcMRErBG6zSvckEaREGCpajYeVTdTK
7GAi1UK0NMGWmS37NR6mIm745ua6rqg0Sxs+U0ZX83O38reW3XNtJWnnpXfk2nJ2
WZbUH35PBd0uaOQrKsCY0WxkS1Kmau/4Dx7GcUhS8orQl5PbCz7EVP6i1+IDjzai
yW6fCJk4o5TLrYJrgAzgvnup1U3tHEusmWQSo60pFOQ7lG+EPuwljWJ77ocXtlLT
7MYzk8cs2trZxO8oWT7Atu1tomCgDSdpXU9bZC24r/zzP3X83187ymk0yc34WD6x
+Fh+zTBHHV5neQDlJre0nVfezhQI2w==
=abUa
-----END PGP SIGNATURE-----

--Fl2vJPm84SLt6fHJ--

