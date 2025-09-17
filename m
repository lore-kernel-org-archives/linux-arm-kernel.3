Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B426BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwNSmdi+KZptf6b6MK55g50B3mbRbByQWSDIfsJFSMQ=; b=2DCQUmGawZ6I2WDD2z9EY6C6Ad
	+tgqYz4kycKWjYK8GKgKSYqbHUxp56IHMqs7fKWSH/z8Mzo5yn0nO3rWLfBOXjCGOTLLnkETuL2Y1
	vp48bu3Br0bAXuKGLBRpXcdsLVC2CyxOVlHR2UYsXkWp/SixLERvDihG1ze/MjIGtNYo4KwxWRiGO
	zdVvUwDv9DXDWfBOq0Kukl8iSoSHulr7iGKZJOTWKV1SerL0KOGyxaUCEdmIwEDYuCHIpTfXZOPET
	BsNBHMRf4zivFn84b+giaCxFh3OCbeK7nNWHVty5uiX0Yj4trvmDe1xgdkRGFGXJhAB9xY9ErxeTN
	iQlOxdPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxqA-0000000EHs9-15wj;
	Wed, 17 Sep 2025 19:29:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxq9-0000000EHrh-1exa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:29:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBF7C601E9;
	Wed, 17 Sep 2025 19:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE73C4CEE7;
	Wed, 17 Sep 2025 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137356;
	bh=PwNSmdi+KZptf6b6MK55g50B3mbRbByQWSDIfsJFSMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzFgPD9IWTdKPsaTt18Ghq7Sh1MfkRZHqJSBHqcEg2CkyJGEopiUmzN5oO1gqS1Al
	 34Mw8dSikLk+oc4gvm0WnwR4ah6sYEsJsG1A4GbRKFHD1bOFzraH2ef5ECAkcrooJz
	 D8JN1s2Sk7whLwHcaI+n4gZ0fEqMPUYg0kW892MK9Zu7/9VuG2G9bAEgYYUymXUb2n
	 McG7RZgucCKu4hu3MIy18JRmSXXRbq2ZRG4h9bpGdS3MIoTgWZs7dU4vSS/nQth1Q7
	 JJIJq1eBaa9tO0+zEOM14ekJDaRT89Qj6ad6O7FkN5e/oDi2I77hfu7D8WxDaUchJF
	 MR4nOsZkyt+Kw==
Date: Wed, 17 Sep 2025 20:29:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	krzk@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, ksk4725@coasia.com,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, smn1196@coasia.com,
	shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
Subject: Re: [PATCH] dt-bindings: timer: exynos4210-mct: Add compatible for
 ARTPEC-9 SoC
Message-ID: <20250917-credible-refined-0e3e244ee9c1@spud>
References: <CGME20250917071322epcas5p3b25ff15ee16f58aa3101f2fc44b554cc@epcas5p3.samsung.com>
 <20250917071311.1404-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JN60OKxJv97kyLy2"
Content-Disposition: inline
In-Reply-To: <20250917071311.1404-1-ravi.patel@samsung.com>
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


--JN60OKxJv97kyLy2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JN60OKxJv97kyLy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsMBQAKCRB4tDGHoIJi
0gqTAPsFO9w+7JD4IB/fAJAhSZhGgnOF48FKI1HkhpszyX/AqAD+NOEkyGMMFp9K
scg8d9Hj8Q5MWrEH1LUvTFW+1N1OPgE=
=0ePc
-----END PGP SIGNATURE-----

--JN60OKxJv97kyLy2--

