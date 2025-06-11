Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0548BC71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChSNUVxFtx+wYinAqz6EG6K36rN3iauMcmFkc5ToAHQ=; b=YbBT4/wFuRV1ycM2hQL/CPICCs
	f4Qlto/sv1YGVm5nzeaDKIPB2tI+HPBY20kMTJ4XfV3rFKCtTmDo7bdViG6+7vV8i44YnoScKPKCY
	zVXBpLS9Irn7iABcgXQYhD8Sa/LHf+mERgJ/xNR6zwTjRIqflITpyIZkgQYozbw3qfZLi1fE7xRBP
	3ZljoLfQwOCCkdXt4BOOdYM6tA8yN/B7xNm0l5B3KH/5DZ2E3/+srK+9WmqHrDYZvLp00Mt0NDUfr
	T8jaq4BMrLRiX5eZ6l1pmLZ2JBn5fmZMWyx2VrMpvmf6QXlxdeVD5KaGma1y632W48EZKlXI9Gf8f
	+E9hTRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRY8-0000000B3ps-3YSY;
	Wed, 11 Jun 2025 19:55:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNjN-0000000ASgi-28dI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D2035C4756;
	Wed, 11 Jun 2025 15:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9CBC4CEE3;
	Wed, 11 Jun 2025 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749657072;
	bh=ChSNUVxFtx+wYinAqz6EG6K36rN3iauMcmFkc5ToAHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3bJdu6AdPM4A7YDrlYN5JyWQIMAhVg7y5ZO28UKkatL2fukCeREnf12+AgIr0jHQ
	 RX5SLdxuy2Z1xjnOjUEKREayHeXTp87hVneG2MunraowOH5wjHFmbOu0gGnadi++OO
	 rYRkwgQeX/OXfIDetDT6GZyB/IzN/HTlLCJGuWKc0+m3d1SSxf/YE4dHLssAm4+fcT
	 mnXYt5NcUtCGnDWS+vdwoQcRigOa2mz9lt3hSiWKXSkUoHtBTNB/6VSz88jy2ZL46Q
	 sRF0VgyaGsyi/ALe9RG7hORY0/G788mBJqy5mzSdPyE98LpAuPo9bfqIi4XW0c4HPa
	 GEwM2R50ki0wQ==
Date: Wed, 11 Jun 2025 16:51:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 7/7] kselftest/arm64/mte: add MTE_STORE_ONLY testcases
Message-ID: <49b4a106-2ddb-469d-b556-f8f63577a167@sirena.org.uk>
References: <20250611150417.44850-1-yeoreum.yun@arm.com>
 <20250611150417.44850-8-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3aAzPfVUTizjUcAZ"
Content-Disposition: inline
In-Reply-To: <20250611150417.44850-8-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_085113_586015_1461F997 
X-CRM114-Status: UNSURE (   9.24  )
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


--3aAzPfVUTizjUcAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 04:04:17PM +0100, Yeoreum Yun wrote:
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.

Reviewed-by: Mark Brown <broonie@kernel.org>

--3aAzPfVUTizjUcAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJpecACgkQJNaLcl1U
h9B2QQf/d+mWZ97O/areQImQSq75oC0pir5NqGhE3ks+INAvV4Fij8ENpSl0kxDy
rag8fm1VD6d1qzB5GjVwTWwEe1CWNC5TD/KUuGsGXwQkb8sBwJEy47CrfpS1Wedw
9WTqAQ7LOxzRcndgAo4vhETFB30Mw3Utq0MxC4TuQ4sxvy9RLI/nsXjAg9Y7q6ra
GH1KHDCW09fkKT91PbNZHzcWNDeIuMp0o05iEw5+RsO1Mc9muJDmwSEGHjL4M+IK
N55Z5doe8q8I3JoVt3bEhiPTgi5UUDlv+pwkwGxZxhLfg01Gqb1tJJGgg69yNeqt
PauxFqN+E5yeoR0WnatVADkwG7Coqw==
=y/aH
-----END PGP SIGNATURE-----

--3aAzPfVUTizjUcAZ--

