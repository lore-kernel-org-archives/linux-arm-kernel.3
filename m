Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F2FC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijKQzzLB6fn0l9HXOynSzKmWa93u4m5lk6YgCJ/52bA=; b=2fTvst4vJjOfZ7JrDOByuLpDx3
	0jQz+//VibA1pzDhd+i1S3JGsvT1t+zQ/ZZOhrtvNvI/hGXhUfvuoC/0sKo3tePV/rqDx75rRDWLE
	dkmjV8JGLnkPPaJKQ17Hu0klu0ssjZE1nkaz7vcPkips59ZeK+oofWtEYnPc0BD6jAejr81LIClnk
	iy3Os2AeKI2WTb29jn2nAEM3NWT4z4xAMnSCx647UHiCxawDkILr/D/ivUF8mf9MM3dlLfvyvCL3C
	3FTZC5Ih/XlC8Xd0INDo/3+P7p+ZVY6kLC6l/tuZ3TXoXHejhfdiVntxOy+FxpWFlKhGaJWjbAibF
	p5buZh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeee-00000001jP3-14l4;
	Thu, 15 May 2025 19:54:08 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeau-00000001ijo-0AAs;
	Thu, 15 May 2025 19:50:17 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4766631a6a4so14793121cf.2;
        Thu, 15 May 2025 12:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747338615; x=1747943415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijKQzzLB6fn0l9HXOynSzKmWa93u4m5lk6YgCJ/52bA=;
        b=jw6NNKJjZEx+Hactvvon1O+qGqvYhwdQPJhqezsKFnsUkZmr3BBcDbtz98PChkJH2+
         bxnR+Kk5B2/qtLBmGCBHQpm8KtQYh9nwXtk9eByZB2beDFAtstebrtGaG4LeBO+U+GvD
         zEs2KjH5KQuIN24cK6xDbL4Q7MVN7s004jCjZ/5ekhZUiNkVtmlcBhjpVOzb4jOu3SJF
         oAgepSgCl1qrzvJsQnYR/TJRtndt2FFErB/Nsz2VIzRxE6z4EMXtDFLE/nrWQgk/t++M
         NBdyOEAMKVaaZC10viR7Z5LENrZSgm1JO64YOnS7LbxM2Per7uumFq6WmGYMSv1TfGNr
         w7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338615; x=1747943415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijKQzzLB6fn0l9HXOynSzKmWa93u4m5lk6YgCJ/52bA=;
        b=FycgwT12zlQ6FW/AHO1sxFrI9q7InlOrN6SH/cW/zz9G12ml4o8gYgPScfVRCHmIHd
         CbKaObKnAwozarwh4TQwxEaOD18k4S3Qui0k+OlLdHjwT/7GBRCbDWzaNJ+LR9hqwdnx
         wlDdR9DkSzAnUpA41BdvSHP5btyzTF/uzWuB1InB8Et7jRFS4FJgwq9alhBt10Q+yVdR
         SjU/Zo4g+Kwqn+JXFNq38HDzLYZxcEiW4b+BCqKJYdEWfYOLbUcVtnD9jK3DWMbd9DbZ
         7vbbPlFWaFMUtNQjNiQdsxn6jv+qNMhoxf3tl7J/Dop0GSk3yuZR/OsTSvgpVwjbIlb+
         ey4g==
X-Forwarded-Encrypted: i=1; AJvYcCXaeNLc7TBvaVtZCqOwmlG2oXugGTm1KV3dSbzhm3mJ1Vbg/jDSgd+fqAINgzsCGc69+iXr3UXToMlIxPJ5Haqs@lists.infradead.org, AJvYcCXylksegiAtw1EX6HeGCVGvl8SVp0wtSEuCdz8Dcj/5OpFBNNx31RkVDORMuneSpftryglv3TPFUzXx@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ28tKB92UwHYYgdi8mQ2Q87gYdXshac5cHW5FFg+x0BUuSexa
	2XvJOWRzd8FBF/xSMT3i+Sp2eIBfM/1YVTG/xy/tGfVX7cJdjmJsT+GzdA2oHga7VNcsQ1WClS9
	zEjaeO/6+G+HcXeffmeKF3564xRg7naI=
X-Gm-Gg: ASbGncuva5hb89YoTmKPlhL4AhKaWjwTY8jLN3Yxcqq98ABzsv+cojSn5zyMwL1/y/G
	RPSX68AQ3jOeNyQPVvkWsUBi4w1Nb2IZkvjCGKfGD7NqxnADYrnimtICTzbfY8Ed8e6kOxUSwNY
	XIXhvHWtUiI3f3DamOE61kSpQ70p08zN4Z
X-Google-Smtp-Source: AGHT+IFg/wcvnBBQLcYze3vfJPGy+GNXDNI9xDfhAt+JQBd/EhhLBzPOLi2CERDJ8hqiCo+MSJ2a3RvbExF4wMUuIyY=
X-Received: by 2002:a05:622a:8c9:b0:476:b02d:2b4a with SMTP id
 d75a77b69052e-494ae39531dmr14532621cf.27.1747338614671; Thu, 15 May 2025
 12:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
 <20250510-wmt-sflash-v1-1-02a1ac6adf12@gmail.com> <20250514204159.GA2988411-robh@kernel.org>
