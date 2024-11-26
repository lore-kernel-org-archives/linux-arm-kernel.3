Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7892D6554F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 18:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FP8KRA/DgqyuzIh0IvIbveFrfHvmUgGMVizg2Kjg4xo=; b=LzFx9Eswt8F6nrqaT5LJlzkSEY
	2d2YK/T3d76pvgkCyB0pJTxOhxLrtZ8ePSWb4L9IQ+F9LfMXhrrzHbeiwluRlIUFNubIoKQ9F35uG
	lISGWNRPbdj+NUpJcBBo17Qgp+eKvDNmkdHPkT503DhUGEyfMAy0sYU7DPqpAs5BDPXiZF32rOVmA
	VJybN3JpYl9MamUPW0/4XAQtONih48p0mIvDy0PWOSxE+lnvAI80R92H2d1upQLBWKL2c+eKG8WHs
	iIudgpqZfyY6JbHS7YhdPWRoufvEUUTJ+r9k2Vr3e7Oto+mldkhSZQh1y2IwxGGBmo0Y1R8SyPDdP
	Vc0EXZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0hM-0000000BU0F-2Uf7;
	Tue, 26 Nov 2024 18:54:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG0gO-0000000BTu1-1rPV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 18:53:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1C54A40467;
	Tue, 26 Nov 2024 18:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE86C4CECF;
	Tue, 26 Nov 2024 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732647187;
	bh=YbaJtQ8ZD5m/lylDmgyKGCB6UhgH6Eq44TWOBqH9jwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iyh27BILoiDEuzMYVXCv1eGEu0zUqO8tCwZ7nag3vvaqWFAIMZPFw9fKstNoBbXhR
	 OgAk6RuvRDzLJYZYT9L4XkBWkumYOsUfXy617gwEByqNoSyLtyFptCtfPF8ka3PPUe
	 bzuuutQCp5q9ZZco8iIEnBoCm3XSPrZBi959POFvJf2mKqNS35D+6Zy6gG3e9BV5FL
	 JrubH/idSS6TW2tueLDIWa8bBEJEe4sOTbKyg1843kgzjPzaz34j6L8nhzK41usrmm
	 jfkzo1hGs2zR2rSGSf2grGoBiI9/qBAmNLI9/sDQ+an+Dttc4WSmdyI1RDUXvVGImd
	 eDLyqwvr6fm9w==
Date: Tue, 26 Nov 2024 18:53:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [BOOT-WRAPPER PATCH 3/3] aarch64: Enable use of GCS for EL2 and
 below
Message-ID: <287e6fab-e858-4a7b-bc21-687c36742e24@sirena.org.uk>
References: <20241126153955.477569-1-mark.rutland@arm.com>
 <20241126153955.477569-4-mark.rutland@arm.com>
 <154929d3-c46b-42cd-9785-c48aa1b08d33@sirena.org.uk>
 <Z0YNFCfisiCqU3lJ@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="45ImN+cSKYtfPWjP"
Content-Disposition: inline
In-Reply-To: <Z0YNFCfisiCqU3lJ@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: Have a taco.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_105308_550275_A64E41D6 
X-CRM114-Status: GOOD (  13.87  )
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


--45ImN+cSKYtfPWjP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2024 at 06:01:56PM +0000, Mark Rutland wrote:

> GCSCR_EL3.PCRSEL resets to 0, so the HW won't push to the GCS for BL/BLR
> and won't pop from the GCS for a RET. That menas there's no GCS value
> for a return value check to compare with...

Oh, good point - I'd trusted that the initialisations were required and
misremembered which of PCRSEL and RVCHKEN was which.  Sorry about that.
The values on reset follow the same pattern in all the GCS control
registers down to GCSCRE0_EL1 so the initialisations of the other
control registers are equally redundant.  We should be consistent here,
either initialising all the GCS control registers or relying on the
architecture defaults for all of them, and the note in the changelog
about them needs an update if the initialisation is there.

> That does raise the question of what specifically happens for a return
> at EL3 when GCSCR_EL3.{PCRSEL,RVCHKEN} == {1,0}. Can you enlighten me?

RET will attempt to load and use a GCS record, the pseudocode is in
LoadCheckGCSRecord() which isn't EL dependent other than the selection
of which GCSPR and GCSCR to use and setting the access as privileged if
we're not at EL0.

--45ImN+cSKYtfPWjP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdGGQ8ACgkQJNaLcl1U
h9Cragf9GpAnFnXQJaa2RGfDh+VEOiUa6YLiEGaGryyi4jSy2udt311+ENe2HAeT
N86mytfheIZ/KH+FdR2T3qfUOALLQTvzJJTVmU/08dJGAcP0kv2lwd6yApNBK6ev
GN0XIAKn2mObqeZPhyPzkgqLMdabs5vdR8GNUl6jol5q4rZQsHmwymv3epmjgIwJ
GHqNkc41sM+/4rkEmxZELcDBoT2TS/niIFDzl4ZkyLojs3QethyXTfflicwV2j9s
pO5nEbmmDVLJbK6trdnPlnKXJ+5RrMEvE2QGHuwa7G/YSBbbDc5vGPjqmAzRumO0
SwbuBoHdMk1L+DiWYcZcgd93OQ5rGA==
=jlgZ
-----END PGP SIGNATURE-----

--45ImN+cSKYtfPWjP--

