Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B68CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiIFOOX5cTeFtxjFg4qC88nb0t3jgyvT3V3axSy5paY=; b=KRSuC2D9X2FAHqtu/4VJyZootX
	o0aAtwL/ErHt3ZPfWfULGyQ78U5s9NbAbjeAWOYptcMWfKZAMowJVcDbB+ziLxWzqv4JrKLlJI0Rh
	UsJJuxzd8ARSMcg4MCJ93EYtxfk3jO34kaj3mqQiTS6UzfqBL/mbmlcFXIXHTbsibCxVLMBKRMM33
	n18YjmCLuvMaa8QSQg8qeKGRk6NaRHcBd1B88+bLWzkcJDa4UAtadTehrOE5nYieZl55O5EFwvdp1
	XJkhUQhi4L+gPgnsty4PZVPAZIPKWZEVnWX6Dz+7rWTaAbxUYE014+5cegkZ4TGDsWGFUkEWE4fpy
	q8SbDhuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7FM-0000000HN5s-1uyB;
	Thu, 21 Aug 2025 15:30:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3ZQ-0000000Gm8q-2fly
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:35:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B557A61157;
	Thu, 21 Aug 2025 11:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBBDC4CEEB;
	Thu, 21 Aug 2025 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755776102;
	bh=Mtgl0PdlBLAE8c0yy8tJp7Vtvf88Vj9PP/tXS+OYlo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5usWGKAAO1lQsOx+rbsDR6gLbfmiGENVcU1hT+ZsyVVSBOaBXiQILxohvFDlax3H
	 WGHZS7z6Sna8K9FJ9MidFbpIxR/UR4baaXcusFHgHHLF8r/9AUwYe2OT78GNN35fGH
	 /GYXmSiWrWjmEo4sU/8Ki81WkELLfSUt/H99qa1t1e8Pt5g7BNu9uOmAdv1WARaaeh
	 JTv/cvB7QMlBRPJs5NRX51ynb2E37mjhnz1IO8VFe5ntIWcf4OEcnaS24InoScgOrJ
	 AsHDwF6x4xwxjg9k26a7kfD4anhPga9AotZyhLjOatcvf3p0IhIOfuuv3PxD1O1mxu
	 WBZM2qjU4WghA==
Date: Thu, 21 Aug 2025 13:34:58 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 00/14] spi: airoha: driver fixes & improvements
Message-ID: <aKcEYn_hX0ZIusne@lore-rh-laptop>
References: <20250820123317.728148-1-mikhail.kshevetskiy@iopsys.eu>
 <aKbDjIZhJuWo3yFu@lore-rh-laptop>
 <7bca8089-09ad-4550-93d1-35a365bcd167@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x8+Rd9hZnvWmebul"
Content-Disposition: inline
In-Reply-To: <7bca8089-09ad-4550-93d1-35a365bcd167@iopsys.eu>
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


--x8+Rd9hZnvWmebul
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> On 21.08.2025 09:58, Lorenzo Bianconi wrote:
> >> This patch series greatly improve airoha snfi driver and fix a
> >> number of serious bug.
> >>
> >> Fixed bugs:
> >>  * Fix reading/writing of flashes with more than one plane per lun
> >>  * Fix inability to read/write oob area
> >>  * Fill the buffer with 0xff before writing
> >>  * Fix reading of flashes supporting continuous reading mode
> >>  * Fix error paths
> >>
> >> Improvements:
> >>  * Add support of dual/quad wires spi modes in exec_op().
> >>  * Support of dualio/quadio flash reading commands
> >>  * Remove dirty hack that reads flash page settings from SNFI registers
> >>    during driver startup
> >>
> >> Unfortunately I am unable to test the driver with linux at the moment,
> >> so only the following testing was done:
> > It seems to me this is quite an important rework of the driver. I would=
 prefer
> > to have some test results for this series. Are you able to run mtd_test=
 kernel
