Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30B7CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 22:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deIlNliIFfttHaVaz+a5cZngYOdByEk2eSULIl0DxWs=; b=o0ixYd1vtvjbeuFnRNxQVBlAhg
	gzARRo7WvCxsLBlkYL/82fZx6jK3b6qch1XPKukOftghRA4lGx33ebZMFcQb1pqKkTixrgOBy30yt
	Ad7+EYoUU4KFVKm8rAWeLSnuU9hre6o2QfxJyeB4cs5bObCXPya2Y1bpYkCdPMoaZ5rpijTCtq0F0
	A7bQ/STxIEkAnoptntRZQOR+az3Q0TdgWeueA7vncxdKWMVJbPLek4Cz5JvyUNUcYc8D+xBK8Q9UT
	2tmjJpuVmqyg+MBD1DQpP4VW1T6uLXJGE+FEARZrOSUt33vn428sHXdCsqoyE+kWnrBI5pBM2f8LD
	UJedLAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SQW-00000008KPI-2MAK;
	Sun, 21 Sep 2025 22:21:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0SQU-00000008KP7-1tYw;
	Sun, 21 Sep 2025 22:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB7A1601F8;
	Sun, 21 Sep 2025 22:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F07C4CEE7;
	Sun, 21 Sep 2025 22:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758493256;
	bh=deIlNliIFfttHaVaz+a5cZngYOdByEk2eSULIl0DxWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWFQwBZAhMYUaaA5uo8ILM7NlcErylUxQ0nRkEnKhmzH9SouyhUwUsvmPI8QMRlt9
	 Jg2/R3gHsr8SZPU31xZDfAd1A63rI4tGgEnOzVNDdm3/rg0soJjO205N0BG6WGf2nW
	 WW8D7QcD+yi2pqrLhsgwlPIIKEwBhDthWnIoiVFPXf2kxhdRf5Y6Po4bYd+TOsAA7/
	 Q9ny93JPVwtoGPrSc4xbuu0gY6KwDLYX59A5Ygmq2srNC0wUu7EnWnODFp9RcNmMe4
	 Yswi79VHYfZLnnz8r8LNOolutZmqspeDlCmODf7uIfi6Ls6u2XBT95jAjtpbXhPU/I
	 objma6kY4n/pw==
Date: Sun, 21 Sep 2025 23:20:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <didi.debian@cknow.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf
 requirements
Message-ID: <20250921-abroad-decibel-5b81c0680693@spud>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
 <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
 <20250820-await-chomp-9812902c0f74@spud>
 <wtwdpqi4tk3ixzmrvdyv2aguf6pjlmnz6q5gvhlajl2hk6mdys@fmkugriedhqe>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7v51AzaYiK6X0Wju"
Content-Disposition: inline
In-Reply-To: <wtwdpqi4tk3ixzmrvdyv2aguf6pjlmnz6q5gvhlajl2hk6mdys@fmkugriedhqe>
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


--7v51AzaYiK6X0Wju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 08:35:12PM +0200, Sebastian Reichel wrote:
> Hi,
>=20
> On Wed, Aug 20, 2025 at 08:48:23PM +0100, Conor Dooley wrote:
> > On Wed, Aug 20, 2025 at 07:40:49PM +0200, Sebastian Reichel wrote:
> > > Instead of having an optional rockchip,grf property, forbid using it =
on
> > > platforms without registers in a GRF being needed for thermal monitor=
ing
> > > and make it mandatory on the platforms actually needing it.
> >=20
> > I am assuming that "needing it" means that it was actually mandatory but
> > the binding was just missing the required required entry. If so
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I just noticed, that I never replied: The GRF configuration is
> required for proper functionality as far as I can tell. Technically
> it might be skipped, if the bootloader already configured the
> registers correctly. but I don't think this is something anyone wants
> to rely on and with the same argument we could describe almost any
> resource as optional :) The upstream kernel DT always had the GRF
> specified for these platforms (and thus most likely has never been
> tested without it).

Acked-by: Conor Dooley <conor.dooley@microchip.com>

(ik I gave it already, but for clarity)

--7v51AzaYiK6X0Wju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNB6QwAKCRB4tDGHoIJi
0oeMAP9PVmH8y60xBY5fyeXeZW7A8LvI0TS/a+zumSiuaKg5lwEA1ZC8Pd7dkYva
SIjnbkEWh1VeQ9wWMnQJof1jJW/IsAY=
=mGFB
-----END PGP SIGNATURE-----

--7v51AzaYiK6X0Wju--

