Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBEACE9D48
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8Vo9dsyzzNPonTUyLVifSACgsr/xvnHu5Rzrn29nUg=; b=IF+HK8NIyPnQ2mpB+RhOFK0obU
	Cp/mhPcVymUkc00pE7hfj/IxeS6BjCskRVoihdUQdFtuHqxmedR7t9Q0NxLPj8FAff3S5Eko2gV9V
	AuZxhWkCJn3D0pBzJw7OKfggiY+MjcGGjt3k36gCiJR6mxtZiffS7eT/XkhMqFY50gAmfyQmr1JIg
	7vvPoOCfhN6HG+dSt1katKtaVL1sCBGJT9Ch4iI7mo+ZAzruBbne8dtiHCg3QWXoLJxqcYFXs1LMd
	+xsdkYwDRs8Tt8G799pVqOWr2c7ksdNq/LhSxkzS9BYpO0HRJy1s5A/br0MBXhcSdIn1dCMMkxab4
	dAZMETxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSCs-0000000EreA-0AKF;
	Wed, 07 Jan 2026 12:00:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSCp-0000000Erdp-2cPv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:00:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E83FB4093B;
	Wed,  7 Jan 2026 12:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3EEC4CEF7;
	Wed,  7 Jan 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767787202;
	bh=c8Vo9dsyzzNPonTUyLVifSACgsr/xvnHu5Rzrn29nUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aykSm78YRBaeK2Nn027FpWoMFfGw9mr/20rtbrqwagJz3x59N1N2tYu2IGNa5+IGd
	 NdyN5ke260TrzgN1d8vV4X2acRLg9VF48Vlsi1YoLrQPcfexz0VEp1B7iBpx1pLJZD
	 a5pRVOZOdeWatXEWXm8MuArP92IvlVEVZgrLjgE6WWhTjDsrtwS6HCbHFBJQwI1vzI
	 PfJOw8+c5Ciz3TiynEEGFGpJQg6g8TNZdk88wunXManbFJDb8cN0pdY9wMJBCylFb4
	 GqdinOV2vdEVcHaATZtfXeQYXW7f+ipxH+h7ck2v5KyV14FUF2qhZW3rHar4SfAzTP
	 cxwbaERc1hMiA==
Date: Wed, 7 Jan 2026 11:59:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	tabba@google.com, will@kernel.org
Subject: Re: [PATCH 3/3] KVM: arm64: Remove ISB after writing FPEXC32_EL2
Message-ID: <82ace4a0-716b-4e20-b74c-780a28832407@sirena.org.uk>
References: <20260106173707.3292074-1-mark.rutland@arm.com>
 <20260106173707.3292074-4-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F8CNh9YRKDELmQeX"
Content-Disposition: inline
In-Reply-To: <20260106173707.3292074-4-mark.rutland@arm.com>
X-Cookie: Is there life before breakfast?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_040003_696710_1950BD1B 
X-CRM114-Status: GOOD (  11.12  )
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


--F8CNh9YRKDELmQeX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2026 at 05:37:07PM +0000, Mark Rutland wrote:
> The value of FPEX32_EL2 has no effect on execution in AArch64 state, and
> consequently there's no need for an ISB after writing to it in the hyp
> code (which executes in AArch64 state). When performing an exception
> return to AArch32 state, the exception return will provide the necessary
> context synchronization event.
>=20
> Remove the redundant ISB.

Reviewed-by: Mark Brown <broonie@kernel.org>

--F8CNh9YRKDELmQeX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmleSr0ACgkQJNaLcl1U
h9DypggAhbniX85c/2LRXLMPuqwJNp1Ckks0jsb/diW3g/klnt7da21jL97LWuJ8
qSOtXy2npPphiTLN7j2u5cu1Bp7ISZth76D1a6apHA2efySFkOnkuhCprVQkJn0A
0I24b6FNqtf3xyMyChm44ZTJKRmky8ltMBtVBRx+rVBPYqevg3pdFtocAB3zlYY8
XTZNB8Fbol2p7ElgaPidfRPnMiYS8rGi4iVP/f2y+6gtskK5mOrj//I8ZL2gmTpO
LQDyWIKVGBuY3OCFIy89yPdEwjOGQr9m/ixTU60LF5YrrgdQIz/rjUUjP+5uXDNx
9GHHbGY8Nx/flbHOrYvlViNQ4X56Mg==
=i/o5
-----END PGP SIGNATURE-----

--F8CNh9YRKDELmQeX--