> > module for testing?
>=20
> I'll try to build latest openwrt with this patches=A0 and mtd_test kernel
> module and try it on one of our boards.

what board are you using for testing? If it is based on Airoha-7581 you cou=
ld
use the following repo for testing.

https://github.com/Ansuel/openwrt/tree/openwrt-24.10-airoha-an7581-stable

Regards,
Lorenzo

>=20
> Actually patches can be divided on to parts:
> * fixes of current driver (patches 1-10)
> * change of behavior to avoid reading flash page settings from SNFI
> registers during driver startup (patches 11-14)
>=20
> The changes are based on the code we are using for more than 3 years. I
> adapt it to latest linux/u-boot code.
>=20
> Up to now the only known issue appears on en7523 chips only. Here a
> corresponding patch description (not added to this series)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D spi: airoha:
> en7523: workaround flash damaging if UART_TXD was short to GND We found
> that some serial console may pull TX line to GROUND during board boot
> time. Airoha uses TX line as one of it's BOOT pins. This will lead to
> booting in RESERVED boot mode. It was found that some flashes operates
> incorrectly in RESERVED mode. Micron and Skyhigh flashes are definitely
> affected by the issue, Winbond flashes are NOT affected. Details:
> -------- DMA reading of odd pages on affected flashes operates
> incorrectly. Page reading offset (start of the page) on hardware level
> is replaced by 0x10. Thus results in incorrect data reading. Usage of
> UBI make things even worse. Any attempt to access UBI leads to ubi
> damaging. As result OS loading becomes impossible. Non-DMA reading is
> OK. =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>=20
> Regards,
> Mikhail
>=20
>=20
> >
> > Regards,
> > Lorenzo
> >
> >>  * Driver compiles without error.
> >>  * All changes were tested with corresponding u-boot driver. U-Boot
> >>    SpiNAND driver was modified as well to match linux-6.17-rc2 with
> >>    additional fixes for continuous mode.
> >>
> >> Changes v2:
> >>  * minor fix
> >>  * add comments to code
> >>
> >> Changes v3:
> >>  * add patch to prevent continuous reading
> >>
> >> Mikhail Kshevetskiy (14):
> >>   spi: airoha: return an error for continuous mode dirmap creation cas=
es
> >>   spi: airoha: remove unnecessary restriction length
> >>   spi: airoha: add support of dual/quad wires spi modes
> >>   spi: airoha: remove unnecessary switch to non-dma mode
> >>   spi: airoha: unify dirmap read/write code
> >>   spi: airoha: switch back to non-dma mode in the case of error
> >>   spi: airoha: fix reading/writing of flashes with more than one plane
> >>     per lun
> >>   spi: airoha: support of dualio/quadio flash reading commands
> >>   spi: airoha: allow reading/writing of oob area
> >>   spi: airoha: buffer must be 0xff-ed before writing
> >>   spi: airoha: avoid setting of page/oob sizes in REG_SPI_NFI_PAGEFMT
> >>   spi: airoha: reduce the number of modification of REG_SPI_NFI_CNFG a=
nd
> >>     REG_SPI_NFI_SECCUS_SIZE registers
> >>   spi: airoha: set custom sector size equal to flash page size
> >>   spi: airoha: avoid reading flash page settings from SNFI registers
> >>     during driver startup
> >>
> >>  drivers/spi/spi-airoha-snfi.c | 508 +++++++++++++++++-----------------
> >>  1 file changed, 260 insertions(+), 248 deletions(-)
> >>
> >> --=20
> >> 2.50.1
> >>

--x8+Rd9hZnvWmebul
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKcEXgAKCRA6cBh0uS2t
rHlkAQCnnfXQhEwCqeyAoAXrliU5ohBl9ETMGPOldm648EN+fgEAvncAtUoj/911
w8qFdbO/bXNBPXs4NLY9ZsmLqe96dA4=
=SuZn
-----END PGP SIGNATURE-----

--x8+Rd9hZnvWmebul--

