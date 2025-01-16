Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1DEC02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gBUGv/ayLs0RS7Pe42wUSVdgcwy2g2KlQrLOm4GDYU=; b=xn97wuFfpuBgzc31LFfa64oEl4
	zydpEC5RdwRRFUW9zV0amVDSb2EXsAD/OKwrcNj5rbQNFMV+38OomHYiqD39Y3b01EnnnJZTZ19yY
	0Vi3B+R6HycuuT7/74BmFR1qnxMXj7GcKzqNcoY+4X9PJ/ScQFgVDCHGzF3aI3S5c7k+BRPQO/8NO
	Eonl0wY8HM2Jui2+15EuFlQAh7zXdy9q6QhZzQ/3zH9huOc79O7YV06V10pJjt7a00z3Hkf4ieF23
	752WYoctf6ObopEVBjcpxnhOFaYyQbOF6T+k4P77vC+MOxH0FpcCeQ68CWnALyV+y+7/jN/oCZGuf
	NM6dY2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQ0g-0000000F1eF-2dQc;
	Thu, 16 Jan 2025 13:34:10 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPzQ-0000000F1WT-3GyY;
	Thu, 16 Jan 2025 13:32:54 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa68b513abcso190991366b.0;
        Thu, 16 Jan 2025 05:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737034371; x=1737639171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gBUGv/ayLs0RS7Pe42wUSVdgcwy2g2KlQrLOm4GDYU=;
        b=leoT2rCvpyuuqBNOXnu8GWw6wKG+JSC0+aCUe3JY9lcCF8ENHMFgEGBShqfmEDBZl6
         xgjNPytjTN3qNy6uqYYB/KDzUarGzRrR/shxeqA2hn5R/jUNZA7WP/lub9W6WVKQV3Q2
         CEAjYyEhzUapUFT4lccb8hAZYvQ1RPTmN/8ttP5gJbBKC4OSwvBvsBgAghl0C3h6YybW
         b08z4pstXdiPbBvmhLOy5ue6CCEBb4/b1YsQUdzIVAUDev0nc2obKIQtJKaGseFQmEzq
         uqfj9P8s4JZ89urA4qWLUKTAjCIJfPSfvaxOPc7ni8RfRZxKDuNhwpUMimTRsku1mn3T
         2aYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737034371; x=1737639171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gBUGv/ayLs0RS7Pe42wUSVdgcwy2g2KlQrLOm4GDYU=;
        b=Ht/ZUds8WHNbXbgAejqn6bux44Rg34rMQ3ZP5vzUx/+hvhnjUSbt67lCoLP79Etd8O
         3oJ48oWtB4MXiI7vuSF5UM+Mk8PsxEeCfjnHaYrwy3fzlEizSq5Yoi1g2fqJusTEGWyh
         W+34912L/P9Rb9Ls+xWI7SXyPEgJKMVPAdOgr/IGFhl7CH8Q9YH04UmuUMEOWtw+MyPG
         UfTrfGBhKMnG+CgLBkRLJ2mZgpWK2eOhb1HPclN38aQGX6wRXx5l3eTU6hb91gb2G/NE
         FNiAIovfYfOhzA6XWdtxaJUDA6RVAWyq0FGoXsjKZXb7JbGnKplvxjT7sfd60aDev7M1
         Ks3w==
X-Forwarded-Encrypted: i=1; AJvYcCVDGlaw6w2YVzazQgGZIV6kCcqBTv9DtT9obEnDNr3tCnIAssAC2Y4nAERyL+VEI7kGoyZJIzdYEYqmVCiG74cD@lists.infradead.org, AJvYcCW2OzlbJorI3wPg5UcIWcGBnKmdq+rn8/wJHit1RsRuaTffUY3dScfdqx3fRFjXByiMUQmy4ZAxYkhn9Xc0900=@lists.infradead.org, AJvYcCWoK3Vd9aEdqUrBeSbPfiHCDXUapiEiIZFNWO0dr+NX+PvWhn8m4EGuKsoR28Ot50D5Hxodz7nGwgP7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrg3ew9CTXE6vmftqtVJnYM+BVveeznkq5/bmx3sI56KyTFqC0
	CZpYnemEloVtfl4rMXUbBBemAAzpvKHpbRbePzn2hgyVyZkV+uDfsLUeGVkEUNUVz4nThsP8h+S
	wSd1vIADfKECP+VQyLSETo+usFR8=
X-Gm-Gg: ASbGnctGG/BeoH6DsX/kfJlGvA/x7pjbvFChIQgcmCb/nvN12hKk0h80w2Qkmyh6boF
	mQapINER/OREOT107xpjJG4FqGdCc4+059/T6xes=
X-Google-Smtp-Source: AGHT+IHP7QulPAep+piqVLDSNR3tY1ZYz1ExN/RoD+LEIWDVIojfscu8qWjGIy8ZIzfrB0LkwNba/gtyAbIYcAl18M4=
X-Received: by 2002:a17:906:f58a:b0:aa6:5e35:d72d with SMTP id
 a640c23a62f3a-ab2ab703f0dmr3129019666b.24.1737034370862; Thu, 16 Jan 2025
 05:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <20250115012628.1035928-3-pgwipeout@gmail.com>
 <fe006de3-16eb-4c20-8e8e-da5ff5531c6f@kernel.org>
