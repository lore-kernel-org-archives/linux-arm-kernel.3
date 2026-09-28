Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6744BCA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKhdntCBuVlgMeNm8tbQb7Cnj6P4iyCp83pUTrwurPA=; b=LAKLaLICxQ5wCuhCIH6VFWnpqG
	WHEFop5PRj3p79PixFJDsZO+z40K514v3lUSm3LBY7ozktwHUKXxfY9HUgvzMOG0qem6i7lUEj2Sd
	s/Vrlvq/qgIQzQ1gIQLWSKLsxHSaIKHEop0cHx4aXc4bui9s2vPE5KlvIlfZiXN0MpheTpO2FW5LT
	Mk+6MPnOgeAg1otuUayzKsL2f+B4FQtjYPzGUS8bKaznOaMPev5By+hk1JFZakqgVrO7/CkRHJuAb
	GOjSXXvdJG4lmUA7Pqd3MSzshzuYVAxlbF5GtpC1tdewXR7airQMcsSjKqbWROJvtajIuhgyiqSJU
	bz0ybM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE8H-000000010xS-1nUW;
	Mon, 28 Sep 2026 16:23:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBE89-000000010rb-19Xj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:23:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E08E43C2E;
	Mon, 28 Sep 2026 16:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC6B1F00893;
	Mon, 28 Sep 2026 16:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612584;
	bh=mKhdntCBuVlgMeNm8tbQb7Cnj6P4iyCp83pUTrwurPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=URguE6+ZiJyeNC5QdcF7Gts/ltH2DJ1Qu7uSOCowGgCEcF+9C4KLrt51H2aotox5c
	 cftSFvdc4aM96MQdsnRiHz8jfHhRtXQN8CuW76NXeXfkXQ+lDNFafy2obZFJ6IZmbh
	 fWKv9kHbiVy6wLNYNRi7EFaePBs5HWNZDagIAfCUbo8J8Yph3pbiEx8h6AbgVtuNoG
	 hReNO+zzzOI2P8iaXL///tviM8wsR7A4ObwmHP3Df2zhNFICi/E2w+dxkmV0IMrYr1
	 0hsvzcKC/oF5vyxX/3Ad+PVQ/muGvnEe9xFhcEUipJ1KSfd9/SEan4DMwqV4t9ULUi
	 fSeReojSssX5w==
Date: Mon, 28 Sep 2026 17:22:59 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] KVM: arm64: Block ID register changes after we
 rely on the values
Message-ID: <09970eae-2283-44a9-bb47-6c6f459d71a4@sirena.org.uk>
References: <20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org>
 <20260901-kvm-arm64-idreg-final-v3-2-a0ffa06fa872@kernel.org>
 <arpsY1oqmhvxRVpj@gremlin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uxnxKIWYwbBSuLhy"
Content-Disposition: inline
In-Reply-To: <arpsY1oqmhvxRVpj@gremlin>
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


--uxnxKIWYwbBSuLhy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2026 at 03:36:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Tue, Sep 01, 2026 at 07:18:49PM +0100, Mark Brown wrote:
> > In commit c5bac1ef7df6b ("KVM: arm64: Move existing feature disabling
> > over to FGU infrastructure") a check was added to suppress duplicate
> > recalculation of FGUs based on a flag KVM_ARCH_FLAG_FGU_INITIALIZED. This

> Just for my understanding:

> FGU = Fine-Grained UNDEF -> if feature not present really act as if it's not
> present, don't just not advertise it.

> And that's about ensuring RES0, RES1 handled correctly?

That and registers that are just fully UNDEF.

--uxnxKIWYwbBSuLhy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6lGIACgkQJNaLcl1U
h9CieQf7Bv8OrYHwyTU+Q8U2Ii8RoH7Y81j3ZZymc25xk67FyvKWoMlm90kSNr7m
b2KvlUUujGzbrKqVYvyDLVGokWSypH8rJYoe5kzxiWxXaVb07D6L7uqWagY4JFjq
uWESs4XLJrP3W2oOW+Mx/SSMTbVfep5+/WPaLY67zM1Lx67q3hS2mj5n8l6GQOcr
JGR0DpX/8oxXJi7Q6VMY5wxNB0ElSPVnh39qfQPz9obagNaBlg6OEWoEHAZdThLD
FDsuqz96LmeRxRlG/v+mF/8Oa5HoZ2F8usmq06X5GcbK8mfhAun/BL3tY4zARSdY
sLLmnysxOOkZIv2VS7BT1jG/oR8lPA==
=ZDVc
-----END PGP SIGNATURE-----

--uxnxKIWYwbBSuLhy--

