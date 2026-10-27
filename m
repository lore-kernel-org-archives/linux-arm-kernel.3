Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E22606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QznxXwO0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDxOg+/O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YiGvfPO8lWPcTMujIOBDkGnAATfXB+3gMom+JivhP4I=; b=QznxXwO0dc/YAwqXSPM2il38bP
	+6KofdJArjSLD82/RgvoHK8UVOzMeQZU26eYAUdFpSYCzmyXWc0qPn1R7rGqBkE+gY7JAwn4s6adP
	bh1hqzUaHvBgZSo0wTQTKwqgDAOsMDAevCQ3UWfymGvl3DqZVg5kWyS7D7CYMnm8EiD9Az/xhmR9M
	tAkXjSBjcRPvRlo5s0azvM/y6Rg/dWzruQFoXBtlPYOlCPS4oGD1oNXfNTvQEQRgpIAtjaU3QB3nu
	cDlE4TxDf0LaYH3A7TaewYPdQWR0k7f32hW1P/h7uTknxtVXsZ2Z9RgWliZxOaNoFBuGNNej8oEQi
	xaRI9rGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcXZ-000000041lz-2i5u;
	Tue, 27 Oct 2026 08:28:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcXZ-000000041ls-0vlX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:28:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id A124943716;
	Tue, 27 Oct 2026 08:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 040911F01825;
	Tue, 27 Oct 2026 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793089696;
	bh=YiGvfPO8lWPcTMujIOBDkGnAATfXB+3gMom+JivhP4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GDxOg+/OidGDh+op4PZKFPmGJZX6FIqs1fNvpzf3+QrVikwfnnkRapy3E8/9MRtMn
	 +Z+0tXC+bGwAUE5882CibfYvjj25yCv04lmM1HY1v+hVl3mqeLEqwMIDv1x+BZak2W
	 DtH2WXyT4aFv96+qvfNQOuj5ICd8U6OaDj257AwsZCm2Rn4UqLC1hv1YtFzRVF08jJ
	 1LKDLEOY8npycHhNpORGGbiqp3jz5cICTkInnCurqB/JIIOycw//BlbqJ4k9En1nN9
	 QynPbMK3adqDOafKQ18jukHXpzkD9gxwvpSPZcKgHGvgiZVZk03Lxav6K7lOWbwdNU
	 xNIFHI4/uzTaw==
Date: Tue, 27 Oct 2026 09:28:13 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 06/10] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
 compatible
Message-ID: <auBgZhx0qcbAgHnF@monoceros>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
 <20261027-apple-m5-initial-devicetrees-v1-6-1356181bc50d@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="osff576hwwbj3tks"
Content-Disposition: inline
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-6-1356181bc50d@cyberchaos.dev>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--osff576hwwbj3tks
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/10] dt-bindings: pwm: apple,s5l-fpwm: Add t8142
 compatible
MIME-Version: 1.0

Hello,

On Tue, Oct 27, 2026 at 09:03:26AM +0100, Yureka Lilian wrote:
> The PWM controller on the Apple silicon t8142 (M5) SoC is compatible
> with t8103. Add "apple,t8142-fpwm" as SoC specific compatible under
> "apple,s5l-fpwm".
>=20
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/=
Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> index 48cafd391ca2..7c9e148727a7 100644
> --- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> @@ -20,6 +20,7 @@ properties:
>            - apple,t8112-fpwm
>            - apple,t8122-fpwm
>            - apple,t8132-fpwm
> +          - apple,t8142-fpwm
>            - apple,t6000-fpwm
>            - apple,t6020-fpwm
>            - apple,t6030-fpwm

Fine for me to let this go via apple-soc.

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--osff576hwwbj3tks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrgYJsACgkQj4D7WH0S
/k4YKQf/eh5CHfao6qpCs5ensLJARYPiQLmM7MEnVTmuzRzfOmxDGCcz78bwmYPM
N1vos/TZlbRIBml0Ci+lx2nuJBKqCWVW3KqxHpSm3xaOoxExRuRKOeGhvgxsmnLO
AdAXkYxedLQvYEykoMB3S8m1c/e8dkF2Wt7jIx+NOMk3xVyTWIJttmYpCVQX6sdI
U6O9qXIfZz4S2Tza4z7IPQDPtO3sTH/pOCT7AUy71gfAgfxI8Kjl090c5dYGVtHI
3mzNK5S3Vfm/BanI5WdEV4WsU6oTxNjjE5DaG/f5yyod/dOYR3VT3O/8Fq92GNVB
hPx73VUJrqd3dTtu7nEkhJZgLopppw==
=9oZQ
-----END PGP SIGNATURE-----

--osff576hwwbj3tks--

