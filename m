Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B810DC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTN2gUGLfjEmLI+kfBb4qKSBquVXwsBhaTfbpY2NRrY=; b=AsCBdSv++X6CzvcAqUWSozfpP9
	3lDCJlJNXPgPdJ8Xrv/KsbgTXCIGHdmBsalB9E2eovFSO8NdRrIZk8A/zSqkCuzD3Ymjtp3afqEQG
	Qax62a3i8U/qFqq0cW/SYmED10SMQ/ik02ZBAaRtpO2eX0jvGuvGctstyBGJHrc89H/Rg257OGx/2
	bVgghaUht86V9xGbXPZmtAqXe1R62EC/6DbgULmxWYHASNySIYfuVconD6wafNrkmE/8cmzk21VPn
	o9LMq4lL3W1VVZ/VEPAc6sAGUq9frTyBuQWuHD4rFcgtZe6M6bb+s3jvLtVO1JbDINurZUnalaM+3
	ZSw7s70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA98u-0000000E0hA-3QTy;
	Fri, 25 Sep 2026 16:51:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA98t-0000000E0gs-2jk0;
	Fri, 25 Sep 2026 16:51:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBE1C60136;
	Fri, 25 Sep 2026 16:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F3F1F00893;
	Fri, 25 Sep 2026 16:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790355082;
	bh=uTN2gUGLfjEmLI+kfBb4qKSBquVXwsBhaTfbpY2NRrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ff4ROM4KRn94F3daBy8gUc+QsXb8btPOPmOKC3Kv/YBuIY+QMg624xqfPAFN3I33m
	 t6SIDlDUtS2ifLCzs4Pi9sCZ03jW1xYlboCpY+JFD7BkO7P9At90Alwz3kQFDla8GL
	 JmN/1pvjr9C4zEqapYWo5EvdFYdNuBC7LREsNebx3fD/NFAQZ+PZjOB8lH2d2kmc4x
	 BhBbYyxRSXazwrYJ2ycjkxDVxR9w2cwGvK8OU5JNb/cPY87FDgxsmsnSWG+PK1IKuz
	 WHO4RJ1IWJ2FNakGrl34eJUYtq2UOa3xiswvAbGEbazt9+0GmcePAmkaSeW5KWDFFP
	 EjW22VqTYhlHg==
Date: Fri, 25 Sep 2026 17:51:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	p.zabel@pengutronix.de, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Message-ID: <20260925-generous-overbill-e5fa75aec1e7@spud>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-3-benjamin.gaignard@collabora.com>
 <20260924-compare-useable-3e2863b66924@spud>
 <518ec010db104f6f0e7c85607a97af408da44eed.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mC0ZFJQ+JqSh31eF"
Content-Disposition: inline
In-Reply-To: <518ec010db104f6f0e7c85607a97af408da44eed.camel@collabora.com>
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

--mC0ZFJQ+JqSh31eF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 01:51:13PM -0400, Nicolas Dufresne wrote:
> Hi Conor,
>=20
> Le jeudi 24 septembre 2026 =E0 17:55 +0100, Conor Dooley a =E9crit=A0:
> > On Thu, Sep 24, 2026 at 03:04:52PM +0200, Benjamin Gaignard wrote:
> > > nxp,imx8mq-vpu has been tagged has deprecated since a while.
> > > After driver clean up it is time to remove it.
> >=20
> > No users in linux doesn't mean no users, but I am guessing that there's
> > genuinely no users elsewhere and anyone using out of tree devicetrees
> > should have updated due to the warning at runtime?
>=20
> I've checked the vendor DT before they moved to the mainline driver, and =
they
> never used this binding (actually they never made bindings).=20
> Here's what the DT was:
>=20
> 		vpu: vpu@38300000 {
> 			compatible =3D "nxp,imx8mq-hantro";
> 			reg =3D <0x38300000 0x200000>;
> 			reg-names =3D "regs_hantro";
> 			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 8 IRQ_TYPE_LE=
VEL_HIGH>;
> 			interrupt-names =3D "irq_hantro_g1", "irq_hantro_g2";
> 			clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>, <&clk IMX8MQ_CLK_VPU_G2_ROOT=
>, <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> 			clock-names =3D "clk_hantro_g1", "clk_hantro_g2", "clk_hantro_bus";
> 			assigned-clocks =3D <&clk IMX8MQ_CLK_VPU_G1>, <&clk IMX8MQ_CLK_VPU_G2>=
, <&clk IMX8MQ_CLK_VPU_BUS>;
> 			assigned-clock-parents =3D <&clk IMX8MQ_VPU_PLL_OUT>, <&clk IMX8MQ_VPU=
_PLL_OUT>, <&clk IMX8MQ_SYS1_PLL_800M>;
> 			assigned-clock-rates =3D <600000000>, <600000000>, <800000000>;
> 			power-domains =3D <&pgc_vpu>;
> 			status =3D "disabled";
> 		};
>=20
> I've not aware of any other OS or booloader that offers media capabilitie=
s using
> Linux mainline DT. The now deprecated nxp,imx8mq-vpu compatible had a sho=
rt live
> in the Linux tree if my memory is correct. Hope this is enough justificat=
ion.

Yeah, and this kind of detail (plus the fact that the driver emitted a
warning) are very helpful in the commit message for patches like this.
Hint hint Benjamin!

--mC0ZFJQ+JqSh31eF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaramhQAKCRB4tDGHoIJi
0vuwAP97l8f+kng/LRWQUycXlp59bH1E1WLY6HcLhXhNVw5eZQD+M4FadnRs+7cb
V/japjgTQ7Y+cGI9P1+T2PE+6OiOpgA=
=dwjl
-----END PGP SIGNATURE-----

--mC0ZFJQ+JqSh31eF--

