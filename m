Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF527CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1XSY0vT6OMbSFwYM3WYl0nmIcd2JaGA5/JSzPeHm6U=; b=xRx+zQ4BAvqq3JgIeXlUQTKUE9
	1oquDxnGg5P9uFArsppWJI+KNSnS04PTZM8hLXO+Ka1HZu8pac+QUg+FtTPYxVTIy0wxZR8ThyqXD
	gftttjxzt5JQ31yYmijocNPtrWM62YWSohRaqLnvMBjjPro/9VMzGLqfvOdfFC7DbrlxkFPKmCcAE
	dXQ+M+TfjMD+7o6zZrl88rp1pZLRVx3JnOLAQiIiGZ/NxIEsjEXbu0PwmiovnfVy3MI1iO2OkgAEA
	aj9h+ppklil9J0zhZwmvIMeNcQVY5CMYsMOh0YM/9fNnUjMrsCpWyHi4G2jDCocMKGfe8XsQk+5ci
	n9T2uBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKkY-0000000CGRC-0TNp;
	Tue, 04 Nov 2025 17:23:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKkX-0000000CGQx-2708
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:23:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FB52601FE;
	Tue,  4 Nov 2025 17:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99B8C4CEF7;
	Tue,  4 Nov 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762276996;
	bh=E5LlO3nuIGMGzEZzuymHEqptWv1aueAZNyEcApu+pa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HaetDQwrl/7Fkot0PU9d+nSTeVzFdfuXVDZmdtpJpJVeBaaA0klVmA1eENrt1+e+5
	 TvhgjKUbjrZtovhEDg0p/Am7ivqIXvS57RaliFTnO9C2HOAGLORQ+0s4yJ1549qzi5
	 gnwahsmhyujkKSeMLxE7Jq6+mB8ZvHH3Eqy2gdJKkij38H6iV88jCabEwF+N90TP+d
	 nkBwS/85Hd9v0+6QjTt5T3ckOMj14HwnAD/nWS9HVhCHfN326C9iagieA4W0sQaU1i
	 OHNav7/x0N7m+JDB2QKDKumsi6pntWjK6Fai4t3GiS1oW6jXuTiAMboyPolY1CBmjo
	 4EbUobAL5zV1w==
Date: Tue, 4 Nov 2025 17:23:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add AST2700 compatible
Message-ID: <20251104-grumbling-document-6483add9415e@spud>
References: <20251104055112.2679087-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EAVUn09jG7fwpxUy"
Content-Disposition: inline
In-Reply-To: <20251104055112.2679087-1-billy_tsai@aspeedtech.com>
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


--EAVUn09jG7fwpxUy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 01:51:11PM +0800, Billy Tsai wrote:
> Adds support for the AST2700 PWM/Tach controller by extending the
> compatible string enumeration in the device tree binding.
>=20
> The AST2700 PWM/Tach hardware is compatible with the existing binding
> schema and requires no additional properties or modifications beyond
> the new compatible string.

With this commit message, I expected there to be a fallback compatible.
Why isn't one used?

>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.y=
aml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> index 9e5ed901ae54..d6ff4182085e 100644
> --- a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> @@ -20,6 +20,7 @@ properties:
>    compatible:
>      enum:
>        - aspeed,ast2600-pwm-tach
> +      - aspeed,ast2700-pwm-tach
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.25.1
>=20

--EAVUn09jG7fwpxUy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo2fwAKCRB4tDGHoIJi
0sYTAQDbftqnYaV1ZmhlGS+OCOMPY79jqcr4MOlskykoteVUhgD6AqEmQ/T3y0h7
Z5h+xKS/iDZ9j7HhE/bIphciTJDIMgQ=
=uT06
-----END PGP SIGNATURE-----

--EAVUn09jG7fwpxUy--

