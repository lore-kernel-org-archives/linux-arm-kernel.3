Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6C2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 12:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqWmRbxG4Qp9PANlqRQFXcAxqQpO9VcB+LGzNMztTTc=; b=TyJX3oW5RE93BcRIdXBql9l9yX
	p5RPZAmcDdpevagcDP8ggsN9US6fNpsHfCC1Tm74XG4BCsowt2G9GHJatWSohNQn5gopeJUY1Cy7x
	oqm5CbfUjUqT4obHqUAUnMR/SkhOROczNP34d+FS8aEjbgW5mw/BPPURclw3i3l9cRCRBpn+frqQi
	znEVFBqx+LtvNtkP7NW2YMJfayC5ubju/yqQy4bbIK0u07mxS8WslY5C+6PP1GYuUkVcyQOn+jJSu
	mNyC2OgKh/Df0LIJ00XaDkw0pDgtIAZqUdGiiPItiJ/typP/hmlMWmL09gEidOzDJBzh+LCvOWyWp
	/Z1oldMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzVj-00000000UkL-2Qg7;
	Thu, 07 Aug 2025 12:14:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzLy-00000000T40-0wyA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 12:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC54E43B28;
	Thu,  7 Aug 2025 12:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25353C4CEF4;
	Thu,  7 Aug 2025 12:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754568253;
	bh=3Nv2ReQcE0cjcXzp8V/iD0MVf79EuAx+RGJtUPfvBhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOe2YOedP5W9OCUYaMyEDQku/5/0CBpPf2CyvFu262QH3zEPlN3LliEOkx5EIKZw+
	 ZItKzr3pY/oQ3W79PbpB+p2POKF8JihPZeNijIBKDXcJiCqpmahqQHWNW5vP8N1wnS
	 a4gsDYgJJzUd7fqVcJZhg2HNUhbhHFXFD8Q8Gb1KRH8bR+pdOQUrdCP2n3zBG53q3y
	 E5gfF/uA1RDj2WoSX1qKXDgmUg0+9w6TN3mbVfUkrWTXHwv0rX0e8wIQNkKX02F8ov
	 i/KptSdo0++nXrI/dFjY6rsrFDThpUDhpY/vtlbUX2bc7fBm0WEwWnA95l+nMNmXFn
	 If1PAU8dtbjig==
Date: Thu, 7 Aug 2025 13:04:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] selftests: arm64: Fix -Waddress warning in tpidr2 test
Message-ID: <a2456da6-2c73-4b0b-9d00-50ab88bff4af@sirena.org.uk>
References: <20250806203928.168365-1-reddybalavignesh9979@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Aez3VvGl60kO4LiE"
Content-Disposition: inline
In-Reply-To: <20250806203928.168365-1-reddybalavignesh9979@gmail.com>
X-Cookie: Real Users hate Real Programmers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_050414_287006_F0B45CDB 
X-CRM114-Status: UNSURE (   9.68  )
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


--Aez3VvGl60kO4LiE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 02:09:26AM +0530, Bala-Vignesh-Reddy wrote:
> Resolve compiler warning about always true condition in ksft_test_result
> in tpidr2, passing actual function.
>=20
> This silences -Waddress warning while maintaining test functionality.

Ouch, good spot.  Annoyingly the compiler I was using didn't complain
about this at all.  Like Anshuman said it's good practice to include the
warning, and also often the compiler details unless it's a super common
warning.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Aez3VvGl60kO4LiE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiUljgACgkQJNaLcl1U
h9Bs5Af/QyzJEIAygC1BnUR4SlU1p0hHnudoWz87QJl8gRYWIGA3nHhJDdJw0eAf
Af3TyiNhstsRNlwBIVeHu1ny2/udd97DtFYu9ErK7EmBTbBnWiyKRtGVQpkdtAJn
GcyBuCFWhZCDT+ek33WMFY+eXCUtMZt24Om0eI846jET6f6LYRLG6977mqAvlSpf
9NQtO6Q+/cV4AP2r5+ta2oF92L+NCaD0l2L34DHKPimA4ytf+x3N7xyIEw7eb9bd
w5sowauXzmgXouRQPvRxFjVQWAGwrskVFIhgCyezaj5FRNONkPqBFRQrP7EvsEGC
PH49pDmFLUMSSFlxWHkmtp6pJ57UQw==
=EB21
-----END PGP SIGNATURE-----

--Aez3VvGl60kO4LiE--

