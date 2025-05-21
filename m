Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E6DC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 11:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvXnpzfFDmYTCvRMWCiccKER6AnXrDuq79CLzj26e9w=; b=JJQWOuyzKcBoHcd7rdQzAz89Er
	v7hh+Tl2sGQLdfpSB8PclPMN2f8/xoJ+AuqclyYox8XyLce4eDbEAC7kRTQ4XPPtR+6LNEW/uDTDb
	kkTY2QSXUNlYANOi6aFRDtIIETj3agWRPTMtzRil+pa38tmeDRI84NYdbyR5vd8XM6BHLP4GAu7uE
	2fk3H3UgiXRi2+Rtug/nQ1WPJAlJnSgahblZ34pGK6gpgRU3wbCtqzPEkpqkIgXPy6sjHDBTIEBXw
	ggPItCIJepz5g6gaJaawmaMtEcs9g2LBtOvuA1LgB5Zrgvbh4RKo86mWPJEit8TctBrV8imWWL3mz
	p/PKpBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhxC-0000000Fg5f-0oBh;
	Wed, 21 May 2025 11:49:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHhqr-0000000FevP-3m7M;
	Wed, 21 May 2025 11:43:15 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6015f8d4b7dso2722917a12.1;
        Wed, 21 May 2025 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747827792; x=1748432592; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qvXnpzfFDmYTCvRMWCiccKER6AnXrDuq79CLzj26e9w=;
        b=AEhIG03UP7Th0szzn/Kqzpsq699JlDXkQinHSmTuEK4nfXWkDAChRngqmmI8qopJmz
         z00c86VqaZrgUipUlAJIw9iGqpa8wvqr2dHVN8ESW/3GBSSy7t3tSUlPc0CAyb1E/WLc
         4BLr3Md5Ea7KTyqVS0FYBxw22WZTE322Lmt5/+azKo/pF7nqFsK+nMibdyqolnU8dYTW
         UM5BJevSOuy0Kzxb6yibFSy9pYKFiqyGE8rqppHGlqgKm1KNLagiipZRu+x8dxgJKv8n
         qhw2km47Bx9KtdeINVdEkDWCGJctM1rLYWjRs6khst1lTtyMNrhcSfizK8GCdpef6zrC
         Hw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827792; x=1748432592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvXnpzfFDmYTCvRMWCiccKER6AnXrDuq79CLzj26e9w=;
        b=pyu9PLLtkTSx4s7DkbDd3/qd63ARGmsyX+RI8Voo4Nc3E0rBLBzhc2daWEacNkMs5e
         ok2CTphsNCCWwLTKgEZ4qXwU7OXGIQTaY0wAFn/3N3WeFJAo+3ecaPNnrpQA0GpN5v9e
         Z72/kgpRbLyD/ff8iZ0Rb4ILYaHOhRNQctPJeXyW4oac7PuNiZd2TQEzBvoXBL7N36Tu
         O6ESUnSJC5xTnu8HmhD9Io2EeqAPGhuXe1uJPGEEXuAs++P3AkqRmpCOdqb9571TnqS8
         r7h/iAwbGsPmRa6zDhUO4nOSecT1Ui85j/07Vzu76YwmsPPBdD4+3a/DV+8lV4r+nU88
         g2mw==
X-Forwarded-Encrypted: i=1; AJvYcCUvwGmdxg4FYJSwwuQBgb0GDke4QJKzKLhXi7E2dQOrjqfWfMs3I0nkSGNsXtu43/JWj4l0p1myMGQmZ+PrT3nBUg==@lists.infradead.org, AJvYcCW7HYyT1VzwF2xddNV38JK9ezgPPPM1vJUbmILBwiDhEyRZC5vgLclPQb8L8NpEYyyDgeWNBEPkz8Tdoi1l@lists.infradead.org
X-Gm-Message-State: AOJu0YwWoe44FK/sWLQ/LlyY7jXTFn7WvidBbLiCNpNQHqnQ0d8Oe2O0
	nOB7pdBWuH7ZATp+bNC5q4d9OqeDfdOpgFtSEZxhfRFEnFwyNMPtWWTuuFqCPUVHNOJf75COIM0
	/NqnPGr1kGpozusAOyuNpQ9sbyn2jYZ4=
X-Gm-Gg: ASbGncuPydo/1w3ww3KvrhBmqrNidqcS6YQZHK0lpPTgnujz2YOpWCdn1ZrVoKU8387
	QSPHNRMFGgvnm1C2CMYcyBT5u6EqJKO0NFGdRm1KHqoe0PCfnZz2n0keEVkxWgZWjQ69IazrUmm
	w1eSBlXk4LqVEQslycmhE0GGi0Lr3KvLI=
X-Google-Smtp-Source: AGHT+IFDzNtI/CaK3q6Z0HD2sju7OyWLGycbvanWFVrufRUMz+SMpJuYify2HixyuAXGL6NwA/JUeCrr/7SUp+Trlwg=
X-Received: by 2002:a17:907:9344:b0:ad5:23e3:48b6 with SMTP id
 a640c23a62f3a-ad52d5ba623mr1989900566b.45.1747827791526; Wed, 21 May 2025
 04:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250521074535.16488-1-linux.amoon@gmail.com>
In-Reply-To: <20250521074535.16488-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 21 May 2025 17:12:54 +0530
X-Gm-Features: AX0GCFuRNEz_g2JELBFe7G_6vR4egqHEh4dmZX-9WFiiMW0PYC4vW84aMd81Mo8
Message-ID: <CANAwSgTk3R6SMqsNcT7c2AVzQRAdk8Z2Rs0bK3VCsgivR6nLmA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Update USB hub power and reset properties
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Cc: Wayne Schroeder <raz@chewies.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_044313_941712_A6C54388 
X-CRM114-Status: GOOD (  20.57  )
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

Hi Neil,

On Wed, 21 May 2025 at 13:15, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add missing reset-gpios property to the USB 2.0 hub node to
> ensure proper reset handling. Also update the vdd-supply for
> both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> for consistent power management. Remove usb2_phy1 phy-supply
> since now it's managed by the hub reset control.
>
> Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: remove usb2_phy1 phy-supply since now it's managed by
> the hub reset control.
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 3bca8023638d..d46b6aaef8fa 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -42,7 +42,8 @@ hub_2_0: hub@1 {
>                         compatible = "usb5e3,610";
>                         reg = <1>;
>                         peer-hub = <&hub_3_0>;
> -                       vdd-supply = <&usb_pwr_en>;
> +                       reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +                       vdd-supply = <&hub_5v>;
>                 };
>
>                 /* 3.0 hub on port 4 */
> @@ -51,7 +52,7 @@ hub_3_0: hub@2 {
>                         reg = <2>;
>                         peer-hub = <&hub_2_0>;
>                         reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> -                       vdd-supply = <&vcc_5v>;
> +                       vdd-supply = <&hub_5v>;
>                 };
>         };
>
> @@ -311,8 +312,3 @@ &toacodec {
>  &usb {
>         vbus-supply = <&usb_pwr_en>;
>  };
> -
> -&usb2_phy1 {
> -       /* Enable the hub which is connected to this port */
> -       phy-supply = <&hub_5v>;
> -};

This is breaking the bring-up of dwc2 in u-boot
so could you consider V1 of the patch?

Thanks
-Anand
>
> base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
> --
> 2.49.0
>

