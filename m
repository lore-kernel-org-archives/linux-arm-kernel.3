Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB460C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 06:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Message-Id:Date:Content-Type:Reply-To:Cc:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vlpjp+tNENTHC+6zLHEzFUhv1yBlyukyiDJrfWoVwU8=; b=m43bPBFhryy4avWh+Yx3dryukp
	ey2D4ItG3G9rYyyoGgsJjXA3CVNWrRnp8UHDUi8PS7gQsRqf5zFCRM4aBtWSsAemSdsH7Gc1JPnV3
	OcUjrrWRPDexoyoZyw1tV/aNtauI5awF71kr6vFXP+QE0fBdkf0r6CS+p3LYFMoCgQ6BEPRU+Uk48
	fRUpbH08O7Lg6NAZmhyTjA6/ZQ1rxhtxgNwHy+M1LYH7s+FLb3qTMADTZGgl1jG6T8jENx69FGWoV
	z/QyOBdFsipwwvVDLqfETjLRKzKdNum88NNKS+zSa68QqTcGEVYjFxGOup0jDTeq/iQRIZ1eTshKU
	PDH8TdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFJ3-000000092YH-3FP4;
	Wed, 11 Jun 2025 06:51:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFGt-000000092ME-2QXP;
	Wed, 11 Jun 2025 06:49:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93C916154E;
	Wed, 11 Jun 2025 06:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7566C4CEEE;
	Wed, 11 Jun 2025 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749624554;
	bh=FMyO1EmovbumXEl+OiTYuyUzT9z/yCBH7rYczUz94gc=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=mU92wHiV8pQgRnuittKr8tyKpv+KRITKdjTXqVhUdCd1U6UGvNR5xKmCjUvnqsaN2
	 UncLT+z+CSgoqGV1i65FmgBZB+8HF90JOJEAjoz4b8zpOLdg88JfQKb80HxtJyge0k
	 RskP5bvywhh2BnOhmjiH+pOvJzrA6bZXDSN09gsAhPlBnYOclAvDSi5nDRK9LASQ5y
	 i2WfiVz1w4Vgdsz+1K6DVU8puXA6jvHKTVAhKUF/kvr1oA1Fgy6c/+T9VSOYhG+2Tq
	 RYXvHM7TG7U6mLZLJxbVDhtHTtj1E/NBYeB/yhKpxIH3e1cWdGZIkcMYftCSkqr/bk
	 rhKq6Zyn78hwA==
Content-Type: multipart/signed;
 boundary=092bfdba70b2454870f72bac72348f01da7a4597ebda2c812354a0b1278b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 11 Jun 2025 08:49:09 +0200
Message-Id: <DAJI523999W0.GE2LHI6HQUPN@kernel.org>
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: sfdp: parse SFDP SST vendor map
 and register EUI addresses into NVMEM framework
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Manikandan Muralidharan"
 <manikandan.m@microchip.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-2-manikandan.m@microchip.com>
 <8caf71ab-8b3f-438a-8075-60dd01a7a448@linaro.org>
In-Reply-To: <8caf71ab-8b3f-438a-8075-60dd01a7a448@linaro.org>
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

--092bfdba70b2454870f72bac72348f01da7a4597ebda2c812354a0b1278b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jun 9, 2025 at 10:04 AM CEST, Tudor Ambarus wrote:
> Hi,
>
> On 5/21/25 8:03 AM, Manikandan Muralidharan wrote:
> >  drivers/mtd/spi-nor/sfdp.c  | 161 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mtd/spi-nor.h |   7 ++
> >  2 files changed, 168 insertions(+)
>
> Please find a way to move the vendor specific handling to a vendor file,
> don't pollute the core drivers.

IIRC I've suggested to move the handling into the core, but it
should be more generic, not handling any MAC address related things,
but more like a framework/helper functions to expose anything
related to SFDP.

-michael

> In what concerns the nvmem idea, I find
> it fine. Michael may comment more on it as I think he dealt with a
> similar use case in the past.
>
> Cheers,
> ta


--092bfdba70b2454870f72bac72348f01da7a4597ebda2c812354a0b1278b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaEkm5hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iH1gGA6wzFs0xl83MYYXUgMyMJ+YgGxuhLeTQ1
qHmSAJKFMEM4cyx5fxuUV6FhRyQLNUA8AX9//HDdaQQEZBAfkBYcjQ/PXiEjSPFI
ONNVhbjpadS+iOl+ejT4Mx7vZOxG+bgHAVU=
=zgcm
-----END PGP SIGNATURE-----

--092bfdba70b2454870f72bac72348f01da7a4597ebda2c812354a0b1278b--

