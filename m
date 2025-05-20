Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A9AC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ye8PCZ1i4EUKeCPrSp+vS4Bbl8vtgczZniWkr1Nh0GE=; b=HLvDqL0xB+Ax77pEkxEKubR9Pg
	pNyQLtp0Vb3xa06AfrJclFgpw4oLm4s318E59fC83TgmcvtJgbyCfPl6NsClTBobSaUvyCQd5GKr6
	X4DcCDNT6yVgr7dBgkp03Pv0XymbVUHeer9I6xNM1oD1a3bp/poXOaJKrmUWDGc80z1FPgdRmT66m
	REdE5zK2wOi/mMPA+ho/Q/ud62MirRjh4y7+/Cg8+R9aOveMmRukrk/XHWeG625NFy7osFyKuCepp
	KN/tIFHit8ji1u9j7vHrLpnh+zhVMYumyAzYJzQkeQOvScK27ZnqxJdm5FuaRLFAZFZBV/idAN/sZ
	OOqbwsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHO0Z-0000000DAcI-42cM;
	Tue, 20 May 2025 14:31:55 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNwk-0000000DA1S-1li4;
	Tue, 20 May 2025 14:27:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so330570366b.0;
        Tue, 20 May 2025 07:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747751277; x=1748356077; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ye8PCZ1i4EUKeCPrSp+vS4Bbl8vtgczZniWkr1Nh0GE=;
        b=nivhtjWyd0OafiwXVsx3ayjQoLavr2MIhaGegSY53iCQqAaro9AFN0ZJXWBGAxVaDk
         w/DBsR2Dh3V7svnfZlWk0jDIQvRhsuj0ORZKdcd1Pe4glD4EA8pKlREZy1me7ESL1ONp
         cJfJknAjHiMknm187jTGShhXr2AWbUKymk6/Mncuvh5L1lcwhe9XtCDoQUPGi8lloOy1
         PSSWajVoR1Hi1frvjBfalsfclD91w4J1OZGD5Amazn65vIbcPSzlio1DRg2o4GMXj0my
         FKKjvX6GVkOilCDaqRLit9irSchuRWGurYtwCePu4UK8lOdh2mUl84yGT8L/hH36DUi4
         BKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751277; x=1748356077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ye8PCZ1i4EUKeCPrSp+vS4Bbl8vtgczZniWkr1Nh0GE=;
        b=nuUJ5PAmDhGAhoXH7gqQj+McKdrcWXXKn5Ot87gRYkoRNI7XYkzwt2ea6x5Ke2GsER
         Lk3cgjEVdSgoG3AuiQ46/c+Jg0dzyF+pnGCjOt78GSUASUylab4+giIh+f5sgN2ogE1L
         r3CdCq4+Xc51Y64CzPRQKnMDUfj7nIDi1VNMLLuW+GzEj9TeuqBbHIheeHK4JKVVZ9xk
         PN38Ne5R1VdTZaQxx9h+L9Lrlj31CwfKib9g1bvBBynWT55YZc2O5Wp523CqG8LKlJd7
         AnqI//XMC1RMZcPSz2izH6F8rufFuzKx3Jh6AJNndquls5ByJw8jMB+6LqNqgRFu0Y4k
         zXWw==
X-Forwarded-Encrypted: i=1; AJvYcCWaVBp5ELl92CzGePp31idodo6xdV7JTaV4bmAD1BWiv/QPjSvwQ59zX8rjYplqR1FjE/+nNRjNnjpDSic/@lists.infradead.org, AJvYcCXLFhOblgSTqPl1fJ6lZiVJRCyvnfExfkL+3Z+R73s5yJO05TANMFZbRyzpkomqmycWJ9+O8eDSRhqQ5rPADjBv1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRX5sPjeH+5htIjQscjhQ+KBu1ZfBy91+1+D974PY9cY3Ej8hV
	ERTJmU8tLqmfUEUjAY42UM+LndonhhmmAj/BbcAdu4AmZxerVAm46PWfrXwxJTuuBbLn9oqjlTO
	+Pe6flKbQrlBnVV1LDQnPmisFFavLqwE=
X-Gm-Gg: ASbGncvByQPu2dZ4fnjxSOJOoqfdF++E44H726VRgCCydalK/RRS8RYisLatmZfBl7Q
	B4KZfLZiDhMsJR86NW7NATrtq7Bb/xrPH9xKuAx7syhpy5JlLDVpMrHcrJrPLXDBFOMf9JvVFWp
	wgQAM4X0jdSxVAmY98aJg1tG6e4qBqKHa1wCQep3j3TA==
X-Google-Smtp-Source: AGHT+IFZgpPsbCjQ4M57nv2zRvt3oeZ+tcbZ/YAX5E0FusXZLDlDws/m7F2i/u/CIk/aP2/Q7JUqtolBCf+hMq9BjJc=
X-Received: by 2002:a17:907:d9f:b0:ad5:8414:497 with SMTP id
 a640c23a62f3a-ad58414049cmr464555166b.16.1747751276504; Tue, 20 May 2025
 07:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250520091842.7504-1-linux.amoon@gmail.com> <872b7da3-b771-4df3-9b1a-21ca48c36045@linaro.org>
In-Reply-To: <872b7da3-b771-4df3-9b1a-21ca48c36045@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 20 May 2025 19:57:37 +0530
X-Gm-Features: AX0GCFuk9qchRZpZBJtUb0YknJh95nQU5vmvBDf2Ydkc7hsmi9ejA79lugkbvVI
Message-ID: <CANAwSgQrg06aZayOSFh1h1=bxqyvRje1aU-+NBNSoKrPeTAaDg@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: Update USB hub power and reset properties
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Wayne Schroeder <raz@chewies.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_072758_460404_02C66A20 
X-CRM114-Status: GOOD (  18.94  )
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

On Tue, 20 May 2025 at 18:02, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 20/05/2025 11:18, Anand Moon wrote:
> > Add missing reset-gpios property to the USB 2.0 hub node to
> > ensure proper reset handling. Also update the vdd-supply for
> > both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> > for consistent power management.
> >
> > Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > index 3bca8023638d..ad959f8bc1ac 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> > @@ -42,7 +42,8 @@ hub_2_0: hub@1 {
> >                       compatible = "usb5e3,610";
> >                       reg = <1>;
> >                       peer-hub = <&hub_3_0>;
> > -                     vdd-supply = <&usb_pwr_en>;
> > +                     reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> > +                     vdd-supply = <&hub_5v>;
> >               };
> >
> >               /* 3.0 hub on port 4 */
> > @@ -51,7 +52,7 @@ hub_3_0: hub@2 {
> >                       reg = <2>;
> >                       peer-hub = <&hub_2_0>;
> >                       reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> > -                     vdd-supply = <&vcc_5v>;
> > +                     vdd-supply = <&hub_5v>;
>
> In this case, also remove the &usb2_phy1 phy-supply since now it's managed by the hub reset control.
>
Ok I will update in the next version.
> Neil
>
Thank
-Anand

