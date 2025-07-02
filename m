Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80E2C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGQkzz5zRxRRS2uo+kWwt7fThwG7BuLxpPIngGvvrqc=; b=TVntslvKNJK0cx9ipCwvY+cAfT
	vGpvvcnGqIgTP5+Qn7v6iBPcgEwaiChTpAvxiIGtlDCGcmiOiFCThowknwGHNUFjaAT99z/0NxlWG
	8I17J1qehVZAJIktIbP6RCDqPzySgIYnLhePmHLBQK4GvfuVcEZZNBZIgUd1vfXuCAKE9Q7iHGxtH
	YenXy9sQCMshBvpi4+uoUWe30MQnPO4ItgWOOKBd2JSYl5+n1FNfj4MwCTzkO2AimyWxLmUT17BzK
	uSRK2vqWAIUEnV6P09AplfnjCC2Rs99cQeMte5UwCIETSm4+R7CM3WGUvcmM0WVaoPQ6BQ1aEjdax
	+l4Fy/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzGm-00000008lUj-3VQ1;
	Wed, 02 Jul 2025 15:21:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyKV-00000008c0S-1NJD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 14:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yGQkzz5zRxRRS2uo+kWwt7fThwG7BuLxpPIngGvvrqc=; b=Uo4luXZiCJWmlaUlZbIc/ObXX5
	rYULtzbE5DmTc0+ovylDeNmnEea/3aAI0PNqh7eWRSFtllz4EWBUxvCI2/QzcDF2NnUjqkkXgO6dd
	50QjvVwAJmmTwrU9Qz+O/K5wwb4H8k2ece6yLuUIW2JJ+Q5433SUsSSvWyWNj9XUT6Dbyb3NxSqUM
	hv672vcvYsp5GSM2vUc1VEmVDHKN76ll0ctEJj65t6EGRuJ4Vlnu39jpw7GTsoMMjmR4LgIQpk5CX
	Vy8LTF1T688rpY2Pq1d6hqnbqiI23GYhpdzVBDiaAvxCS5VJBo8euogadiINb8eUrx3AS7tSmfyqt
	KnSUGZ0w==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyKS-00000007Rc6-0xq6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:20:54 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-313910f392dso3492164a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751466047; x=1752070847; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGQkzz5zRxRRS2uo+kWwt7fThwG7BuLxpPIngGvvrqc=;
        b=hCfbKBqHRTuWxmM+8R7qigBVmKoskcYKZHj9sVYYzQavHLMLFpVz2TQ3SrdDfjhCg/
         IkZfGbs5Hl+HqNoubRJzyVn7Vok7DDYO/Ue19U8sqyiBD88bae8I6kSVisrOGV1AEgSv
         ho0BaYHv8COq4FkMG5PDl4vl4uNA8imNQaeKJi/SrzTc6k1Pbhxl44msi0Sv6XG9WFnQ
         pMAEahp2xwOsXmL70MuMEny0GImrboQDsYZomKU7vsUvHrNeK7LC37qzMUs/qRfONB+K
         x1Ksn6MZUO8aleLZS3wsUlE3c/Wcsg/Jw2QMyglf/WHY5EgtMSDRWBKsMyGaSPSSOzY7
         3faA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466047; x=1752070847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGQkzz5zRxRRS2uo+kWwt7fThwG7BuLxpPIngGvvrqc=;
        b=sENkWJwRJ/zq6R8SRMFTnFmbE9fx1bXby+kKlgX9fNncY5eIcD/a77yLpc760O8DKF
         i1SZ+0zFm3+n27C+zKvFFuFvkg0esrr3NUQ4DFqFMr7IpjPg3BAyRAHlwnmO1mHBmUnc
         5r9jqGyQUTzrYMu2AgaTMY4HPKHgGVQ7d8wcopQoqdd0IRCEv1fazfn/4cfk6YS+CQ0V
         jMiPPYJvOIvVMn5G1XOmUofxzGrmBc3iGksjMO8ImOvYfrBum5ikMM1vS3+SdgXBDdyE
         dGeJJ0DI0nDS2Lf5wNiSPnsq8cNWkd4WDusQlF283HhEsBuGFtq4s8toOraCDu3NwbEa
         D3yQ==
X-Gm-Message-State: AOJu0Yz0NFGWqdJtfCLR6HHh1AnDQWWybaOBCxeu5rDr9ftiUTYCZ4aH
	iZhhv2oKD+IXE/E2KNkURnLC50xaQouWlhM+CmB6LxDE9JD1FpQEOj2hQNPjDVyXle1rp6YToTM
	4zL74my1LEtqCJLT9Oos/MwQfHkKHf9zGmg==
X-Gm-Gg: ASbGncvfeeDNfMHXEdtsrbd5SkWZluR9WPXco+hAPagujGugUgDR6ORpmuvdsC4MsSO
	Ob/SQtZGqEXaefkQXEgbdyCkAqSsjkG9xwKjOfT7cLEFh8rE1XbnxIfL/lUGM+WC+O6ncDI23E4
	cXNgyyMKNHTp5k5NCTMDeKK3wE9Dp0Vyd0EsyfIc5rtvKVRCUGF+WlUg==
X-Google-Smtp-Source: AGHT+IHXe/1zFmqCjXQ3C8alvXOHiCKHLQ3bJLFyVQ/G6RNjB0hyZ7QrXCV2jrtHiA4TmMP8JM9c+KanMU9aiN4g/Xk=
X-Received: by 2002:a17:90b:1c12:b0:31a:947d:6ca1 with SMTP id
 98e67ed59e1d1-31a947d71e7mr2657565a91.22.1751466046836; Wed, 02 Jul 2025
 07:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 2 Jul 2025 09:20:35 -0500
X-Gm-Features: Ac12FXzt0gezjSCPgKwgvm9n1EIPWkC5-wwtbhI6dVypdKni0yvTumI1x5nEKA8
Message-ID: <CAHCN7x+2A476SgUP3uWSLovpDU0qxxP=a+sXLbdE0UU6Bv+_YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_152052_381255_981BE7A7 
X-CRM114-Status: GOOD (  15.56  )
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

On Fri, Jun 20, 2025 at 4:34=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>

Shawn and/or Fabio,

Any chance this can get reviewed and possibly applied for the next kernel?

thank you,

adam

> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 21bcd82fd092..8287a7f66ed3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -294,6 +294,8 @@ &usdhc3 {
>         pinctrl-0 =3D <&pinctrl_usdhc3>;
>         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
>         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> +       assigned-clock-rates =3D <400000000>;
>         bus-width =3D <8>;
>         non-removable;
>         status =3D "okay";
> --
> 2.48.1
>

