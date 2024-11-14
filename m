Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137D9D6A22C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GStnpoZ+VQ6uDrKHaa71APEXa76ZcpeNnKiOpUy9XOI=; b=t/q1JF3GnUCwMT+O7Iyb4157D1
	+W+mcyr9gqw5PicmoEbjtBlhw5HlKVgAq04aXMOcAlUCq1SocwvsPqvluczzT49C9XfRrucnfsO/Y
	ikLp/1a3rOsgo/L8PXfXgyNtXT+a8w9bHwJ4bQ5iPGpAbRObdwvFBY8/v0ApUkVjsAyFPN1xdUKtv
	AyTCg4UFiXNq8xI+7t+//oVNhrkjPolE3+sVLmC2tg0ndxUOYXRXvzUEYecEEv2D7oNm7PKJq4s00
	fkKNFNyK3DaUqgTXTjSaSeV5G+MtPWK2Aw1c9Txz/S0X6ZBYkSnqJ+D+8n1/wDO8TFhhqF1p2Rr7l
	sn4sP2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgDI-00000000ihg-1wGO;
	Thu, 14 Nov 2024 20:13:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgBp-00000000iNp-2bhL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 20:11:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2812E5C4D33;
	Thu, 14 Nov 2024 20:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8272BC4CECD;
	Thu, 14 Nov 2024 20:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731615100;
	bh=GStnpoZ+VQ6uDrKHaa71APEXa76ZcpeNnKiOpUy9XOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifBLn+y62V3OgsjgceF9S0OjLQq2V2zdc5EvQrPQ2LsdRtb5KMuqfW5qZ9iM0oPDI
	 f5nqFA5ySmqKwJwV7+tCuCtWg893zbyZrtLubPym2lnbZlyYnZsbB0Xd9DFWZCgBAw
	 WmMZE68SS74Myf2E2eh30vivlLqQNlji2dknEOdoSva4VYXTM0vtHFO55mO7INKMVK
	 YTeyIEQz1TM7AAfxZQuLbk8xeeONbPk+q9R+1OsPfcTB2TD+E33TlM/KKIkf7NnsXf
	 lqL8o/D0N7B/arozKflimwe8EFFqrqI4zpcJKfHbyzv8GfuRvHMoBz0dlOdd6OS3Pn
	 38dhUZnaMoeKg==
Date: Thu, 14 Nov 2024 20:11:35 +0000
From: Conor Dooley <conor@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
Message-ID: <20241114-convene-reseller-84a0bcd98882@spud>
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-2-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V/kjFjce5AftHnAw"
Content-Disposition: inline
In-Reply-To: <20241113110955.3876045-2-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_121141_702528_D8D0644F 
X-CRM114-Status: UNSURE (   9.16  )
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
Cc: nm@ti.com, robh@kernel.org, conor+dt@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, kristo@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, ssantosh@kernel.org, srk@ti.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--V/kjFjce5AftHnAw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 04:39:54PM +0530, MD Danish Anwar wrote:
> The ICSSG module has 7 clocks for each instance.
>=20
> These clocks are ICSSG0_CORE_CLK, ICSSG0_IEP_CLK, ICSSG0_ICLK,
> ICSSG0_UART_CLK, RGMII_MHZ_250_CLK, RGMII_MHZ_50_CLK and RGMII_MHZ_5_CLK
> These clocks are described in AM64x TRM Section 6.4.3 Table 6-398.
>=20
> Add these clocks to the dt binding of ICSSG.
>=20
> Link: https://www.ti.com/lit/pdf/spruim2 (AM64x TRM)
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--V/kjFjce5AftHnAw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZZdwAKCRB4tDGHoIJi
0nMTAP4yuPMHFxAERFbK6P2x0JNdAaZSUYUH7R613NAJWVXPUgD/V3Qi3VBQ6Qtx
zaDDBbWph9y+Hetql40pzTNs2EvwjQQ=
=Anq3
-----END PGP SIGNATURE-----

--V/kjFjce5AftHnAw--

