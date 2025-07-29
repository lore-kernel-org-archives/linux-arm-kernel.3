Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33207C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 20:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsF9xa5Mt5eWvFYvP4ppl+lpx7xROA4dI7ZLgi/IK7c=; b=4ESiFrtq1YTKguAKlvIWBaMJu0
	+JMb6qf7Tw0ZAasNelmpANVaECsk+JWQrr9+thwaOGF4kjxNK6MlKyJLLx9NLomvI2m9/syiUAjoQ
	kQnCH6X16rmdW8/ekMtautqJHAOdeDSpuEY5BeXB609kH4Di+6UePdD6TsorZWzICTAu/c2yQpnM2
	IJMquw56x0tphF5jWFsxxF2HfuLGLwX3JCz03GYtpbVfb/Gi5QJql9LaGVcaFp84D/Hv3LPC8cmxd
	gA2N+zQ3o9VtZDhLtGPFeQcrtnIqug66ShdBNbmAPdIsW9HmnwsheyHdOrsyTID0cxuCxX9tHoaBm
	xQ090WCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqgc-000000002BT-2n5M;
	Tue, 29 Jul 2025 20:12:34 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqe4-000000001uP-0fJI;
	Tue, 29 Jul 2025 20:10:01 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6b7so2640782a12.2;
        Tue, 29 Jul 2025 13:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753819793; x=1754424593; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GsF9xa5Mt5eWvFYvP4ppl+lpx7xROA4dI7ZLgi/IK7c=;
        b=GldTIyfWbGUcIEZgOKOds+quxdGwQauCt5aEr6UvfVjJ/mwIzsj96VEpRjbJj4OuPa
         oURTBz2/Bvk5rWrcVTVlbf4tEGT2T7TSF8QOxD98L1Uuv8TWdgrIDmJ/TpW/piDULyw0
         op8rHeh0dbzOBgXUnCYuyjRoNNb/Cg52gxsZlRRTqWthUpqckTEWnIcTLNIEzfvjZIO4
         Bw5u/xet0iZj/xNVLl8wYzoa6MmI2WwFwBwowkxgkOPwE7PU+PqhNXqIGQqFLHTcRsAe
         5amCeYG4p675O9ZwFyb0FiqespYSGkfZGS2iXjoCLVsQhUEV+qsctEoE3o9FIN3zwF3c
         XQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753819793; x=1754424593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsF9xa5Mt5eWvFYvP4ppl+lpx7xROA4dI7ZLgi/IK7c=;
        b=e5ItwBX+jagS3yH4GUUA8MA7e6Nc3ZZhvZEz7ikZQd9YC+fcWfgBkCPZp5WdyD4Agb
         ffiBPYaCkjxq01kAdCN7RjmwKpXnFbJ40CbN8+NfRMiY3k2FKCzhUQ6wsAaBxE9u/cSg
         8dkEDjPJngl04LKBZ+7OMOjUJdZyzPWaLJ3NI2TLdiO9AliEnn1v2BkJkqz5zLVOSzxQ
         EKC5m43RKCLlljK1q0R0x1vSjupnXLtUqafDhazIcc+f0Lv80dWrPN/aUAkTpLuPiSKN
         6K/QVqjA82a60ghCU8w23WRGx8PLW1y1PNhZIgnBGYSkPppFwMQMS0rHHXiciLP2+oqH
         56tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJEzYf3HqmkYMwAfpm6EHAUWRCzcVoQOcbsGLazdBCyPWJ8yOVbFBUyIV4LfBHHA1SWV7En7z1+47pTIZNlZw=@lists.infradead.org, AJvYcCWXP5NwH0W3fdjfNJ1tdLxa2/92w9g3d/+hM2KMH2kwTxTQf60JYuJR/igLxGKTR22mJ8D+oSpkavMwl0NWop2G@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3PByKyTOHn4IP7lp6Ln2PtZ54TgnYXifQwUMBWYZBnzK+wzlu
	xKW/Mr4BMXySn9a5xSo5+3n+J6hg0j89QA67qrPX057f0n950FJ3qFtfGjaWKpEbyZL9/cAfH3q
	ZZzpr1WFLP0rU3qWJwXbNQc33jsbmSmhP2RTC
