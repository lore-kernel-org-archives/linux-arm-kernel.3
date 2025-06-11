Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D021C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJt4wUvWYOgHjNVmZCdGGSU43kMPSCsm6+NJxSOJ5XA=; b=oxmAKK8L2tjRxTy6ThtQWCf795
	p+IYFz80WN9KCb1Pczf8PT7Vjf2WcG8Ec4bnQz3hkrr7h1LsdPpQtUhLv++c/xGK3VTk1kfxi/sBd
	S6YLpXSCnJM8q/S7wC7pPxLZgxz8+5qDZc32ItTnV+v2A7QYvp/Br+/2aPijMFr/kIs3Y816xYA8T
	sww4wtenvohW1B8mbA4w6NFrt15rLZ7njfftqTK/noICLqzAY18Cfa/q+o8lvGbeOGMIclYuzbd+P
	ggb7TgmDD9nLDKs0IRCZsW75hBo2f/RMJlnJou5tYpfwP6QWJKUdCq3WDzMyZ1sQ1L5RPKHOhvovT
	JyFAipig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSh6-0000000BFUu-2eoh;
	Wed, 11 Jun 2025 21:09:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN9q-0000000ALm0-1B25
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B6F45C0BDC;
	Wed, 11 Jun 2025 15:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C14C4CEE3;
	Wed, 11 Jun 2025 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749654869;
	bh=8zfSXXFV1xgQJy1mUdrZsabuC4LujniNvHm8OnpJ6Zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0uCF56r6j27XgvKCyCizr6xrutKJGUpp4AcCHT01Rw2e/qrfgs/Rz0yVtixer5wA
	 NM4kEDqYDy6IBEPkT0fueSGEG2lVijkxx7FkcKeJ8KYVAtEKPspcaf4OL1hgJFEv/2
	 dRymKCmndm4aW1LSOrrxbtVnxKdcmxj8mx5nfgv+RYUgHNHQr2Y2O0yq+1nwUn6dxq
	 fZAXboHW54lLSudqtZQTyJQRvnCil1OPpdmtpSVAJFt1Q5cMOPPeUGBl3x02Rd4Dki
	 4DM5TwWiO5LnCO4Q1rk4WpGkXEKr118k+JydDJVFosiBFdVi6NNOHXDxYe9QJsEC7T
	 +aHrMIJWdwUhw==
Date: Wed, 11 Jun 2025 16:14:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <9a78c058-2aeb-43d8-94f8-987507a1a9a3@sirena.org.uk>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="llNME2sYZezlFhNO"
Content-Disposition: inline
In-Reply-To: <20250611135818.31070-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_081430_354680_22481413 
X-CRM114-Status: GOOD (  10.43  )
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


--llNME2sYZezlFhNO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 02:58:11PM +0100, Yeoreum Yun wrote:

>  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
>  	 * for tag check faults. Set them to corresponding bits in the untagged
> -	 * address.
> +	 * address if ARM64_MTE_FAR isn't supported.
> +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
>  	 */

Should that be "are UNKNOWN"?

--llNME2sYZezlFhNO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJnU4ACgkQJNaLcl1U
h9C55wf/TdyfC/w7P1v4F0hQRmhNZ6ZT6FQpZRqi0HVD/ZBIHWgIpUenQ1p+dTrL
Yh9K8yel2k1AKNsrZwpcTYGX6EHG1e+cpxTBHRQ1QBAMjIZA4QGpUqmBLFv9HSa7
fQfN06W843PM4GCO8U94F7ovaj+Vtroe01uCZhkO0zaYGpuBppaL0yWKw88unErL
lRnHmzOy74Vip/f7zNEdXYscNcBrHQW9hIZj+RFi7sE9jykuCCxQlrT5kTNckmAV
BWwj7tCisc8IRj/ov8BRtANfk3BqZlLsHtBCkMUACdNCmnhATAbhkZa1tQUOsROl
q81tUHwm4zYBMoApcuEa4DSp2Ex73Q==
=6B4e
-----END PGP SIGNATURE-----

--llNME2sYZezlFhNO--

