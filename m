Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB9DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p77ze5zoo7hs8NG8yNFWbOWv/K/k6K+sWR4S5HDBE4=; b=yX9Iybhk2TGCRSEbNimtm9ekG7
	kebG0QWi4z4PdOarbN0CGyET2Y17wIFMEjBXE1Hd4i/5H1qUP11nxPUI6XaIfwSVNabJyrlBK5iM+
	+TWJZCbi49lDZ8svX1f7wr9/nKNNk++D6u01jNcaWlkXw+mRKCPa68N1qQkmsNJtqP18iDtMqoL7h
	vo7jEf0jeYWsqV6NlzIS3dkLrWp1qT4f4ipzwyJiPE3kLaH9atGIqg185SCfFo6AgUzL1rJCrRD2p
	80mDE/ZrHqnR34tE6s5wHQm1IKK6/MR/+3uW5gHWC6R7JAdXViANxPDWhiM18urjqtZgD1JLLBDxJ
	mkOLtiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29Z-00000009XhH-07XK;
	Mon, 19 May 2025 15:11:45 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1WU-00000009S5I-2Uc1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:31:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43B2A43A59;
	Mon, 19 May 2025 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747665074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7p77ze5zoo7hs8NG8yNFWbOWv/K/k6K+sWR4S5HDBE4=;
	b=AyjLQwJWGcKUmZ6VaNk5ITKrFlhDRR+c8R3gN9SFpsJd1QrDAjYpDS6DisqQrWl8tZaD2G
	HOjNhJu89qWQtct5Och1x9MJjr9G3QicjuSGVzX3icRZNC74Q5tHQ9y/kNHHYDvG3qYvEt
	x9t2lBlrwavkxkTuFtVsmgjjvf19KXEox53TddBZK2Teunada8WIESJhokZf2JfO8Z91cs
	8/BJuJDURo3fAJbtA5daLcEhduOUNeBmG6SYUWtXWHq4jpXyBCvczcXIilzSAXS6/R2TUW
	7fbxS/B2r4ojjoOwyRlp1pT3weMN1IEEq7xTgUlfirUikKer6qLZTAbbbzU4pA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: marvell: kirkwood: use recent scl/sda
 gpio bindings
In-Reply-To: <20250519112107.2980-3-wsa+renesas@sang-engineering.com>
References: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
 <20250519112107.2980-3-wsa+renesas@sang-engineering.com>
Date: Mon, 19 May 2025 16:31:13 +0200
Message-ID: <87h61gpt8u.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudeksggtmegtvggrleemudhftgdvmeejvgehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudeksggtmegtvggrleemudhftgdvmeejvgehuddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrr
 gguvggrugdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_073122_764285_3AE3792E 
X-CRM114-Status: GOOD (  11.42  )
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

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> We have dedictaded bindings for scl/sda nowadays. Switch away from the
> deprecated plain 'gpios' property.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi b/arch/arm=
/boot/dts/marvell/kirkwood-km_common.dtsi
> index 52baffe45f12..259cb3d5f16d 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood-km_common.dtsi
> @@ -27,8 +27,8 @@ serial@12000 {
>=20=20
>  	i2c {
>  		compatible =3D "i2c-gpio";
> -		gpios =3D < &gpio0 8 GPIO_ACTIVE_HIGH		/* sda */
> -			  &gpio0 9 GPIO_ACTIVE_HIGH>;		/* scl */
> +		sda-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> +		scl-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
>  		i2c-gpio,delay-us =3D <2>;	/* ~100 kHz */
>  	};
>  };
> --=20
> 2.47.2
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

