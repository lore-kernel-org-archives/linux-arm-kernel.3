Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0D2CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/dQIN/6bQs5cMkEYR2kGWQIOG8oSziPJNK6u+M3TKI=; b=3RG/IY71yWpI88XEVFZSjUMwD6
	eU4fggrHPvqNBT2rMUXFa97C9gVCP5pbuLBDHs1d+g66ETt1rwpCSELZhG2oDHBP0d9vF47UB+4sB
	25Gfp9XFMQ8fTIQaXdwlcrTC3K6diMn6fd9q4nroEnPNuFYEBQZ+JFjCLPsG8YOVvEBbrxSHu/oDC
	cL+oP9SxE+YWZUxdAehczWh4RoOOeBMptr0YkPMfeyxZz/2+J++fPtx+77xLif3h0swduDLX++iT9
	5V3EMHm588wXqO17lzz2nY6lJMzykZTbWGuCeZQ3GqspVSqPi9h4PA/5Ux7q88SI9b7wk6iV+INFq
	Wmqv5u1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEGg-00000000sri-13up;
	Thu, 21 Aug 2025 23:00:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up91z-000000003ij-3VoK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:24:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E73B0601F8;
	Thu, 21 Aug 2025 17:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB0EC4CEEB;
	Thu, 21 Aug 2025 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755797094;
	bh=3/dQIN/6bQs5cMkEYR2kGWQIOG8oSziPJNK6u+M3TKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TbbRsU2FbjHzWD8HhM2bCrBS0hMiRzteNS9o3F40QEvuuGSIZ0EhnGRscZ8uDMONG
	 IL5cT9ZTjmrSovM0Conzjx4X7ZkmqUyrKXrGjDq51s6e93LQ0IZkRdngZTBfFdeahN
	 rF9N8MCZ2RChmIK1IH4hQo+LkEzbQ/NrrK98DOpPaEZnjlHMyMZSEMPMhU4NDp/UfS
	 Ae2nl/nJe2VGlaS74QhlNI2cnUGMclBz/OFMYysAMvO0HCU0ysVMSzrNG4usoHO4fr
	 72fy4rgAhRmcnp/m2cBscXutwTuRKhmxinX3AcXrc38HnD4FFiiL/rbXP8+/PQDTO+
	 6BQRSXmOsuong==
Date: Thu, 21 Aug 2025 18:24:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64/gcs: Use nolibc's getauxval()
Message-ID: <d5a26257-769e-4ad4-8d6c-723529b66aec@sirena.org.uk>
References: <20250821-nolibc-gcs-fixes-v1-0-88519836c915@weissschuh.net>
 <20250821-nolibc-gcs-fixes-v1-2-88519836c915@weissschuh.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aTcioaIg2uzKW47S"
Content-Disposition: inline
In-Reply-To: <20250821-nolibc-gcs-fixes-v1-2-88519836c915@weissschuh.net>
X-Cookie: Warp 7 -- It's a law we can live with.
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


--aTcioaIg2uzKW47S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 05:13:03PM +0200, Thomas Wei=DFschuh wrote:
> Nolibc now does have getauxval(), use it.

Reviewed-by: Mark Brown <broonie@kernel.org>

--aTcioaIg2uzKW47S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminVmEACgkQJNaLcl1U
h9AVxQf6A1M5k78zL2oHUCa1XHXmZ2SNKsaRCAl+dwv0NAAGZVrcPpptgN6brFHI
2wmu+akQQ4ySojXlKtQZ9N1huH8OhNU3KB+OdPQTQkz7rI6u9LN47eZNRDW3I6cd
X//TqDY3s0/a+nYkBDvWWEW4/BicZ2NP0BQiafY0JjioM7Oz5H3TjXwRDsDP44/2
WmcsLUmySNoCcAP85z8m7X2t9btxDKFvcg9VadNJKSeOH1DFhRaoPMODtosGzzv/
4hdiBqn+n1m25AdceKsRDCyOjcBJjvKz7a7LwTCJBtt2swGrLU/zZ9VhSuSUYv3N
PQd9ZCJsh3vYd7SKImd3L5vEL2TX5w==
=DLpa
-----END PGP SIGNATURE-----

--aTcioaIg2uzKW47S--