In-Reply-To: <fe006de3-16eb-4c20-8e8e-da5ff5531c6f@kernel.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 16 Jan 2025 08:32:37 -0500
X-Gm-Features: AbW1kvYL0IgwJDA5A9TSF42c5RGkjndMf9ngKuIr3RREKEvGBEVXmrRFBrG0Ktk
Message-ID: <CAMdYzYoB-wFGcmDNYrOMKTb0XSseBd7btLarKBB5+TUB-11KjA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/6] dt-bindings: phy: rockchip: add rk3328 usb3 phy
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, zyw@rock-chips.com, kever.yang@rock-chips.com, 
	frank.wang@rock-chips.com, william.wu@rock-chips.com, wulf@rock-chips.com, 
	linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_053252_822689_75881424 
X-CRM114-Status: GOOD (  30.13  )
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

On Thu, Jan 16, 2025 at 8:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/01/2025 02:26, Peter Geis wrote:
> > Add documentation for the usb3 phy as implemented on the rk3328 SoC.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >
> >  .../bindings/phy/rockchip,inno-usb3phy.yaml   | 166 ++++++++++++++++++
> >  1 file changed, 166 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,inno=
-usb3phy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb3ph=
y.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
> > new file mode 100644
> > index 000000000000..cde489ca87ab
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
> > @@ -0,0 +1,166 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
>
> Wrong license.
>
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also `scripts/checkpatch.pl --strict` and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.

Checkpatch literally told me to change this. Ran against my original
dev binding:
./scripts/checkpatch.pl --strict
Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
CHECK: DT binding documents should be licensed (GPL-2.0-only OR BSD-2-Claus=
e)
#1: FILE: Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml:=
1:
+# SPDX-License-Identifier: GPL-2.0

>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/rockchip,inno-usb3phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip USB 3.0 phy with Innosilicon IP block
>
> > +
> > +maintainers:
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3328-usb3phy
>
> Why is this binding entirely different than existing usb2 phy? Nothing
> in common? This looks like made for driver and both - driver and binding
> - duplicating a lot.

Hmm, I hadn't considered merging it into the usb2 binding as it is a
unique (and uniquely broken) device. I'd like Heiko's thoughts on
this.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 3
>
> Drop
>
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: refclk-usb3otg
>
> ref
>
> > +      - const: usb3phy-otg
>
> otg
>
> > +      - const: usb3phy-pipe
>
> pipe
>
> > +
> > +  interrupts:
> > +    minItems: 4
>
> You code here randomly. reg has only maxItems, clocks have both and this
> have only minItems. Does not make sense. If you get it wrong, I would
> assume you repeat the same mistake but here it is like randomly chosen
> pieces. And this is making me wonder whether this was not sent too fast.

I admit, I dread writing bindings as even now I'm weak in YAML and it
seems to pick and choose what rules it wants to follow.

>
> Anyway: only maxItems.
>
>
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: bvalid
> > +      - const: id
> > +      - const: linestate
> > +      - const: rxdet
> > +
> > +  resets:
> > +    minItems: 6
>
> maxItems instead
>
> > +
> > +  reset-names:
> > +    items:
> > +      - const: usb3phy-u2-por
> > +      - const: usb3phy-u3-por
> > +      - const: usb3phy-pipe-mac
> > +      - const: usb3phy-utmi-mac
> > +      - const: usb3phy-utmi-apb
> > +      - const: usb3phy-pipe-apb
> > +
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 2
> > +
> > +  ranges: true
> > +
> > +patternProperties:
> > +
>
> Drop blank line
>
> > +  utmi-port@[0-9a-f]+$:
>
> This wasn't tested. Missing quotes, missing starting anchor.

make W=3D1 dt_binding_check didn't complain about it, using the
dt-schema from pip3 from about a week ago.

>
> > +    type: object
>
> Explain what are the children here - description.

Fair, will do.

>
>
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        enum:
> > +          - rockchip,rk3328-usb3phy-utmi
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      "#phy-cells":
> > +        const: 0
>
> Does not look correct. Your parent device is the phy, not child. Why do
> you create children per each type of phy?

Because that's how it's done elsewhere in Rockchip's phys [1]. How
should it be done?

>
> > +
> > +      phy-supply:
> > +        description:
> > +          Phandle to a regulator that provides power to VBUS.
> > +          See ./phy-bindings.txt for details.
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - "#phy-cells"
> > +
> > +  pipe-port@[0-9a-f]+$:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        enum:
> > +          - rockchip,rk3328-usb3phy-pipe
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      "#phy-cells":
> > +        const: 0
> > +
> > +      phy-supply:
> > +        description:
> > +          Phandle to a regulator that provides power to VBUS.
> > +          See ./phy-bindings.txt for details.
>
> Drop "see ....".

I was tempted to convert phy-bindings.txt over but as above I dread
writing bindings. Will drop.

>
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - "#phy-cells"
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - resets
> > +  - reset-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rk3328-cru.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    soc {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      usb3phy: usb3-phy@ff460000 {
> > +        compatible =3D "rockchip,rk3328-usb3phy";
> > +        reg =3D <0x0 0xff460000 0x0 0x10000>;
> > +        clocks =3D <&cru SCLK_REF_USB3OTG>, <&cru PCLK_USB3PHY_OTG>, <=
&cru PCLK_USB3PHY_PIPE>;
>
> That's way over the limit. Wrapping is at 80.

Will correct.

>
> > +        clock-names =3D "refclk-usb3otg", "usb3phy-otg", "usb3phy-pipe=
";
> > +        interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 76 I=
RQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 78 IRQ=
_TYPE_LEVEL_HIGH>;
> > +        interrupt-names =3D "bvalid", "id", "linestate", "rxdet";
>
>
>

I appreciate all the feedback, I'll incorporate the changes you've recommen=
ded.

Very Respectfully,
Peter Geis

>
> Best regards,
> Krzysztof

[1] https://elixir.bootlin.com/linux/v6.13-rc3/source/arch/arm64/boot/dts/r=
ockchip/rk3328.dtsi#L887

