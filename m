Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47D2CD5854
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Qoymrb5thtThb1eekmb44aNodNWzRugEYQRQdnUQZ8=; b=ef92u4jAdARLoA8GT71ObIoB5y
	YOCy3AXGng+wDrveRIoKml2geuSkCwnQcuvd/jyFAiC4P1bN2ZWbWrMb1SOBSpbPOgqhq93oI5O8R
	ERDzH3VlNAQOPsgvZyiy/8+iHWV4Ss/BXTeX+V3nmirbsLVuZ54LEliQVpO8voySDBgcsFEUUbprB
	ajv8otilzK3EFovgvRuNbf9pxCGBiXHYO44dH2drqzhsbCN70TJ83th6gQxKTwRsVihLSTHRKDs91
	N2Kp4XgneOfdfs+Ra6a7yqX8HMS3VIqeBuziflruLMmq69kp9OyRPGYKHNUjyJ9iDkyFJmiBY5eZz
	OLQkQCyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRyI-0000000EqWk-3LkJ;
	Wed, 07 Jan 2026 11:45:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRyI-0000000EqWe-0mzj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:45:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4303D6000A;
	Wed,  7 Jan 2026 11:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FDDC4CEF7;
	Wed,  7 Jan 2026 11:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767786301;
	bh=U78ONRWmwz2WH/BhLsJ/KDqiXNz0V6xhHYfAOq6nW7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHmLJTvwbkEgKWAHytU4pXHG45MFBbx9IxlV1oUeeyYDJOKamHdPBPbdD+ory6KXy
	 zDV25YkbE3RgIgJuMbGp/FFSdatXOQjhIsYxrFFFow1C4NfMWc2PphS5Oo4OOxGdMh
	 Ais7luwAxY0q1r042+FOg4Kj9PMQKvApGVdGY9SS5QuJLZStdO9UBwUDp5fhjWkw+9
	 zeQyuvv4lS9czEq3mqnV0PVUxtTIIStu3a2kOdasaqAVhanVRiPy4vNO5X+Smug1SD
	 19YN8Sb3QfysNMnpVDDr9APvY1FIdB0XwN5tbrxiTpudd1vqZHLtt8t+Zus0tmMqV1
	 d4I+41lHm7fQg==
Date: Wed, 7 Jan 2026 11:44:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] KVM: selftests: arm64: Skip all 32 bit IDs when
 set_id_regs is aarch64 only
Message-ID: <e1907b3a-416e-42d1-a682-4ea514572b64@sirena.org.uk>
References: <20260106-kvm-arm64-set-id-regs-aarch64-v4-0-c7ef4551afb3@kernel.org>
 <20260106-kvm-arm64-set-id-regs-aarch64-v4-4-c7ef4551afb3@kernel.org>
 <4cb1ad60-f8cc-4efd-9c9d-9ae52001e547@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u4ub/+ka66XeoUsW"
Content-Disposition: inline
In-Reply-To: <4cb1ad60-f8cc-4efd-9c9d-9ae52001e547@arm.com>
X-Cookie: Is there life before breakfast?
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


--u4ub/+ka66XeoUsW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 07, 2026 at 09:54:58AM +0000, Ben Horgan wrote:

> Not touched in this patch but the check for aarch64_only looks suspect to me.

> From main()
> val = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR0_EL1));
> el0 = FIELD_GET(ID_AA64PFR0_EL1_EL0, val);
> aarch64_only = (el0 == ID_AA64PFR0_EL1_EL0_IMP);

> As we are concerned with system registers that are accessible from EL1 and higher
> should this not be checking ID_AA64PFR0_EL1_EL1 rather than ID_AA64PFR0_EL1_EL0?
> Not sure if it makes sense for the two to be different though.

The affected registers are ID registers so they're always physically
readable, the entire ID space is always accessible (the otherwise
unspecified registers read as zero), and if you think about it for a
system with AArch32 only at EL0 you still need to know what the EL0
features are from EL1.  Like you say it's a preexisting thing either
way.

--u4ub/+ka66XeoUsW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmleRzcACgkQJNaLcl1U
h9AVJgf+Mn/sKDgmo66c5NvxoCXjOoZfe7OcF1vxptR4Xhi48ZKjiIIfsvbXBmO4
t0/y5Qrj32kojFEURmi4jDtycN6dUxXRrzJtiwoyUMYGnJGFx2bjPvWytAmcpYiH
wZ1Zjcvyje2tyCxxS8sZ9W86uwjtEb9nR+T1cythwqdQDAb7odZ9Dp8h5jnv/3I6
DtuUA+3f7H0dUWr15UGFTolCAP3Si3VISKgLTpolcT/rKMA+An9fYfYbt5OzA2r0
NLqvIMHKMTIXG/EReN6q1DaKEI0Sn0/ymrMdEMb5xglL+7Myd96RM4lxw4zZISXl
ZeHydmawsPpyhxY3Fn5cySG+pvAV4g==
=RS5q
-----END PGP SIGNATURE-----

--u4ub/+ka66XeoUsW--

