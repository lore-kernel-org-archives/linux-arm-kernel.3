Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FF1CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE0JVkVZrrj0DYaTmlnaaMVVZ3bum6caTUwXERfVn5o=; b=2mwe17TpPckdIo1MX49hLVMlQr
	NjPq+qPuai1gGRoUIuur4KnCMm+qvbXXgfgQPBv3Qn88gN5edKP6Ok9223JrX8Mzzt8UDLMwYeD6D
	DH2wTyvmIymlcttmGNlQL573+CosmccFMVJRHbI12IEDMCIVR6p52ECFWGQtJZg80mdUpRzjK0d44
	UQqqMPGuc2xReyWmQ8oR9Ej1nO9n2mZU7UP1QZ7fKYj6Oy+4gY6AWxL4gSEZxPKu9n9cW/RLU9w2p
	8oUUOIsmdJgqbNHnD5HN0z3lTCDHrTjMXTMPRsaXN7RtP1K6l3zAggL0sx6mMPsxsYapQynNzTsOi
	LxbJg82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzPK-000000063JS-0emu;
	Tue, 09 Jun 2026 16:34:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzPI-000000063It-31wB;
	Tue, 09 Jun 2026 16:34:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23290407FF;
	Tue,  9 Jun 2026 16:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70781F00893;
	Tue,  9 Jun 2026 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781022868;
	bh=TE0JVkVZrrj0DYaTmlnaaMVVZ3bum6caTUwXERfVn5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MBKUl9B3Hw8cHltz45RL1oqLl0KnwJX+t4Su1K7RyigUJAdgC+3SupRx4IKE5orMO
	 BnC89sm8cuNX6gmuZ+0aWaWl2G583n8bLV4qqloTseQYPSCmZHQo9Sm8AH70+pv497
	 L3WYYjc5tdNTfdYcB3SZQdReouellKPywO+D3ggeBNAvb4M/4JzXzTlan7HHlDdLk4
	 n9zVCZvrX7Ya9pzSrgCFhSawrvPNiCyoWKio3Fl5F4Dl0R21/JMl+j8aK1kflPi3aI
	 bE6/HrtKeJC1wWSbTubnaZCx6CCjn+B60XYNN73JJaOLaEo4Ju9eKRam3NP+xIbxx8
	 pFKnKGP/bY4Dg==
Date: Tue, 9 Jun 2026 17:34:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: dts: ti: Add specific compatibles for SCM
 conf nodes
Message-ID: <20260609-riverbank-buffalo-ae12ae1317c6@spud>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
 <20260608-n-dt-bindings-simple-bus-syscon-v3-3-4eba9ec1212a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQ5L5UMcTh/jjl/e"
Content-Disposition: inline
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-3-4eba9ec1212a@oss.qualcomm.com>
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


--qQ5L5UMcTh/jjl/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--qQ5L5UMcTh/jjl/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaihAjQAKCRB4tDGHoIJi
0hzzAP9IgmdOgnqiwiYVQ2g4qdVGTjE27anCdxGOJk/6ywkmjgD+JWKwOZ6gm9aJ
GYmHT/Qbuljwrlk++nV9KotKQ5dCGgI=
=3af6
-----END PGP SIGNATURE-----

--qQ5L5UMcTh/jjl/e--

