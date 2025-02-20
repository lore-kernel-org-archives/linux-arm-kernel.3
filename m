Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD79C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeC/y/vh1tkJh+M+/QzTRw0yFeyaFGiu3MMBcm9DXsQ=; b=iajCsnbjIURdIw+F/AZEOLk4IE
	87jywi2CSV+ZpF79MQB2IvUbxVQ3YNDs+WclOsjmR7B1uD6JPX33BWbofcSGkKXtgA6KbRfMHFH89
	Gc6Zn9cTBf4Esmqju1uUOXdxg/an4Vrlb55uTZZG4S5gee5TcQUusgQcCXaLJzV5vISnL4ILbVCTW
	RmwLEiSCMKaeYEX2UbydKM+oy4L1EoQaQkfATlK4Fm1Y7MkiW9bwOP/S9x9EucSpgNJJX98prjU2n
	pS67veD59kmiPWVnMLpnL6xzkAEgq3r5dRG0J8I3jkv5mJwT1BJcJmybXgn5/XeBJG4cpTW87Cjrs
	7QHd+hXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl95a-00000001lRS-0b8Y;
	Thu, 20 Feb 2025 16:07:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl93D-00000001kVM-1Fqd;
	Thu, 20 Feb 2025 16:05:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-439a331d981so9667565e9.3;
        Thu, 20 Feb 2025 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740067521; x=1740672321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeC/y/vh1tkJh+M+/QzTRw0yFeyaFGiu3MMBcm9DXsQ=;
        b=izM7r91f2OAj4j/iNmoYEyIgVSdPb+3l0wCxtwcx/T/vfQ8bHNzm0VUIZNwZ1BIo5Y
         iDurJ/tuxlCor/P1+vaIhelKtvbhnOg+hq2aRt+xvjF3fouVvWM0G8uEP+OniDYyWuxz
         2bFiWSihV5OUdlNrDvZvdjK+RDDjGyu1HjxZ37ZxLZrJh+0E3JItYI9uVjeiEct8HSJL
         fONJvJPLTER3La2+U7HqW6fCkuPlyea/o2P2OXWMxdyocYPdlufQ/58fC8+Ngq9ro7iN
         Fvry6e8idvdoJLSXU/j5XOFKCUtNTt0OObvuGDCccLAFXOwiX72RghW3IrFvNrul/Y6s
         likA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067521; x=1740672321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeC/y/vh1tkJh+M+/QzTRw0yFeyaFGiu3MMBcm9DXsQ=;
        b=PXRomut3cuC0lZGrmFoCDHorj6Laqbovb3ac2L/70U7pQtv/gqMO+R+xaWjYDfgPqW
         XeZD7W3EHfESW4yap0asGOOiK8a6qXcyvRzVhXxSZ9hoAt6p9zKTqmrqTFI8Vhx9yMk+
         gGPhZwxiKm4ADPrLnE/iQPjIZn+ya1tcipafgqsITK9p8KJUuTNRavrofuVFxBteJ3l3
         tqCLh13q2773CTntxl+APAx3iXitNa1NjTirzT5yfneb8N5hlEAVohpdOO4enlOPxKvV
         CYoOZBt3gPUE+4tSa3kXZxp1HlaEDrfhp2nv//Toz151wSV9w710/r0cfa11n/qpRqkt
         YjgA==
X-Forwarded-Encrypted: i=1; AJvYcCUh2Sqo7rB6KJCUH8x1S06Zk6hrdk6DSoreU286BG3V49JOII257xqx04X0yVMUUS3CdbIWJxgC6aKtohy9wu2T@lists.infradead.org, AJvYcCXD/Aecy7G//O0PW3NIErBZw6HTiYuUlxYumFsEYw5Nm35SZuybbHoZqg9I7zZTNKpG+QpRMoemDLNOh8s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhbQ8vdVBZ1mRIrW7AQiULtU6/9SyTLcw4Z4t/skSoqcIMGqDx
	Zz6px1z5PjNCPJ3REk+xynDS0tjHQFmjKaFJdq4bZ3Jpow+qrZrE
