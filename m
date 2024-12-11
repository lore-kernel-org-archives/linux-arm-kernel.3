Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714BAE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GFGBRoKYbX3/BHaisqy6VQSKKdmiRV5MR8dYdoSLoQ=; b=4Imh/LqaOmi1C5UYqbhKFJYvFl
	nRQeqfGkIj75NGXfZhvFOAZ7c1nsOil3z1pFSDeidNaLTknyYoxcXXzClUQ5+A8KsjVxEHK9YLBWV
	5zhrcGHEpR9+NLM37Y4xb3XK1PLCfeWw97vlJQKJ9jn/86XHCgcBeAan+IxKd8j2TEmE2KGz1rF2i
	nhl+DTuPlA1J4lg0Rq3HtrjRnXsK7bQF6e+VTRJAME1SFcbdtDH1VJTUX7ac40IWf82Xq8SVjNtmd
	WSjGhiyyfT1ptYC15D3tmZ6AzU8fa7W/Zj+NekpjrnOgPhNR8mj5/s0EjtFiOV12jReDvRGs6xm3Q
	ORq/sV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNd9-0000000F833-0ppx;
	Wed, 11 Dec 2024 14:23:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNbm-0000000F7ob-2cVW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:22:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D82D25C5B31;
	Wed, 11 Dec 2024 14:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82021C4CED2;
	Wed, 11 Dec 2024 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733926953;
	bh=9GFGBRoKYbX3/BHaisqy6VQSKKdmiRV5MR8dYdoSLoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIBTgR/4TwdzUGIzjJSjfptLWKWzXyBwEpMSwF8RNgMfq2JFTt/M6QzE04K8Hp1wL
	 I0WIipmMKes18WEkjok3ZQ5SWfpPmE06iyPG29rVDOL/3xVqNowImTU9/X6+xmr8Ba
	 ikCj4U1w1OZ6iy5gwnFgR0OsTZlu0J5mfpGAjgIN4JMOtDOLgkxRwy+wZNUbLfz/8J
	 8OKCWMqd29XdE1DKkryYzrkkZS5CNN3LZDcXrgcc6UKcParRnqg033OEOSX8rGorX0
	 ypPzlLLmo399cFBB3ZbtyCKIFwdHuw+TFVx5B9Gz+chr91XWfpTxeN5ALv/e8vPl4P
	 nz+UNpDYVZILA==
Date: Wed, 11 Dec 2024 14:22:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Weizhao Ouyang <o451686892@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: abi: fix SVCR detection
Message-ID: <804c336a-30c7-4d4c-b8dd-24912de39808@sirena.org.uk>
References: <20241211111639.12344-1-o451686892@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bJ96iDhLkg2PwTh5"
Content-Disposition: inline
In-Reply-To: <20241211111639.12344-1-o451686892@gmail.com>
X-Cookie: Every path has its puddle.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_062234_700419_B2BF3BB1 
X-CRM114-Status: UNSURE (   9.50  )
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


--bJ96iDhLkg2PwTh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2024 at 07:16:39PM +0800, Weizhao Ouyang wrote:
> When using svcr_in to check ZA and Streaming Mode, we should make sure
> that the value in x2 is correct, otherwise it may trigger an Illegal
> instruction if FEAT_SVE and !FEAT_SME.

Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks for spotting this.

--bJ96iDhLkg2PwTh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdZoCMACgkQJNaLcl1U
h9BIUQf6A/rU3f0f91Pf47ZodZLzOxU/d/asQ8duMWLaCfvdxZLW1fzCLXCl85tn
2ExRdxuvM9yNmk//Wi/Tvs2aRebFCS/m5H5GUdaelrDDFFamRaLD263wPPg6CF8E
Yi06wd4eQdzm8m9THHEqno2sluJIwfUJbaoF6F/ne8VYSUWROVE4Wr3UY4OWU+Un
Z+8jIecDVaxSCeAlcwGDQR6po6YDopwXqmcOcZ87YndXecqnIBFPuhVD/zYQpNAL
XEW1GVqElH8THyIuOk7cNmZ5dgQ9p002FPW6fQ5FlM6HhX0AA/8wlPK/yPoE+URN
HBPjGuZ+8xKYm7AADFPoYvqjuPrdZw==
=xbKO
-----END PGP SIGNATURE-----

--bJ96iDhLkg2PwTh5--

