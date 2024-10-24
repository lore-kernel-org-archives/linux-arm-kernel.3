Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDF9CE8E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bqFi6yiy1dWjdqnfPAssInhUUPNsx3HhwKXNB+L30E=; b=jthZNAWDPLhEgkkVcTbW2bpmU/
	GCFcBLTR17aFzoAwcc/aKRk/EmDOu2Jp8nlyIgDDlCutpPKKvjgQCZ9EdkK/mI4YcwsIFZyf/g9UH
	4ZcMrp1eVGIPcEezWvWU+EnfmoA7lguc9cSWkxd9rkPZePPbsXrq9fNLML4y6V3nAtLFxkfPtar3s
	zDDe88nKEgo0W9gDCyatU6V2tCDMtEpa6n3AKx2+XMHFzjp6tqvNlqRN/mo1aTgiNvuRgBQClJ9t5
	60o1mjBE3bbALON23QPr59V5fI8GX7JJpcGRvK0eGsyN/xnu2iWd6lURtSJNmtskFdhjd0BxtXl+H
	NPVLad2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x38-00000000M29-20AO;
	Thu, 24 Oct 2024 12:34:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x0j-00000000LXV-0ukD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:32:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB3F6A45244;
	Thu, 24 Oct 2024 12:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08AEC4CEC7;
	Thu, 24 Oct 2024 12:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729773134;
	bh=LMV1/ZjJryHcoq/PAGVhqnmnz6y8NgUSfp9u9bYAkl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZrhemjU7IY3YPHK1vRXxDbr5qeWrcxI65mkq85Pqm2OT53JF0euLXr9ciwNHNPwF
	 qAhLKNhDZmIx4EOaXAnvy7RgCK9WigW7PQdgP7ybl7FzOp1esDme+prG2GVxphj7cZ
	 dEq3xlh8OjvAk1ctNGmS785C86VZBWHYigbhcD1ISJfyDLgSNel5JVmnB5BT0axMFo
	 V6h6qZken2Xy1XIgtFSKHYH3vkwfPOw4CsZDIkJ8cP4D9ZHB8hAObVxhLzPedCH+qj
	 Pq9dXkMO+jgp/FyN6R5TAcUT9HzdTzcEjKVkbJsFHFnH8yIeyw5rGlhpgTK8Mkvjb/
	 o5nxyPbcEj/0Q==
Date: Thu, 24 Oct 2024 13:32:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v5 17/37] KVM: arm64: Sanitise ID_AA64MMFR3_EL1
Message-ID: <33681a4d-2ea4-416e-9e2c-81a89a78c4ed@sirena.org.uk>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-18-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wt33+Se1teOVCKXD"
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-18-maz@kernel.org>
X-Cookie: Real programs don't eat cache.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_053217_346003_A4039E3B 
X-CRM114-Status: GOOD (  10.06  )
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


--wt33+Se1teOVCKXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 03:53:25PM +0100, Marc Zyngier wrote:

> Add the missing sanitisation of ID_AA64MMFR3_EL1, making sure we
> solely expose S1PIE and TCRX (we currently don't support anything
> else).

>  	case SYS_ID_AA64MMFR3_EL1:
> -		val &= ID_AA64MMFR3_EL1_TCRX | ID_AA64MMFR3_EL1_S1POE;
> +
> +		val &= ID_AA64MMFR3_EL1_TCRX | ID_AA64MMFR3_EL1_S1POE |
> +		       ID_AA64MMFR3_EL1_S1PIE;

The changelog is now out of date, POE has been added.

--wt33+Se1teOVCKXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcaPkkACgkQJNaLcl1U
h9DiwQgAhH+zkGBrN/5cPpNXuLmA1wMq84HXbwEsyxUGI5X55Vgljru0e/29zbCG
jVQ9lEjO5dTEorGFMaF4BoRmag/CbRwMlmXqr8MdtiqM9FMZ08gHKjXaQu3OpJ6x
fEDQqlhkCSXM2NWLrWsxh+pi8dx2IzL4anecrFQMJ6KkJxPj8KxuEeB4BJchcyPx
/+u6Cv8K9YVyMFiKwKGetUQPLqF91wAQJPYtyORrpOI42U5qqaXw+SAXQ0BDmZpm
TM8E3ywD6+cGPiW9K1RNnVO3ENt3u+TNqqgsnKJ8kAoQU3W+X8d+YUuIUnCNEn7l
g31W6yw4j9ryKy3ie8Zs2R1whrYcyg==
=37Mt
-----END PGP SIGNATURE-----

--wt33+Se1teOVCKXD--

