Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A8EF43833
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ms3qftcx9l8CcCu7n9bXhHjFHP3lu9ydftyONXWJth0=; b=EOuacvA22MCcxYqqJx+E2ijCJs
	yNV0EWHb4IhxXoIPkoEUMeYuE9OvUSAZC6uta/BmB2jZ1u9L2i9leOUQnOw6P4FYEsxpqF36zAlr3
	KwzR0Jvezeo7OjaCF0JECD75pXq6zHNUqmWNSrbs+UrH3I4dlH+8LfCPPcvn9F7rWr6jqJJan6Jch
	K3Z07MSXy/3HiivWuQmQOsddBwP6yV1Q6wznPW2i/AQpQYygYpPsyRuhgcJ/RpPWhonaym/2LN7PF
	LPuuP4lEVvzLiqzitS61u8OZEwSbm69HqDyfwof0m5hp68MavgZy/MtzXvVojY4/wamX4d3ztcdal
	GF0+DidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1yX-00000001IlR-4233;
	Wed, 15 Apr 2026 15:16:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1yW-00000001IlL-0VOU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75A0B600AD;
	Wed, 15 Apr 2026 15:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78ABC19424;
	Wed, 15 Apr 2026 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776266179;
	bh=ms3qftcx9l8CcCu7n9bXhHjFHP3lu9ydftyONXWJth0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxasmsFPvYIRmUnYJKcAbphex+Wq5Pjp52xM7nx1/wr37rxyxDr6pxdPjg3OiMYrL
	 0GF2RZDY1Ji7/wVnMccZXCIFYwRXt5iNiz+sEVa/2lEqeOhVGfjuooYwXpxNWzSmn1
	 PXyCT6nUNFAqZxd+j6voIb9pqaX+V8e1NG2H82EsQQAPCNgyjRy1Yhnx4BfkUKUlJi
	 3QSRKmvtxpQxwGle0iY7cvCGZAoL+vknOQ6lMbjJUB+4GCxrLlYESj21plkLMj1FJn
	 MaA+7rtESxCqHReFhUjrsfwSSdi3dWopxsBejjve1jZ32Qg3ma4Zkrq9bE1nUo11V3
	 r+tpxn8tkVrMA==
Date: Wed, 15 Apr 2026 16:16:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: jk@codeconstruct.com.au, andriy.shevchenko@linux.intel.com,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v29 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <20260415-quartered-value-c97d22249d2e@spud>
References: <20260415-upstream_i2c-v29-0-317c1a905ae1@aspeedtech.com>
 <20260415-upstream_i2c-v29-1-317c1a905ae1@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T+1xF5cKS74kAZx6"
Content-Disposition: inline
In-Reply-To: <20260415-upstream_i2c-v29-1-317c1a905ae1@aspeedtech.com>
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


--T+1xF5cKS74kAZx6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 01:14:02PM +0800, Ryan Chen wrote:
> The AST2600 I2C controller introduces a completely new register layout
> with separate controller and target register blocks, unlike the mixed
> register layout used by AST2400/AST2500.
>=20
> Move AST2600 I2C binding from aspeed,i2c.yaml to a dedicated
> aspeed,ast2600-i2c.yaml schema.
>=20
> Besides the split, this also adjusts for AST2600-specific requirements.
> - require two reg regions (controller register block + buffer block)
> - use clock-frequency for bus speed description
> - interrupts are required on AST2600
> - use correct DTS coding style in example
>=20
> No compatible strings are changed.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T+1xF5cKS74kAZx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+rvQAKCRB4tDGHoIJi
0i4+AP42ReMqv194rOhH36frqjgErlXbSrRKDSEC57660lJwPwEA6By5dTTLyEEk
89m6goS9CjKTurkjleB8q03uegrHXws=
=AghQ
-----END PGP SIGNATURE-----

--T+1xF5cKS74kAZx6--

