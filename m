Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C27C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSYdeLGJkEp6RG4mLhV6bWVDxhISM2o2G8ISMbTkn9E=; b=JpC+zr1rRzdbQX8RwN8dbneVVM
	RLmHrdUFLiBZuTKuX1EcCMESb2QqdSueuECVnlBESmW0bJ7iaBZMV/9tLZsNnsU/HAd75CB9r0JvI
	nvgqinYl9Aha2fjpIBJub1Ivhrfuhyp1her9PjTeFPODjEv/XC/MLPWddP9Iuybew355blElR4Zto
	t/0nrV1E8s6VZ57vRpPwIvII8UsjTzDl3WAWt7xtOLEx7iKYEKxUltTUJRwkPEo5n25Bd06wod+G8
	BEQVfhD9MiIBcLGhP7GBoqGay/JeWVoHn+3jZb6yICLwLJza2MdCWE3ga0kTKEIVFvneK4LYths3H
	CzN1JYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KRo-00000007vi2-0E0s;
	Wed, 23 Sep 2026 10:43:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KRm-00000007vhl-3frK;
	Wed, 23 Sep 2026 10:43:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 569C940E15;
	Wed, 23 Sep 2026 10:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5A31F000FF;
	Wed, 23 Sep 2026 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790160210;
	bh=rSYdeLGJkEp6RG4mLhV6bWVDxhISM2o2G8ISMbTkn9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HPNSWzft368imB4Jhn8LvwdCx9ipMDPvZXMaiHJJ61dxo5m6ERjbY2w3iThBHmQLT
	 GLrl204KOo9ylSJcKrwXQqQQa9i14Y9uVutsmAa3HTwTMOBDSmJmC6a6Ms8QgOl7fN
	 BjGfhAUJcTzuG51nCOgrHNZQQthQ+xKYWLCNYXLXyDWFvxWbxa+kipvtpXN+rJszud
	 kUPKL1YV0O/zNQo4718LIb7wvxO7F3FjzkNQNz0wOI7DGEUA5ee2udfmWaCpyIpzc7
	 sKC0Bi6qkfkm0zyN8+xdVUroFOlhVOA5U+6ARO9a2letyJwnkbyR8dePyXzrgBo3M5
	 cgSxxEcTfK/ug==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 64B7C1AC5739; Wed, 23 Sep 2026 11:43:26 +0100 (BST)
Date: Wed, 23 Sep 2026 12:43:26 +0200
From: Mark Brown <broonie@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] regulator: dt-bindings: Convert
 mediatek,mt6380-regulator to DT schema
Message-ID: <arOtTntGW-ocXRxK@sirena.co.uk>
References: <20260922195502.818012-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+UzvdQb/G35qJU4t"
Content-Disposition: inline
In-Reply-To: <20260922195502.818012-1-robh@kernel.org>
X-Cookie: Too clever is dumb.
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


--+UzvdQb/G35qJU4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 02:55:01PM -0500, Rob Herring (Arm) wrote:
> Convert the MediaTek mediatek,mt6380-regulator binding to DT schema
> format. It's a straight forward conversion.

> +  '^buck-(vcore1?|vrf)$':
> +    description: BUCK regulators
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +    required:
> +      - regulator-min-microvolt
> +      - regulator-max-microvolt
> +      - regulator-ramp-delay
> +
> +  '^ldo-v([mat]|phy|ddr)$':
> +    type: object
> +    description: LDO regulators
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false

The LDO is an object but the buck is not?  I'll apply, but the above
looks weird.

--+UzvdQb/G35qJU4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqzrU0ACgkQJNaLcl1U
h9AfYAf/ampyiNIlGnZ0CyLLiNBSD8wKSANZb1KXzkse0dMyKkbrRYXjL2p/VrGt
fj91VMtpTD+SrBud3kqnEWbQ2Z8DZb35yxRPGloijv7Mb+8Br0+9PLEj9ll3Nhx5
vbZwPMynyBUyt60ttPOAb+cnFYi9b3E/6swkSQwsDknwW3hW4nRs7M5EzF3kaAtj
9GaiKMQBlKOSNlIMI3jjNZnYrdYxfo0jyJy89Y0AuJnKahY7ZExbSToAp8OlUM3J
Oa0yayxZFKv4eQGsV9OUCPpZxLvXNa53MjOMPcTmcZQe0DBuc08YHEsQAoGAbu6U
dFatjPp/Hsf9ZouwaYE8W8/NyS7KzQ==
=qIJ0
-----END PGP SIGNATURE-----

--+UzvdQb/G35qJU4t--

