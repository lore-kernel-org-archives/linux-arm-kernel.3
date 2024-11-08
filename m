Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FEFD5C0ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFzgbkRb3LtjgiePUCs2zLxnEeHaoMumIeCtvURNEDE=; b=H44qcwDhib6gGpVuqSkLvGmnfV
	VwPkv0XC/ChGEHpD7XxBOCOKDjd66MFDYmWCKFinoC2Svih2nfGJwLDvtDAmCyBCriZrBB9tYriej
	PrpS3tfK/EDQUAXepjcOsH/JTfN2HF2n+7fpxO35q25T729frZCo0rG3F/eH1GgOrgzsZqoYM4WEH
	5aWJIDwCD6jlBnY9VWkIs30PVN/1+qiNhJ6cnf1ZNvKuZAUuUX4Mcx+mrdATlcsu0klm7F0fIFWoo
	zYI/9zSHhlAMe2tzuA8iRh7WXvQ+FLY/q7z0yFK63EzZaSKIPLYa3zieVGbrammZ5IaoUQmHFS8e2
	WiD2WKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9R2S-0000000B3IE-3MFW;
	Fri, 08 Nov 2024 15:36:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QMg-0000000Av2W-1liQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:53:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 585F65C5C31;
	Fri,  8 Nov 2024 14:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67071C4CECF;
	Fri,  8 Nov 2024 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731077613;
	bh=7FYaU4FCXmhYjzpZo5YkfLyjPElVMZd2EEcZuyqFuTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FlFekRhq6I6wB60c160O1nElWFaN14ychQ07e8bNDVaWQ8VQT+VUzzjKyZiqle3VX
	 wRgsXtsfIWyHimefzVvDvHTrqT7EjHyZc8yfPbG4CRo8rdqyGKQv4/dE+N10AQzVXJ
	 hdc+NP9EAqARi8/fL9Ix0OVLQbMbIzjP8L/hrour3EOVwUmlQD5M0vAZna68G7QJm8
	 Uuyrus8i+WxX21ninQNZpaDTEAi85LwI0N1q1z8Gqq8vrkWg4VECCKyqz0QbJ0CMH8
	 xP2MPAuoj6y2q+t0GmXWu2DPNgVlVCnOJsPEm33sUdOBR9+tXftVYb5PsjLePU4GqQ
	 /eN1JojyVg4TA==
Date: Fri, 8 Nov 2024 14:53:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] kselftest/arm64: Fix compilation of SME instructions
 in the arm64 fp tests
Message-ID: <15526a78-b9ad-46d2-b451-013dd3b8356b@sirena.org.uk>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <20241108134920.1233992-5-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FPsmg5krTeqmJNjw"
Content-Disposition: inline
In-Reply-To: <20241108134920.1233992-5-catalin.marinas@arm.com>
X-Cookie: Do not overtax your powers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_065334_531732_5D26DA02 
X-CRM114-Status: GOOD (  12.58  )
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


--FPsmg5krTeqmJNjw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 01:49:20PM +0000, Catalin Marinas wrote:

> SMSTOP/SMSTART require the SME arch extension for the assembler. Add
> '.arch_extension sme' to za-test.S and zt-test.S.

I've got an alternative, more idiomatic fix for this running through my
testing - SME is still relatively recent so we can't rely on people's
toolchains having it and we should use a .inst instead.  The issue was
that the toolchain I'm using locally appears to default to a full fat
version of the architecture and happily assembled the SMSTART even
though we don't have a .inst macro for it like we do with SMSTOP (which
is why that didn't error).  We only have SMSTART SM and SMSTART ZA.

--FPsmg5krTeqmJNjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuJegACgkQJNaLcl1U
h9C4twf/dV0Mfyo15G5UeUI5nLI4lpOQljXMqJb2khJTZHeg0BYqBhOzBdaYXyWn
/pd2xNbUrI6X86KqkT4ZTkGL9nsftGxpIbA0I0Maf0OskafPQSnJIeIQ6GS7n5Y5
IE3yPP4dmuHOThUOWxAHLL/ZxTfbMHDwEjLLjGwJzk2PIVP7gZA5MPmvt3yk5zNQ
QYPxxYjv6ee0zGSULgpChRuvHiqTjtm1aXf3bLtkNGE71Zb0KNecxwLRvBwkwmyK
rj9QEEM+fZHKJ7wHTI2C/4rLDadSIuvImnyBOfaeFIVUm6LzZZcrsEYn5IOkUp/D
HhEyl4G1SiazCXYm2I3j8LqT1zmieg==
=p8wV
-----END PGP SIGNATURE-----

--FPsmg5krTeqmJNjw--

