Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6E2C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYOszcyAv2MHFI4KF++FD4YVfwcmAEWNPRJzM4zf2i8=; b=G2qDRo4UkUXYU/9sw3LBq63VF/
	mXrM6czzpSeXnNW/SlKVsaJWZhpxJfzjFE1UaOp8bFOeMaZpRDLNorJ3rV+L2eD8CVIChmD2ebq2r
	cMkhHDvGROd0irpc0pAJaK3gibx588WcVy+sQ4pjHpmfAdsXN1AHVABMklBKT5Qr122N4dFv0HeQu
	ASou+H2Zv1Ml0N2Y1Cf8kfjPOHmJNwv99e+XrAbS3/mawp4Q9UxMP37fg145Jh1aXRc6CPsFibFT4
	IgN9c+u+ypCUYEZxxz7bhIotwSBs4BpWWZ4Y1FWYDiG+lmQkHSUhVhRycNui0kxAXU4qiTAoL4rmS
	dVdayUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BMt-00000000I5a-2Jwa;
	Thu, 03 Sep 2026 17:36:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BMs-00000000I4v-17Lb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:36:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4648D60120;
	Thu,  3 Sep 2026 17:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FEA1F000E9;
	Thu,  3 Sep 2026 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788457013;
	bh=GYOszcyAv2MHFI4KF++FD4YVfwcmAEWNPRJzM4zf2i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JkbwZNy8ok4L4oriC8g3PM+zQszbreb7sedqMSeb0lCmL8KNRQdk5SRx/ZaTNcXtz
	 ufHDYwCIbZ7UMLbp4fN1OVUw9rOJElPyHPWGavsomJfga362CvrOIYJJ2HtE6uvyiH
	 MJ1XEY6Fa7d+alzegb6GoFGsazjoCdrbMD/CRCS1/3vrx1Mw0iKXcJPodIBTcVKIrS
	 mj1VNF5d6+5Kt5RsriKPeAWNX82Uu4wjnDBbrN1PhaQaJYv0NVfN1uIpnQtwe1UrOA
	 ELWhCzT2guKZ968riHybpQ8mTazR2glo8JDvfyR8QvgBCV0QGc47urTPD3dNokOlFS
	 WA/oBUDc6u7mw==
Date: Thu, 3 Sep 2026 18:36:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: add Axiado AX3005 SGPIO
 controller
Message-ID: <20260903-duckbill-cartoon-d1877e4c0e3c@spud>
References: <20260903-axiado-ax3000-sgpio-controller-v3-0-b30820e1b858@axiado.com>
 <20260903-axiado-ax3000-sgpio-controller-v3-1-b30820e1b858@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OrWhVXbbco6P8u3i"
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-sgpio-controller-v3-1-b30820e1b858@axiado.com>
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

--OrWhVXbbco6P8u3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 12:11:32AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the SGPIO controller found on the
> Axiado AX3005 SoC.
>=20
> Each SGPIO position provides one fixed-direction input GPIO and one
> fixed-direction output GPIO. Input GPIOs support edge-triggered
> interrupts.
>=20
> The controller serializes output values and samples input values over
> dedicated data, clock, and latch signals.
>=20
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OrWhVXbbco6P8u3i
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmwLwAKCRB4tDGHoIJi
0nUSAP0dyjCLkvgRkuJeO5EQJWdRF9RerX1spQo+2jyKk4+HfwD/bcZvsxMEDDd3
auDb1zeyszZb4i9nsXRYElsNRzHgAAk=
=lVaB
-----END PGP SIGNATURE-----

--OrWhVXbbco6P8u3i--

