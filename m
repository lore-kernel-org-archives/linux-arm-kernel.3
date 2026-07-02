Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FDDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts0JUqI/UQtpggkPbz8ec50NHpUrsHW9mROWrvo34io=; b=LhKSs/DgHWju064Vpx/la8OMMK
	t/XA2UfB8U9MeNxBcRNVbtwPyTfH6lYFuD6ZByPJq62bps5BiOKaluhIy1sCOHwCtwCSDkUDEmGY5
	GvO2RErkzhoTxGj4Ke/yzqKm+Lc/NpXQGYLgv6d3IkIukANuvPb7OxY+kOEvyE1M3mdKs4j2Cn+3I
	Gkx62Fu2c8ewhEVspNWiqltj+y37gmQqM9mFUNxC62igyRKYhMppmqO3sNM4qIyxVSS5ekWKJAA3i
	hN5XB8o7q89DnXe0fODTTJTV+5CjxZ91tIzYwEvHxRi8nwXGV0K9EAiiYrIAVem3++e/DZminMnxE
	qj+XZGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMiv-00000005JqS-3XG7;
	Thu, 02 Jul 2026 19:05:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMiu-00000005Jls-0qWD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:05:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C1C3601CA;
	Thu,  2 Jul 2026 19:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C09E1F00ADB;
	Thu,  2 Jul 2026 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783019118;
	bh=ts0JUqI/UQtpggkPbz8ec50NHpUrsHW9mROWrvo34io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BpfolKN29Ql/zs4jLL/uQI1Kq/bcwoinu+Hx2O+DTwS6qRSA7Sf53w505wlmGyHQb
	 01kfEiaFHA2zOzHR2Juy3SSBIAyHk4Xu1m1EZydiyYLJne2Zeq5MzCJZbe2HGX7Z8G
	 slbSLMlL5GXdwdfwR3mbo9/NlOAgEFNF+7a3KjPCLD/60ymU6+suGXAAc5DaYBBmw9
	 ydSwd4wbDJuw/cfefH/ZLKr2MdjY/Hr3s9UHsgPMd3Ixfr+DbntgKbun7dc7RIgMra
	 xGa+cMmzxRqsk4wkIL7Tb+peMCf60K3Vxstbeaqrn8aQz3RDlel+rhFNhS/CLJP/Jg
	 LNqWyC91fkR+A==
Date: Thu, 2 Jul 2026 20:05:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Message-ID: <20260702-frequent-refreeze-9850982156cb@spud>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260629-unwelcome-raking-3df3d8ff0422@spud>
 <ihPM7P2dSn-oiyaL8fageA@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uabdFokmh9zu64R+"
Content-Disposition: inline
In-Reply-To: <ihPM7P2dSn-oiyaL8fageA@gmail.com>
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

--uabdFokmh9zu64R+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 08:22:21PM +0300, Stefan D=F6singer wrote:
> Am Montag, 29. Juni 2026, 18:49:08 Ostafrikanische Zeit schrieb Conor Doo=
ley:
>=20
> > Bindings seem fine to me, I'll be happy to give you some r-b tags when
> > you go non-RFC. To be frank, I think you should drop them as you've got
> > no significant questions here I think and you'll be taken a bt more
> > seriously.
>=20
> Thanks for all the advice so far!
>=20
> Here's one more binding related question: Philipp's request to give the P=
HY=20
> reset its own reset ID means I need a node and driver to consume that res=
et.=20
> My question is if it should be another MFD subdevice of topcrm or not. I =
am=20
> leaning towards not:
>=20
> usb_phy: phy@2 {
> 	compatible =3D "zte,zx29-usb2-phy";
> 	interrupts =3D <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 43=20
> IRQ_TYPE_EDGE_RISING>;
> 	interrupt-names =3D "powerup", "powerdown";
> 	syscon =3D <&topcrm 0x84 0x2>;
> 	resets =3D <&topcrm ZX297520V3_USB_PHY_RESET>;
> 	reset-names =3D "phy";
> 	#phy-cells =3D <0>;

Where is this node's reg property?
What bus is this node on?

It looks like the answer to both is that it should be a child of the
topcrm and this "syscon" property should be replaced by "reg".

> };
>=20
> usb0: usb@1500000 {
> 	compatible =3D "snps,dwc2";
> 	reg =3D <0x01500000 0x1000>;
> 	...
> 	phys =3D <&usb_phy>;
> 	phy-names =3D "usb2-phy";
> };
>=20
> I am not aware of any IO region to configure the PHY, although one may ex=
ist.=20
> topcrm + 0x84 has two status bits reporting if USB and HSIC are powered a=
nd=20
> out of reset. Nevertheless, the PHY feels distinct enough from topcrm tha=
t it=20
> should have its own binding. The phy driver would merely deassert the res=
et=20

This is the sort of thing that should be a child node of the syscon,
rather than integrated into the parent, given it consumes resources from
another feature of the syscon.

> and wait for the ready bit and maybe in the future do something useful wi=
th=20
> the connect/disconnect IRQs.
>=20
> Interestingly the USB IO region is actually downstream of the AHB bus and=
=20
> matrix controller, but it has its clocks and resets in topcrm. I suspect =
the=20
> purpose of this setup is to allow wake-by-USB IRQs while shutting down th=
e=20
> main data path.
>=20
> Cheers,
> Stefan



--uabdFokmh9zu64R+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaka2agAKCRB4tDGHoIJi
0gdQAP9SW0nb5swJHYPwKFbOAuwicY4LMenlLRlsYlYGO0fb6QD+Mf9ROZAatBx5
9zeKEpLv/VLnYldfI4wgADXKMReGqQg=
=VHSW
-----END PGP SIGNATURE-----

--uabdFokmh9zu64R+--

