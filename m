Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4464CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBEPK/ItgXtL8RrOwEQxUimjZhkACX5vrovEaxJ0TvU=; b=Gll6hxjDTy+o3Lrd+rHfEGdTbA
	Tq4oOSFA/qkd4z4FqNWBHrt6UsVt+jFAkeLB+GzQ6OX/MAapHu4j9viLboxgp9kNWSR63xBNRhFly
	+tnshomwfhaTM4ukGCZJJE2ATguM7oArsopqU57kWv4tg5Nj8FNoeUdedy4Ep5rJwaEGjrvx92aDH
	A4uFQS+x+bY+MSpQ2d+h5SDBJgCr47lhz/nh6ADjoprdGa1PH7MLGVJs764COfqrA/H8Q2BzOFpZk
	pAVYzrZ02mH0I5BQY+/LHMhiRvd2qAmBns+OpGxKeb2A+X/sAFGwyr5ELeFp2zVcgjW6enYFIiHY6
	c2z0n/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWm6-00000002bH9-2rOi;
	Wed, 22 Oct 2025 11:13:02 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWm2-00000002bF8-3b3x;
	Wed, 22 Oct 2025 11:13:00 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 3556F1C01AC; Wed, 22 Oct 2025 13:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1761131577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yBEPK/ItgXtL8RrOwEQxUimjZhkACX5vrovEaxJ0TvU=;
	b=HQgMT9LE6g77sHbrC/HhWVmziHofgn2BPC541hn8rKfSWz3cR2/O6Cnt4zeoIKCLNFjW4v
	96AyoSweu1fqhZPTiEA1k9tuDH5x/9xcDCJCPa50wsGJQdTrGbU+8aVI1hXSL+ufb9jrIF
	vbn3mL4s0q0r+g+3Qfvp3hX9RdOsUMc=
Date: Wed, 22 Oct 2025 13:12:56 +0200
From: Pavel Machek <pavel@ucw.cz>
To: guptarud@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	"Leonardo G. Trombetta" <lgtrombetta@gmx.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: rk3399-pinephone-pro: Add
 magnetometer sensor support
Message-ID: <aPi8OCA2OkvrGA+S@duo.ucw.cz>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
 <20250929-ppp_light_accel_mag_vol-down-v4-3-6598f22d3451@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/IL2wEoASFvIAdD5"
Content-Disposition: inline
In-Reply-To: <20250929-ppp_light_accel_mag_vol-down-v4-3-6598f22d3451@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_041259_040507_220DA261 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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


--/IL2wEoASFvIAdD5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> DEVICE=3D"/sys/bus/iio/devices/iio:device2"
>=20
> X=3D$(cat $DEVICE/in_magn_x_raw)
> Y=3D$(cat $DEVICE/in_magn_y_raw)
> Z=3D$(cat $DEVICE/in_magn_z_raw)
>=20
> X_MIN=3D$X; X_MAX=3D$X
> Y_MIN=3D$Y; Y_MAX=3D$Y
> Z_MIN=3D$Z; Z_MAX=3D$Z
>=20
> START_TIME=3D$(date +%s)

I wonder if we should create some simple gui tool for testing this and
accelerometer?

Anyway,

> Co-developed-by: Leonardo G. Trombetta <lgtrombetta@gmx.com>
> Signed-off-by: Leonardo G. Trombetta <lgtrombetta@gmx.com>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>


--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--/IL2wEoASFvIAdD5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaPi8OAAKCRAw5/Bqldv6
8kxOAJwJ2rD4puXSmIpTlLg26wYcEZf5fQCgkJcbklr4Db1oSCPze/V0XUGuu/8=
=Z0vO
-----END PGP SIGNATURE-----

--/IL2wEoASFvIAdD5--

