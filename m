Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE57C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqPXmYf6da/8Vonc+HLrWxd5/lraaVNs4gaAWBXdOT8=; b=WxiF2BshKExKRWFboKBPwiyzYn
	l4BtHQmuZUD1YLbjwH0EZ6BhLffOALBruDLIp0ZU+xfbjq1raRFsGEZovhq2VHbBLiN//jbdb08wy
	VRAp3Fi89B2Nn5TC2/ko+ubbTqL52zIj8FeXPFw1iGH8OkoxiZGj+tTQOkOYelc8pPZ2GndvybLU2
	s5ytur+RnQH6mLkJ+mECz9OFkjQ8jmnE6Z2l/0xrrrOtWPsM6u9HXMJBSPQv/oCwJ4U/xaWtyeKla
	g5fGZo+/WZChPlhIDmyHCz7XOmx+fOdePaZ4MOvRgbttICyT/ueU9W1LuroTrK0+kGiCT765WxON+
	jnjgHipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixPb-0000000FGlZ-2BmV;
	Fri, 14 Feb 2025 15:15:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixO9-0000000FGUG-11zV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:13:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4534F5C5A92;
	Fri, 14 Feb 2025 15:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9340C4CEDD;
	Fri, 14 Feb 2025 15:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739546036;
	bh=RFJpcfzla1/p+yWYqC1cUGJBffni0p3EoU1xXc12NtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GL3W9qVJRdnVkROe2Jpk/w2dfKv9mGFjcE9L8pLVH4N1RfKzcJq/fZ8TX7dwk8O19
	 /EbfgQHy0Axj6AsvQMM7ZqU0fEV4I7Br04DgFFZQspQ39PekulZTDBPoWaj7V+ZE3e
	 N4ij2TZ87MzllNIOaUHXMIL4s7cmyWQgr7HIVuMKzvczBtUVMj7LgXwaTk1XCaLjp/
	 t2GSIVrLipjlT7J+Bm59c5g5dilhwdFS3PEYKIL0N3koWLQwkt6XQShXXKisu2zyvQ
	 ofphn9ih4xkL5zWvi8CpF9LBaH5dTcAR0896zurKsC3KgZ3neiBM70w0hf+QAD5UXV
	 0BAweflLkRZ6w==
Date: Fri, 14 Feb 2025 15:13:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 00/27] KVM: arm64: Implement support for SME in
 non-protected guests
Message-ID: <Z69dsGn1JVWPCqAi@finisterre.sirena.org.uk>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
 <86pljkswuk.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i3oZTUREBVwjVqsD"
Content-Disposition: inline
In-Reply-To: <86pljkswuk.wl-maz@kernel.org>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_071357_375559_9E65D9F8 
X-CRM114-Status: GOOD (  30.70  )
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


--i3oZTUREBVwjVqsD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 09:24:03AM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> Just to be clear: I do not intend to review a series that doesn't
> cover the full gamut of KVM from day 1. Protected mode is an absolute
> requirement. It is the largest KVM deployment, and Android phones the
> only commonly available platform with SME. If CCA gets merged prior to
> SME support, supporting it will also be a requirement.

OK, no problem.  This is a new requirement and I'd been trying to
balance the concerns people have with the size of serieses like this
with the need to get everything in, my plan had been to follow up as
soon as possible with pKVM.

> > Access to the floating point registers follows the architecture:

> >  - When both SVE and SME are present:
> >    - If PSTATE.SM =3D=3D 0 the vector length used for the Z and P regis=
ters
> >      is the SVE vector length.
> >    - If PSTATE.SM =3D=3D 1 the vector length used for the Z and P regis=
ters
> >      is the SME vector length.
> >  - If only SME is present:
> >    - If PSTATE.SM =3D=3D 0 the Z and P registers are inaccessible and t=
he
> >      floating point state accessed via the encodings for the V register=
s.=20
> >    - If PSTATE.SM =3D=3D 1 the vector length used for the Z and P regis=
ters
> >  - The SME specific ZA and ZT0 registers are only accessible if SVCR.ZA=
 is 1.

> > The VMM must understand this, in particular when loading state SVCR
> > should be configured before other state.

> Why SVCR? This isn't a register, just an architected accessor to
> PSTATE.{ZA,SM}. Userspace already has direct access to PSTATE, so I
> don't understand this requirement.

Could you be more explicit as to what you mean by direct access to
PSTATE here?  The direct access to these PSTATE fields is in the form of
SVCR register accesses, or writes via SMSTART or SMSTOP instructions
when executing code - is there another access mechanism I'm not aware of
here?  They don't appear in SPSR.  Or is this a terminology issue with
referring to SVCR as the mechanism for configuring PSTATE.{SM,ZA}
without explicitly calling out that that's what's happening?

> Isn't it that there is simply a dependency between restoring PSTATE
> and any of the vector stuff? Also, how do you preserve the current ABI
> that do not have this requirement?

Yes, that's the dependency - I'm spelling out explicitly what changes in
the register view when PSTATE.{SM,ZA} are restored.  This ABI is what
you appeared to be asking for the last time we discussed this.
Previously I had also proposed either:

 - Exposing the streaming mode view of the register state as separate
   registers, selecting between the standard and streaming views for
   load/save based on the mode when the guest runs and clearing the
   inactive registers on userspace access.

 - Always presenting userspace with the largest available vector length,
   zero padding when userspace reads and discarding unused high bits
   when loading into the registers for the guest.  This ends up
   requiring rewriting between VLs, or to/from FPSIMD format, around
   periods of userspace access since when normally executing and context
   switching the guest we want to store the data in the native format
   for the current PSTATE.SM for performance.

both of which largely avoid the ordering requirements but add complexity
to the implementation, and memory overhead in the first case.  I'd
originally implemented the second case, that seems the best of the
available options to me.  You weren't happy with these options and said
that we should not translate register formats and always use the current
mode for the vCPU, but given that changing PSTATE.SM changes the
register sizes that ends up creating an ordering requirement.  You
seemed to agree that it was reasonable to have an ordering requirement
with PSTATE.SM so long as it only came when SME had been explicitly
enabled.

Would you prefer:

 - Changing the register view based on the current value of PSTATE.SM.
 - Exposing streaming mode Z and P as separate registers.
 - Exposing the existing Z and P registers with the maximum S?E VL.

or some other option?

--i3oZTUREBVwjVqsD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmevXa0ACgkQJNaLcl1U
h9AvMAf/UX+5QSO5KD39QjMVwAjrzs5PpGSz3thq4Ajk3AvOq6MoZLM+cigoPhqX
VlsiJ5F1ztiGHX5M2YNaZHgpA3xg5Q+deKieaEkqUPok0M6qFUG1k18RMiKLE672
FXoKOBodF5HMK+avPXZVprpADSTCJXcWvKNYh8/eiDe3l/hkH6+GtTTtjsRmmW2w
Rm7PdYpNDVKxs1oVgMWd4lG7OD55/NtKfBqDaKwLia1iFVtr7RAJIw+EUiWnj8tK
R9UND4PmPkPqsi+7Z3ixTXmwc2v2k4SDeXn2rfwCf5p1FQgwj63LAKmX75LHvdFU
rXcZgH/UQ7bWTd6ZTfug17WaPkswBw==
=zfPV
-----END PGP SIGNATURE-----

--i3oZTUREBVwjVqsD--

