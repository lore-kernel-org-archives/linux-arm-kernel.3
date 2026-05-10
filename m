Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577BECD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWmgbjG7zGF24sa5WwQmGg6RVdKBUDJnnneFdOm7tsU=; b=Gs0foxc7g0I2d7QlFkpSpJqVyQ
	ExDoawSTIHbKcTPTPKzjarhWgZ42rJDty0GTVLP8j0ktpzOPpUUTACi4V1LBuQfOL/tC4qkR1Dohx
	m7gAl2Dr/vN18F0I7y+KRacwqaRvBpzKuuZN6AgidL0Twdxb3zYTH4V4fV4c6o00sDP8Ldil+Z2cm
	cEM93zXTPD8r8RVOQeTKC2f4cZPpqrIKkRbRJQEdRPdDDDZ85rgm1E5xD0CtyNvPbdi03vDFaSIFO
	foahViTVqnUKZ/N92svHPkd+uWDGJcfz4h3u0g0rglT4XpMas/XG7/B4Bw4J3RV4ezKOVR2TQmHeL
	tbo1eJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5JU-0000000AxKX-02Hv;
	Sun, 10 May 2026 14:39:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5JR-0000000AxK2-1qNv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 14:39:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891b0786beso22922505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778423959; x=1779028759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWmgbjG7zGF24sa5WwQmGg6RVdKBUDJnnneFdOm7tsU=;
        b=OVNz15Z5XdGC1FhKiOYiiV1YPD4qwdbCBzDQtmOvbP7MN3Sl9sN9Bv+AkMNRH6/wJ4
         4Au652rMX8wUcFRuJuH3vVdecPlJPJnFWxxLgJ6yhLEgZInpccFYiUqqfh5wKBbCkO8v
         QIrsx3pCPf44dvSPBYWBGjRb4WLY0KNfAfA4UkZgnCTWVfiYC8x0qZWKDk+DekKp71qI
         oxGNxSRaYf8FRKpswRBzCNtRmfD7BwBJ7WXt86/qeA8ZeC27kI6DA3/WE6Z2kGj7EHGU
         nMiQhfCW/Yv752z6fH7Lu7Rydg3okqtqFRK/m29oHIcwAPGFFRgLioVj1T8oHic62fmt
         sY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778423959; x=1779028759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SWmgbjG7zGF24sa5WwQmGg6RVdKBUDJnnneFdOm7tsU=;
        b=AJ1wus4p5P0der1RZlmhHJL8RINsLLNk1g1O3s5o45JThoZgOzCZKCGW/ZEc69tDx0
         zL+Um5evwuWkS2hL8u7I3jhHxWV4uZWVmpz4rwub5DrK0I7ryfYxkaZST6BSzkYmCVJz
         49pjW16vK9Rt4Exf3Q4BGFQn91mr8wZfviXWC6bhBrPVHiCm62WEYl5jnsapcBRX7iAf
         9ZBKnTZ3BeDCTj+lFz0d/cYSuSVTJeJP9EaZ8lvFUS32hKhtjLEc6iDfRN0mG6H7uqcb
         seyL9Vg0nLlMIxcekO6z0sWXG2hZRATt9gp+LykACiovWkjc4e7fKkuoQedY54aKseaq
         kMEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wss9uusF2lYy7aXHJAdJYAJrmb/JDJUn7ThS6t334a45Rg5DiPKkTWfWypMmab7Lq86tBLRPk1jDhEbO9HIG0@lists.infradead.org
X-Gm-Message-State: AOJu0YyAiSTbH4KwqK06Ya9x3Q6LK6jJa9kZkPQSwCdbhWLTFogXRkzW
	/uh3q6fRAiqrgU4kjM65sN2COCnfFnUC81Wo9ed+BfXaoagLswhef1l+
X-Gm-Gg: Acq92OFfPMgI3jTmAJNHhsI2vL8lhmeayora374u2UZdJXKOUCxAENtr3vzSoaKHPOO
	sfQRVtfTn4EVmU45nU0RFpWiM5QTHboFWWIaMLA4D3ZffDEcaioGsF23LgI2qukdCdnV4jns/3+
	krADzlwRrkEwr71pZy4Y2TeTzEDNA4gCiRMJmd1LEiL7k/l8qDkAs4/N8qI57YtTt1CvvLNSkxS
	EBJunuq4M/92aGiUtuq0YCdfDftM2crDniOYWud8x/27FD1tjHOz0ZRCH06YJ+b0be7Qotjbvws
	sOzLN2u8pIdtFoUllzjPe9k1AoFPgm8JxyRwuENWcigXeJxuMXIM4YO+GrYptUnT3ynXJmIrQcH
	IVoxmshHjghZBME6gerGsH47Il66Q9/BxuhNDstlfDAeyKLQqc5lTUqnY056rWx17miiXwYhAOb
	PE5akoCwK1S0/MC2hPSJtUWW1WuV5YgZvQzd8tjoZ6E9JIDClS50d8ERAHjDukptk97DHMg/i4c
	7p7TG1rtHkQo7iIQw==
X-Received: by 2002:a05:600c:696:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-48e51e215a4mr187215675e9.10.1778423959237;
        Sun, 10 May 2026 07:39:19 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6c79fsm20097047f8f.15.2026.05.10.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 07:39:18 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a523: add gpadc node
Date: Sun, 10 May 2026 16:39:17 +0200
Message-ID: <U0YLqOw4SGiAdV7UGlJ3wQ@gmail.com>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
 <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_073921_523188_102D1E64 
X-CRM114-Status: GOOD (  12.98  )
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

Dne nedelja, 10. maj 2026 ob 14:57:24 Srednjeevropski poletni =C4=8Das je M=
ichal Piekos napisal(a):
> Describe high speed timer block on Allwinner D1S-T113.

Above line doesn't make much sense.

Best regards,
Jernej

>=20
> Tested on Radxa Cubie A5E:
> - 2 connected channels are showing voltages in agreement with
>   schematics.
>         BOOT-SEL-ADC ~500mV
>         BOM-ADC ~1800mV
> - 3rd channel exposed on 40pin header is showing correct voltages when
>   connected to known voltage source.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 5afa8d92acbf..f6c5cae5b23a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -340,6 +340,18 @@ ledc: led-controller@2008000 {
>  			status =3D "disabled";
>  		};
> =20
> +		gpadc: adc@2009000 {
> +			compatible =3D "allwinner,sun55i-a523-gpadc",
> +				     "allwinner,sun20i-d1-gpadc";
> +			reg =3D <0x2009000 0x400>;
> +			clocks =3D <&ccu CLK_BUS_GPADC0>, <&ccu CLK_GPADC0>;
> +			clock-names =3D "bus", "mod";
> +			resets =3D <&ccu RST_BUS_GPADC0>;
> +			interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +			#io-channel-cells =3D <1>;
> +		};
> +
>  		wdt: watchdog@2050000 {
>  			compatible =3D "allwinner,sun55i-a523-wdt";
>  			reg =3D <0x2050000 0x20>;
>=20
>=20





