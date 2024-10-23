Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEB5CFA452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtJo4zot3w8BwP/8zXFnTcSq6MtE2E0zlRxvZWsYvH0=; b=f/Eca9p3kDED4fTPSyaBVIYcj8
	SEoyRE238SuMR2vyLrZAoKKBu15XwJXkBuZ7V5CxZFTQOK7v9GC2efwn3a5L9rH3gnhcKPK9S5PKT
	+lgvDjiTjJiebEub+23FL9HMNk46dkSZn0rrg9wvmYUZiOV96od5N85FAPq51NoBbEsewLmfmsCE0
	+Z+isZR84RNiYphyhrNFjfPrPwPs6s8zkSBy6XBG8rao7gzY1nC1NXUEsuw8JJZQSfAZtDRsIBAyo
	J2nV6erUNXL/urw7EFqBynuqFU7IpU5oE0pJBd0SOdo8zU+CMsqvHiIXFVLgX8kxgLJhKpKMWpzxY
	zE4R2XKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3egc-0000000FFUj-3ACm;
	Wed, 23 Oct 2024 16:58:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dvP-0000000F5Pw-0Kcn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A9A8A41BAA;
	Wed, 23 Oct 2024 16:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8D5C4CEC6;
	Wed, 23 Oct 2024 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729699769;
	bh=n9CFz8/vOnmhIP7XRNL8O0kq9oZVGYkCgzkVNRTU0os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmoPNK0Nsd0z81eyOINYWD1x7VjEuzVcwQy6+mG7obZ//QlkmYkxCieOgrlHEH9UV
	 lepgKko4MMKnh7m/YGqgnfaB3uWXJu4/ryUlZXJ8Bsb3RgTf6opZ8rZMI8apJmvbou
	 tXj5JBdl3NSwqwsNZrE2ivQzIzsrAlJ5bH9zXJjC041F/EB4YjDLTTJOqQ3nJgoN5h
	 FxV8FVfxZd2u6/0clzFBGtyxGPgEKuVEDhrkBWro2m59bqs/BVixmBBQ6RpqVuqK1/
	 QsmraCS8XxcF5/1cl+Uy3uLHBti4cs1s4FgvrSxxKmxqFPLJuTPqm74ctgElKKV+Jn
	 MtXkSW1FOxQVQ==
Date: Wed, 23 Oct 2024 17:09:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v5 10/37] arm64: Define ID_AA64MMFR1_EL1.HAFDBS
 advertising FEAT_HAFT
Message-ID: <4a30bfa6-f4d9-4aba-9cf9-3da3820d1c82@sirena.org.uk>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-11-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zTWiFabwS6Q+EPcc"
Content-Disposition: inline
In-Reply-To: <20241023145345.1613824-11-maz@kernel.org>
X-Cookie: A bachelor is an unaltared male.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_090931_200167_31807DA8 
X-CRM114-Status: GOOD (  11.65  )
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


--zTWiFabwS6Q+EPcc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2024 at 03:53:18PM +0100, Marc Zyngier wrote:

> This definition is missing, and we are going to need it to sanitise
> TCR2_ELx.

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

I did give you a R-b on the prior version.  We also now have multiple
patches on the list doing a full update of this register, please pick up
one of those.

--zTWiFabwS6Q+EPcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcZH7MACgkQJNaLcl1U
h9BCkwf/eGCXEznpZaAHD5ICBMoWRTJ9Qc2+3a3q4Q5wlIN0t15c8dgG62kaVvQJ
2/fwIHBln2QbFvzpgTYXkZr4fV0mFxlJv0yrK+W0oJS+PsFkKhGiJd1QmvokICUc
nMxD+VNkKFa4SXpmTGMxDumhGOEw2OR4RuB8MKsEmwZgo1wASGTf+QwQUEm+b16D
vOzcafUYFkXotHP99s0Mq5Thcj5V0yn6wlrTOpnQo+QmhdKuDRtXkwPKuoEEnSS1
WnwGR/EsZ3IELb43obAV+P3TGWuL2WnR4r0aIVYh22QCoobE5R34wc8A4tVa6ovp
1CSFbw3KqIf1dqcueiY3Pk+074TeOA==
=Iq2/
-----END PGP SIGNATURE-----

--zTWiFabwS6Q+EPcc--

