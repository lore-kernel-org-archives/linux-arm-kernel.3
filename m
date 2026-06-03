Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5173ACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fG3MUMFCV92OWWB77GGml+hp8tZmw/pgA+W3l3I1k20=; b=jz+rKPDqLymgQg8SznjAguHloH
	nRSKQ8605Jlr+sEe2zZyoXsK6+JJC5Xccsm0i1pk/iWtPrNfXDNnx8yHQ11E/8qOhqwba1E94YnIQ
	ZTc35m7L6bquC4nR+df7YafSmykCtsH4qMzzuyhKJv4SgWW1RDK2n2CdGWhD5Dw+Q2BJBn5XJ6Sg5
	/mPM2/DUxQQyfJUyFa4PtBLUuBR2v9HqUBh+5qSsYDOY/xsT5BcwqmZO/nj+JnEFm6I90jVa+ohlx
	wjVWBJU8VCBJ+Q+DM/9c6536lxPjhQtN4XSW0gtjCs6BVyZ49RdN1ve2kim75rddfL2rIrq35BJXM
	+VI2sT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnti-0000000FTBo-1NAF;
	Wed, 03 Jun 2026 15:52:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUntZ-0000000FTAe-09e6;
	Wed, 03 Jun 2026 15:52:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B88360098;
	Wed,  3 Jun 2026 15:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC521F00893;
	Wed,  3 Jun 2026 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780501960;
	bh=fG3MUMFCV92OWWB77GGml+hp8tZmw/pgA+W3l3I1k20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jO5Vh1Z2cCH53eKrog4JC9WgTp6qjuIxSww1UqENset/sIpIhNuxmzZqwF972/eqM
	 sgLPIBkT0nLpPNTrQvYH/PL13eY0XdNwPtA9FuXlucIZQxZzfc27eZBSYbp1bRn4Id
	 YRz1RhdLDJUdi4/uBcUiu6lmt6IG5lU9xlerGYflKg8EXAqSgkEOgmhBa0eza4cqT4
	 j/oHfkClM0tUxVklQ2F8AXGzSrOx/5jmIo5jOZ5Ji9Fud+O3ryZ2VTv4KN4iWq9iIf
	 CNjVs+Rt/xpSNxhgGhZ3wv1usGh/QTiXNGigpw0eQPg0hlL7dPOpzHXZfyT1n6iz0Z
	 hRQDpK9llKWzQ==
Date: Wed, 3 Jun 2026 16:52:35 +0100
From: Conor Dooley <conor@kernel.org>
To: jian.hu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add Amlogic A9 peripherals
 clock controller
Message-ID: <20260603-banshee-reshape-7183ef9cde25@spud>
References: <20260603-a9_peripherals-v2-0-ee1b8c0a1e6c@amlogic.com>
 <20260603-a9_peripherals-v2-1-ee1b8c0a1e6c@amlogic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DCCmq9+7sUVqL8ML"
Content-Disposition: inline
In-Reply-To: <20260603-a9_peripherals-v2-1-ee1b8c0a1e6c@amlogic.com>
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


--DCCmq9+7sUVqL8ML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DCCmq9+7sUVqL8ML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBNwwAKCRB4tDGHoIJi
0sghAQDd2PkqviQwhNqJEYhIzE3HGz8asHPFKg41uBAnYMt5TgD/RAOvvy7LgVTT
XtUTQPnCXjUUQTlu5zvj2P6MgNPjEgA=
=L+fy
-----END PGP SIGNATURE-----

--DCCmq9+7sUVqL8ML--

