Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BEFCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+K5yiCqW9C+tRMYZ/wwccsdp0OS3k1cMcrj4lVdzjRc=; b=lLg6NynCbwyDkUtWwZZ2x4RrHy
	cf6K7a3YPzwi+9IbnP3qHwm5+VGgQJyVu6SSJYRt6IfddMW6zqr+5GMtFCiMGkqm337PoVfNOzbxh
	3e7RhqVuyHREGcS19TfACokI0gqTtELo+igdPQZYrNpSjFzK/30HtR7558bLjtpp1PaaOPMgZi6pi
	Vt1oefct4YtIhgnsR1yNG0v7KgzC1D2q5eUoM6Kn6s2uwZzr4535MUSuTfH0wcR9t3K1wlgQa3JAo
	8+k3b92VGRjwVfqzCDt/941ORXM/pxfFN9cWSJR4nt6CQfgrYWM1t8vIyxe2VX8PdVYaNrQJDao0Z
	R/x+laxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEEN-0000000122D-1Ggq;
	Mon, 28 Sep 2026 16:29:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEEM-0000000121w-1ej2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:29:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B8FC540185;
	Mon, 28 Sep 2026 16:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187C71F000FF;
	Mon, 28 Sep 2026 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612969;
	bh=+K5yiCqW9C+tRMYZ/wwccsdp0OS3k1cMcrj4lVdzjRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DGNsSm5CeSch8qKbicKiPS+/iTe9NVwwVAY1o2qvMrigSCn7ZW5izpAY4X8yUhJlZ
	 XC5f77ZgevAcosylEbZnqnE9p612ztQWIkhempJZQH1ec+eXBPIA8N6ZqwLKjhgvvd
	 jUFyuiU1lCHqyrcRATKg+IzIqMYNTYvPMjR3klJaqD2ABO4G84iRb91Hago/EJW9cr
	 YeLcZXBw6k4lGXcpKbwrOa6lSCiDyAs111UWnGibka9Gu+1tE9KGfdon5JFh8oPWq5
	 2cZyNrh7hTuu/TNWld91/aVkopMYRMuTz1hZnPRbBD4753VRHPGsVaEZ3ECk3DCVsf
	 izAy266OL5oQg==
Date: Mon, 28 Sep 2026 17:29:24 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] KVM: selftests: arm64: Report set_id_reg reads of
 test registers as tests
Message-ID: <0cd3acab-b974-41e4-a4a5-639ddadba1d7@sirena.org.uk>
References: <20260901-kvm-arm64-set-id-regs-aarch64-v7-0-7b065b0bda9a@kernel.org>
 <20260901-kvm-arm64-set-id-regs-aarch64-v7-1-7b065b0bda9a@kernel.org>
 <arqE3CNeYyQpgcMf@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fdLDzAIjJR2VDlrJ"
Content-Disposition: inline
In-Reply-To: <arqE3CNeYyQpgcMf@gremlin>
X-Cookie: All is fear in love and war.
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


--fdLDzAIjJR2VDlrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 04:26:57PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 01, 2026 at 07:50:01PM +0100, Mark Brown wrote:

> > +	switch (id) {
> > +	case SYS_MPIDR_EL1:
> > +		return "MPIDR_EL1";
> > +	case SYS_CLIDR_EL1:
> > +		return "CLIDR_EL1";
> > +	case SYS_CTR_EL0:
> > +		return "CTR_EL0";
> > +	case SYS_MIDR_EL1:
> > +		return "MIDR_EL1";
> > +	case SYS_REVIDR_EL1:
> > +		return "REVIDR_EL1";
> > +	case SYS_AIDR_EL1:
> > +		return "AIDR_EL1";
> > +	default:
> > +		TEST_FAIL("Unknown register");
> > +	}

> I guess these are for GUEST_REG_SYNC() registers, etc. that don't appear =
in the
> TEST_REG() list?

Yes.

> > @@ -828,7 +872,7 @@ int main(void)
> >
> >  	ksft_print_header();
> >
> > -	test_cnt =3D 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
> > +	test_cnt =3D 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
>=20
> I guess because you made things use TAP now?

Yes.

--fdLDzAIjJR2VDlrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6leMACgkQJNaLcl1U
h9BjmAf/USPitIAZrXSGRtz8RmYTAZ6Zu7zIOqOnzA05aYcufhrgg0JlTCO5i2jF
WUsJEsqePHFiy+W/ydFn7+BZ1hDHABtDvR3k08GrqNyh1zquMnDvPqqppNs0ZHDo
YdYrGjdQF+ujDqk+ZgYwflBO37HWmvceyR/kwjImXyoVo7OP0yrAJIvkUo1CATB6
CtpOujxpIounDRqj7/nvCL6u9n2lfuNXGm4zfpLpNsxw1lMBuMS+ahe5laA6wcx5
XO56EdJkdk8rxJYq5wvq/6AzLFRxJeIS/J82wtz0x53Ljq0IiqFTxmQ33Y9+85kS
6vt6rGEnMmQvzFPK1aSrnqpQlzgwmw==
=1OOp
-----END PGP SIGNATURE-----

--fdLDzAIjJR2VDlrJ--

