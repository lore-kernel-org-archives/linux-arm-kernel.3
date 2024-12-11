Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AA4E77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXPkCuR2SivnRYq9dCkjsf2KZvGLOYoks6cx+5KrVNI=; b=0s7iNglncVYajcTPxz75pSUn7B
	0LvK2kLX2Mx53t0JtMuxuqbaxNuKUfuwteb1zVvo/6sobbPBf3nzErB2UtTza+FpJjGYrdvFcaVsZ
	kM4TNi5D6QfBJjo2MrcTEiEQkoU1x25ePpHY9s/u2zXB3syZlgxiMDyz5sYeZ9tGJNONNAOf+eb+F
	k8wO8vJz2khkglj3Q/talCvT040uCjONoib3SoWH4Khh607uhJJI5BeA52lxm1IAIiwP+jDhZB/UB
	mAIiI6fBNr2P5hFBh09UrkgWelF0zr/IpwS68QP8FjEp1ITNgo6hkr5GcC38R5tPPOKN5k1xkAat1
	0K/NuV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPab-0000000FSPB-3RdS;
	Wed, 11 Dec 2024 16:29:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPZX-0000000FS0b-3ezX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CAF37A40E24;
	Wed, 11 Dec 2024 16:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94745C4CEDF;
	Wed, 11 Dec 2024 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733934502;
	bh=LXPkCuR2SivnRYq9dCkjsf2KZvGLOYoks6cx+5KrVNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/6DagzcvgXPGBIjb2VKXo5Vd8TVb2h1SAsb2coJAuauL0I658hRF/AzJdyz48E8P
	 1K/CnVd+HuPTKt3MQkX58EdS+Bh3LX5JcgRSTN0phemolAyHs/DJ4F85mbJWxRugN1
	 oEDBhekCL491PJ74fmsNYkY4Yn2holKMFnBPC5LwI45s+C02d33+2wuzJplt0iFHD6
	 Dc2N2yCquH//fIvkOMHXVGZEAofYIAtuguXiiAkrTECRHH09TIzwyBArW/mZsU2nGG
	 xu8zW4wKPDP/H4wwacscWTNaTtPQW3Ycks7C+3RGTzF001nmUCjb5fPwqjfdwE0EZz
	 cMA3o+jQ/xKhw==
Date: Wed, 11 Dec 2024 16:28:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 02/46] arm64/sysreg: Update register fields for
 ID_AA64MMFR4_EL1
Message-ID: <f27091f1-879a-4434-8124-2d1e27241078@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-3-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AuImAyBVAiYKZd95"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-3-anshuman.khandual@arm.com>
X-Cookie: Every path has its puddle.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_082823_970661_EAAA6ECC 
X-CRM114-Status: UNSURE (   7.75  )
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


--AuImAyBVAiYKZd95
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:27AM +0530, Anshuman Khandual wrote:
> This updates ID_AA64MMFR4_EL1 register as per the definitions based on
> DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--AuImAyBVAiYKZd95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdZvaEACgkQJNaLcl1U
h9Dt8wf/Xkj06W8/tQXbtUdCh+cZdMzvCYsmFjs77GpeWcGAMwMMXAakKXLvdIaZ
Y8MeZMkUNJbkjjQHFfvq769HABUCe5pvxstBlcm5RwkLw779YKyPfHhKBj804gnP
ygoSQuth62S2cQ98ZxCS0X1uKsLuMO7bufZc7FH8OeBCBSY2pm9TnqAMbnpXyb01
/0po6atZiUVhyFENAG12VmiVbyFN2xH5ePDRmvwV6OlGLkuHfnxYBbnxhyTDhwp7
24tWFW+aSQKpCHgfwIndNpqkXtdEFjc+LE8S4T1i1KEd877lYfPn5oe39LeEZCou
FvWw3dF3ew82JkVHikP0R6DqLMWRhg==
=jJAi
-----END PGP SIGNATURE-----

--AuImAyBVAiYKZd95--

