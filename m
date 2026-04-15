Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE07F43847
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dee28jZnToSIv/2KhtAbQI/WuccJs8QoILf+fdpRKPQ=; b=Od7F5oRpWw8je80klj3dn8FMJx
	UxnyC/SI1Au0nN5OpqBAdMugJq5qhKs0fzLUnrWZR40njF8r3MLyBOVVDKyhwWvukazC3+Ex78Pvr
	TGMJ5F2aJMMyl1Rl0jeUfFYaCpmyURKMKF6YnkrAoaZNn+yspIdqGQUv2vyj6C7IECIXOn/l4N7ng
	P2ibHVjzZpj1RsU43enQZ2uICNJzFXn59veNPax47QpN5+XzO9Z9d9awbAFuRIURD8DoTH9EXnzF9
	BTZJvPNMBD3wlj/aeceGkwxYOiUqXR9YKpulk2HsEWD5Qg22LYycC2cldynNbqRwn1HzKsbHcIAw3
	GmIiElSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD21R-00000001IwP-2HMC;
	Wed, 15 Apr 2026 15:19:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD21P-00000001Iw5-1jTq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:19:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1ABA440B9;
	Wed, 15 Apr 2026 15:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8CEC19424;
	Wed, 15 Apr 2026 15:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776266358;
	bh=C2CEKkmCH9aV17LYLLM5/3fFEfH0fiYdFqoFdPLbCN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bS4AIlrTVya99sPUUaSqchJnoC6rYci6Xzps/4CQD2kUYYTmQDqXTctvL4FGXcCzN
	 X2IMTtcMBZa1NoBprs5sXGpMnltuGHDSD9onfKIKmRwOLCKIhTrX4VGTkJ9y1Ewjr7
	 jwJXWgWa9sfdD+xI8InH8vG3rho7h10owTtFx/8RPxFFImdgU6Z4lo3RgaPRSMg3S+
	 48jQ4ZE2kL+PI+CEk2JqSXD5+PZ5Rz97yOjVAPANdEA567ruWCca51wpQmDpWBvV9T
	 BEZ0NLRsjjZ0M1/L1Wqjr6NkZDOPzQiKBhADFn+WcQoQpOQ+zMpqCsbbTFDQTQ8p1x
	 6OP7bi0P8k8gg==
Date: Wed, 15 Apr 2026 16:19:13 +0100
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
Subject: Re: [PATCH v29 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs properties
Message-ID: <20260415-unrushed-collected-562130070d8b@spud>
References: <20260415-upstream_i2c-v29-0-317c1a905ae1@aspeedtech.com>
 <20260415-upstream_i2c-v29-2-317c1a905ae1@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k6I7hnG3lmH5OCNw"
Content-Disposition: inline
In-Reply-To: <20260415-upstream_i2c-v29-2-317c1a905ae1@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_081919_489283_198D30DF 
X-CRM114-Status: GOOD (  19.48  )
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


--k6I7hnG3lmH5OCNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 01:14:03PM +0800, Ryan Chen wrote:
> Add the aspeed,global-regs phandle to reference the AST2600 global
> registers syscon node, containing the SoC-common I2C register set.
>=20
> These properties apply only to the AST2600 binding. Legacy DTs remain
> unchanged.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

I hate to do it to you on v29, but can you please explain what this
"soc-common i2c register set" actually is/does in your commit message.
The patch seems fine, so with that
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
> Changes in v29:
> - remove aspeed,enable-dma properties.
>=20
> Changes in v28:
> - update commit message correspond with aspeed,enable-dma.
> - remove aspeed,transfer-mode and add aspeed,enable-dma property and
>   description.
> - Fix aspeed,enable-dma description to reflect hardware capability rather
>   than software behavior
>=20
> Changes in v27:
> - change aspeed,transfer-mode to aspeed,enable-dma.
> ---
>  Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> index de2c359037da..0c769efb76a5 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -37,6 +37,12 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle reference to the i2c global syscon node, containing the
> +      SoC-common i2c register set.
> +
>  required:
>    - reg
>    - compatible
> @@ -59,4 +65,5 @@ examples:
>          resets =3D <&syscon ASPEED_RESET_I2C>;
>          clock-frequency =3D <100000>;
>          interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +        aspeed,global-regs =3D <&i2c_global>;
>      };
>=20
> --=20
> 2.34.1
>=20

--k6I7hnG3lmH5OCNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+scQAKCRB4tDGHoIJi
0kJHAQCCIue29Y53DEXwYeyc7bzKCGyQ41fURdeMFKTMRVm7uAD9FboLEsQkGSoy
RW+T31SM4kdnSSbuJvWj/tlGvWC9xQ8=
=8TWM
-----END PGP SIGNATURE-----

--k6I7hnG3lmH5OCNw--

