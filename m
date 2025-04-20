Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D65C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8TOZ1wqavZra/je2htJyl9Z7dmGZ7iMnPc5kvx9b5c=; b=pwdfSnRrJ6esn2FZo5To+wDHDo
	XiEE/4PloPyfngyqI0EtJeqlCVtnUAIYGXbI9P7niY1NzPFDmxKlFmo46xuLeX2k/2enjOiY9R8nB
	yIjXCt9GyN+m6HMDkHneLcOm3DR2cMIac5i7NQPmi2qqrwB9SmlkZEEfrNbtnLD943A8pyGQwlk6p
	47MN/qsNwRI5/GJXHBpJOrToFiLUpEWz/1awSbZ4yCxJlIitOOVMiB9Qi4kTi32jQr96HEn+07OYX
	NuTV/ul+Z57lAm1xiaroOUiZMu6qWc9XmeNZbL3h1I+t/c5WhlZ8HaXXrzMKddhBKVWLiD3xXDwt4
	YvQFoiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6R69-00000002PGl-3khZ;
	Sun, 20 Apr 2025 09:36:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6R3E-00000002P6L-0VvX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 09:33:25 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac34257295dso608682466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745141602; x=1745746402; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/8TOZ1wqavZra/je2htJyl9Z7dmGZ7iMnPc5kvx9b5c=;
        b=ARGvJBMqhaaqnXQHFsBesVTGiNhZMnR8qr8kLsrDFTuq227u2QRKTd04XDaf2zHkVV
         Z//PztWvuUN1jSFsr8Tz9QhoA7e+GC6XlE7SkpQ+6nHlmc3MbsjlmjogfIuC6d+Hgh/C
         bvuTt/JlAvmLBpU8whUPIwAsAEamF1uwWJ4B30heoYHXEf7IqZKtDePz+IX+VNGqnZTr
         XdEz1EQZ+25UmD9mbvsP0RHFr2kkqbpaFdJxQLbaeN30Gz4amLBK/Yy+Hvms0dLGJ2B1
         6bV1CXvAMCW6UJcja1mRzYZ0KPTbMkD6cKflL1FA+haHXv6rXluSljjbhLsQ8JlEpfi3
         Xdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745141602; x=1745746402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8TOZ1wqavZra/je2htJyl9Z7dmGZ7iMnPc5kvx9b5c=;
        b=GaLtcKtARat6OW52ONZn8BNbd0LerVZ7jmGoLoH/tEwu3Xf2u/qOZU4kbEwhOgdatY
         nyq5BDtqRoYHw5/+AjshMFLiXb8yKDRxG31sHLOiFOL9p7r3KuXa4Ok8nq+3RnECtZUw
         /vDM75SR5qZfy5YzmCvKaB458PteNfYuEmORImivx8Fue5m78onf9xIB7nsF7oX72HfX
         ZkEVhNMJHaCVINvjMgiGqr3Bk/xyZDfnQ03ryMf1eWfllfvvfkczPdDJ/UqouSEXq4PG
         cdmZfrS59nx7rm18oMoVEL9/m8RA//QcdEDHt9812SC8xCLscQMi/EEyy2QfGmn2LHxL
         guaw==
X-Forwarded-Encrypted: i=1; AJvYcCVBvLEV3mIGVWxuM3aY7qZkMdnvRyhfksWBHa95qSOdKu+DLWVNSRkxVKQYokOVXhK454/gfE77tm8Y9+B43Ihd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5NTm4Y25CztO2vQX91vKaZ1nsotr36Avw00x0LLDBDqWjsj/u
	43wbWbJJwE+dSNt/dj3t8QQEPB4qhGwajqUnZ5asoVB3+RCvS+TizhCBQLzeITLotVYJzytyJ8G
	JuI4ecpqi+wdyOJf/ntU0FLwWGxY=
