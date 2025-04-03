Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BC9C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLztPsr5eakqOjmON/tFU6V3RL0iAp8KMrGrYsXMR4U=; b=jHVdFbYDZf0greZIkB1by0xg2x
	/lhvRgivkZvs1GVwkty9Wuq0yCF6SEfLCg83bPU8wIgp00+3yaWaE46YETc7Mdq9afch33PH5ytEJ
	N7hKhdvJasIMvv7B9fgbNEbPtsxj50uy++/mxgPCMSFh5rkCMfdtNg/0VUm2WPxk7NRmt7IejrQ89
	jzdYv3+FmG71NeAucRuljABDbj9izCwBJzTP+rSzCPk9Oqu5Sk3nO2SebPnm0YOYiOHVip8hxcdbC
	7USMrdW7nyVJu2yQM8cP6hRbppu2sHDclVJtSlAu3eTcKSDqnXfLtmFC5uXXb7T3f4qgAOa7X7nSm
	zN0EctCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MHu-00000009C87-1qJy;
	Thu, 03 Apr 2025 15:15:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MG6-00000009Bvs-3Mr6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:13:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2288A438E5;
	Thu,  3 Apr 2025 15:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA41CC4CEE5;
	Thu,  3 Apr 2025 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743693213;
	bh=nbiBXDXZAlOQvo10+zoofvtVEMUN+xY7qBqGVHhpers=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJGDlWGIp+23uurxjtN0FzliArNVEFGXTjWhDmwmumYQxf4YwG8X1V/gDTSBeSAng
	 xK9QCLMq8OR0Z57WW9Y0yMUZsZwKqgJiGlvv6PGmSApSOOMIs7S4wvmE77eFgV3cGD
	 /5bksFqBt1wfCpxGAxdUdArvKPb0ngAKYR7iGJmbCAovdg6vYjd63rpR0VMfi28dGU
	 yAxdO3cQNZXt5Og7Q9Gyl/9rQu5o3UiejFQenpS6ZK3Oq1S0CsJTlGH/U6j9KT5Um4
	 nr8Nkioo6nmpPCC3TkBJ2pO6MrqM9YpRI90fTHJzkA95r3PCrn9O3Cpgb1JD3HXapD
	 qth2JFVXEfElw==
Date: Thu, 3 Apr 2025 16:13:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: add FEAT_MTE_TAGGED_FAR feature
Message-ID: <e397283e-4c53-495f-a699-16c2f556837f@sirena.org.uk>
References: <20250403141535.23496-1-yeoreum.yun@arm.com>
 <20250403141535.23496-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bl3Aw4IbGSVKLODu"
Content-Disposition: inline
In-Reply-To: <20250403141535.23496-2-yeoreum.yun@arm.com>
X-Cookie: Logic is the chastity belt of the mind!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_081334_911612_90A05303 
X-CRM114-Status: GOOD (  10.88  )
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


--bl3Aw4IbGSVKLODu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 03:15:33PM +0100, Yeoreum Yun wrote:
> Add FEAT_MTE_TAGGED_FAR cpucap which makes FAR_ELx report
> all non-address bits on a synchronous MTE tag check fault since Armv8.9
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/hwcap.h      | 1 +
>  arch/arm64/include/uapi/asm/hwcap.h | 1 +
>  arch/arm64/kernel/cpufeature.c      | 9 +++++++++
>  arch/arm64/kernel/cpuinfo.c         | 1 +
>  arch/arm64/tools/cpucaps            | 1 +
>  5 files changed, 13 insertions(+)

Please also add this to the hwcaps kselftest.

--bl3Aw4IbGSVKLODu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfupZYACgkQJNaLcl1U
h9D64wf+Nr2Llm6/mPq6+NvuhzVcdPF1hydswJcaFKW0vvrsQNZ4lVoKSvIjEpQd
UHlSgRORZ7WqXD/8CYs3nqGOyESHVPG+lASZ+KVOjQgfdA/ASEPCkeJqnzmOODnC
Y8chXEeiY/mdbjpKYs7VhLrJq/W5GroettA59pxxDW4W04aEp9hNXDFABAUEQDnV
56fOv3kdPrm56oGB6CAeMtcEfK4VGjnPJj/tQ1aMuWxnKtlmDwIpUpsfH+HX+675
AFu56782gvNwKp9Fxfgc3SKDtZ3nGoyHHYPxzjoBpHYL/IckhFsjGVDPR6Dzbubl
SlQlNnf5roMqmEubfwaHKVrFsGi0yA==
=yyPx
-----END PGP SIGNATURE-----

--bl3Aw4IbGSVKLODu--

