Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA82CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XU1KJEIpJD7sz0WHWX8jsl8435fYv6zL2ltBSoQIW8=; b=CB5++YhPi5WivnmT+tD6y4W2Qz
	JKcjtkGr3+tRdBiOAKgoUNXCujuBntrVvk7s7x51ss7mB9nTDCBwSieMoxt3SSUvegxZeUvahME3U
	rzvo6YWkwTyF+MaUwAYp4952AxJnJZHQiiwAh2qOD/PKNr0Q4IFyrbcZPcqA7X/+IGj/g9zmBNvE4
	P/PrjL+ErdInO/srxZkx5NX7/TmnnDbM1Ymofl7lDNFb09Ha2tWmvFOM3v0QXs+fZu3a/xGqlyfoI
	98rDTisLvFQ4boBONx+d3VeJsuYAfh7rQG8eOD6SaAsKh4WMHrYY58XXC4Q+IBI9+F+du0AhG5jPS
	9ftm2i6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPafI-00000003hIn-0I2s;
	Wed, 20 May 2026 06:44:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPafG-00000003hIc-3vEe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 06:44:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EF7F60129;
	Wed, 20 May 2026 06:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916611F000E9;
	Wed, 20 May 2026 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779259461;
	bh=/XU1KJEIpJD7sz0WHWX8jsl8435fYv6zL2ltBSoQIW8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ozmZTUjWFWt99kP2+KjNWiH2zgJafxakMIw0IOcmg0FpvHTYgdWwZBFXAzcsO1WEE
	 TrSHQPczsIthEY3Y6kHOE4CCdxZYBN5ZiOxSea6/ZwBMd7QNzeC7TKEubbeQaV2pLi
	 c5ACGh3MezgaB3SWK6u7t8gUTgWrfy69xEf7YS8wS8JYWeAWLHDQwI3MOaxLLISP/P
	 ul/Okbif8ZmTaPe4bS/1bUdSOy0TLIvXvph5ud9Ognn45A67P5sPqWQK4gbSaMsfVE
	 QXjwjVvg+eQridave7D+WMhO+Eo6JAxBlhs546GQH2N1dMGsG7zclnUofNXFjCLyKn
	 ELIufQJ/y9veg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id B46D6F40084;
	Wed, 20 May 2026 02:44:20 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Wed, 20 May 2026 02:44:20 -0400
X-ME-Sender: <xms:RFgNamKwEMr56_MZsB0rJLrqLo9mTMHz7oUajwELiRJhDD2W-JFgDA>
    <xme:RFgNao_5eXkQ-RB4L579oFItpKUyRhpxBjd6mx_eKds2yPYAVckbtPjZRBaSDHKfi
    cJYo7QzRRv-A_jQ6mQSsgxY0OyWuBMI50rZbHXbqjpTun02tK4QuFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeefleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeefhefgtefgkefhgfdvffdukeejheeuvedthfdtiefhleejhfefjeffieeu
    jeefteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovg
    hnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgs
    vghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvh
    gvmhhlohhfthdrnhgvthdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghp
    rghnrgdrohhrghdrrghupdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinh
    hugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrh
    gvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihn
    vggrsehtuhigohhnrdguvghvpdhrtghpthhtoheplhhinhhugidqtghrhihpthhosehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:RFgNanvJG5sya091gFvdSd_PKlx3lHUJvyL3znodAG7glX0fYIVQ8A>
    <xmx:RFgNakUeImDMwdrinZ2SrqXFu9XhcHw5f6r7WE7XlEM0ADZ-udLfDQ>
    <xmx:RFgNanz8HyOcRulfnmChXHaMK8dw6NXyqZSMf4Z-xsTY7JLJmtyt1Q>
    <xmx:RFgNarFT97jvAlkyHQee9xD2iuGOBJk-ldnLQ_Cz9G_m7LUrS3FVRQ>
    <xmx:RFgNasvh_GPgvwexsFeXBe4i90XykWYnaGW7bZtxw7iIIMJn1yMeCrdh>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8FE65182007E; Wed, 20 May 2026 02:44:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 20 May 2026 08:43:59 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
 "Thorsten Blum" <thorsten.blum@linux.dev>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <fa73cb3b-df9a-4070-b525-29c640f81230@app.fastmail.com>
In-Reply-To: <20260519141033.1586036-2-u.kleine-koenig@baylibre.com>
References: <20260519141033.1586036-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] crypto: Use named initializers for struct i2c_device_id
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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


On Tue, 19 May 2026, at 16:10, Uwe Kleine-K=C3=B6nig (The Capable Hub) w=
rote:
> While being less compact, using named initializers allows to more easi=
ly
> see which members of the structs are assigned which value without havi=
ng
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>
> This patch doesn't modify the compiled arrays, only their representati=
on
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koeni=
g@baylibre.com>
> ---
> Hello,
>
> this patch is part of a bigger quest to use named initializers for
> mainly struct i2c_device_id::driver_data to be able to modify
> i2c_device_id. See e.g.
> https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@ba=
ylibre.com/
> for the details.
>
> This patch here isn't critical for this quest, as no driver makes use =
of
> .driver_data, so apart from the better readability this is only about
> consistency with other subsystems.
>
> Best regards
> Uwe
>
>  drivers/crypto/atmel-ecc.c     | 2 +-
>  drivers/crypto/atmel-sha204a.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> index 9c380351d2f9..56350454ac29 100644
> --- a/drivers/crypto/atmel-ecc.c
> +++ b/drivers/crypto/atmel-ecc.c
> @@ -380,7 +380,7 @@ MODULE_DEVICE_TABLE(of, atmel_ecc_dt_ids);
>  #endif
>=20
>  static const struct i2c_device_id atmel_ecc_id[] =3D {
> -	{ "atecc508a" },
> +	{ .name =3D "atecc508a" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, atmel_ecc_id);
> diff --git a/drivers/crypto/atmel-sha204a.c=20
> b/drivers/crypto/atmel-sha204a.c
> index dbb39ed0cea1..0fcb4692494f 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -210,8 +210,8 @@ static const struct of_device_id=20
> atmel_sha204a_dt_ids[] __maybe_unused =3D {
>  MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);
>=20
>  static const struct i2c_device_id atmel_sha204a_id[] =3D {
> -	{ "atsha204" },
> -	{ "atsha204a" },
> +	{ .name =3D "atsha204" },
> +	{ .name =3D "atsha204a" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, atmel_sha204a_id);
>
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> --=20
> 2.47.3

