Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3202CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wHdicrLTHaXzXB7dJnKcgscr1vx1F9p95EeRolG7Cg=; b=E9CnQWqyzMDLEMHbPk86L0Hwfn
	fA0qU7qWHiZjHkqirGF/UYs8cNSmAax0/joY2Xjq4d3e+jlqzqTxG9Jp+4pgB2UEuZuRMh8JrsuoS
	C15YznaM1NOifpLQm+ZjuP5IsfNvSDiABn7xHGJJ7YK24hVKvMRPeb9ykduY4PXncywAoDs7iiK2O
	seN46CyQ9gcDjhFyFHxYlFo1EIiauN9/zfnOPMHcxVKiLXS9Oxm5+T8hZS2n/6tJ5WOMEXkBy1hNJ
	PHeAt99NwJU9Z/WxZIfdlvjXQiqdSBD2nZuYWmsDI4fXb73V39e5wj9XD2oW4q7ecL/UM10mJvLRZ
	x8kIyo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbh1-00000003r3E-3kAY;
	Wed, 20 May 2026 07:50:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbgz-00000003r2T-0JwM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:50:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D8904058A;
	Wed, 20 May 2026 07:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9859D1F00894;
	Wed, 20 May 2026 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263412;
	bh=0wHdicrLTHaXzXB7dJnKcgscr1vx1F9p95EeRolG7Cg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=SD/qTkLNCYuv77dgJY3q9IM14jxb9e3Iaatubww+KyIOt9IlgKBIY5cCzB3Y6B9me
	 FywLHY2w6vv5+/rqYtfMzCIJ7HWzma4LmWS6ejIDs4KoUuXyps6Lti/Dl5pLtxVCuz
	 1cDf5RqANIb36Tfl6PkeKT5IkSSbeNzTuCi7Ggp4LANY2ZScRD9FDiiXoqPPBr8tYa
	 3bNUawpVFSx2Ls7a8LqGn5o7Y34CodDordu3cHUpBuvFaGve6GWWri5S5FokalHcft
	 kSgUvtY/jGcrWWppRJurNCTB7QC6rPIhi54tK2ZK2H91kR8RtO75PJhcW6KmsGPx/1
	 K6A0ZkB2Eo1Ww==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BB917F4007D;
	Wed, 20 May 2026 03:50:10 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Wed, 20 May 2026 03:50:10 -0400
X-ME-Sender: <xms:smcNavQNe2--VjfUN2vuBVVVgiI0FtcfUdCuQiIt_MG83s8a-pWkHw>
    <xme:smcNarn8bFbQPr5pLS_HYAnQc-4D9eFBjIixf3yXk4G4bADEiH5guE7l2YDTB9Wx2
    668Foq1F32JybHBy2-F8IfO-nQuNyXX8t4p24wCfFukmD_L5y3xk_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeegtdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeeuteeiudeigeekjedvheduieehteetgfdtuefghfejgffhfedtleehvdeh
    fffhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtg
    hpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdp
    rhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohephh
    gvrhgsvghrthesghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopeht
    hhhorhhsthgvnhdrsghluhhmsehlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtph
    htthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthho
    pehlihhnuhigqdgtrhihphhtohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:smcNak2pQPrEVN5UcZA-Z_UJJNQY0B9L71JZGJbebdusFflrrr8KHA>
    <xmx:smcNaq8WhHVi_LE49pI4ecjl43vluF31mM49gXKFquxHTAYLXPGKUg>
    <xmx:smcNap79vTB5eD8qo3e4vQmI0m7GtrY1gdjC09ZQTyOwI578AnAwVA>
    <xmx:smcNaitbmgGe_KqzQsX8Ed8vDs7RroYooRdQ9yJrxRIlYs24SmKmzA>
    <xmx:smcNar2slnqsas7tKC4yDLoEbZzqwCa90tZD4a3Df7SMfHG2uOUQ5T0P>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9683F182007A; Wed, 20 May 2026 03:50:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 20 May 2026 09:49:49 +0200
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
Message-Id: <46130020-eaa5-44ad-9c6d-62ccb30c19d9@app.fastmail.com>
In-Reply-To: <d0fc3069860f9e31122c1af635a1114dd2c443cf.1779260113.git.u.kleine-koenig@baylibre.com>
References: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
 <d0fc3069860f9e31122c1af635a1114dd2c443cf.1779260113.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 1/3] crypto: atmel-sha204a - Drop of_device_id data
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_005013_154581_362A93F4 
X-CRM114-Status: GOOD (  17.98  )
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


On Wed, 20 May 2026, at 09:01, Uwe Kleine-K=C3=B6nig (The Capable Hub) w=
rote:
> The driver binds to i2c devices only and thus in the absence of an
> assignment for .data in the of_device_id array i2c_get_match_data()
> falls back to .driver_data from the i2c_device_id array. So only provi=
de
> &atsha204_quality once to reduce duplication.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koeni=
g@baylibre.com>
> ---
>  drivers/crypto/atmel-sha204a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha=
204a.c
> index 6e6ac4770416..f17e1f6af1a3 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -208,8 +208,8 @@ static void atmel_sha204a_remove(struct i2c_client=
 *client)
>  }
>=20
>  static const struct of_device_id atmel_sha204a_dt_ids[] =3D {
> -	{ .compatible =3D "atmel,atsha204", .data =3D &atsha204_quality },
> -	{ .compatible =3D "atmel,atsha204a", },
> +	{ .compatible =3D "atmel,atsha204" },
> +	{ .compatible =3D "atmel,atsha204a" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);

Just trying to figure out how this is supposed to work:

i2c_get_match_data()
  data =3D device_get_match_data(&client->dev);
  ... returns NULL ...
  if (!data) {
    match =3D i2c_match_id(driver->id_table, client);
    ... compares client->name with { "atsha204", "atsha204a" }

So we will be relying on client->name having been set to either=20
"atsha204" or "atsha204a" on the DT probe path before
i2c_match_data() is called, but I am struggling to see where
that might happen.






