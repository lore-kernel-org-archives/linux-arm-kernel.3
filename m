Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4824DE73158
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc8a2rbCtfYJgdXVM0pXyxTfODD9++p7QslTeHAYTaE=; b=JPyR3rFygMu81a0IBwn0FQy856
	K/zV/hfI78VsOUA0fFGsqURdk/FAUMaloJEeauB3SbUDu5y5+hQTkS0b3OkNvg354fccXVRYJFCkK
	hs4LlzwZ4/IQIh56+OJaQunxh0c6MYuD2y15wka7FXboMoZ19OBizskU+M67noCUC0U3FTH3Vohx7
	rwVluBpJKUqeIcJ4LvUsyHmI+rgMALpfhdvCdblFfYxdVp5lFNG/27mg7OTjI5suIpUoJ19Ge7A4R
	UP3eQS5xoay+k0iWabmbBK2uzBwfJIgM5peNwtK8+tNN70ha+X4UQBzorZzVJeqx65ClW8GdkDusS
	pr8xKf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtiH-00000004zQd-0wx2;
	Mon, 02 Feb 2026 13:11:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtiD-00000004zPy-3ib1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:11:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8307641B06;
	Mon,  2 Feb 2026 13:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16320C116C6;
	Mon,  2 Feb 2026 13:11:26 +0000 (UTC)
Date: Mon, 2 Feb 2026 13:11:24 +0000
From: Mark Brown <broonie@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Fix error handling in
 arch_set_shadow_stack_status()
Message-ID: <8b42459c-60ff-4c04-b82e-f784677d1fb9@sirena.org.uk>
References: <20260130-arm64_cgs-v1-1-c9b6942b6b70@debian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xn4s3h2wHJKFqJWt"
Content-Disposition: inline
In-Reply-To: <20260130-arm64_cgs-v1-1-c9b6942b6b70@debian.org>
X-Cookie: Bedfellows make strange politicians.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_051129_948568_5FA7865D 
X-CRM114-Status: GOOD (  11.48  )
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


--Xn4s3h2wHJKFqJWt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 30, 2026 at 01:43:09AM -0800, Breno Leitao wrote:
> alloc_gcs() returns an error-encoded pointer on failure, which comes
> from do_mmap(), not NULL.

Good spot, thanks:

Reviewed-by: Mark Brown <broonie@kernel.org>

> PS: This was compiled-tested only, given I unfortunately don't have
> a hardware to test on _yet_.

You can run with the Arm software models, shrinkwrap provides a
convenient way to do that:

  https://shrinkwrap.docs.arm.com/en/latest/

or the very latest qemu.

--Xn4s3h2wHJKFqJWt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAonsACgkQJNaLcl1U
h9BkAQf1HI60VaNVlqrjMf64dQLTH8yYaj/y+fv6cv1dH9Yyvzrd2QyI9Tv3/CKa
L2Hmf3CFgfNF7wTYy4LKboXLqt/vsRJHCVEhh+1Zli777TPSOwIrsbijramI+TwB
YYz3TzibtVEATJFM66mwgrYrW65jPe2TTgsfsoGV0W7AdvMGe9KFGCO4tCI4/zi2
RhnV9lQQ35edXezXKx0mvjCTdd4d5cWHUlI/jMCr5jQs1ETtZ+mZ5I5vyeqm4gVo
sJCp/izavcK2q6f5GuFyfXTIc4nIe+7dp8v8fwr0Bysf0JplCHH4ltN+3Lwlhy+Y
nHyUE1Kim3jTBut3PS8iKWS+xMzj
=Jmnq
-----END PGP SIGNATURE-----

--Xn4s3h2wHJKFqJWt--

