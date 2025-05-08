Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939B9C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FBdXjj5dIlpEEGLNFH2EjYrwNsi54oDoLefxoQmJgk=; b=Unh2w4/abRYKg8e4fPgNJ/3Y41
	8psfU6ow1+nSeaippwko0IMzJ7g1fvdrvcVg9t+HAbqC523Q7K3Y5FKJ7oWftTXUB/1SLWF46Y+PI
	qtCIONyzzE3Fa8NI+hOrl9DFRij44NnEEjvL42FfgApXdbkkp8mYQTELTa+vSY4G/lhk25Xpgs0bt
	qP1ZkK7oRv3MbaI8Xqc+jvQebvy9Ng7R/8Uv2E9GUG2A1itN8yyaOjP48q+TggTNnOeruWhJwZN/M
	9TGT5JIjmP3c0fYlBPy4kg/iyZ+LC0PssTa2fHr8h34IYRexdjZutHc0Q5SY25DccmNL04e1KNxs8
	9JsinI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD41P-00000001H59-1SKG;
	Thu, 08 May 2025 16:22:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2vj-000000015NI-2O2w;
	Thu, 08 May 2025 15:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4813E43A52;
	Thu,  8 May 2025 15:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A71C4CEF3;
	Thu,  8 May 2025 15:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746717179;
	bh=1FBdXjj5dIlpEEGLNFH2EjYrwNsi54oDoLefxoQmJgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkxmdBWMf1dNCvZhDdwpXZT6BEPL2dtWpd0Y2VGOpqdR8J6iY4lpdpX8ZxX/2evGo
	 qAMCMIRxQDytEjFuq8KwR3ws8lJ/GkJddG48oZXI4sWmXEmDNg22/PUgrd/JsnuEOl
	 D72OKPTC3ND59y2RCUsUXl/OGxL/QxPSeE5Qq0gojf2o3SqcHVr+AJSR28w2WChN9T
	 Hq/nUGAN/fc0WEyb+VmzeOruM4TjkAZTVAo+ITGCG6jU3GfNg44vMU7bK2oj1VpklD
	 1UUmOswz3OOdqQsPbqLVlxh97gy0RwBuWfSloJ7TLE4VoqUFi2fMsiQZ/VmKcsP6gf
	 A0VUbTkuyvPdA==
Date: Thu, 8 May 2025 16:12:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards
 from Theobroma Systems
Message-ID: <20250508-frosty-facility-39eee13870dc@spud>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JJRiOfQ3YU0HTA4I"
Content-Disposition: inline
In-Reply-To: <20250508150955.1897702-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_081259_622827_B0E114AD 
X-CRM114-Status: UNSURE (   9.55  )
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


--JJRiOfQ3YU0HTA4I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 05:09:52PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> Cobra are Touchscreen devices built around the PX30 SoC using
> a variety of display options.
>=20
> The devices feature an EMMC, network port, usb host + OTG ports and
> a 720x1280 display with a touchscreen.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JJRiOfQ3YU0HTA4I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzJ9gAKCRB4tDGHoIJi
0tvOAQDrujT+TKQ25zyokjWVf7DY5LtWTPxftRqTZZquT2qJrQD+OWT/TfjIhS+g
+XjoU9DnuB4tieyeaM2WLPqDSdkHZwg=
=F1A9
-----END PGP SIGNATURE-----

--JJRiOfQ3YU0HTA4I--

