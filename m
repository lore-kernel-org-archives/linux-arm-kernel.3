Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD43CCC6B29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y99uqPqfDhQ120rnGroawz9lqy6eeL55mgnbGQJ5KsM=; b=c1ZRqqnYYjLITx/6wrt3FU1WFh
	Oy0JLvFBh6R2eAxQHK4ZOZBx0jpzkMCAboLQavQ5CTU6yRvlVLkH3p6V+FxlHVqvuvycUmb9qWnBp
	9ULfTVQIt9kqy7b1Ydntq1tD9NPi481ajRT7oHpGE4qii4ZiV8rUef5jcKYP6yA3XKpEi+5kar+sf
	KmM/+RJWZpQ8HOpNNqrn5/NrqdZtfOA+YYRALNUTmwdMN1J1V6Hzwq8WlhxVGIlVnxQdt0C7rfM0O
	CCc5TW1n6WygzJSGZS1cRbJCsqqRaqs639J3VeDKSaJUH3GespcDIhDyLcaV96lrN6UEnlXMZ04YY
	rQQeevOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGv20-0000000EzUR-1ntz;
	Wed, 14 Oct 2026 09:12:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGv1z-0000000EzUL-0SIB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:12:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 4858E6022C;
	Wed, 14 Oct 2026 09:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 74ECE1F00893;
	Wed, 14 Oct 2026 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791969134;
	bh=Y99uqPqfDhQ120rnGroawz9lqy6eeL55mgnbGQJ5KsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SH6m4y/Q26xnIfaLbL0LKLJ9GsyrvgptTxf9IYL4V98FafFL5Ymzx0S7S132c/sGx
	 7F2o0leazSbBgVqjBhcrbQZbCUtsFLB4Xv/uMjRWfyOybBZ2V14NISOTBkt0W3Cq7k
	 MV2lb+hpFGtOoy6rDtkPRn949Gi3loTPKY+lb7NfWM+ir50TnzSpOrhKs4caHsuv4R
	 ftnPxr/tp4gpoS/YPRT8ACZ+EuvAnJe1uTKj+FNzHPB7ZNoKPsWf8vzCMLmkTCkP9T
	 Zk5SHP1fb2w8Y5iX2Z3y+8bk7GiEFRAKxcLjus49xueXsFKpGrnZVTtJi1fmhA7bOW
	 aMdKlk4lvCXHw==
Date: Wed, 14 Oct 2026 11:12:11 +0200
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
Subject: Re: [PATCH v2 06/10] dt-bindings: pwm: apple,s5l-fpwm: Add t6041
 compatible
Message-ID: <as9HQml198veWxDy@monoceros>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-6-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mzqqhllyskho77o3"
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-6-961edd8d661b@cyberchaos.dev>
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


--mzqqhllyskho77o3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 06/10] dt-bindings: pwm: apple,s5l-fpwm: Add t6041
 compatible
MIME-Version: 1.0

On Wed, Oct 14, 2026 at 08:56:13AM +0200, Yureka Lilian wrote:
> The PWM controller on Apple Silicon M4 Pro/Max SoCs is compatible with
> the t8103 (M1) one. Add "apple,t6041-fpwm"as per-SoC compatibles for M4
> Pro/Max.
>=20
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
Fine for me to go in via apple-soc

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--mzqqhllyskho77o3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrPR2gACgkQj4D7WH0S
/k5U+wgApfuQUcC81+F0xRcpsmtZvSbz5AVEGouH3+XNu/8L1latDub6jMQMtvpf
5e17zrSmAvr24cslWxo3aSYXrCZ3kqrNyTq/53kwfaU6pCWFsjBf1O/34BERZlEU
5WlDJIN8cx2+unVaKOYjECKUcaPrGJJAe3Xy9tR2+iBmIOqpurdQeMb49PqCGwRh
dPvcAPWyNne3XIu++Gz2xXdzg2vx0jRAbo3aZIjtOKfbC76DHvJWHMPTUReikd8x
7lLFFuU8p01k32f+S24v9ivYJe6n4MaLTeD/N2IYaLLMtL5P4yOTKvD+SqQ43gBr
S9TQlFnLEXFvb4g4OCuixPOzrCde+A==
=V9CH
-----END PGP SIGNATURE-----

--mzqqhllyskho77o3--

