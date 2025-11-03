Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558B0CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYpE/o8QeVnvKWPaYcPJE1tYaZ7Vi13aXpPbvbysa7w=; b=K2/k98yZjyHSrbuqU2Gs6Zq7LL
	JDFgn/iX5IwG997fOfe77ANy+E8bj0YNfrA2mPen0H+yhWDHdXnH5OKU/38vMU2oeFHZos0EahM1i
	Zs3OCMBt5CmHHtlkvxuhUpF2TRUOPR4kNFytQOBnsNDoEVgpgvsVU7nDu/DG81OCVktgjs0lmDpPt
	xhsPCDMNRAi1aRfX436WMcGWuYoVq/b1uIuX2G4pMQT14dNZhUx9zqY1zoSYhIg2e/vS7X95VsMAo
	3sIT4TgD59gJCkVHIVIieVkC2X5pUeaPzDT0zD9byUZV1yjjDGeuuf98fOBcyda4+sptDroGf0Tgh
	rC2EF9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxdx-0000000AI00-1L4D;
	Mon, 03 Nov 2025 16:42:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxdu-0000000AHzR-33hK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BB6043745;
	Mon,  3 Nov 2025 16:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63513C4CEE7;
	Mon,  3 Nov 2025 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188174;
	bh=pYpE/o8QeVnvKWPaYcPJE1tYaZ7Vi13aXpPbvbysa7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBVbreQjg37cDVv0mGvX9dbU9+n08cbq6ZzOFDSiW6enAmiVfVYCyGNcGGp4+vvTC
	 DCDPxeJW9+EoKUqPzu6kcExrXZyKFYtkt7V0NoTfp0Md8uXB60buGicnmPTIt57IwI
	 syA0XqyVDb/lvrd4sTJQImXC4kHd/SCzdmzL7AmI2JTUtGs9Z3kZAUxykwq6J/PsS/
	 jQ2qFU0312rEPhkXayASbbsvhHt+qCIWlQ1hI3jmKbiuFNahkM40CQECEtUbgZFgJY
	 qsg6Y00CMlYCAu8c8SjFbUVO79jh61/mMate8J7VrZ54LSf+vs97sGymcDgRelmtZc
	 eH4dbDzM0sgEw==
Date: Mon, 3 Nov 2025 16:42:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, yangyicong@hisilicon.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, pbonzini@redhat.com, shuah@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 2/9] KVM: arm64: expose FEAT_LSUI to guest
Message-ID: <aQjbiyNWZxrjRLQd@finisterre.sirena.org.uk>
References: <20251103163224.818353-1-yeoreum.yun@arm.com>
 <20251103163224.818353-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SsaoZEtYAOX1mTlI"
Content-Disposition: inline
In-Reply-To: <20251103163224.818353-3-yeoreum.yun@arm.com>
X-Cookie: If in doubt, mumble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_084254_785117_9B964684 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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


--SsaoZEtYAOX1mTlI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2025 at 04:32:17PM +0000, Yeoreum Yun wrote:

> expose FEAT_LSUI to guest.

You should also update the set_id_regs test to cover this (the addition
of ID_AA64ISAR4_EL1 was applied now).

--SsaoZEtYAOX1mTlI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkI24cACgkQJNaLcl1U
h9ADVwf/SkI01bIU3sqijvh+m3ciwOMaw8AQTOZ21rAp8NHnf0xynHjwbIP0GLzh
z8Y19mBYMVtFkTkSAsPsHauHZbzaCRgN/Uje2OhNJTvJK9sRmEJr/Zvr5TgedGq4
5ypibycxN20qO9Zkhf6bVvclZ2Q35qHuM5ZQz8Vkbad8TmoZLS4x5rIcf26AFRS4
Cf4Zl5DoA5jFOesZmz6jKxYGVMPz73zOF4owaL/Hake4ZvG+JO6ijjqOGcPFjWP5
Bhs9DTIzOQzG4Ff2WfQw6VwWL3pZP+dMAKyL1cQnUkl7MaBHbDhVQjRsZhpxUNLh
2eTrRDfBp0Wez31IZmTh1EH2AMIobA==
=Vduu
-----END PGP SIGNATURE-----

--SsaoZEtYAOX1mTlI--