X-Gm-Gg: ASbGncsPivdqll7Hzr7vBba66o+MinPZyu4aPQHr/ckYDyMg1+hFLNY3urfGxs/VpiF
	A7Djsvglb4uhQhBbHWc9YO2OQ3uDimekomc+XQ4h4e7V9gyVYxq/5Jgqq7hAy6UwcDmSSPkHlk1
	akT0J18YmMNSS7ibGS6ZMaOF6G/tjaUliTnAQ2WP15mh2cQXTRblSZScHZfdaCqa/AW5ANBG5iR
	fP+Ed41SVrsoPHd8BsvMBCCzgrYigV3naOzfEjPZ8UwQq4pOVazvfOHUB80tijHMSZUlCnFw6MK
	ZRdtdd7e6NEHPRWMIcfbTbfWvP7kkCvCXPcUUV5Cd5ip19HmiAmHKnmwCuLVYDO943w=
X-Google-Smtp-Source: AGHT+IH4UynjVIIpSlbvfcPnRuzuDf6FHbdwZq/2+3kemkCHgCd8NUoqXYSrlF9BQGYXBcqlYeePNg==
X-Received: by 2002:a05:600c:3ba6:b0:439:9828:c434 with SMTP id 5b1f17b1804b1-43999dd0fe3mr80636455e9.20.1740067520987;
        Thu, 20 Feb 2025 08:05:20 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399b430912sm54276465e9.0.2025.02.20.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:05:20 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxim Kiselev <bigunclemax@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 John Watts <contact@jookia.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 John Watts <contact@jookia.org>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add thermal sensor
Date: Thu, 20 Feb 2025 17:05:19 +0100
Message-ID: <4835098.rnE6jSC6OK@jernej-laptop>
In-Reply-To: <20250220-thermal-v1-1-5168ddfc86e8@jookia.org>
References: <20250220-thermal-v1-1-5168ddfc86e8@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_080523_338437_4AA9045E 
X-CRM114-Status: GOOD (  16.90  )
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

Dne =C4=8Detrtek, 20. februar 2025 ob 10:25:10 Srednjeevropski standardni =
=C4=8Das je John Watts napisal(a):
> From: Maxim Kiselev <bigunclemax@gmail.com>
>=20
> This patch adds a thermal sensor controller node for the D1/T113s.
> Also it adds a THS calibration data cell to efuse node.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: John Watts <contact@jookia.org>
> [John Watts: Remove disabled status]

I prefer other patch, which was posted not too long ago since it also has
thermal zones.

Best regards,
Jernej

> ---
> This is a quick fixed version of Maxim Kiselev's patch from here:
>=20
> https://lore.kernel.org/all/20231217210629.131486-4-bigunclemax@gmail.com/
>=20
> It removes the disabled status as requested. I've tested it by adding the=
rmal
> zones to my board and it works from what I can see.
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index e4175adb028da2be539e7aa316206fec4810adfc..cc3f9cc9b8ed20121924cc932=
412a6b6342a2f86 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -166,6 +166,18 @@ gpadc: adc@2009000 {
>  			#io-channel-cells =3D <1>;
>  		};
> =20
> +		ths: thermal-sensor@2009400 {
> +			compatible =3D "allwinner,sun20i-d1-ths";
> +			reg =3D <0x02009400 0x400>;
> +			interrupts =3D <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_THS>;
> +			clock-names =3D "bus";
> +			resets =3D <&ccu RST_BUS_THS>;
> +			nvmem-cells =3D <&ths_calibration>;
> +			nvmem-cell-names =3D "calibration";
> +			#thermal-sensor-cells =3D <0>;
> +		};
> +
>  		dmic: dmic@2031000 {
>  			compatible =3D "allwinner,sun20i-d1-dmic",
>  				     "allwinner,sun50i-h6-dmic";
> @@ -426,6 +438,10 @@ sid: efuse@3006000 {
>  			reg =3D <0x3006000 0x1000>;
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> +
> +			ths_calibration: thermal-sensor-calibration@14 {
> +				reg =3D <0x14 0x4>;
> +			};
>  		};
> =20
>  		crypto: crypto@3040000 {
>=20
> ---
> base-commit: eca631b8fe808748d7585059c4307005ca5c5820
> change-id: 20250220-thermal-803de9da0ce6
>=20
> Best regards,
>=20





