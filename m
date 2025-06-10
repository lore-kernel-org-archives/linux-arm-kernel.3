Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A83C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/0vOKGnYhqRXSzWEfu7o/Jh/rwIFPqRA3jAoO8+n0g=; b=tTiZIRhbRkkg1gIy9r0UpXx4EI
	TilKk5Q2W9DHR+S5njsQOXYYua5P4U1s1DHXRnhplFCjCjvVYIagVFkicitNAab0q5KFT4o9rB6tS
	VLJkORuhJCVy1AZSKAeswl2V1KDV2Cx33u4VhFEhjuzS85ZHE0bodaz2Iwrqx8rhQZckZ9n4mW0eB
	1dxdUxuHkfbPoNwVR8MEml4yF7VOD4nT369kHJaBsuMmrVBAb23SbVZX91z7Y8HRxu2FgggLS93PT
	l9d9WDLjSnhp5kABV+aXeJ1eqSnxmKsYAfvCYF22Lyn8a9y8rB5/QAYBUh2sooeF8MuRiq8zsC2Bn
	TLOVQUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4XR-00000007uX3-1Lky;
	Tue, 10 Jun 2025 19:21:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP13W-00000007LLJ-481M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:38:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2C7A44ED7;
	Tue, 10 Jun 2025 15:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2697C4CEED;
	Tue, 10 Jun 2025 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569910;
	bh=YN2abfYTzSNS/+hpyJFcfBAwNk3QerwbhJuKXfXBLZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttO/2+H5eQRLnu1nZSrsbB8yax6s0pOvJr05qK8/af+y3dKzaa4XYMCuCFsGrdlhP
	 sbsuvkkpksTCEEbRuvfDK54h/wJRXhQfvn7s9wCC+c9BWzjMn9vf/f+SZPPsGunpCT
	 16jI+eYsZNvVfNQueTYmvOjWFrgrUDRb0tal9dEAC/F9wZcwg+kG2XF89gxeE7ZleN
	 vRxFpczLdfS+QGdnX8S0VubCl0DEEvjxpCaZ4rmDA0Pt6x8i2WiDi2QYQG48QA4oXE
	 5Pva/rXpVnrB1g0VeHQLwEtSgqnV5TnikGVGZ+RJIxuSHYveDhV/laQ0+z95u+YZeV
	 WHYG/SyHCsewQ==
Date: Tue, 10 Jun 2025 16:38:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 5/6] kselftest/arm64/mte: refactor check_mmap_option
 test
Message-ID: <69778d2c-3ace-4fbe-a55f-297e280f8761@sirena.org.uk>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
 <20250610150144.2523945-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wiurY4jNrpHPUgNi"
Content-Disposition: inline
In-Reply-To: <20250610150144.2523945-6-yeoreum.yun@arm.com>
X-Cookie: When in doubt, follow your heart.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_083831_060603_AB4E8636 
X-CRM114-Status: GOOD (  14.53  )
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


--wiurY4jNrpHPUgNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 10, 2025 at 04:01:43PM +0100, Yeoreum Yun wrote:

> Before add mtefar testcase on check_mmap_option.c,
> refactor check_mmap_option.

Please describe the intended refactoring here.

> +#define CHECK_ANON_MEM		0
> +#define CHECK_FILE_MEM		1
> +#define CHECK_CLEAR_PROT_MTE	2
> +

Perhaps use enums for this sort of thing?

> +{
> +	static char test_name[TEST_NAME_MAX];
> +	const char* check_type_str;

Coding style would usually be

	const char *check_type_str;

> +	snprintf(test_name, TEST_NAME_MAX,
> +	         "Check %s with %s mapping, %s mode, %s memory and %s\n",
> +	         check_type_str, mapping_str, sync_str, mem_type_str, tag_check_str);

sizeof(test_name).

>  	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
> -	"Check anonymous memory with private mapping, sync error mode, mmap memory and tag check off\n");
> +		      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF));

Looking at this I can't help but think that the more common pattern for
test programs where we have an array of test parameters that we loop
through might make sense:

	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
		format_test_name(test_cases[i]);

		switch (test_cases[i].test_type) {
		case CHECK_ANON_MEM:
			check_anonymous_memory_mapping(USE_MMAP, ...);

That seems a bit more legible and maintainable.

>  	mte_disable_pstate_tco();

The management of this could be added as a parameter in the test struct.

--wiurY4jNrpHPUgNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhIUXAACgkQJNaLcl1U
h9Boxwf/dZbDq7YqYcbr08R6zhlOta4jGhZDU+Ik+NUZ6h0zOrm/eN4p2q1GyOQQ
UBaVFS6XoIDDwj9dq0EepDjWFCzfvSMUTQlmTpsiZRz7WUtT1Arf5Hyj70NlSM6G
Jwp45Bd0RGSnp2Oqto5PulRstpLEAcFPOfy0yxi5RUQ0fb/PKZ3HVa640wxxs+s1
9LLLkdqf/DAkWNveuKTbLlpjuQa2GqHRPOGxvft392o36Vj2B2xOyyX1BTtU1m64
0e35ZUud9tpixP0m05mkemT53/HXnziTuZHY/B4FIfOf93oDOd0OMEfAtSsE/qgs
2i5Pz9GXvPgJCKag2F9ZrKirf315Og==
=2tuw
-----END PGP SIGNATURE-----

--wiurY4jNrpHPUgNi--

