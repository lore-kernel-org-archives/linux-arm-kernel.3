Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743ABE68973
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMjYvi/k0LQv3mvZTRUW98lV/FQ3V/2XaFC77x3qp1Q=; b=1Nq7v7Gx3BZ4k0S2bXGXA7nOXP
	PZjE39BoXuSItokJrLGvp1QGpmdRRyELwYhIDS/VSYIPpH54XlUlANbbOaJIURAkM9CJTxd76wcr5
	9oz4iohjIMjiobPg6+v32SFR1jvwLaon1ij/lNgSo17gr+fXNLpWhy8y535NvqRBUR+6vSbK0UfWP
	WGNY2AS2w22Lzmbyi6FNVLrTwbg2bwNxu76tjYu8rUFVxtAw2au+xDSoS9VYSi8ZfEX5biobkITDz
	JK+gvcM2T+PVa9K1p9m1NMou7FjFGWI3Zf1Cq/f2TvEXE3HwT1dkmiZ0GE1fhI3wL0/MCthAGRrz3
	+PDul8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SXR-00000003Fng-3b72;
	Thu, 31 Oct 2024 10:36:26 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SVY-00000003FGF-31GO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:34:30 +0000
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C286989285;
	Thu, 31 Oct 2024 11:34:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730370867;
	bh=xMjYvi/k0LQv3mvZTRUW98lV/FQ3V/2XaFC77x3qp1Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R4DHCx5y1WLPTmrQgUeiNT6q3Bn6qZiHbfVy1ehcrKerMsp7P+SUnLS0pozgzOPEO
	 kwgnuv6a61i3Dm+t+OvvD22xMAErsoInObWnEPfvAA8jybfRkteO3QxnFRAt/OeNgM
	 MoxHxi38Bt/0U2XnfgVEP3Bj+03bJYDY8TQQzGWn8DhvAcnznVXQAT3eJPUvFCPn//
	 pQfTEjQHSr0rSIfcrOi+2EDXasBluWymdqPk9XPs8skGxvOgoeapD4WQ1oLywpfmO5
	 Jbx+6iLWJwYhirI8XINXT4olddEyZrSN328ulmFYI1T6lTRVUjGnkRRn4p71+Hc2wW
	 +Fzheen24Xqmg==
Date: Thu, 31 Oct 2024 11:34:25 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/4] ARM: dts: mxs: Add descriptions for imx287
 based btt3-[012] devices
Message-ID: <20241031113425.1e3d1da5@wsk>
In-Reply-To: <806770fc-3830-4e89-a3ee-487b662685ed@gmx.net>
References: <20241022133040.686562-1-lukma@denx.de>
	<20241022133040.686562-4-lukma@denx.de>
	<20241031094236.17ed927d@wsk>
	<806770fc-3830-4e89-a3ee-487b662685ed@gmx.net>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FD/wYCUhTrUoXhAbjXcXHQB";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_033429_093605_AB0BC704 
X-CRM114-Status: GOOD (  28.69  )
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

--Sig_/FD/wYCUhTrUoXhAbjXcXHQB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

> Am 31.10.24 um 09:42 schrieb Lukasz Majewski:
> > Dear Community,
> > =20
> >> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
> >> some extend similar to already upstreamed XEA devices, hence are
> >> using common imx28-lwe.dtsi file.
> >>
> >> New, imx28-btt3.dtsi has been added to embrace common DTS
> >> properties for different HW revisions for this device.
> >>
> >> As a result - changes introduced in imx28-btt3-[012].dts are
> >> minimal.
> >>
> >> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> >>
> >> ---
> >> Changes for v2:
> >> - Rename dts file from btt3-[012] to imx28-btt3-[012] to match
> >> current linux kernel naming convention
> >> - Remove 'wlf,wm8974' from compatible for codec@1a
> >>
> >> Changes for v3:
> >> - Keep alphabethical order for Makefile entries
> >>
> >> Changes for v4:
> >> - Change compatible for btt3 board (to 'lwn,imx28-btt3')
> >>
> >> Changes for v5:
> >> - Combine patch, which adds btt3-[012] with one adding board entry
> >> to fsl.yaml
> >>
> >> Changes for v6:
> >> - Make the patch series for adding entry in fsl.yaml and btt3
> >>
> >> Changes for v7:
> >> - Use "panel" property as suggested by the community
> >> - Use panel-timing to specify the display parameters
> >> - Update subject line with correct tags
> >>
> >> Changes for v8:
> >> - Use GPIO_ACTIVE_HIGH instead of '0'
> >> - Add the comment regarding mac address specification
> >> - Remove superfluous comment
> >> - Change wifi-en-pin node name
> >>
> >> Changes for v9:
> >> - Remove not used 'pm-ignore-notify'
> >> - Add display names for 'panel-dpi' compatible to avoid Schema
> >> warnings
> >>
> >> Changes for v10:
> >> - Drop new line with panel-timing definitions
> >> - Add new lines with 'sound' node
> >> - Change 'codec' to 'audio-codec'
> >> - Change order of properties for saif1 node =20
> > Are there any more comments regarding this patch? =20
> Sorry, i wasn't aware that you are waiting for reviews after Rob's
> request.

I did not received any mail from Rob's automated DTS test script, so
this is a good thing :-).


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/FD/wYCUhTrUoXhAbjXcXHQB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmcjXTEACgkQAR8vZIA0
zr2R0gf/dn+dA46KkhqB5cnCwM/Du4YuF84nm95iXMGzE3j0nrAz35xAEt4kbQWT
AeHvQn13mHETK44MBDyVCmwJsx/UIWNCPRdpFRyN1b7cVLqxQu2ktw3k2roMChbS
Xy4aOQY4GcAf+OPczECtsV/sXrCAbZlOILrtEP0qBxREDWbLy6J+7fWL8UZ6VXbM
fCBTG/iu4bJRUpQG4gX8w2G2WW4Su487RJqbun0Wj0r+/ED4tQqzmye5wZapZNhJ
CO8rqfo9o6qQZzW+ppECs3DC4vRVLeMYbsNhyKhTrM8igjjAnutyabSHzw5R3Jh1
5D8uiUHD+Y/NfIWkM/tJFFnS1iGreA==
=8/4m
-----END PGP SIGNATURE-----

--Sig_/FD/wYCUhTrUoXhAbjXcXHQB--

