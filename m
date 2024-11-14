Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C75D6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 19:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BO0ocrdM8qppSqW1SjWnEfOdpwdtAHOAMkaqKecG0Lo=; b=RePhWr0nKm3lKHdN35CSGlrnJH
	HcmNLBWGdAErDbI1hi1u6Zo13OeeGB04LOXxkUppBDDAa/tABY8M5W4+fF4UVZK9f9pbT2eCSuj3k
	1xZlhVPYbUU5A+UO5FyQC3zNM7VRy06Cc/y01RzMEI8DpTMBwJsUjU6Xsc+uDnpc5UZfgrHsIpX8t
	ip8t2KX/o4DI+HKia74t5HFgV6OXzS8dCZRfB2jGfDpESr1qJ5BO3Rc28NrgbE+KlzMekGMotcQOY
	bGSnlvECXAXyLuVJx/y4uulbJ85uXoKXYt18eXohMEVPUn4+1f7uf9CBL2PrGtGrxOVrZhkYT6qJb
	DQ/867oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBfA2-00000000Yyy-3GSr;
	Thu, 14 Nov 2024 19:05:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBf97-00000000YpC-2ink
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 19:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0464A41990;
	Thu, 14 Nov 2024 19:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8297CC4CECD;
	Thu, 14 Nov 2024 19:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731611088;
	bh=BO0ocrdM8qppSqW1SjWnEfOdpwdtAHOAMkaqKecG0Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tr3txAoXtAXT5bN7zR3CtuwXVxxigCyNCfYdRUHQbWfKrqZ61Rg927F8rtYckWtYo
	 k/k4qWwcpmnltWeU8AftQe0dN2t5V2o7lPTQgysNsdn/8C05fE+xW0sSqx4wE5Q1Rb
	 sJxsDsR+qsXa9ge0klkjXIxM/oJtejumsMwhQ9FotePswtU2W+pgYOEVfISQN9YqDc
	 QGCXpGPBJYBVVMJXL9/whHMlPx/n4ukWIP8FW4ih9SMYLc0dBVcPjN/KFZUUxKIsS4
	 80AtBvFtHXF6DWKOQMOgTVvgjYw9heELRrvTvV6Rs7Jl0mpphqq6xoH3xCWwN04KLo
	 1LEfksIezO9iQ==
Date: Thu, 14 Nov 2024 19:04:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: dt-bindings: media: i2c: Add IMX462 to the
 IMX290 binding
Message-ID: <20241114-affidavit-granola-ee8a7bb76d35@spud>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UJbfj84JWYiL4PQf"
Content-Disposition: inline
In-Reply-To: <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_110449_762056_33A9C65A 
X-CRM114-Status: UNSURE (   9.84  )
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


--UJbfj84JWYiL4PQf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 04:01:14PM +0000, Dave Stevenson wrote:
> IMX462 is the successor to IMX290, which is supportable by
> the existing IMX290 driver via a new compatible string.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

You've got "media: " twice in $subject.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--UJbfj84JWYiL4PQf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZJywAKCRB4tDGHoIJi
0tBiAQD5ax1UE6LgvKkKSHs+2Rgk33ii2RN+pg21HWrkUGrpSwD/e3Ab1r7f0g6Z
5C3Tkpi3lfXWYPKcXSjldPYCGPZEsgA=
=IwPX
-----END PGP SIGNATURE-----

--UJbfj84JWYiL4PQf--

