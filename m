Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A10BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 15:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwDd2EMlZr9hfaN3cZIU/a2g/xgt/yNMRfTpdvkoNFw=; b=LD5OxXO9nu8JS6kPL+KlurKJMX
	V1O6rGtpnD77Uykpg1LnAjcjX5IkhEHL+QHI2LTD2YEUj83NAgwfwEAI5XovDzSvL+VEsTCqX5qeO
	9ok6hq1RuLxQcHvUSAASf4HvGL6gtamgpsIDAyEJfBnecpmLmKJXqwv3BBMSZz9s8zleNlW42bpmU
	Grmf7BR6fx3T6F3rbPRneBd5v5MR58aW7Q4QE6BZzcFevOZQvimChix1X6+StFn9E3nuXFZothqgN
	c15ryezjMbRbuQ8KAAB3ju/gzdJXgQRUujTxmPM5tXheaO/uZTqosqN0Mgg+gIbaY1aF8D2qnzSc9
	l2c+x8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlFb-0000000GG1u-1Bt9;
	Wed, 21 May 2025 15:20:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlCs-0000000GFdT-010x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 15:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E50CB5C5BBE;
	Wed, 21 May 2025 15:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EC4C4CEE4;
	Wed, 21 May 2025 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747840688;
	bh=KwDd2EMlZr9hfaN3cZIU/a2g/xgt/yNMRfTpdvkoNFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKYwt/eTjs7jcUmygYh73NgjqTryFfhuIcg4HAKdZOIqrbxom5z4j4CrQfDMdMWft
	 HIsFoBLJnjWp7FPctJZvgVBlkYx1++dvYYJWnz5nRu39NsRJ4l0vQ/GQGnmc62L3i1
	 NcaCwCzj+++0fTq3iAenS6rI4dU+POgxpb6L7pJI10YTZnZgL6vM/4eKIt5EcpN+Px
	 9kTtF+mpbSdjGfyGU8ijsXaQpj8sEWy8FZUMfSN0q0LlffhaKJwLIacSBBKAnST6OX
	 1ATG/6DX0ExKwvxuN8F9jva2nmcTzz+q+lh2GT65rdVNbw4S5sdNVhLvIW2J+Q7mvv
	 EGJRoMxDU4Pcw==
Date: Wed, 21 May 2025 16:18:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	peng.fan@nxp.com, wahrenst@gmx.net, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: vf610: add ngpios and
 gpio-reserved-ranges
Message-ID: <20250521-monetize-variety-0f5860c56c11@spud>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-1-04771c6cf325@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yNwNt4S7GEmEqYEF"
Content-Disposition: inline
In-Reply-To: <20250520-gpio-dts-v3-1-04771c6cf325@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_081810_092646_C0D910BA 
X-CRM114-Status: UNSURE (   9.05  )
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


--yNwNt4S7GEmEqYEF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:46:12AM +0800, Haibo Chen wrote:
> Add optional ngpios and gpio-reserved-ranges property.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--yNwNt4S7GEmEqYEF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC3uqgAKCRB4tDGHoIJi
0jGlAP9TnTdse6ZU06tanpS6TQTiGGVwpZ8Bh6rNtLQi10BkkQEAinMkR1LeNCP0
wO5kSg63BuWyDoTNoR4N0z+zJSsZ5gE=
=jwcd
-----END PGP SIGNATURE-----

--yNwNt4S7GEmEqYEF--

