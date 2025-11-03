Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8352ECCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=944WUfKnF+Zba+I0xlHeqcuUGP7ut3bb3xelPNtHWpM=; b=n+wAu1Fbv54HMQeOKuhtFErw8l
	ZbEK2Y3ZFCmjiL5eMKuWOXL4Qvdujk2Sjx4SXVDTDfEBkmurBrTOaB9unt1IwExyEcsRPqlWmWzYu
	Nsa+h0dhLCWZ31Ic3zKZ/N/8GQmyp19UWV09sETXOmF7nxCwEsZvtcAbR2zmELj3lrP4yxnOTnOvG
	r9nAntMLci6UaII83D9pUgI+oVzaKvsdWq1PX4OlD+7KlPqpyZpK3yxxDrZ9PFBKXhNZtJEh972Ev
	48ZZnLmXkdHBenoYlOBIZ6M9S5g5T6CkcgibFV9tUdCnfCfIep2e0oaWxAMrsLRHDuNvm28r13A49
	Xn6/QHBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxhR-0000000AIGF-3amk;
	Mon, 03 Nov 2025 16:46:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxhP-0000000AIFs-0f2L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C6A140272;
	Mon,  3 Nov 2025 16:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F82C4CEFD;
	Mon,  3 Nov 2025 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188390;
	bh=bQoQlcYHevM+fEbYlxaZHeDzoToJ/H9DsSpcxx2O4mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7nsttJ5wpufBxgZ9zN/oBF3lPwKV2Js7ZlalsYPDvqnBqXao784dbn3VhiGOKMdL
	 RI7i/xgC1l/Bz4BRmjwKmq7uz/QznxWKVaJ3ABHOMRRERMywkusS7kdYoE1JP6ZnBY
	 JIQdngWur6Rp09hAlyfRUyRoElss3L1XblKaO68JWV0AFmDItmGtzdGwOXw1dpgLJR
	 NbtUi3GZq96yicFFSNVOTsgDU+tX6LTbL5ObLy7Hm9/Ug7JbuX4vendjj0qS75ScHa
	 9K82muTkdTaFXcrCY6cfUKdTmsJ4fsPxxBdb79XA+ryLLgKVm+qOsjt/lIayM9wfnj
	 6tVxLclq9s5SA==
Date: Mon, 3 Nov 2025 16:46:27 +0000
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
Subject: Re: [PATCH v10 3/9] KVM: arm64: kselftest: set_id_regs: add test for
 FEAT_LSUI
Message-ID: <aQjcYwHstanefv5L@finisterre.sirena.org.uk>
References: <20251103163224.818353-1-yeoreum.yun@arm.com>
 <20251103163224.818353-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n1neAWNWhZ8UixfX"
Content-Disposition: inline
In-Reply-To: <20251103163224.818353-4-yeoreum.yun@arm.com>
X-Cookie: If in doubt, mumble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_084631_216994_D22FD0C6 
X-CRM114-Status: GOOD (  12.62  )
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


--n1neAWNWhZ8UixfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2025 at 04:32:18PM +0000, Yeoreum Yun wrote:
> Add test coverage for FEAT_LSUI.

Ah, sorry - I see the set_id_regs change I asked for in my previous
reply is here actually!  Usually the selftests patches go at the end of
the series after all the functional changes so it didn't look like there
were any for the series.

>  static const struct reg_ftr_bits ftr_id_aa64isar3_el1[] = {
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR3_EL1, FPRCVT, 0),
> +	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR3_EL1, LSUI, 0),
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR3_EL1, LSFE, 0),
>  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR3_EL1, FAMINMAX, 0),
>  	REG_FTR_END,

Reviewed-by: Mark Brown <broonie@kernel.org>

--n1neAWNWhZ8UixfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkI3GIACgkQJNaLcl1U
h9BSBQf+LLF5rxdT9uo9B8kyXYNRb+JQM8zxCcNQeqrEg0FpYzyyCldSnKZHqq3a
C2L100Zn5WXFzUsmwztAxkDPDhfpXdPp+B6A7IZJXpLHX33tXSC1cMoHmgGustOd
vw4RjrvTdLKKxIj2lsOyxJAXHKK4h+9JIc0uN0msMm5Jy+2dlVv8EaF1jc0nUxjY
rHh8DdgOCh0GwEBG/AnEOWeH2TUsgjxMlVT9MZ7KYoIhIErPUjTxZELb86quh9g2
CwR0PD4SN0NMfRPcI0JQV1CX3wU59f3actJXifMs4yFlqvzlKm8B3DkDzHz6S54w
XXSOpO06mXKEcprPaUq3qYEX/6NQkA==
=pmiJ
-----END PGP SIGNATURE-----

--n1neAWNWhZ8UixfX--

