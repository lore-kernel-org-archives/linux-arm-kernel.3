Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3564DCD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHhslRdCb64uAeyYNctM3W9sIiDue6c1zUXUsmVQdDw=; b=o9MzYkp4ALb7pVbHEsrogjWMA8
	coWtwXAoc+bSTU2wn3tK7B2CtgrDSPLMcuWIF+k/BgPuPn1tFWhWfmVol8FSacMsnqexly+Z/nO3M
	pWyRFogYiZehPpqQCKMzf50AGcM5hBJB2Ert/Pd6t8wSyOMSfwtMzTuAJKP2uodT8AHr9HlyQqXJg
	18wPqHvbr332h1UNRp9apqRkoYosaEQuY6V0tlMbBycNGsbqiGuBPPgChQ4I4KXO8gqpaRS5xbpAJ
	namQmM+VPip7HwkqPMBda1POYquMGGVwxmGNL8voTjRjCjrBJ5oRZXcAcF8ujQV7xCGNiSuDkBik9
	yxIl1zNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURsF-0000000DQbl-1D7z;
	Tue, 02 Jun 2026 16:21:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURsE-0000000DQb7-14CU;
	Tue, 02 Jun 2026 16:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 900AE6001A;
	Tue,  2 Jun 2026 16:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294731F00893;
	Tue,  2 Jun 2026 16:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780417309;
	bh=UHhslRdCb64uAeyYNctM3W9sIiDue6c1zUXUsmVQdDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i6OMW+cKx7zXo90uE8WPiS/OcVuI7uDGylbGIqiWQu/iVicaSM+DeEqQXJGZgk1OM
	 IwDdZDUjqr9ntqqtBnHhSlVGJ3pjMA5BuvXq52ZMR7U7t3oZQUNF8jtZk+ZwcRP9hc
	 D61ZQrbLjbtT5RO3hyuYOkE7XNJAIp/9EfedL7TXY87GOrYpVa/Sv5OVr/lSqUti5d
	 72u7DVutWn4bGcGII3fkV4HtfWPqmtqV7oJK0yYoPS9cthoXN2w+wtVcLxSGNSg6XS
	 v6M/90d4HVUGBK/JsRPbA15VcpcWK0jZYLMglbsTdx8mWmoqkjwg+39Vo6paf66FZ6
	 7Qy55uJv251Ig==
Date: Tue, 2 Jun 2026 17:21:44 +0100
From: Conor Dooley <conor@kernel.org>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6323 PMIC AUXADC
Message-ID: <20260602-paramedic-savor-d18b45241914@spud>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com>
 <20260602-mt6323-adc-v1-1-68ec737508ee@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IJiwimoZW+P1otaL"
Content-Disposition: inline
In-Reply-To: <20260602-mt6323-adc-v1-1-68ec737508ee@protonmail.com>
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


--IJiwimoZW+P1otaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--IJiwimoZW+P1otaL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8DGAAKCRB4tDGHoIJi
0kW+AQCQIb8fbQspyzRXQ31z317U3glZxhw+7Cyj4mh7Xu2LSgD/Q+ATNfJMuTbI
u1ybBxzqgJ6j/WnDdxqpZN+NAU2qIww=
=Hak5
-----END PGP SIGNATURE-----

--IJiwimoZW+P1otaL--