X-Gm-Gg: ASbGncuM2S28jAzbXyaNOdUJ6qzVXTu2gYHduGb6WUmrfPznI8FyGZ6Nm56ietuY2gH
	FkudoNa75WZW6Zr6QAo5yGFeJi9EHz5mA5epqCTMyw5/qLEgMw9pRhTGDt4a+97JEvWknWaa4+y
	qhykbkkiEvVmdZSyviAIQYZw0IjpIEC4E6zTOwrb+L9+0ZIsH1UPLhmfE=
X-Google-Smtp-Source: AGHT+IGX10xsrDu5V/UjkEupGH0LyUzW3ha9EoTXPcUMoBfunRTwSAC3I1NonXEe/hPiG88ngXa6JOs1oqW3vl3TGZA=
X-Received: by 2002:a17:907:1c07:b0:ac6:e20f:fa48 with SMTP id
 a640c23a62f3a-acb74bdcde0mr706379066b.33.1745141602109; Sun, 20 Apr 2025
 02:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250419160051.677485-1-pbrobinson@gmail.com> <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org>
In-Reply-To: <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sun, 20 Apr 2025 10:33:11 +0100
X-Gm-Features: ATxdqUG50NCyTDEBxJuIUN4T06VkkXzEZg9j2zhXsssvhxuy2mRvejdomh4GKDo
Message-ID: <CALeDE9Nyt7Di2_u-Vf=6OCAg-6wmbz75Cs_MCfZrk6upbD9nZw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_023324_164493_16EB56AD 
X-CRM114-Status: GOOD (  25.76  )
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

> > This adds all the pin mappings on the WiFi/BT header on
> > the SoPine baseboard/A64-LTS. They're disabled by default
> > as the modules don't ship by default. This includes, where
> > they haven't been already, UART1 for BT and mmc1 for WiFi.
>
> The patch subject should be improved a bit, to include
> "Baseboard" as well.  Having just "SoPine" is a bit too
> vague, and it should actually be written as "SOPINE"
> at all places in the prose.

It literally has baseboard in the second line of the description.

> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  .../allwinner/sun50i-a64-sopine-baseboard.dts | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git
> > a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> > index be2347c8f267..64d696f110ee 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> > @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
> >               regulator-min-microvolt = <1800000>;
> >               regulator-max-microvolt = <1800000>;
> >       };
> > +
> > +     wifi_pwrseq: pwrseq {
> > +             compatible = "mmc-pwrseq-simple";
> > +             reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> > +     };
>
> Is there a reason why the status of this node isn't set to
> "disabled"?  Or even better, why don't we move this node
> entirely into the proposed DT overlay?
>
> The required reset procedure actually depends on what's
> found on the add-on module, so it should belong to the DT
> overlay that defines the add-on module.
>
> >  };
> >
> >  &ac_power_supply {
> > @@ -103,6 +108,18 @@ ext_rgmii_phy: ethernet-phy@1 {
> >       };
> >  };
> >
> > +/* On Wifi/BT connector */
> > +&mmc1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&mmc1_pins>;
> > +     vmmc-supply = <&reg_dldo4>;
> > +     vqmmc-supply = <&reg_eldo1>;
> > +     mmc-pwrseq = <&wifi_pwrseq>;
>
> Of course, the "mmc-pwrseq" property would then also be moved
> to the DT overlay that defines the add-on module.
>
> > +     bus-width = <4>;
> > +     non-removable;
> > +     status = "disabled";
> > +};
> > +
> >  &mmc2 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&mmc2_pins>;
> > @@ -175,6 +192,14 @@ &uart0 {
> >       status = "okay";
> >  };
> >
> > +/* On Wifi/BT connector, with RTS/CTS */
> > +&uart1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> > +     uart-has-rtscts;
> > +     status = "disabled";
> > +};
> > +
> >  /* On Pi-2 connector */
> >  &uart2 {
> >       pinctrl-names = "default";

