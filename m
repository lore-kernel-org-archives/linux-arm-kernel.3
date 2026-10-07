Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315B3CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ono3XC2jWzCtdtxm1AZV27fSUgyNe3YWPdofYixm2yg=; b=oPwGRl7ryf2w0M8NHZDDrll2w0
	SpbGj77W8+sYIXNLYoI0P8gM1o96rV5E+C1bbIwlpdiQCTCgNnKNKgXpmulBeQh2Me/VspFUqZkVa
	KZ1QKMu8xcY3Bm25fh1Ac0NixZ+Sgw8WqkNlFTy7YPMrGtf6eMBn15yg4Ph/V9uYvgcXcXE2QzdK0
	tXeJsJffwQa2Qh0gLXe/QoZKSFWs82Y+PpQI5nM4D29MmoBqxatrqkU+D39YAMcuo8FNrazNbMz5q
	ePrSqTTXIrpYPeQUGzbDBxDuX0gE+YugaQ64E73miqrrXzE1RFV0Z3HzTPja4xGfg5DEq2cCxSSeY
	WDhqKN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOfy-000000028kw-2dw5;
	Wed, 07 Oct 2026 10:15:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOfx-000000028kn-1fcl;
	Wed, 07 Oct 2026 10:15:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2B31601FF;
	Wed,  7 Oct 2026 10:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49471F0089C;
	Wed,  7 Oct 2026 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368104;
	bh=ono3XC2jWzCtdtxm1AZV27fSUgyNe3YWPdofYixm2yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h7BK6S4EsPsLhtNocgRwYmx0oYvG28EVSlh+twpgHi2L3srMuxRgHtU9HQN7ijvnn
	 0RR1zAxlBmg9bhTEbyJTtWcXMLFeuIXVB75NPh4VN787WIG6RquVkX7iCk96XHUjTA
	 i/Eyv9GxL/C+yNdcs0dDN43pOJAQufRdNFvDSyvNOnzU9sqxQW7gOQ9jbiga5GwItO
	 /PJS3OpTZfHAc09l7/r9brOj+ehkt/X7LMs5hdxHBuCoWSlyYes4Ys1htM7+coZb+4
	 lZ5Qih8rmI9EYhriH5tBhhALcs8HRlr5cqQfq2i3fR7GFlnS3ntQSxSn0Td6wy0epw
	 HhKPoDQ2HbSsw==
Date: Wed, 7 Oct 2026 11:14:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Bob Hui <bg9oxa@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
Message-ID: <20261007-272017d1a64ba304c82482c3@squawk>
References: <20261007-quarkpi-ca2-v7-v7-0-a84c6d5d6ef6@163.com>
 <20261007-quarkpi-ca2-v7-v7-1-a84c6d5d6ef6@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BNFm96iWEOnTS7pl"
Content-Disposition: inline
In-Reply-To: <20261007-quarkpi-ca2-v7-v7-1-a84c6d5d6ef6@163.com>
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

--BNFm96iWEOnTS7pl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 01:06:26AM +0800, Bob Hui wrote:
> Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
> computer.
>=20
> Assisted-by: Hermes:deepseek-v4-flash
> Signed-off-by: Bob Hui <bg9oxa@163.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index a799bb843f74..a3191bb909b2 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -182,6 +182,11 @@ properties:
>            - const: alientek,clrv1126f
>            - const: rockchip,rv1126
> =20
> +      - description: Alientek QuarkPi-CA2 board
> +        items:
> +          - const: alientek,quarkpi-ca2
> +          - const: rockchip,rk3588s
> +
>        - description: Edgeble Neural Compute Module 2(Neu2) SoM based boa=
rds
>          items:
>            - const: edgeble,neural-compute-module-2-io   # Edgeble Neural=
 Compute Module 2 IO Board
>=20
> --=20
> 2.34.1
>=20

--BNFm96iWEOnTS7pl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasYbowAKCRB4tDGHoIJi
0poEAP0cDi8AhzthDNrWdJoqYeqtrAtg5LLLMhgZoDbWX/wPpgD+MSKXvvDtM6EM
UqxVzz0cH9Y5SazOBJ02w2vwLh3wRAI=
=kjo2
-----END PGP SIGNATURE-----

--BNFm96iWEOnTS7pl--

