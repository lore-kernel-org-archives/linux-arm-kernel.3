Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C251BE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drCjzHvtjNpHff9hGzqloOB/2JfX6x56fLo/32hxt6E=; b=0u/Ivg0gy/KSAhCyhudqaJJ4tc
	SovL/FMvVrHu9MZRgQXnHk7uqozUaoKPuoeA+ABN/yhs6emxg+M42cX34EHCPPW0a2T8DrAtYVJXy
	iOl/gLI8KQNSvPuV40rL2NkKZQVUgnHCGvqTIHsp0u9yYDN+QMHqadDaI5xFyEytzBAqrgP1eBUXh
	jCBCBKNspHmujh+m/l/Q/CleXnFFQTFYVkOb+VGCb/lvJjw1PVFecmUcdSps3AOWndaQl1frvLaJA
	/nL6OYus8G6Gg8Xm+cbbBSeQoamtHYptLkcjV62di6WvD0QXyALlD9CpCO29lA+XrYQhcTqBb8b5/
	zYlEwpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDVt-0000000GTen-0lZH;
	Thu, 05 Dec 2024 15:11:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDOr-0000000GRu8-069r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DCC6A43DAB;
	Thu,  5 Dec 2024 15:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0A0C4CED1;
	Thu,  5 Dec 2024 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733411056;
	bh=D+6lIZ9bV7/xmzLlToKOUu2B1ZQZPieWd2KlAr78KFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFLtffy8VkU0jop2tBE4Nby6MYHqO9tZwCt3wlR5Y6DtZRYvtVt1sLIPUxa7orxN9
	 GMSUCXqbiKiLjiQuuFKz0RflS4afn99I+O2ZLpY+iHR6JYmP4TcwBuovzXI8q9eUbX
	 pbqNeiIiC866KjlpDRx/tDV1828q0r2+rW+CwRwALRDcVrFtvu6FMce0MfIG/+50Md
	 /t5M9uZxzMZlfOda4A+pqp5RQyrJYW9AdWgdp+QzLBTLA83OzDb44eBi6FR6t6cInq
	 REIx0DBED9ljs/QKgUeReKQ0QxAuEAqPk3gqR9YAHbTMj42JP+6yCCXCdVEdpSRWC4
	 vzHdM6+CTAakg==
Date: Thu, 5 Dec 2024 15:04:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, catalin.marinas@arm.com, joro@8bytes.org,
	jean-philippe@linaro.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	joey.gouly@arm.com, ryan.roberts@arm.com
Subject: Re: [PATCH 2/2] arm64: cpufeature: Add GCS to cpucap_is_possible()
Message-ID: <051c017c-a60f-48a7-b09f-07f0f32e48e3@sirena.org.uk>
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
 <416c7369fcdce4ebb2a8f12daae234507be27e38.1733406275.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fK5nFpGDFbAVSTd6"
Content-Disposition: inline
In-Reply-To: <416c7369fcdce4ebb2a8f12daae234507be27e38.1733406275.git.robin.murphy@arm.com>
X-Cookie: System checkpoint complete.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_070417_131969_D3D38ED1 
X-CRM114-Status: GOOD (  13.57  )
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


--fK5nFpGDFbAVSTd6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 01:48:10PM +0000, Robin Murphy wrote:
> Since system_supports_gcs() ends up referring to cpucap_is_possible(),
> teach the latter about GCS for consistency with similar features.

Not clear why this is part of a series, there's no obvious relationship
with patch 1?

>  static inline bool system_supports_gcs(void)
>  {
> -	return IS_ENABLED(CONFIG_ARM64_GCS) &&
> -		alternative_has_cap_unlikely(ARM64_HAS_GCS);
> +	return alternative_has_cap_unlikely(ARM64_HAS_GCS);
>  }

Ah, this is bitrot since the series was on the list for so long.  As
well as HAFT which Rutland mentioned it looks like _bti_kernel(),
_irq_prio_masking() and possibly others have the same thing.  Ideally
we'd have no uses of IS_ENABLED() in these functions so it's a bit more
obvious.  In any case

Reviewed-by: Mark Brown <broonie@kernel.org>

--fK5nFpGDFbAVSTd6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdRwOoACgkQJNaLcl1U
h9CKCQf+PJ8xyxhvWUHGbBuvArpSMIsFSw+7fhNagnbBeERzr41D0PePE5LX+Cmk
6dz3kmNjq6dOXgE+3Rfkg6b+TXeIOusL+uYCaBrTYQBnEWM+lk9iLoDFQl7GGq3f
+qGLeP9ao7/bHZw4fud2kaNQqnRhkaQWMKBWgAqSJkJav74Px4IXdVUR5PhvtEHV
N21Wqm2F/0/deeX8i8MWFqXIzVh3xGmHaNSTvRu5Cu6pZf0rKMKJ4zfPuvKOxLIb
90qIFQ0LxjTmPJ3MbfkcpB79OcHKz5STwV+lc2MM0IEsMl48cqrY70xrnSK8MGRW
dlGUimQQPI5s+0N/rctb0kDpMXz+mA==
=NPof
-----END PGP SIGNATURE-----

--fK5nFpGDFbAVSTd6--

