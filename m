Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C394C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNZoOIFbIF33mpeluUNeVtmExbkCoaujMEPBtqtoqkU=; b=Jn9L92/2qvUb3TY8f/yiCOQ3yD
	7gQENxrBDw2oyupn0RENUpSft9G2dTthD1D2HCcS5Xog7sI3bhwEpTLX+AIUJD+lQLZ04iBv5vxUl
	v47TsCyoLHHsjn6Y6qkt4yNCGCCWUje1yEp5KO6Ea8KQnji7o6Jz6hTNx9cjRqkmNUMwdyNQKHpP1
	Ya9tYS+8DRbAlSNCNghcCi9kOeKmP2DT7brvQ0Im7RNG4C1YHhGzjw8j86r3jou94KjHKF8XNyVv7
	eDGVLE7HW0Nd68ucLaEyPkbidhXkupfRUdu1sowOw5NNi3LYDOoTNzjYBvu6AnJ1SRfJKtnenmgAw
	tHfk01Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRrG-00000004USi-1wTK;
	Fri, 09 May 2025 17:50:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPtf-000000048Wo-3pAJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3003A4C655;
	Fri,  9 May 2025 15:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2098C4CEE4;
	Fri,  9 May 2025 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805462;
	bh=IMXhmQQ2lWO0KiQ0KnSj8yQCSD7P7FRsgDDD17Jfbs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPxU1U5hYKZ9lQxrZY4kxYVxUmRXrbi6StJM5Se5n7emSq6H4CCwSp1PvU+8lZBWu
	 HbfNfwQ8AcE3ZokS+TWPkwMsUIKc0x+56XDheqWT0qF8298RYe9A4q38mFWZ7Lk9ve
	 akBoJ0shcCVTV726rUnUs8VixrBSHZGpKtaQOca6w8+ck2exdtHEdpuuchiPDZfLAB
	 88C9cULAhL//1QOWsfNefOfDOT35BpoGmWBlTgM2FjHO4U4idlU9jfnih4UrpUoNO2
	 gI4DJN+4mUatc8d66IbD2/dmYNB7RaWDOD594gGKIlFi6yew1MO1+P+CFHYKfF2XYQ
	 UwDcwZiYYwNuQ==
Date: Fri, 9 May 2025 16:44:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Hu <richard.hu@technexion.com>, sascha.hauer@pengutronix.de,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	ray.chang@technexion.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS
 SoM on WB-EDM-G carrier board
Message-ID: <20250509-dripping-colonial-aa805906a189@spud>
References: <20250509071242.12098-1-richard.hu@technexion.com>
 <8173a798-b5d7-485c-8ce3-b46f4a097d83@kernel.org>
 <83401d0a-ca96-4cfd-9016-13a8604beb9c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OD4wdRO1911HDruQ"
Content-Disposition: inline
In-Reply-To: <83401d0a-ca96-4cfd-9016-13a8604beb9c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_084424_020529_35F14EED 
X-CRM114-Status: GOOD (  19.23  )
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


--OD4wdRO1911HDruQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 03:58:32PM +0200, Krzysztof Kozlowski wrote:
> On 09/05/2025 15:21, Krzysztof Kozlowski wrote:
> >=20
> > No, that's not a spi controller.
> >=20
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devi=
cetree-basics.html#generic-names-recommendation
> >=20
> >=20
> >> +		compatible =3D "rohm,dh2228fv";
> >=20
> > I doubt that. Drop the node or fix the compatible.
>=20
> ... especially that dh2228fv does not exist. There is no such device
> from ROHM. If you claim otherwise, please share this imaginary device
> datasheet.

To be clear, the thing to do if you have some device without a kernel
driver and want to use spidev for it, is to add a binding for the
device and add the device specific compatible to spidev.c.
If it is a simple device with no unusual properties (maybe it has an
interrupt, that's fine) add it to trivial-devices.yaml instead of
writing a dedicated binding.

--OD4wdRO1911HDruQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaB4i0gAKCRB4tDGHoIJi
0rTIAQCvC0a5Fu0qeL8RJpXo9801tjpYBm1ES+9QEWTFRWEB4AEAuwO8YdFqpXuB
siGWDtLPid4o2efFJvy1i/+/LuJXeAA=
=VP1b
-----END PGP SIGNATURE-----

--OD4wdRO1911HDruQ--