X-Gm-Gg: ASbGncuSzBwVyr1hxZ8N/h1aJxKAen1Eaxg6xof0LGLHGKM7fno8/Byi808QAoxgHoh
	HcfiDXQ4Paks6FFfe0LqXHi8jfxxeSQkya0UP0UUo43/z+vaOLJi6y2OurVdWt2CwKFfdgcL2ig
	3KSO+hL/rUQZDeb9aCUC0a2zX2eaqDACO48ufh3z8w+xVI+WLKwe0DUubwIbtmy1ewdG5wzoUrB
	7y/zsYT1sSYI+VC1JWe7PpBQWgbZx/nmxLcAOnX
X-Google-Smtp-Source: AGHT+IHp08a+dqAcG2SqZdg/Q/IaPZikdzCFE1YVv3PwaCR2cMYRBTvpJ0sMCJoMk8buiVXu2JvpXqMV1MUNd/Qb36s=
X-Received: by 2002:a17:907:3d0e:b0:ad8:ae51:d16 with SMTP id
 a640c23a62f3a-af8fda55064mr88607166b.55.1753819793020; Tue, 29 Jul 2025
 13:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250729185827.144547-1-pbrobinson@gmail.com> <6948463c8ca90bd9c72fb34178ddb029@manjaro.org>
In-Reply-To: <6948463c8ca90bd9c72fb34178ddb029@manjaro.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 29 Jul 2025 21:09:41 +0100
X-Gm-Features: Ac12FXyxfZWg8J34PdCYZFxIOQsYsTBJ_0Qnm0fc0wOJNc5kZopjCpZIel3xgKc
Message-ID: <CALeDE9PBnfu9Oxo4xc8O+uJW8p+_=43Y-goe0i3=VmT0SsovNg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Pinebook Pro: Update WiFi
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_130956_268183_572D7BED 
X-CRM114-Status: GOOD (  22.10  )
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

Hi Dragan,

> On 2025-07-29 20:58, Peter Robinson wrote:
> > Update the WiFi configuration to include the wake-up
> > pin and add an ethernet alias to allow assignment of
> > a mac-address from the firmware.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3399-pinebook-pro.dts | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> > b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> > index 5a8551d9ffe47..05c48cb09df6f 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> > @@ -19,6 +19,7 @@ / {
> >       chassis-type = "laptop";
> >
> >       aliases {
> > +             ethernet0 = &brcmf;
>
> I'm sorry, but this alias isn't acceptable.  In a few words, this
> simply isn't an Ethernet interface.

Can you explain why? It's a wireless ethernet interface with a MAC
address, there's other example in the kernel doing this so there's
already a precedent, can you explain how else to do this or give me an
example?

> We're already stretching a bit the dynamic nature of, well, everything
> with the aliases in the Rockchip DT files, and an alias like this one
> would be stretching the whole thing beyond the breaking point.

Why? If you look through DT outside of rockchip there's even more
stretching and I don't see how using this goes beyond breaking, I
think this is a bit of an exaggeration. Rather than saying no how
about explaining an alternative solution?

> >               mmc0 = &sdio0;
> >               mmc1 = &sdmmc;
> >               mmc2 = &sdhci;
> > @@ -883,6 +884,12 @@ vcc5v0_host_en_pin: vcc5v0-host-en-pin {
> >               };
> >       };
> >
> > +     wifi {
> > +             wifi_host_wake_l: wifi-host-wake-l {
> > +                     rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> > +     };
> > +
> >       wireless-bluetooth {
> >               bt_wake_pin: bt-wake-pin {
> >                       rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
> > @@ -940,7 +947,19 @@ &sdio0 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
> >       sd-uhs-sdr104;
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> >       status = "okay";
> > +
> > +     brcmf: wifi@1 {
> > +             reg = <1>;
> > +             compatible = "brcm,bcm4329-fmac";
> > +             interrupt-parent = <&gpio0>;
> > +             interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names = "host-wake";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&wifi_host_wake_l>;
> > +     };
> >  };
> >
> >  &sdhci {

