Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3528C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BplyvVDozmPKMflokHePn2tVjQH8dGQbXJDI5IAAd7M=; b=P0XNkDb8zwZ47HN3gzGPgoJQuR
	neEISrj6jpXkHPS/8lqTH3Jb9AUOOzjQkX5QU0aa41mbkz26npDzL3NyPULMBiKu4DG3k318KYyza
	z8+dNzyaG92vRlY5o4i1bgDtm77rB20W1K+/fsd/SRH4ez03JYr+xaQUnEYln2tF/WzMwOnfEib0L
	2CrGZiQSvxaL73DbZ8+1UZRcKYMxQ8pFzVc0JlxDxmWzQig4hD3kPA2+UwobHA3RHCmIlIzoLyMMZ
	maKcXBRDwmel9NTxWY/y/AC7ddhDl+bpNf5zZhVsdh73CnlI+niJvLZD3c0kxi3O0v2wF/DaGjy1u
	CVD+db1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqavG-0000000ExyM-305v;
	Fri, 07 Mar 2025 16:51:42 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqatc-0000000ExZz-2tUO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:50:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A31744326;
	Fri,  7 Mar 2025 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741366196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BplyvVDozmPKMflokHePn2tVjQH8dGQbXJDI5IAAd7M=;
	b=mi68TnuaVw8Kt0xQOuiK29+qCxeKmfezbkHt/2Ynt1WpV5oaPbJ5YP82QQZr524HHcGhOl
	bj7Q2qUHj8Wlc26xQwE7YarfG5h15cWTYJydyrik8m0OAHYVhrl9q6paB06Kzao9N2IVeJ
	ncibjlYXfyFoWDb13pCnuOPFSGpiVisHgxqMQ91nFqFQv9E6vTX2Csgk4a9ZPbt/D1GoD4
	Ecb2a0zmjyVWw6thbtxrRUe1a2lbk54nffUXmpRmze50Z4E+Np35q0f6VNbPaRsWCv39oZ
	bqrcD6ZCIl7o3qZdAFmma4oWM18q9lyd16njXdeZDMniuS8Nv0xbfrERMwQi0g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: ***SPAM*** [PATCH 1/2] arm64: dts: marvell: armada-8040: Align
 GPIO hog name with bindings
In-Reply-To: <20250115211727.194142-1-krzysztof.kozlowski@linaro.org>
References: <20250115211727.194142-1-krzysztof.kozlowski@linaro.org>
Date: Fri, 07 Mar 2025 17:49:55 +0100
Message-ID: <87v7sk23bg.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemledtrggumedvvggutdemlegstgdtmeeivdgstdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemledtrggumedvvggutdemlegstgdtmeeivdgstddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehsvggsrghsthhir
 ghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_085001_167862_FB67190E 
X-CRM114-Status: GOOD (  11.55  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warning:
>
>   armada-8040-clearfog-gt-8k.dtb: sata_reset: $nodename:0: 'sata_reset' d=
oes not match '^.+-hog(-[0-9]+)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  .../arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b=
/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> index 225a54ab688d..90ae93274a16 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> @@ -371,25 +371,25 @@ &cp0_pcie0 {
>  };
>=20=20
>  &cp0_gpio2 {
> -	sata_reset {
> +	sata-reset-hog {
>  		gpio-hog;
>  		gpios =3D <1 GPIO_ACTIVE_HIGH>;
>  		output-high;
>  	};
>=20=20
> -	lte_reset {
> +	lte-reset-hog {
>  		gpio-hog;
>  		gpios =3D <2 GPIO_ACTIVE_LOW>;
>  		output-low;
>  	};
>=20=20
> -	wlan_disable {
> +	wlan_disable-hog {
>  		gpio-hog;
>  		gpios =3D <19 GPIO_ACTIVE_LOW>;
>  		output-low;
>  	};
>=20=20
> -	lte_disable {
> +	lte-disable-hog {
>  		gpio-hog;
>  		gpios =3D <21 GPIO_ACTIVE_LOW>;
>  		output-low;
> --=20
> 2.43.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

