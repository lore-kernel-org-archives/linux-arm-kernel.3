Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446B7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er5swXWpkzKiG2YOJuYh+0MhuxsAcETMofMo3e4cVbc=; b=SLYzrFV2dIGUJJj5VfIpkN3yn9
	QYIQN1QY6czIj77Y+zwy/cAS1/1QQ0D43fLTe4/kgskSK7gry2T0xFtK3ET/lrlR3rEm2jV1R8rY8
	62O8A/dQvQCf6ooHNvTNqxJBw4a8YG9QsG3dIMpNWMyYBxXQEr/r+hs1dPwlnA4PRTocCE6SWjt7h
	+6m1T52BT68P7yFO3c3bu+dx/1+AOFw4fapEuhLpD5A3rOj454femZLFhZB/FyITzFPvkhakm09Df
	Q2YoEHAUt7LGoZHajspQSsgYNdTO1WWen4dUqee33cC1lcTi8WxOvzSKhJo/xkgFptwUYBaMajKWp
	ujryLgow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqawr-0000000EyHq-1eML;
	Fri, 07 Mar 2025 16:53:21 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqatl-0000000ExdA-2OOX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:50:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF12C20457;
	Fri,  7 Mar 2025 16:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741366207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=er5swXWpkzKiG2YOJuYh+0MhuxsAcETMofMo3e4cVbc=;
	b=dSwAmMPX0XxGWc1amRFX5TEIMwxJBnC+Zlvg7U17tdj1DhqUqHw1uVmcHajy0fKle53yxk
	JEtSK5sYffqXMsd17h04cOr182u508EAApybN30hr6zInkYSqeJq4yj1CoKByEBfRM5EIg
	3dQSo6tVeKc/6IbgL1eAw721D11B2L/uUsgTvofB34pMzqQCb9qTk7CWUV+KUbSkuE9VaV
	YCUT5yFhMg8mQujISMgZj8fPCDfjQPNZNnVocreg7qqQP63efWF52iA8g5yCoGTfdwLgQN
	hwzPs8tdkMDxBRdP4CSBxtD8AFp+JIbMgSl6YeEnzCuUEcHFSr13SkNQtQp1dA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: marvell: kirkwood-openrd: Align GPIO hog
 name with bindings
In-Reply-To: <20250115211727.194142-2-krzysztof.kozlowski@linaro.org>
References: <20250115211727.194142-1-krzysztof.kozlowski@linaro.org>
 <20250115211727.194142-2-krzysztof.kozlowski@linaro.org>
Date: Fri, 07 Mar 2025 17:50:06 +0100
Message-ID: <87seno23b5.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemledtrggumedvvggutdemlegstgdtmeeivdgstdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemledtrggumedvvggutdemlegstgdtmeeivdgstddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehsvggsrghsthhir
 ghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_085009_739939_125981AA 
X-CRM114-Status: GOOD (  11.86  )
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
>   kirkwood-openrd-ultimate.dtb: p28: $nodename:0: 'p28' does not match '^=
.+-hog(-[0-9]+)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi b/arch/arm/bo=
ot/dts/marvell/kirkwood-openrd.dtsi
> index 47f03c69c55a..9d7cff4feada 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi
> +++ b/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi
> @@ -53,7 +53,7 @@ mvsdio@90000 {
>  			cd-gpios =3D <&gpio0 29 9>;
>  		};
>  		gpio@10100 {
> -			p28 {
> +			p28-hog {
>  				gpio-hog;
>  				gpios =3D <28 GPIO_ACTIVE_HIGH>;
>  				/*
> @@ -71,7 +71,7 @@ p28 {
>  			};
>  		};
>  		gpio@10140 {
> -			p2 {
> +			p2-hog {
>  				gpio-hog;
>  				gpios =3D <2 GPIO_ACTIVE_HIGH>;
>  				/*
> --=20
> 2.43.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

