Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DADC71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUrCFkubRPGIH7KhLiMP14AD697H/zhWTU0QyZeS4oA=; b=YszuwAHOGRQIFy3gEIy2eeGDvk
	mKMwn3RtkWATKrCluO7PV44U6vajV97ChtCp/QrE1k5xqbX7h7DMJ5wBiIzePL9lA5tDmBy0fgoR4
	yJUBL+lbyEqPv2iTY/E+0oKnq/j6Uny84mt4oJlT1Bj23b3I0rbChvBQvo0UPELwzSwUirMVFnO0S
	x6xxvE4ZRyEa2R5BZyzwkbfIlgGWAj2iUwAI4MEJ1YvL5D1w3JTdF3AhfARZsO+L7fsneGacBSONm
	JXxg/VAjURmIWkS2cv6o65sxWjERRQ1ffwK92BzN2yIKvveQK+BthaMYifeJ3BxPndx3DlSj7MfTP
	pbqfviAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL3-0000000ANkL-2Ryv;
	Wed, 11 Jun 2025 15:26:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKJj-00000009ow9-0Sf8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F202A5174C;
	Wed, 11 Jun 2025 12:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3E6C4CEEE;
	Wed, 11 Jun 2025 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749643950;
	bh=SLJD4xSGhnQdu4G0Y8SleRMssURTGoQ/hhnSRqumesk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sezHiOaZuBVh2WM2w9v3+RnYxj8O2uvwWdqlcK8KwaMwuHN4PKpyQ1cbuaNgDOZOH
	 x3I1WuOlyNgGclKVEZGC0eQZB7+P8LHY6x8zmkVhA8rM3r12uX5IjbSFcC8FHyKmn1
	 4v/AgQMv0cIxBaEMzoHqvlXonG9Z9HdtBgFo50ACU4opYZTAKyUuy4QVvaUZ0BoGuq
	 LfyIPCa0psvy1UtVfcH6MMwfY0K8T5Qvkid1O4HFLt5S7kWHzhNuEQMKzRFP2qKtTi
	 7XXfyIVrvJECB5r/+v9aYXPqkQXXPPKhgsN74DnXfb99/PimSRNjSIF5f2RdBCbrNU
	 JhTpRZoTHbcQQ==
Date: Wed, 11 Jun 2025 13:12:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 7/9] kselftest/arm64/mte: add verification for address
 tag in signal handler
Message-ID: <5d2a3abd-f19d-4fe0-adfa-9a9860d7404d@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-8-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dMpReiqx5R2V4KiQ"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-8-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_051231_211149_AFC9672E 
X-CRM114-Status: GOOD (  12.12  )
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


--dMpReiqx5R2V4KiQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:05AM +0100, Yeoreum Yun wrote:
> Add the address tag [63:60] verification when synchronous mte fault is happen.
> when signal handler is registered with SA_EXPOSE_TAGBITS,
> address includes not only memory tag [59:56] but also address tag.
> Therefore, when verify fault address location, remove both tags

Reviewed-by: Mark Brown <broonie@kernel.org>

though if you're doing a new version there's minor stylistic stuff:

>  		/* Compare the context for precise error */
>  		else if (si->si_code == SEGV_MTESERR) {
> +		 	if ((!mtefar_support && si_atag) || (si_atag != MT_FETCH_ATAG(cur_mte_cxt.trig_addr))) {
> +			  ksft_print_msg("Invalid MTE synchronous exception caught for address tag! si_tag=%x, si_atag: %x\n", si_tag, si_atag);
> +			  exit(KSFT_FAIL);
> +			}

Indentation seems off, also there's ksft_exit_fail_msg() but either way
works.

--dMpReiqx5R2V4KiQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJcqcACgkQJNaLcl1U
h9D6BQf/aTNOEBHCdJx2AzPMclI0fnVTOqn3wjbjAva4lqTXOKFLHZfMukbLQgMt
ZFa2UJLpKBrYoh3CG2KucTHVJcFeDfXv2PQuxC98vDWOla6CX9m1+KmtYs0hWI96
wu/1FPcXTxhiymFlHU0Bp8LkfTfhimSXigPbKSCvyhSZWmg3UPp1f7S04agQk8N5
oiCzwjCfckUZh1yEmlJIF/ALdO7GVzQaV3J/vpE90pajKUK8GEw1KP7qm6GYMWj9
6bEM2rgEw41ohCucoKhFn41SEy0XPOEnlmEJEuWAnn5U8qWtrq4lP6gBE8L/y5wJ
cC5YE4Os4Oq3fc0aLmhlCtnVYLeBSg==
=etRc
-----END PGP SIGNATURE-----

--dMpReiqx5R2V4KiQ--

