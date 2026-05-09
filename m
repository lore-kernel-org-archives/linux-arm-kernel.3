Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47CACD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 15:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zr4m8EO3YhFxN6CoauY25unQTyVYNNdKNzU/2dfC/f8=; b=PtManmTsHGw2eYTt0wcjz+weKZ
	39piaSnN0v+T/f4PboNrzGt7FUq+WuKQJrtsbduaVa+MDiyzEfHpU/4d+AyUqY/XhrxdKeV48jvbH
	aYLAPNFCr0mW2bXLXgj0abCHSwUO4Ao0FPmYsQSj6oiw269wAs6xl3798gmRGVphcCaIp2MdCN3CT
	QFwebF+SxlzVrtC1Y9lVPitF73XeGukccJ3BMH24n12QfypviKXyRPhmVtQX+hp4KfvozCK2EMIWo
	VTydfBlmMF0eNbcmqTr3qv3/IKaDzIVW8oZg+3adIOkROfzWnTZZ5iFZTLSIm8qfLVqg8U3OY1IXW
	c7ThwINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLk32-00000009Drd-3kcO;
	Sat, 09 May 2026 15:57:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLk31-00000009DrL-177w;
	Sat, 09 May 2026 15:56:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5524B6024D;
	Sat,  9 May 2026 15:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8372C2BCB2;
	Sat,  9 May 2026 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778342218;
	bh=Zr4m8EO3YhFxN6CoauY25unQTyVYNNdKNzU/2dfC/f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmO/0+iLYfR73DzP+ymTgRYt6HckcF7rGoQCiVrmhwQiB7Q/CSEV6AQkBymmR6tOh
	 /+obMeqDlir2WdtBtazs3Aa202G61ojjW8Jc1vP/G0pjvL8yC3QlyANWnvZIiRgMeK
	 gmsRnv9xkVqh9mK1iOl9ff1pNMsTSTlb8SlYGnqMRBx5gw63l3QODppExMutvykqTL
	 VibxNq4BLvWWYtVOhtBgTwvv3RYZG/uC+Bqi0maZS1FbZydBAdfq2ixAY+QuDUbmJX
	 x0DBvzSUXuX11IcRgoKvizVaL0X7QN3bYhWhZrXXoYb8RhTOQvYsL/8nOm1ob8DJNr
	 hDduTp1VNd85w==
Date: Sat, 9 May 2026 16:56:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 5/5] dt-bindings: raspberrypi,bcm2835-firmware: Drop
 unnecessary select
Message-ID: <20260509-polio-barrette-07f4368a0cc6@spud>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
 <20260508-rpi-otp-driver-v4-5-cf8d725d8821@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cT+9g1ZKW4ABma7Y"
Content-Disposition: inline
In-Reply-To: <20260508-rpi-otp-driver-v4-5-cf8d725d8821@linutronix.de>
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


--cT+9g1ZKW4ABma7Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2026 at 04:42:48PM +0200, Gregor Herburger wrote:
> The select schema is not necessary because the
> raspberrypi,bcm2835-firmware compatible is already matched by the
> compatible string values. The documentation says "Most bindings should
> not need select", so remove it.
>=20
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--cT+9g1ZKW4ABma7Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf9ZRAAKCRB4tDGHoIJi
0iz8AP4wQV7fiXVYvXG5n3LuNtCriQQf9xbaAci0C0/7BYAu+gD/euZqqTLSAhLr
dHptMO1Ira9axxHjVUdsdRL1HNUEcgY=
=8zrw
-----END PGP SIGNATURE-----

--cT+9g1ZKW4ABma7Y--

