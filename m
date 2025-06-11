Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1F2C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIJLAgJph7+Hc21ND3wEXb+OuB9nJ7aWml5DG0bpva8=; b=4k/Qx7V08FWvgt4rky6aNdeOK2
	ert+uq3eopsHWdrM3el4B4o+cEFTu1kAluU4VJZyRoF62jCSXisW0EfYxxDvpffAJ7uEf8tlTIPIR
	Y+318uQ6w5U8ZNIQtTlX/vq97AD78ArBDb5yr0EldwiU2fJH3t3AAHHJVUHiFOka6MpWqdvFNewJD
	eI4G0u3uTfPLLcm7jSESxsu0L1YjIwZwgs0LMqEJWf7su7phI2ZWVq2uCgRd5l6ATIijYR/kA1xcD
	42ENMGoGuL8t0yDMAN4ta+1V0a6rOt4Dqbm1jOCw2I38ZbF+rZjhMuirB7MDdEKlsiQKKOzxv+muT
	YtIwY2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNY4-0000000AQkd-0egS;
	Wed, 11 Jun 2025 15:39:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKWI-00000009qGi-1yWe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 776B95C58ED;
	Wed, 11 Jun 2025 12:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A59C4CEEE;
	Wed, 11 Jun 2025 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749644728;
	bh=ya87dO4a/HiSj6eipOEqSoaBIE/2f6SuK5LxdImo3jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXboh0x1SuHRoR6mxmMtneC+3hObxIcavh8WW9PHLDCq/s5tnf0i7VSp4sZ9j/mE7
	 dicI6iGqpPOZDYitJxifSE2GxxZWOs3XB7E+kdQiInXFW+dfvEwlXEds7jJEd4YcpS
	 6etZhw9baEpBID3euUjcKhfIBaiPv10chFZiJfyeP3FvMh4EQ7OvjA4pqvtCqzREjy
	 pxJvt5cZwOB4k/4pKyS6Rchm8HnIY/NPWKYBQnkh/wzc2p8nOh+4erSi17g185e/SG
	 JhJVX0KtnsCI7DP4Wf/lX5yhCwX9vebm+ywwhzZ2jhBlHJ5avqPd1bYN/PBG/hujqd
	 xAca3Yjrzw/uw==
Date: Wed, 11 Jun 2025 13:25:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 9/9] kselftest/arm64/mte: add mtefar tests on
 check_mmap_options
Message-ID: <9a81979b-2b9d-4bf6-88a0-5803483f802c@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-10-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZxWWX4yq1T0f5i2U"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-10-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_052530_549269_61FC7755 
X-CRM114-Status: GOOD (  14.72  )
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


--ZxWWX4yq1T0f5i2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:07AM +0100, Yeoreum Yun wrote:

> +static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, int tag_check, int atag_check)
>  {
>  	char *ptr, *map_ptr;
>  	int run, result, map_size;
> @@ -97,16 +106,16 @@ static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, i
>  			munmap((void *)map_ptr, map_size);
>  			return KSFT_FAIL;
>  		}
> -		result = check_mte_memory(ptr, sizes[run], mode, tag_check);
> +		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_check);
>  		mte_clear_tags((void *)ptr, sizes[run]);
>  		mte_free_memory((void *)map_ptr, map_size, mem_type, false);
> -		if (result == KSFT_FAIL)
> -			return KSFT_FAIL;
> +		if (result != KSFT_SKIP)
> +			return result;
>  	}

This changes the logic to exit the loop immediately if the check passes
which doesn't seem like what we want, should we instead change the test
to be:

	if (result != KSFT_PASS)

which I think is more the intent?

> +		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_check);
>  		mte_free_memory_tag_range((void *)ptr, sizes[run], mem_type, UNDERFLOW, OVERFLOW);
>  		if (result != KSFT_PASS)
>  			return KSFT_FAIL;
> @@ -192,7 +201,7 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
>  			close(fd);
>  			return KSFT_FAIL;
>  		}

Won't this upgrade any skips to fails?

--ZxWWX4yq1T0f5i2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJdbIACgkQJNaLcl1U
h9AceQf9ESTpI03oYV79ZBWSYTYktYpJpJCThnBIOdQEB+mQwDdhuDOrLIbso7bJ
GdlaFJ1NDJOYIVLa9jdfiG0kO2WSzq/yClIuGu/HubaKRiVwS0xcfbjfLO5KtrF5
kY1KJc7ZKqUIBA+Tbe/ntokLUqDnLuPgdINUBeSTuemBK9rbAQicUms0/ishICNs
976HinKbqFluPCrgcnVIsOoap5L/1A6ZTT8nAsnJLaK+BYTn/PGgNGgIX1NNbL7r
tX7//JsJpth6lfvUBklfvgM15FZWh+OSH6Zsm4uvML8qFgyf2Vy7CCntJ0XNIPdS
hrE2xe9NlVva3ernymzkyYMwmufd4Q==
=pXyY
-----END PGP SIGNATURE-----

--ZxWWX4yq1T0f5i2U--

