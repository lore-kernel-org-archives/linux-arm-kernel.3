Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB0ECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwqpv0OMmuh14dvqJoXmhqMPOebR0cDuIlzyHJCB7FE=; b=KIgqwnOaAlRjxcjk+I3hkPdPW+
	5mmVWLvgNX7sJ72FkEsEwB7aX4eao8V/zw4VJvkyWl8PcBXDa90SyQ0onytl5Cf2eeKolfCLdplKP
	td97G5rKqHDJyEq0drmpyHhfzlHVTG1+fX3igZsytN7ntgAmVMhAJZmwhFLPR+RpAZjUkIeULjeo6
	XGJRImakfLjNZobGQEXVskMi44wWcB6lphMNytA6a5a8ndnVSdXAI5PK1d4KadoJBAREsaE51+QJl
	A1CdO+PqQ1yJAolJBeOxKIp/J685FwUIcgdvOj5Acf9pne387pWY0WKmRo8FiJTEd6QYgS/3IMW9U
	vSphVHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux7Lh-0000000Aiz0-0GtR;
	Fri, 12 Sep 2025 17:14:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux7Lf-0000000AiyV-3WH5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 17:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01BD6601D3;
	Fri, 12 Sep 2025 17:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DD9C4CEF1;
	Fri, 12 Sep 2025 17:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757697250;
	bh=pwqpv0OMmuh14dvqJoXmhqMPOebR0cDuIlzyHJCB7FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W9JrERn+KoIxQfx9Yk0iMN3Gomju4XAAwgpdQ2MqGJwl30FZw0g9IcS4YMSSyAzq9
	 eimaUJjSJFo4d58GUD6bp9JkOpFKojq2tM0WkyPCc2mvTz3XejGtlnO2AzvjQkQOnJ
	 0z51JO3q7zfPY1JKO5QCa2k0sZlqvZdV7KTX9xg5EVi+0Do7ZjCXnl7LBDjal2fiHt
	 nKe6ZM7o5Aasih3d/b/BuG8CHqy/W8lUn9B42OhDzOspQUm0sy17LBMh7BeLKOOhkX
	 A1m2D8dwOnrZDyHlogQdH1NOxF13JK3PujUqc2kQutHyk6ZODhgyydyVOJetYbxbl5
	 ypKNA6bFCEoTA==
Date: Fri, 12 Sep 2025 18:14:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 2/6] KVM: arm64: Manage GCS access and registers for
 guests
Message-ID: <aMRU3zCRpA4Zuj0L@finisterre.sirena.org.uk>
References: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
 <20250912-arm64-gcs-v16-2-6435e5ec37db@kernel.org>
 <865xdndgpw.wl-maz@kernel.org>
 <aMRLYBWfDFiIB7wx@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DpzIhk4kEi/ksl0o"
Content-Disposition: inline
In-Reply-To: <aMRLYBWfDFiIB7wx@finisterre.sirena.org.uk>
X-Cookie: Filmed before a live audience.
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


--DpzIhk4kEi/ksl0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 12, 2025 at 05:33:39PM +0100, Mark Brown wrote:
> On Fri, Sep 12, 2025 at 12:59:23PM +0100, Marc Zyngier wrote:

> > Just like the previous version, you're missing the accessors that
> > would be this table useful. Meaning that the vcpu_read_sys_reg() and
> > vcpu_write_sys_reg() accessors will fail for all 4 GSC registers.

> Just to confirm, this is __vcpu_{read,write}_sysreg()?

Sorry, that should have been __vcpu_{read,write}_sys_reg_{to,from}_cpu()
*sigh*

--DpzIhk4kEi/ksl0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjEVNYACgkQJNaLcl1U
h9C9MAf/ZDTHvq/toZNl1zFIlYCxa5MviqirC4jCkD4bApiu8FXEn37o5QLHvV1a
TScrRejLtHsbWbAOcXqDXGKodfclNDTwGvxbqbHCwHhYLWbr6p2D1vAa48iYJIhv
gnKnhDqBNSvx4LrNuFwaUJyPhich4VOvTjmSvJPJU8oCLAdPfTECSghGmFnW0FEG
LdO+0s95tByeppfr9prmKGg8/ctwQ10rlmfVFavH6fvx7zfpFoVrSMFKpzp6z8Hq
uqT918mBpk8+wcxaGuheKypl/OQVBGv8OjFpY191RQkSB2PvLelMr2QEG1T6CzeS
9/DQ8sbVFO1rzwaGCpfVMWJL+EKxkA==
=YqIz
-----END PGP SIGNATURE-----

--DpzIhk4kEi/ksl0o--

