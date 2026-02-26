Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6288FD9E1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 22:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AifYAQqOTxescW0jL4ukr0tgR1/pP+TxKwflJETQ18Y=; b=glVvlE5jw+fz/lEkccisoas5H7
	HYzespt7JRDjxgzT/tMcLh2RX6mMVNRajYSfmLPAq/dlTRmDYT1irjDJc2m2/3MZO41evJoV1H2xl
	GmQ5Il3y0+cxWp65gX4Qucf/bM1e/fGt/OvVa2CUaqWAvtxbtHQfbW6+NZWNg8EppvDP1pqQy0wMh
	s2kWy/yikMqM9ytwLD1MOo1D70zYIqztOEqTVVLzou2l09u01l96vfBj73H733+FFObWzQB3zNwBL
	5W72jBLUkkHcbzXbbHRr9fIO9TJIju8ujHeuDwmxR6GlUn2BcJ5HOe8PhJn41rG/7UP/GvzV5yUZK
	4lmvTJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjeI-00000007HxI-1ZHc;
	Thu, 26 Feb 2026 22:15:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjeH-00000007Hx7-0DQB;
	Thu, 26 Feb 2026 22:15:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CCFD60054;
	Thu, 26 Feb 2026 22:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00733C116C6;
	Thu, 26 Feb 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772144155;
	bh=RwM7wj3X9IEFP39jnJS9/0+Jh+WbGtD7RfWDnrAgGVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnePZCv69sjUeRVSamQ23hxl1GM66e3Hlxsr1z8vhYd0ZAd4KfGZ0no71gFW46FSk
	 W8T09ri+jNX48moO+XyEZgMAcEVM792EXIVSnVxKYE+k5jsE19zLOcbW1qfMDqII6y
	 3A1jLsGdcMeMNnr3zyrgqbwa/zYcLiU2d/eDDOA+p4hxnaIBDrHSbrA2j+VrFmCNvz
	 7TLdR6j6L4pykDQ7D37Jq/4/I52hPX2u8EWQCrqP0DF5HeYW6bIEingt42qGs7sq4C
	 LwWjvrojgPDFYcxv2LpS6+G/kA1PyDtdKPX0PJcxl5lvCmUvnPrx3wQHCAv735RXwp
	 VJze4FZgtsifg==
Date: Thu, 26 Feb 2026 22:15:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260226-ferocious-saturday-0e1f9bb28ec5@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
 <20260226-snide-foil-a05e1aa156a8@spud>
 <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mr1yXoVEYhQ07KkC"
Content-Disposition: inline
In-Reply-To: <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
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


--Mr1yXoVEYhQ07KkC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 04:56:30PM -0500, Nicolas Dufresne wrote:
> Le jeudi 26 f=E9vrier 2026 =E0 20:59 +0000, Conor Dooley a =E9crit=A0:
> > On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
> > > Le jeudi 26 f=E9vrier 2026 =E0 18:43 +0000, Conor Dooley a =E9crit=A0:
> > In this case, the driver is currently buggy, because, as I mentioned, it
> > uses reg-names without reg-names being required on the platforms with
> > more than 1 reg property. Probably the binding should make reg-names
> > mandatory for these platforms even without this patch, but it *has* to
> > IMO for this proposed change to be applicable.
>=20
> That forced me to check the driver. So for RK33xx and older, there is onl=
y one
> range, and the driver will just pick the one entry expected:
>=20
>=20
> 	if (rkvdec->variant->has_single_reg_region) {
> 		rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
> 		if (IS_ERR(rkvdec->regs))
> 			return PTR_ERR(rkvdec->regs);
> 	} else {
> 		rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev, "function"=
);
> 		if (IS_ERR(rkvdec->regs))
> 			return PTR_ERR(rkvdec->regs);
>=20
> 		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link");
> 		if (IS_ERR(rkvdec->link))
> 			return PTR_ERR(rkvdec->link);
> 	}
>=20
>=20
> Where for RK35xx variants, it only pick the resources by name. I don't se=
e the
> bug that you see, but I believe this was just a supposition, that you did=
n't
> check the code.

Busy reading path of exile patch notes, so sniping this comment only...

This is a bug, not a supposition, and it's that snippet from the
driver that prompted my comment.. That code requires that if
->has_single_reg_region is set that the dts provides reg-names, but the
binding does not mandate reg-names for rk3576-vdec and rk3588-vdec, so
the driver will fail to probe on a dts that the binding says is valid.

--Mr1yXoVEYhQ07KkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaDGFQAKCRB4tDGHoIJi
0uKRAP4hMTk5j57Vmq3lgRE2N4Yj1vk27N9x3YrJKFz1HSxaAAEAtUSUKVKVlXrp
DShB3ZBQLupX2wlwrHW/Gf7VZyiStAA=
=e9ND
-----END PGP SIGNATURE-----

--Mr1yXoVEYhQ07KkC--