In-Reply-To: <20250514204159.GA2988411-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:50:03 +0300
X-Gm-Features: AX0GCFtuH7yt6ihjR9mFd6CzYnznZejyyxToXHyqEx8rsfGB1bgn9WZkvaxFaRI
Message-ID: <CABjd4Yz3w75PtkRk_edzD5yf6b2xPuf20gopbm8ygddgCBfpkw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Add VIA/WonderMedia serial flash controller
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_125016_086128_F8A2EBC5 
X-CRM114-Status: GOOD (  30.88  )
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

On Wed, May 14, 2025 at 11:42=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Sat, May 10, 2025 at 11:42:21PM +0400, Alexey Charkov wrote:
> > Add a binding for the serial flash controller found on VIA/WonderMedia
> > SoCs, which provides semi-transparent access to SPI NOR chips by
> > mapping their contents to the physical CPU address space.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../devicetree/bindings/spi/via,vt8500-sflash.yaml | 122 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 123 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/spi/via,vt8500-sflash.ya=
ml b/Documentation/devicetree/bindings/spi/via,vt8500-sflash.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d2ea0dacdd56118c0cb5a1c=
b510ceb7591e1e5ca
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/spi/via,vt8500-sflash.yaml
> > @@ -0,0 +1,122 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/spi/via,vt8500-sflash.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: VIA/WonderMedia serial flash controller
> > +
> > +description:
> > +  This controller is used on VIA/WonderMedia SoCs such as VIA VT8500,
> > +  WonderMedia WM8850 and similar. It provides a semi-transparent inter=
face
> > +  for reading and writing SPI NOR chip contents via a physical memory =
map,
> > +  abstracting away all SPI communication, while also providing a direc=
t
> > +  mechanism for issuing "programmable commands" to the underlying SPI =
chip
> > +
> > +maintainers:
> > +  - Alexey Charkov <alchark@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - via,vt8500-sflash
> > +      - wm,wm8505-sflash
> > +      - wm,wm8650-sflash
> > +      - wm,wm8750-sflash
> > +      - wm,wm8850-sflash
> > +
> > +  reg:
> > +    items:
> > +      - description: MMIO registers region of the controller
> > +      - description:
> > +          Physical memory region within which the controller will map =
the
> > +          flash contents of chip 0 for reading and writing. If the fla=
sh
> > +          size is smaller than this region, it will be mapped at its e=
nd.
> > +          Note that if this chip is used as the boot device (as is mos=
t
> > +          often the case), the boot ROM maps it at the very end of the
> > +          CPU address space (i.e. ending at 0xffffffff)
>
> Period needed on the end.

Noted, thank you! Will adjust in the next version.

> > +      - description:
> > +          Physical memory region within which the controller will map =
the
> > +          flash contents of chip 1 for reading and writing. If the fla=
sh
> > +          size is smaller than this region, it will be mapped at its e=
nd
>
> Period needed on the end.

Ditto.

> > +
> > +  reg-names:
> > +    items:
> > +      - const: io
> > +      - const: chip0-mmap
> > +      - const: chip1-mmap
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
>
> This follows the SPI binding, right? Drop these 2 and add a $ref to
> spi-controller.yaml.

Need some advice here. While this controller speaks SPI protocol to
its connected flash chips, it's a special-purpose thing that doesn't
expose much SPI functionality to the outside world, nor can it drive
any SPI devices other than SPI NOR flash. Does that still qualify as
an SPI controller as far as the bindings are concerned?

Happy to reference the spi-controller.yaml binding if so.

> > +patternProperties:
> > +  "^flash@[0-1]$":
> > +    type: object
> > +    additionalProperties: true
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    sflash: spi-nor-controller@d8002000 {
>
> spi@...

Related to the question above... Happy to call it spi@ if appropriate
in this case.

> > +        compatible =3D "wm,wm8850-sflash";
> > +        reg =3D <0xd8002000 0x400>,
> > +              <0xff800000 0x800000>,
> > +              <0xef800000 0x800000>;
> > +        reg-names =3D "io", "chip0-mmap", "chip1-mmap";
> > +        clocks =3D <&clksf>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        flash@0 {
> > +            compatible =3D "jedec,spi-nor";
> > +            reg =3D <0>;
> > +
> > +            partitions {
> > +                compatible =3D "fixed-partitions";
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <1>;
> > +
> > +                partition@0 {
> > +                    label =3D "U-boot";
>
> The somewhat standard value here is 'u-boot'.

Noted, thanks - will adjust in the next version.

> > +                    reg =3D <0 0x50000>;
> > +                    read-only;
> > +                };
> > +
> > +                partition@1 {
> > +                    label =3D "U-boot environment 1";
>
> u-boot-env

Ditto.

> > +                    reg =3D <0x50000 0x10000>;
> > +                };
> > +
> > +                partition@2 {
> > +                    label =3D "U-boot environment 2";
>
> alt-u-boot-env or u-boot-env-backup?

Ditto.

Thanks for your review and comments Rob!

Best regards,
Alexey

