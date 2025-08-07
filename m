Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A79C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 19:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anBkDsucK2PjKsyElrguMz1Xesu863wEQp2W/k3Cq1M=; b=acjchpleIoj0azmXenSvnUhJkv
	OWHyfoJ5L8qvFfnojvjYjVgAfGiOKi1kjOaiAaMm97whjDzBraZRdlAkm6f3zqtbr+MA/eRaP6nrG
	hFqBEu8CsALrdq3lQCfpqgP9NoPPX5dAs/5iCljnASb5n6gLQILxLBSpRb2UBT+UlR1I5HA3tTMyL
	whA9PgIdvFPOq1oPhxFVi0OWYVB4mnnnRBjJYLyAOA2sn9huiipl19WV7/leenPkcKYTsVa4wANmn
	monhq1egWKNoDPR37H5FfGRLeyVjtr7A7haGn6MgHh5901FwfXFjeZG9evpt0CGAegF5eTVUNMN/w
	z6FRW1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk6FE-00000001P75-2alZ;
	Thu, 07 Aug 2025 19:25:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk6Ch-00000001Op6-0PGL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 19:23:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 543B8A5676A;
	Thu,  7 Aug 2025 19:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF7CC4CEEB;
	Thu,  7 Aug 2025 19:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754594586;
	bh=bO0vADNCneshUIVHVe/hVO5ZsIGpYnBPeUVMpWJqGAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeNm/SBMZx67YSIsEMyUKUL7FL7ui9baKhJ5p6Pm9dJFfoOvs+EbdM7/34+mZPMxJ
	 sSEnTwpUbnrKNbQsCzQxPrY/6dqg296Bn/QbB+NsgOp0b14lbHpil6CzWTcAWBGLnk
	 LUEu+oQpGX8cQBGSTQKP6bDEHvk3juv854a+pcioXZEV3U/5h1+SIH5R2O+0DRVoky
	 lWuEF/31rVyOBY7yJGPBF5M5WU3HI0TgpqxfLkLpEVuUfZNQagTVb5HW/Rfx23Zmli
	 SG93Y+FZvwDqOPENpT7c3BxufBcmJx6qvm8WnqQdAG6dC7RZDuMjHX0aCCbhYQoOcS
	 bWMSIB921g9oQ==
Date: Thu, 7 Aug 2025 20:23:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: arm64: Check fread return value in exec_target
Message-ID: <a72e8741-a63a-487e-838e-daeed3458c0f@sirena.org.uk>
References: <20250807154950.24105-1-reddybalavignesh9979@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lDXe6O6YHA3QjJr+"
Content-Disposition: inline
In-Reply-To: <20250807154950.24105-1-reddybalavignesh9979@gmail.com>
X-Cookie: Real Users hate Real Programmers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_122307_202964_C9B2A988 
X-CRM114-Status: GOOD (  14.59  )
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


--lDXe6O6YHA3QjJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 09:19:47PM +0530, Bala-Vignesh-Reddy wrote:

> Fix -Wunused-result warning generated when compiled with gcc 13.3.0,
> by checking fread's return value and handling errors, preventing
> potential failures when reading from stdin.
>=20
> Fixes compiler warning:
> warning: ignoring return value of 'fread' declared with attribute
> 'warn_unused_result' [-Wunused-result]

> --- a/tools/testing/selftests/arm64/pauth/exec_target.c
> +++ b/tools/testing/selftests/arm64/pauth/exec_target.c
> @@ -13,7 +13,12 @@ int main(void)

> -	fread(&val, sizeof(size_t), 1, stdin);
> +	size_t size =3D fread(&val, sizeof(size_t), 1, stdin);
> +
> +	if (size !=3D 1) {
> +		fprintf(stderr, "Could not read input from stdin\n");
> +		return -1;
> +	}

It doesn't really matter but it'd be nicer to return a standard value
=66rom main(), EXIT_FAILURE is probably a good choice.  Exit values are in
the range 0..255.

--lDXe6O6YHA3QjJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiU/RUACgkQJNaLcl1U
h9AyyQf+Mg0LhcTpLXab7BZn+ejV6G4bsn2lcC2nLCXOkHWLPMlKyO26ip+/7+Gd
BfeJ1PFXe4q6YNENah0xOEL1n3kCUXNYUJXmiat+FSAEgqIMYA3KZr/NNiZovIll
zAbTQj0795xW27sGvS3rXXv5eoCr0IiqCgUsT+VSw1FQLEWYf3KF0ZQCGLzF73+E
qHBrCqsUURH7dYANOMOmIood/LECtoeHxkiv0f5WLXegHany/MV0XWOL85Qfw6lL
t0I5zJfiNL47WXJcc8MksVS1o9JFxtx9r2B+son/rzJiVthlyW3B93DnaiEld48I
VkRyo+Wc4JMtxadU6wOjINGD8if2sQ==
=s09D
-----END PGP SIGNATURE-----

--lDXe6O6YHA3QjJr+--

