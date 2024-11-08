Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48603D64060
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tndzLIk/AZsYmCask8HjL4f2uW8WRJVYnBdD2jbBbsM=; b=Rhm/ZihkH2u8p6EM2uF9uJ+akw
	QkrLqiLZt/+/ziBwVrICkc8cuJikziy0RXXtMLgge2VATNxXqUJodrh95HpeUjdmx+Xfn0YIRkiMg
	0fs4Q2LvtpAc+6GgvzIjXhfHkkjCTECCUsAHJ+LKWwGokleHiqLzMQfsO+caft4J72QGLl5xU0Myv
	NBjv1giq4TSimTxt0TAtGdDSy4tuM4gKrNvbPivlbQ2f5vLSzI3MTi3JOia2RAZWFpxmiKMG8OtKT
	ZINAnWIxnB37Pcw084QGUACwPL0IaxQ3v+mnclqmCbwWXfbcC30/XZVZz8Brxyustw9nlbBfG47EA
	xo9niiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtw-0000000BDNJ-0D4C;
	Fri, 08 Nov 2024 16:32:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QwD-0000000B1tv-2cL8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8620A5C5AB6;
	Fri,  8 Nov 2024 15:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF10EC4CECD;
	Fri,  8 Nov 2024 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731079816;
	bh=inazZ1XGpUpzm+m8llnixvOmgECsY/Q+xQOk3gPRIL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sfAhkMXJGuap/ysnOh2CcJgwSRApYDZs9s1QwFf29kgWIrntIRTavwgxc0KkNjkle
	 +mO6HN8Szm97DijjkvFJCCtcnSkBVMDTlLApiv+ptRp5BU5Rt/YjX3gGR/FpO+QC8y
	 HfQr6vzLk5cbvZZXSfGLoGHgEDykd5DzfjB4vzCZKgW4G9+8ayBD+cO7X/yIqJfdAN
	 aHywv4HgvaVYNvB/CJAsxf54bb6bEnzcKRLJ/XFfLkVijd5gAonYOYDwIlB9AYhu5P
	 KZb+3eSuvu8tlCdNfZ48iQ48L5/rm+zj1XDAqx6eJpgcQVjzJtfD6zXNhm1eDBenhS
	 LW84AB8J8f84g==
Date: Fri, 8 Nov 2024 15:30:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] kselftest/arm64: Fix printf() warning in the arm64
 MTE prctl() test
Message-ID: <6a1669e8-1654-461d-8709-3cbcaff7da67@sirena.org.uk>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <20241108134920.1233992-3-catalin.marinas@arm.com>
 <4bbc179b-73b6-46d7-b414-f3b14079b489@sirena.org.uk>
 <Zy4telEzvU1DGih1@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+86Hz4tydrtIHA1e"
Content-Disposition: inline
In-Reply-To: <Zy4telEzvU1DGih1@arm.com>
X-Cookie: Do not overtax your powers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_073017_737715_EB1ED6CC 
X-CRM114-Status: GOOD (  12.98  )
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


--+86Hz4tydrtIHA1e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 03:25:46PM +0000, Catalin Marinas wrote:
> On Fri, Nov 08, 2024 at 03:10:59PM +0000, Mark Brown wrote:

> > > -			       (ret & PR_MTE_TCF_MASK), mask);
> > > +			       (int)(ret & PR_MTE_TCF_MASK), mask);

> > Shouldn't we just use a %lx here?  Casts tend to be suspicious...

> It's more like the ret is actually 32-bit and should stay like that when
> bits are masked out. But the bitwise op 'upgrades' it to a long (in
> hindsight, we should not have used UL for the TCF bits and mask).

Hrm, right.  Possibly put the cast on PR_MTE_TCF_MASK rather than on the
expression as a whole then?

--+86Hz4tydrtIHA1e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuLoIACgkQJNaLcl1U
h9DUygf/TRppmL0lvUaKjiWmpFhnNbIRe4orT2O9q408hf4BiVR0nJdcKx8tOuhQ
dxLLohe4E2fEXQ9aE9yd2uVvNfMypUvfDp5ygLiWHi39u6et1suiFl5Q6KNYE42f
frtC/C8LQ3FVxV78gZ2kNsRKZc3bnkdmUsDUr7hGaRc1WY5wx7QFFptPal7S8Uz7
7//6PR02DDEkKKlszS8ivuBcv1Rkdw8j/QkwSKCipT+4kDtGUz5N/vEXsw7PWUNL
N38e99YJ273KxF3RDs4ZKLLyZs+E6rCecV2qWn3l/gZokF4mLpUuL5a2htxtyATZ
CjY7E27Dxva3m6lLK2FcLxzVvLJlmg==
=6M2V
-----END PGP SIGNATURE-----

--+86Hz4tydrtIHA1e--

