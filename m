Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CA0CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0ZRTPlwT/xyxpdHcA09ypJlccbn5Vup1lZsGchbYCc=; b=iI+JCV2mKTCAMzxiox1Xw1EMF8
	XtSXTeBexAkuB1MBflum+zgGTH56Wj34xcACPqjGfM3g7O2UiaHJFFory2HNxC/jF4wlNY+UtFhWb
	uZNjuZ1HQ4Nqkpfb0kO+klfKgV/dwgr7GLY0u9KfK0mzsSZe260F4yO1eWNscS6P6YpzeoDI+a9/M
	S660PW344VOarsMrmuSsUkTE0nbsKpxRjlQ1PBAIObufw4R/qYZPqSS0whoVNX4wKgIfdVL88G0uE
	eIeCkeZWGBjOrU+IvmDaFY/6WOKyaLuSn1++6G/SGNq0s7oi0YTLG9SlTXcSP8n2J2PxWOBcczjtJ
	c++0PanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3rw-0000000GRZ4-19V0;
	Thu, 04 Jun 2026 08:56:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3rv-0000000GRYq-0rUX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:56:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D184400EE;
	Thu,  4 Jun 2026 08:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9DD1F00898;
	Thu,  4 Jun 2026 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780563362;
	bh=g0ZRTPlwT/xyxpdHcA09ypJlccbn5Vup1lZsGchbYCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VQ0J+CbbA8z53ymXbXli2ktLm3hj2dpSm8vYx6EOzsIKD04T5HKXpSIq7rQ/Rl6xg
	 u6Ed2IgM7TNaL7b8OZ0rglBpOuIfA6F9gPm6yXsIFjqGYqiWqUMBaCjMXvUWhjlpTM
	 L9oIoX7KNYDGHvj/H1Tf220DR8/2HEXoS8z2hSqZhpQuUdXtyERbR/wD6JVK3fVFUf
	 CNz+c+8aejAmVcMYgM7nujR0135LyQJjNV7GtOr7S7zzpUHZRb1S5gQEg4/HLZjiye
	 +o3yrZ4sdPPAthl0/wzun3PunauL63PeFwdiAGAT0ooIajFer6gpyTbLf8UvmFAMf5
	 Byte3zz3XJXIQ==
Date: Thu, 4 Jun 2026 09:55:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH 1/2] dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI
 Controller
Message-ID: <20260604-anthem-jokingly-8d8312ff0c3f@spud>
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-2-cwweng.linux@gmail.com>
 <20260603-daybed-absentee-1b64f5caabe0@spud>
 <41914879-5fd0-41dd-b097-2be80096e464@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DXfNWS54udZtd82S"
Content-Disposition: inline
In-Reply-To: <41914879-5fd0-41dd-b097-2be80096e464@gmail.com>
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


--DXfNWS54udZtd82S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 03:07:31PM +0800, Chi-Wen Weng wrote:
> Hi Conor,
>=20
> Thanks for the review.
>=20
> > Missing commit message for one, but why can't your Nuvoton mail be used
> > here?
>=20
> I apologize for the missing commit message; I will add a proper descripti=
on
> in v2.
>=20
> Regarding the email address, my Nuvoton mail adds a corporate
> confidentiality disclaimer to outgoing
> external mail, so I use my personal address for sending kernel patches.

This prevents you sending with your work email account, but you can still
set your commit author to your Nuvoton address FWIW.

> Conor Dooley =E6=96=BC 2026/6/3 =E4=B8=8B=E5=8D=88 11:24 =E5=AF=AB=E9=81=
=93:
> > On Wed, Jun 03, 2026 at 12:35:50PM +0800, Chi-Wen Weng wrote:
> > > Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>

--DXfNWS54udZtd82S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiE9ngAKCRB4tDGHoIJi
0ns5AQDkCCpaoPInNNPpkFtOd/vTQh2GyJEX+MDZdhtwHCHGVgD9G5JmWreurTno
vUf1oScgNMeUb2uh4YdzD0lMOOWV0Qw=
=pGiX
-----END PGP SIGNATURE-----

--DXfNWS54udZtd82S--

