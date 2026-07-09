Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E75C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuOciaS8DK8jmb2CFQM4/jZaaLCATTx50eQ2Thwjxio=; b=X51uevHQ7+icVLLL+lbGqLF0DA
	HVP4YMXQzMdrI6wiuEkvTTUzdfmsEeMX21Mr2XYuOZ2zo859NvlqOWte8ZWNx39AwASflhYmlaOn3
	XkBPuJs1soD5DE8AFaPd5hxqSKTI37Eid/C9dat2CtUkRD71/J4zedaCnxRM3HGgrgqaT984ivjxw
	OoMzhjH+rvLPLjrIhcY4+EgoX/QDxdo/DMfWx2ysccSmO+gwQWiPLN0vLkXZ2ZAdWK/1YpqMShNb7
	kbmwokukqmYyOUj8t/Agiw2BB71+WDjd3qHHTHbnG/M0BoDGVq44QegP0WKdV/Xs9vBijIpsN1FuD
	gJ3QYNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnlH-00000002OUf-2ZJ0;
	Thu, 09 Jul 2026 12:21:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnlG-00000002OUR-3Shb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 466046001A;
	Thu,  9 Jul 2026 12:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197831F000E9;
	Thu,  9 Jul 2026 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599710;
	bh=LuOciaS8DK8jmb2CFQM4/jZaaLCATTx50eQ2Thwjxio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ejE2Et99WozJ1ypz+xTfglTg5W4D821r3YBkSWZ69VfT/DXUVQDgsyOw2BKsE5Rus
	 n5UQr2tQffCuQ+eTIMbnAhij7IZKyiJDuQ3EjdGG1tJVzTdwUqLrELSFHkS8pQqxsA
	 hlEspvq+80/eU+Gj45dsw0kymVVmclO6yyDyVAdylITZ6ebavOl8agRveBg1in94XG
	 Us/hNWSBeZUmgejcm52jNyPqjdI2sacuRoPucQqiAAeFH820A8aiLPNxMeIvRI0m57
	 TumZ6eFD9Ldh/KW5/ZRTF6fxvikmcBe9pvzdWBw7P4MW1GRSGQcmLSCYYjKPEHwWym
	 qupaWM2bLQdzQ==
Date: Thu, 9 Jul 2026 13:21:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
Message-ID: <ac8c0aa6-d84d-4fd4-9059-ea79adc337a1@sirena.org.uk>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvkuTVR/BvRRX0hU"
Content-Disposition: inline
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
X-Cookie: MS-DOS must die!
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


--lvkuTVR/BvRRX0hU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 01:51:37AM +0100, Mark Brown wrote:
> [ Note: I've spoken with both Mark Rutland and James Morse both of whom
>   might potentially have some overlapping changes, they've both agreed
>   that they'll deal with any rebasing if it's a question of this getting
>   in or something else. ]

Main testing for this was, in addition to a lot of not particularly
relevant coverage, running the KVM and arm64 selftests and KVM unit
tests.  I also ran the arm64 selftests (particularly fp-stress) in
guests while running fp-stress in continuous mode on the host.  Testing
was done for each of nVHE, VHE, protected mode and nested mode.

--lvkuTVR/BvRRX0hU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPklYACgkQJNaLcl1U
h9B0qAf+LBdXTQ7AYWPPO2VCenkHI7Mk3Ar2J3NEDvdagbuxAigD9tRaRejVQbv6
X+hE5pP2Ij0vPRnhodiUla8xiKplqUKX9qF8UKOi3K1USJMLnOC4FKyukI4seelo
/OMB3xjuTCcOhkffh0zUSv+6ssNVUQa9F0eGoXaDCBB0Z+Y5ut+96O3TB6o9CY2P
PYeZeycw0bLZvYzuOYXwRej52aiR/J4asZV5i8OOWTTEMEJIXB2PaVWTBnhMiEDR
VEGyfz/uIdg1RJv5lcChLnlP38Ai0leGL9Gh+bSo672GA8KEUdycqNrTpQuCV2j8
MSqXDTT5NYsRGwpA29E9JKTBqQ+46w==
=Cpl8
-----END PGP SIGNATURE-----

--lvkuTVR/BvRRX0hU--

