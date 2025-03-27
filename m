Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54DEC36012
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8VdYWjuYWa7YIVquN+OvDXAuE0xN2bOP7ibbd8y3pg=; b=IH7nrS2lnt6o2kyVQEubpX9s2A
	OFRzflH4HyhgxzrgXG1Y25IzY85lukLm8jc0o3OSC8/9OAmayNfQoaQbi5zbuVNguNzre2TEW58UI
	meVS5XLLbJg7luMqCzwsXuF2jlykLrjIMMAwNhti3afbne2pYWPgTNKV0Ny3pbqpKECOwMygy2MYZ
	9R3AwXE/bgcrRqTHf3fw43vffyn5V4sgMY6MA66OjLiGchV6LuN32G8f8I/Bd95PJvW2xaueCoFC5
	nJRVnmOtKmilVoyTvH5esezlp9BFKUCMLMPRDEOniZrz1nK8rXrfjHhTLlFrtmC8m1/QHGY/CROyM
	prehLn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiqu-0000000AU9r-2DaN;
	Thu, 27 Mar 2025 08:44:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txipB-0000000AU13-2LzN;
	Thu, 27 Mar 2025 08:42:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2DF0A41DF1;
	Thu, 27 Mar 2025 08:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F1FC4CEDD;
	Thu, 27 Mar 2025 08:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743064972;
	bh=YD48CO4FsnwCglT67h5qBvSC1Oj4vkTc/ynkSqfBkbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOnUw5CiiGx9MW6mTLS3QpYBwCi1ecL7NIZ54rPiNogF5wqbYofbS7ZsUmJuRxOEK
	 VmjINAOiHZG5fr2UqaSFPFa0RR7aoWNBY3rd6ldXeDEwC+r6h8zCfOBjuI1A7p8E1q
	 HFPn5tXVTytEjQ+XcTNZ8fxwCSkLnnVis6YszVKWXfuNWunvmnzxF5pnASBCr3NHIR
	 Z6JeGIbiyq05a9lLiEV9gTwA7OszwjPB4CXTD/6QsVB674OCI73mGO/M00/RC9/vhi
	 CfJuG9imQVqlDaHgG9M8gB/2mzm1d9SekbfhqlLWkHgNnzAWHhs9VecB0F5JLILSNV
	 U5ExS4PeES/YQ==
Date: Thu, 27 Mar 2025 09:42:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <t3zbutuclculgqchj2byhjqbebdyrs3sslt65faph5tljppljk@lr5pbdovyuxv>
References: <20250213094018.134081-1-privatesub2@gmail.com>
 <20250213094018.134081-2-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="chw7rzoep466ms63"
Content-Disposition: inline
In-Reply-To: <20250213094018.134081-2-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_014253_722319_0C0926D6 
X-CRM114-Status: GOOD (  16.54  )
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


--chw7rzoep466ms63
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
MIME-Version: 1.0

Hello,

On Thu, Feb 13, 2025 at 12:40:12PM +0300, Aleksandr Shubin wrote:
> Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> controller witch is different from the previous pwm-sun4i.
>=20
> The D1 and T113 are identical in terms of peripherals,
> they differ only in the architecture of the CPU core, and
> even share the majority of their DT. Because of that,
> using the same compatible makes sense.
> The R329 is a different SoC though, and should have
> a different compatible string added, especially as there
> is a difference in the number of channels.
>=20
> D1 and T113s SoCs have one PWM controller with 8 channels.
> R329 SoC has two PWM controllers in both power domains, one of
> them has 9 channels (CPUX one) and the other has 6 (CPUS one).
>=20
> Add a device tree binding for them.
>=20
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

nitpick: Put your S-o-b last.

> +  allwinner,npwms:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of PWM channels configured for this instance
> +    enum: [6, 9]

Maybe mention the default that is assumed if this property isn't
provided? Reading the commit log makes me wonder if the default is 8. If
so I suggest to also allow that value explicitly.

Best regards
Uwe

--chw7rzoep466ms63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmflD4YACgkQj4D7WH0S
/k4zPwf/YgFEiTFLIAzGN93hGhAtrlBkY9Wk7sGF/1me7yiQulyYfZVNVE6VYT+d
ePJ4J6WFE+mBBUN7AUaq2L3TqRbq0Fe5fRURdVxpk+RHdtcMhn5FKUTpUWSfB9eM
v1qDWxVJfZEFhhs5w6pdVeOP3EUjqNxD6oKqTXROCLJQIe4WA/TtPOMK3oJccVCv
nSnAtTGktNW1RdDOZH6iltBKmY01oZJO1AkRjE7sOcWkjDVk6f68cgig337GWs7p
b/2z0uKOyAlDQZFi8TaMA323lLDgPyoKAbNx+xdcLdlCKNMXUADk+3vF5caqPwQL
9InY8wuNgSZh208F1a8d2YBqGxJlhA==
=gz3O
-----END PGP SIGNATURE-----

--chw7rzoep466ms63--

