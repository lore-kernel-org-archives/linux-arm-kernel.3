Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCF1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrFZsnUmW0yIArlQLTrgfC5aQins48K9v6hYbAT2Tl0=; b=X9YdcRQbsJDfb23VzcQVS6E/6T
	g5wULdYJMBDuj5ScZJLIBYvA0KH71BrvB9J3kaWDUL8fGJuH2oAxpAiVgQJnu8zZo1rcgwYVnB/U/
	FuZj1RmKbneljo7+QMbikhkTruF1OV9iV0u4/ReO6rHEESZzUmoEc98xqLlf08onbLUfg47sj8Ryp
	OdTE0btvbRX6PjKB2YUYayCLSj4ncZZSTPeMnnYLgNzH79PTyBkQeRawjzBuwvMp7cEidqSy3pAKh
	NK4kf0L/v5AkPDZ0ffT1YilyUx4r6/9xvdoeRvH1v5huNWKv7d9u868x33OD6fArQBqvTaltZbNYk
	afYKCJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyHY-00000002eKO-3QXJ;
	Wed, 01 Jul 2026 16:59:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyHW-00000002eJy-3t8x;
	Wed, 01 Jul 2026 16:59:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70CA443C13;
	Wed,  1 Jul 2026 16:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA861F000E9;
	Wed,  1 Jul 2026 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925166;
	bh=IrFZsnUmW0yIArlQLTrgfC5aQins48K9v6hYbAT2Tl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f/w4hSphSkhrF275HYBKpE3cR+xWiEZ6Grf+3aTfW9XXs7R0IzjxQdU0iZc9POURe
	 I4//UBTHXLfdBFJ1R1WNUouug6IAbNvaAkfdt4hqzriT3dtdeZW+CBASufQCich8/U
	 iix2Y1E+qWlNTh3oR8ag9en4qbl70CYHtavF2Xqp3l5g9ZySLDqjLzm86/W0k6UlpM
	 kBna67CTm73CFdyaZQOCIk1c8OWQ5VwXLys/qw2iHzAQZByoYacrUvjP3PAqtdRBTT
	 /D6XlIe/T/UuzEZ+t6s91f1oDe3E0ftrJ6kRHSgwJSjS68V5WGLi3jNgf0O2sDPij9
	 ZpJqFtEeJOabg==
Date: Wed, 1 Jul 2026 17:59:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Long Cheng <long.cheng@mediatek.com>, kernel@collabora.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add support for
 MT8189 SoC
Message-ID: <20260701-escargot-unearth-233b3f1da093@spud>
References: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LiqYd8uyhb+nmNno"
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
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

--LiqYd8uyhb+nmNno
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--LiqYd8uyhb+nmNno
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVHaQAKCRB4tDGHoIJi
0iAeAQDw8UZ2gVBadrMgzz0CFwnC6zMw9K3G93fmyHt5QjKqawD8CT22JOXLwJgl
07e428SiKjL2teJ4dkqvY5MIihGKSgQ=
=8VBS
-----END PGP SIGNATURE-----

--LiqYd8uyhb+nmNno--

