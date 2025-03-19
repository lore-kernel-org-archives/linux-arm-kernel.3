Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA04C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8hPagKbPuB7fz3X5Lg3RtNaeLruTBVSj3aHYFgk1NE=; b=Yfa9ypAQUz9aWcOoeBUExb3J3+
	JDBczHJSYcMUk0Qwmh2ebMnZqLPOiY0mEBj81zoyPIGCapGi6TwE9qYq9I9HATdzSEs8PYl5uYZGu
	EsRBUE1cGdNeK6Y0WltYB6adi51zmenBK+2fSKWKxdxvfcjy52awKbhaYproecugHegedbakH6xU5
	oVSSEjor2sxEFZB0WnRIhmtirxZiP/TraULa3iHZj0eGz4YfmeKi6KjDCPAs9Ke0i4Veeqgq2QigL
	aQq/s0GO9OXj1AkQGUyg27BLxnKdtnPc16HA7YCM1wwB3ux1uHF+RnvCZR8V2hFZ8eDU0muxk6c25
	aLkZAUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tutG8-000000093jS-1DLl;
	Wed, 19 Mar 2025 13:15:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tutDi-000000093O8-3ZbB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 13:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9CCA3A48D4B;
	Wed, 19 Mar 2025 13:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C931C113CF;
	Wed, 19 Mar 2025 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742389949;
	bh=n8hPagKbPuB7fz3X5Lg3RtNaeLruTBVSj3aHYFgk1NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+abxySmgb4KrrYS++Faii+ngdDbuQnepKCNH0eWm/3AxasnpSlOD+o55gBS2ziTp
	 eW3HpEv3Dmi/vb++HC/wq6D761CMKQs3JU6OcyNFoZccZpc5r2HviaakBG+SFNgGPM
	 Tnz0KiW/EOztzT5M+CqG6IFs6w61wAc6IEtboo4isx9K4u4+LWWbokF3hNTfxiWBBW
	 MAAhzwy3Gyxvsm4A61Km6KNR/Og7i6rx9ZO+Zeso2frWa3NwvDdwo+MYfD4qDFpSMi
	 SBtQm7hDwYDe7shG5qVc+AFlwYMAAx5oopYqTrGeOG8kmyo7YPmMU9B9sIgB/jguJZ
	 lqe1+Ilkx0zHg==
Date: Wed, 19 Mar 2025 13:12:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64/gcs: task_gcs_el0_enable() should use passed
 task
Message-ID: <979bd797-6f92-4195-989c-9a004d0d018c@sirena.org.uk>
References: <20250318204841.373116-1-jeremy.linton@arm.com>
 <20250318204841.373116-2-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1WyOTuvindCPGRH2"
Content-Disposition: inline
In-Reply-To: <20250318204841.373116-2-jeremy.linton@arm.com>
X-Cookie: Chairman of the Bored.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_061230_951565_B754BFA1 
X-CRM114-Status: GOOD (  11.78  )
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


--1WyOTuvindCPGRH2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 18, 2025 at 03:48:35PM -0500, Jeremy Linton wrote:
> Mark Rutland noticed that the task parameter is ignored and
> 'current' is being used instead. Since this is usually
> what its passed, it hasn't yet been causing problems but likely
> will as the code gets more testing.

Reviewed-by: Mark Brown <broonie@kernel.org>

--1WyOTuvindCPGRH2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfawrUACgkQJNaLcl1U
h9BglQf/V4W+8RCMCKLae1WNVlW6t1laAXA8fGzyIRqPpHvOyM4r1/FEClh5LLsW
25z4xfwfAm58qvknNwr2f8qh1AltjRq7pTBqxYynX2pr9EVY71ZhX4QtuwAPMz1K
c7kwvxvQjvMBgdhfL4/eS3J2nEVB0P+sesI3eflrcVLoHR7mGX4r2BhErXo6qXyk
gtOemiHpwbzjLm4vV9q7lP4egKPMjSAwv3qe7LaNSTzYXBtUvUYZrTOTI8sMcLn3
hEDf7oukp0WiDeAvVS0hW5UdtMnNAZPTmxaZ+jvp9QCXFQFLYLZ1oJiWfBOaDzpH
QBt0vlj3s7lgFRbcxMqTKiDQCUdWYg==
=oFyA
-----END PGP SIGNATURE-----

--1WyOTuvindCPGRH2--

