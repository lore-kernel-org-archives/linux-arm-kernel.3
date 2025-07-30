Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0A2C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM2lKKsaUK/2/ezpP7H67fTfmIqiEVsc2+l+DJuNOLo=; b=eOy1k8oTzeCATj0OKmKeUzjy0/
	aTQGrbgQetD35Glisb1eZRAx/Y3ZtrBsqAE11zLhM0DiZAkNFgFLCUsHTuKLcx7EyexTTJDKHs7NU
	ithetDD/tIHU0yPoDUYRjXThakV26z/3l8HNO59kopAo/+oyP0e8zaGCl7Gfktkh8A8DnXor5oDri
	rPvxwu3TWWWj84VBRfG0TTmvYeHaGR4y9gGI4JVRkdjTuosHz40NPdU68QGTzWXwc/IHUmlnd4B0y
	IrXex71hWXQPzhjfRnJX9fYnxvDo5lefN0QHSB1Muakp319fOkT8EMZha76kbRz4pgmQaVDTFBPss
	4Sn6Mi6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7wq-00000001l41-3UkI;
	Wed, 30 Jul 2025 14:38:28 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7uL-00000001kqA-3V0B;
	Wed, 30 Jul 2025 14:35:55 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id C56891C008E; Wed, 30 Jul 2025 16:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1753886148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jM2lKKsaUK/2/ezpP7H67fTfmIqiEVsc2+l+DJuNOLo=;
	b=Y0DK5VdKj7DdGQWZYOl9Oy0kbFy2e52flvg2Ks8DK4Jg5OIgTHODnagVLxgoI3/eXGn5DK
	xYLp8YH71CxbqqFNEcCAqhnR+X2M94MHnlVBaHcKvF4fohv2651N8ubol7u1h5EfViVzE0
	G05d01CXLVshIEkmNS6gC/foc+HCG7Y=
Date: Wed, 30 Jul 2025 16:35:48 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	imx@lists.linux.dev, ~diederik/pine64-discuss@lists.sr.ht,
	Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH v4 0/4] Describe the cameras in the PinePhone Pro dts
Message-ID: <aIotxHrxuEEqGbkk@duo.ucw.cz>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UCFE5hbQc5QNmNAy"
Content-Disposition: inline
In-Reply-To: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_073554_160061_2289EEA4 
X-CRM114-Status: GOOD (  15.92  )
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


--UCFE5hbQc5QNmNAy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2025-06-20 17:21:31, Olivier Benjamin wrote:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
>=20
> I have tested these changes on my PinePhone Pro and am able to take
> photos from both cameras using libcamera's cam.
>=20
> This series has raised a question about the proper label name for the
> front/user camera and rear/world camera for phones.

I am not familiar with "user" / "world" cameras, but "selfie" and
"main" is something I've seen before.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--UCFE5hbQc5QNmNAy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaIotxAAKCRAw5/Bqldv6
8jtFAKCAXX0aOwyInpx0Q+gZ2vXgWjrBHQCeMQnkyOMwVT35tIbT/RC5hlstnU0=
=x7Kn
-----END PGP SIGNATURE-----

--UCFE5hbQc5QNmNAy--

