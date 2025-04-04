Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B73CC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hooVEfq7oVAAnbJ6oQr6Xy9dUNqfOjfiJLJlTRLAvxY=; b=xEvHUisM3NAfHhaluMk+sJ4L65
	wQpIB27Kr+paBWIqIAnd6SU6kMoC6X2nRx7hWM2x/tUBlO6qmf3HlaPpZ0iz90GUMLpQaL31bhIrm
	bGpW6LCN0H+Im5ao5RJ1+9YvrIjeDj3YHdPIal/0FW8UX/fXHoP8Oql3D2g24sOosIymSwhWmhQ8b
	rMtQczp5PRS2rjEKwdOhuTy2NeewgzBImoaIC+2lc81kXof6RIvs/33u2++t426IKhiwB4Erp1ux9
	CzTCZHjVCyTUtnR1OpjpzTFN56D9RTwfqp2NPAizARVYvGabV4jIIzmus1BkMEwcRp/ntfyL6FQcS
	flIwcrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lcP-0000000CW4a-21uL;
	Fri, 04 Apr 2025 18:18:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lTx-0000000CUvH-2aaa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 18:09:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 003E15C6B8F;
	Fri,  4 Apr 2025 18:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E49C4CEE5;
	Fri,  4 Apr 2025 18:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743790172;
	bh=9t1KHehgiXRv5QgLY3EXet/42INIXExl9eAq4qzYs/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkg9NvRDZqR8oZIVGFNgFHJv5zjIBnCcMwL+9NAJPJYVw+lsHGGhZWfXy4FSVVFMJ
	 5HLs6st4jPIdKtH7MZxez+rtLiW7DsGlCLVP+99YEvCf8QKA58kMK7zVXbsb16E6q1
	 BzTdONja00n/SjN8t9XvMqePBCEtF5zP2+reqtoGzYd9vZvyqSmX6j/uVFsyft8NdW
	 47LBETrN1swIL3Nrkp6/f7q/Lp2v3fmW4G/G6EGk1vWfPoY1+e3Oro23LKPTdU7Y2a
	 ymorQBf1vJERkwau4+1w7KyAgYVmoijbgGFRJBh4dBdtkIoZEYiytDwob99EQraBJK
	 NE7pypUb/FcKQ==
Date: Fri, 4 Apr 2025 19:09:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 02/14] arm64/fpsimd: Remove unused
 fpsimd_force_sync_to_sve()
Message-ID: <0561dd95-97fc-4cde-993b-939bd696bb28@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LFjMith/iPOo0nFk"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-3-mark.rutland@arm.com>
X-Cookie: You will soon forget this.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_110933_705987_C7773D79 
X-CRM114-Status: GOOD (  11.13  )
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


--LFjMith/iPOo0nFk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2025 at 06:44:23PM +0100, Mark Rutland wrote:

> There have been no users of fpsimd_force_sync_to_sve() since commit:
>=20
>   bbc6172eefdb276b ("arm64/fpsimd: SME no longer requires SVE register st=
ate")
>=20
> Remove fpsimd_force_sync_to_sve().

> ---
>  arch/arm64/kernel/fpsimd.c | 14 --------------
>  1 file changed, 14 deletions(-)

There's also a prototype for this function in asm/fpsimd.h which should
be removed as well.

--LFjMith/iPOo0nFk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwIFcACgkQJNaLcl1U
h9Ac0wf+NUjVKPNbP6azM9TrRar+jKfW9Uywj+7oVHKKP9pSMGOqaIJX68vISbZT
/dCVDcJlqQNmqnuY6aS25B5T6irrP0qjXtdkGU+p6JRUgLaAe8rp0x0wplt8FXyo
866I4WmGx0Dl5zzY1Q46XG5748SP7mEiqmqzqxX298eTVg/Mm04LGAj7gD2atc1b
voJ96qWlrnyZCsR3dSArCSt6qLcK27GWSB4ubQH70sHKjKEhSTxSdrr3yAqSh6HF
NBNAsYSNNY3eDAjmhHr6bAxu2xpxmhQmg7k/ud9xm/8FWnTP/xiNS/x8QwZNvLle
XCAKP4iIy9CczdXYRbsnDPYDthWQfA==
=XJoD
-----END PGP SIGNATURE-----

--LFjMith/iPOo0nFk--

