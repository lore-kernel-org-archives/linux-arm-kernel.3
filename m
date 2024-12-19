Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E679E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 16:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypXaJWp5FnrK2zptKyzvmWYExxQK1Fxh1FHf08743/A=; b=Cu/tzCM6DaUlToIFHZhF5UpdE+
	VJhIT/iGqyP/xRXkDmKva+8/6dCs04aIkmzqi8b4lMBI7SwkCXdizdeMtvUh/QmkePAOYJnZVsvUe
	k5BOK7VsFe3d0lhsNvOvvwT161o9SOZfjm2J77g9O0lje9Mwv/PYwIw0vUOau8gB/8QwHa1zsPobh
	w86gQmfceLKJm++F3WHpSARIJZO5SJbRCqWd1UubWfqfGRAlCOPfMgAOFTeJEcA1DwPEoe5xnpt9n
	TD9PgA9sW5guEe4DZHA8m0rpWVzMy+DDgHDkKjDVXet93RethmGhUrtYBd48KmUgVA7Srhs3/tZQb
	w1S/RsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJZU-00000002OFg-2PS2;
	Thu, 19 Dec 2024 16:40:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJYN-00000002O2E-31IX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 16:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35BB05C551F;
	Thu, 19 Dec 2024 16:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C4DC4CECE;
	Thu, 19 Dec 2024 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734626350;
	bh=ypXaJWp5FnrK2zptKyzvmWYExxQK1Fxh1FHf08743/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auXtyA4xrFWrERNxmVwHNDhnAXBkQxQ2WML0TSPU6xnFHbLaINkmx1/oIbmaw5UBd
	 ha3o7TLRPYCPasKpFBQqR+Scs44gxkCMHpLkg5khJ4msvqvp915YROa8KrUSQeVLys
	 O5N4H6/CFaPPd9f2RVlV+3GPSO8k3IxcQS4D6Kc7wEA6lExl6216/v/pcHgArGaejl
	 9CQn9BdKHAeS0gylpCDC8jMONqiIYAHQjJr28zWy6ux14GJfrVdVBOM18yC75A6/0M
	 vnqSZ/R+PItnqEvhVKdrGRM+Qz3Cfx3Hi3bcJVcsB19zwxo818GFQM0+FE9VcSBvuP
	 X9q/fMkZdX7vg==
Date: Thu, 19 Dec 2024 16:39:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
Message-ID: <51632b4e-19a0-487f-878d-f03abeea2553@sirena.org.uk>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
 <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
 <20241210170953.GB16075@willie-the-truck>
 <b859bdcd-7343-4d53-9f3a-f374deca725a@sirena.org.uk>
 <20241211224015.GB17836@willie-the-truck>
 <248dea18-bfad-4ec9-9a7d-5c87c7f48c84@sirena.org.uk>
 <20241219155547.GC24724@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VyjcJ0zj30NUrDgi"
Content-Disposition: inline
In-Reply-To: <20241219155547.GC24724@willie-the-truck>
X-Cookie: You have taken yourself too seriously.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_083911_801030_096933AB 
X-CRM114-Status: GOOD (  13.74  )
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


--VyjcJ0zj30NUrDgi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 19, 2024 at 03:55:48PM +0000, Will Deacon wrote:
> On Thu, Dec 12, 2024 at 11:33:05AM +0000, Mark Brown wrote:

> > That'd be useful, yes - unfortunately I think that's still something I
> > can't work on myself at the moment for the above mentioned non-technical
> > reasons.

> Is anybody able to work on it? Without insight into the "non-technical
> reasons", I don't know what I'm supposed to do other than write the tool
> myself (which means finding some spare cycles...) or refusing to take
> wholesale sysreg definitions until it's been ironed out :/

Similar issues will apply to anyone at Arm as things currently stand.

--VyjcJ0zj30NUrDgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdkTCgACgkQJNaLcl1U
h9DCJAf8CuU5u1XxAnkW18x2L4cYSHQf98sGUnZENATCQW4WaqnatXSW03A/Y0Fs
56SZ9lcKhlhbbcGp0oO4AM02igAnOtSCQBtPG/ZSv7eOLdNLvMsRve9RX5Prgbp1
J63vhYvmVBhqcp0+OO9BJHkdqTkZvs2fgyTL5wb8yTv2u0EAkX32Dx2Qo1fCX1Pr
dgrbnXcXjyc+yq5Q2DrpBhKsMANKyogTFubMPlgYyhCyqeEJbE6irqiO6um+thHW
6Z9IkgN0vqfJUAEEbnOD5acFDamTlED+km44BJJ6hCAA3VtrNqesF0adCSV0Da3k
0rPz0JhoTWgz6DjCMQFwhzG9xz4DPw==
=evNu
-----END PGP SIGNATURE-----

--VyjcJ0zj30NUrDgi--

