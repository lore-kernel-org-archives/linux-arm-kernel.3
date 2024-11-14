Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8A1D6A22C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyQbDPJjhD/9PZvSWZ+Nf3CiwTC1gLWP5/C+3+BfOGo=; b=14LheS0sbaV4A3mYRrRmeQRen5
	L0fcoctXqgQXI3dtNbaKZy1NSnqLM7/fFlj93iNTO/pdz2qd1CxK9XgUWwByvuLDyFzoBH40RAdUI
	A0i3kVcBdBW1CcGo0uFGoh0w+DwYxbmIkb4c+4UOhCafFbGuVVxaWeLpiAK4ddjatAfbon4/6bHch
	xWdqZtvDspaf/umBZD/g8Xl+1z+xmrXSrDwz7HxCvMhwFest2vL8xuYwLgRWLq/OS14SqTneYGGUq
	3V9ANStDLi30agVyZTbhNR2xQRHmolfgESe24bZQMHoXa27aPYubSQkVqSnmzLLLkIF7TMpMZ1Jpt
	yaQ8lA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgI9-00000000jt6-0vLP;
	Thu, 14 Nov 2024 20:18:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgHC-00000000jix-38S5;
	Thu, 14 Nov 2024 20:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E076A419DA;
	Thu, 14 Nov 2024 20:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B425EC4CECD;
	Thu, 14 Nov 2024 20:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731615433;
	bh=yYJ83seyTbIkEkldRnTO7y9avHpL1XS7XndSlHwyg88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kh8On7gq7Rv+KsOPVPqUnCk5EQfy1Ka+Qrp2jgMzkGNy8pmumvZ7SHxiPua9sDEpi
	 8Nhp0Zr+mJL9ABhDxKR3/W9gZ5LSP7wfwNrOAl29v2F13c7c2bQXOwnzXs/KabIrOm
	 E+nSRjMFSg3E0itVNxh9JZ2R9V/jem0QYGS/as9V0JRN2PEVFtcILBqR8XHRdjy+z+
	 eW+jgFfdvDROttYAHtBz6495OZY3n1xo4cB3ia9Xb6qaHiyf82kvgiPKOtopsx/5Xf
	 J8GaH+08m9kG0zrl+fu+C+vlsFXSjmcM7O7g3QqREEyCP7ChBPR1lIzECMOPEm3YO2
	 1Q7HV9/R3rzGw==
Date: Thu, 14 Nov 2024 20:17:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 0/5] Merge RTC Haoyu HYM8563 into RTC PCF8563
Message-ID: <20241114-pebbly-bondless-a3e1ded70840@spud>
References: <20241113085355.1972607-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T0BKHKFsJ6ROrSX+"
Content-Disposition: inline
In-Reply-To: <20241113085355.1972607-1-iwamatsu@nigauri.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_121714_847705_61104027 
X-CRM114-Status: GOOD (  11.80  )
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


--T0BKHKFsJ6ROrSX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 05:53:50PM +0900, Nobuhiro Iwamatsu wrote:
> RTC Haoyu HYM8563 has the same hardware structure as RTC PCF8563, and
> operates with the same device driver. Therefore, since we do not need
> two drivers with the same function, this merges HYM8563 into PCF8563.
>=20
> This series was tested with PCF8563 and HYM8563 on khadas vim3 board.
>=20
> Nobuhiro Iwamatsu (5):
>   ARM: multi_v7_defconfig: Add RTC PCF8563 support
>   rtc: pcf8563: Add support Haoyu HYM8563
>   dt-bindings: rtc: pcf8563: Add Haoyu HYM8563 compatibility
>   rtc: Remove HYM8563 RTC driver
>   dt-bindings: rtc: hym8563: Remove hym8563 binding

Both binding patches here should be squashed.

Cheers,
Conor.

--T0BKHKFsJ6ROrSX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZaxAAKCRB4tDGHoIJi
0nVXAP9lP5qvW+8yZjRI90llmK9YqGs4I+F1C9FeQe+YF1am1AD/eExxghR4h7K7
OWfTsMUzGLSk2PrYAbFvMP5tnsseKQw=
=dkSo
-----END PGP SIGNATURE-----

--T0BKHKFsJ6ROrSX+--

