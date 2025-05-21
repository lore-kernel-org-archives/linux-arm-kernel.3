Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5145C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9d59y1AAUBQBeLns7WWUxwr1G+hlDyrZidnmum2/Ds=; b=KFd9rid9A7OytGy+Le+wB+Keda
	k2k9+LVhreGojkmQuyrT3SlJ0XyB1v4dCPc11N4Uq3ouw7PnxZW0LkckkWPtkWhxhV3dtXijJKjJY
	FMbLLRgHgiB2aavm5KfETk3Sh63jnoq9VdE5+HF/AURt3slHib2I4GWJ2gy7reQoZxDFs+05scZXs
	40SlQCSYiqzvYoUdFZvRLIqbeqp2QhwJxryEaC40i66EnI6IqttZbtb75ZcNgTtbIKImjKk2ie7hJ
	rTNbS/JYsJYy1nioBnPEs3YRcPaF4oM6Gyxi6q52O8Z9yBR7N15urUKP8u/ONXELs5w5nG2Jq6YMm
	v6G4xp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhr8-0000000Fexn-2mSQ;
	Wed, 21 May 2025 11:43:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhoe-0000000FeZS-2WqU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 11:40:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-550ea5df252so5540932e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747827654; x=1748432454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9d59y1AAUBQBeLns7WWUxwr1G+hlDyrZidnmum2/Ds=;
        b=c9jp6T6bp4KcOEyTDTA5PeuLoB72EZye6wGEt6LdMrbU1yirp8JY93OWeMUf96ailQ
         J+vssxSnjE4TSBJjbM+1bbrfTWTxlXzhTIYHBatRTpvVo2U/8E/49Q4107Yq+ZoxXNFV
         emr1RgGvBCBo78d6Pm1kVJIMw8fmafQDIKyYgDsl50LMH7M+wUQvRYc9/gSldXoAlB/q
         RrbvkMOqLx88VSdnA2IITwV+niU+hh5DvUJR1Egbocpn34bKcSq1/MvTquez3JSovw7I
         xBJwq6jAQaWBbzs+aIogMdGcj8YoN1aNym+fbrsMgFOHPsWZ2139SimQQOs8p21veO9/
         KuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827654; x=1748432454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9d59y1AAUBQBeLns7WWUxwr1G+hlDyrZidnmum2/Ds=;
        b=cYRkEKRyvEig3JiEy/Iuk+TYdsI63mbtUMvNBVd7m9zg2VwaAt4d/zprYNnRGwnuhw
         gAjLhzFPqjQ99Hk7tnWIjfhbFJNQdkVDS3gpypHDSj91BeT9fAQOKCkJNJQlIgjTnmvA
         7LdGeEnmd3pw6vqW4C1naxCbSTj2gvkTNIGurapOK2sFF984wxPm2KG2YMQWA8XkB+Fw
         rKtyXNvH3bugzHPIlMuMZ0jzCy7MmUqJxF5BiTfDY1P1LQacMCGq+7brbuyLkYrWoinU
         M/qyFoiV3xQearW6h91ZRjVwiin6f6MnWC8U6Hd9rgNjVA2YmlegesHa8vsj4SeiVfz7
         ao2g==
X-Forwarded-Encrypted: i=1; AJvYcCUilMIj0FCbp+4091sLpMyTvQfiPzfRHyishPkD7RgvURlEoPDuaUrTjHlMTPGnml90qvLxIG8zTuv3R+le3sUa@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt9QpTqO/m+kLVe4BtLGC0Co5DEQyOBISaM4YelPO+qHJ4qXwj
	0Scub/6V7nVOSbdSjwusNsGnJIoMplvRj/d/FZ5VSjR4AZpMxIv1qi92HIiptI0/rJ49W+FA/o6
	yQYOsqrk6aqHlw4eO7jru5vURkl7JIPs=
X-Gm-Gg: ASbGncs2T9WwgM760knlAz2XSi5zTVHNZ2QmOsDd0ir3raS2TawYp4w2ZPagIFWsN9v
	Us1N7xnRdAbhHYArl1jgBqdzmRVSg1ONa+VUbzyxOb+M/wvMYro+uaQbKyQ+WifhfVRn5hKRYVV
	zMqPDRuzeJz40nbMgPXWmE6srRDNidyZQetuqZDDBk43LatdcIlQ8vvrIwgHmyLoZccZc5SJHiX
	BI=
X-Google-Smtp-Source: AGHT+IEBT7uTeEaD1M6QcMlftPN+Diu0RdjP2HkZ+bs8PtCVUYHorsV+7TdTYTFNdPAyQT5oPUXJJVDEF5pcsY0RnQI=
X-Received: by 2002:a05:6512:3c85:b0:551:ebc1:bc84 with SMTP id
 2adb3069b0e04-551ebc1bff9mr4320652e87.8.1747827653907; Wed, 21 May 2025
 04:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com> <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 May 2025 08:40:41 -0300
X-Gm-Features: AX0GCFvuahJEGWjKzRmbj_fSU5phUy4za7_-MZjI-5ppsFQyUQtxl9C1m5zGqss
Message-ID: <CAOMZO5D-d7bmBfXKe936W5QjmsukRRX3y0ge+xtizqFx0HPE8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_044056_638792_E946E06E 
X-CRM114-Status: GOOD (  12.79  )
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

Hi Dario,

On Wed, May 21, 2025 at 6:28=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 256 Mbytes SRAM

SRAM or DDR?

>  - LCD-TFT controller

The LCD support is not described in the dts.

> +/ {
> +       model =3D "Amarula i.MX28 rmm";
> +       compatible =3D "amarula,imx28-rmm", "fsl,imx28";
> +
> +       memory@40000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x40000000 0x08000000>;

In the commit log, you say 256 MB, but here we have 128 MB.

> +&i2c0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c0_pins_a>;
> +       status =3D "okay";
> +
> +       polytouch: edt-ft5x06@38 {

Node names should be generic: touchscreen@38

> +
> +&pinctrl {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&hog_pins_a>;
> +
> +       hog_pins_a: hog-0 {
> +               reg =3D <0>;
> +               fsl,pinmux-ids =3D <
> +                       MX28_PAD_LCD_RESET__GPIO_3_30 /* LCD reset */
> +                       MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power *=
/

Proper panel bindings should better describe these pins than hog pins.

Do you plan to add display support?

