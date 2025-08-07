Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A433C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 18:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrUU61p/UQxognj6LiQng6m/nh7Ms3lTMp/CEsqP7Tc=; b=Zu4PllbjT1zvljjQjqmpeUV59f
	bUSMCh33aSj43+DrUTF6/7bhH4a/t4IxZqwN+IpfmmZ8hNErm0snkfo6LODduoFUYnAZ2MNoyYrD7
	9W5JO8gAwMaXgqMw5WsVAybUkWwuwILmGzFBR3uNL7pNNBxxjYHNxYNZX4DvkySACgO+WNnseZRKW
	6d9ygV1ElE30+LhA7ZApBqhbxuFIKxF7ApNNSbpPYE4Q7Aorif912KtLG+wPAs75xzU6DbWKi4rsA
	VlRc9oWyDjpKvowEw6etRIwtAEwMb+yHwf8r/HVkBDSyv9q4cS2WLoTdXTDRCnar6wmZmwwPGjfBA
	FC41+8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4vc-00000001I8u-3Xsw;
	Thu, 07 Aug 2025 18:01:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4ru-00000001HYi-0sHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 17:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A35AA600B0;
	Thu,  7 Aug 2025 17:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A213EC4CEED;
	Thu,  7 Aug 2025 17:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754589453;
	bh=o9PhsAMPAYPHNYv4SZ0O7Yfqd4gCIz+z/qFLouKRaXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2Xrg0ZYors9ujEEzRxpg+3F9ofv0IaKxd8P8oi/Nxv/Fpz7w7Tc+/PNRp5tOFZER
	 9nr5lH5USRaThEClrS/0F9LTXe5ikGAlDkju3BXvrxJkQrLDqcCbMhnN21rozjHuVO
	 +cAH8HHEQKYvVpDkB+ep/c53bFvQh4NXAVo/+y8dIfsGXZh9azzZkRKFdf6b0nEYH9
	 CKhuxv5r7wfxcG7oo6mpvRFdiqJWJG0eJUiHZgLvmOBent1WmrTog2wHfK09SGNV05
	 RIISSNypjXHMEpZ429tzQTho+y9DLi8qmHQR4vjQoeTXPaQlIs7pQJiP6LTGkWd091
	 Y5VyjjBMUbxeg==
Date: Thu, 7 Aug 2025 18:57:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	oliver.upton@linux.dev, james.morse@arm.com, cohuck@redhat.com,
	anshuman.khandual@arm.com, palmerdabbelt@meta.com,
	lpieralisi@kernel.org, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, james.clark@linaro.org,
	yeoreum.yun@arm.com, joey.gouly@arm.com, huangxiaojia2@huawei.com,
	yebin10@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Expose CPUECTLR{,2}_EL1 via sysfs
Message-ID: <92feb0bc-18b9-438a-9567-a9059a8cb9dd@sirena.org.uk>
References: <864iuja70l.wl-maz@kernel.org>
 <mhng-9D9CB730-A22F-43E2-A012-D51EF3C1E027@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8ETIWXizD9Z0LeAy"
Content-Disposition: inline
In-Reply-To: <mhng-9D9CB730-A22F-43E2-A012-D51EF3C1E027@palmerdabbelt-mac>
X-Cookie: Real Users hate Real Programmers.
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


--8ETIWXizD9Z0LeAy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 07, 2025 at 10:26:29AM -0700, Palmer Dabbelt wrote:
> On Thu, 07 Aug 2025 01:08:26 PDT (-0700), Marc Zyngier wrote:

> > For a start, these encodings fall into the IMPDEF range. They won't
> > exist on non-ARM implementations.

> OK, and that's because it says "Provides additional IMPLEMENTATION DEFINED
> configuration and control options for the processor." at the start of the
> manual page?  Sorry, I'm kind of new to trying to read the Arm specs -- I
> thought just the meaning of the values was changing, but I probably just
> didn't read enough specs.

Yes, pretty much and also because this is in a range of registers
reserved for use by the specific implementation.  See DDI0487 (the ARM)
version L.a sections D23.3.2 and D24.2.162 which specify the
IMPLEMENTATION DEFINED system register range, and the definition of the
term IMPLEMENTATION DEFINED in the glossary of DDI0487.  If you see a
small upper case term like that in a spec related to the architecture
then it'll have a specific architectural defintion.

> That said, part of the reason I just sent this as-is is because I was sort
> of expecting the answer to be "no" here.  No big deal if that's the case, we
> can figure out some other way to solve the problem.  Happy to throw some
> time in to making some more generic flavor of this, though...

It's something that does come up, working out a way to make use of the
tuning in the IMPDEF registers in a way that generic software can safely
and sensibly make use of is rather non-trivial though.

--8ETIWXizD9Z0LeAy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiU6QYACgkQJNaLcl1U
h9C/Lgf/WSCWGaP2ngWUbX4z0kzWbXmxYJDiNxHJfVVtC1t2Z6+8tn6vbrTvBMkS
ohjVwDVAsLcNj2k09Q/ltjT0592+txX9IOXp1tsfA6ft9unMBDt+QkVpZXroiipq
D36bfhRLT2QDN/Ixjf+Nzy7KELjFozGvOKGmiYM2fCbS5FLhYfW9R+d1mhcCG/DP
L2oZ9SYWP8T4JCmKxE+uytj4cMa3r9HPGBbUZUhPKu6jVBHLQ6n3lO3viYByXG7h
aTOpS3fDV+hiK3MTVZWE2j5PdTWPWy2ynMlRJ+5i3DD01uZYupeuRQ6q6J3cdXli
sILq5TE5+oqVCTqKfoUVTQm6r5gwyQ==
=1SBy
-----END PGP SIGNATURE-----

--8ETIWXizD9Z0LeAy--

