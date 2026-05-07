Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2CECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFzbf4Mo3ZUJ3TRLxmNYLnRznZXLPNlVmRM9z2LvdLc=; b=1EPRqI9Q7Y6dYNIoZA8h+hgoJ5
	YnIHc2scja4284ZXDObvRu98W2bSmr6hVsiIgqUxctnu2LajKh7WNkR1TDjX5i42AmoIJTlXpoLiJ
	vP7JK2o7WBGRjs6kdH9cvodssepSPniCBcGG0sc3rF+xHqlY+l6g9cGfse45LbNRSjIJnOuO/W7gD
	OHx8nIfbHOAscBRq/5ns5u3jOQrDl6E7GmatVAy09azygE3/RsYRftJdecjtgKBbtMa9sZJtZ+SM5
	eRRFAQawpDx6hs2w8H8jYKkRfPmonwoVHXeDnN1DV1Ye+AI6EkR67UEoxPL0iHkkq1tAiDkeBYLVD
	htzYC+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvHn-00000003OGj-01vS;
	Thu, 07 May 2026 09:44:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvHk-00000003OFw-01yQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B09DC43DE7
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 09:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A0EC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778147085;
	bh=Jjnn4yrDTrZX08ni2x7bn720XfEgnPw2PfUE6M7ahIw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qqjGNMvV31nKILNRLnEfl9xhDx2UrF0buO2OdXbecwgZvZpWUc2PWF6VcD/Xi9zdW
	 w/J/5Tu1wRL5Ce2ZE7Hc5gQj4uYOVCR4KwpaxbwrPzqMjZptUDDcqSFD5NnxcA+1k3
	 uZ/p+VROYY7lxK7Jp0fD6gcBcTEYDUAGnBEhudvQ8vdP8/OlxK8XKvh8PhjO3v2CVb
	 D6mbYl3pQd16JmGt8gkQZiUWmRSBePbLKnlDI7l3IHazpidknz+dxXQj8PwBgzZBOJ
	 UsBlxairo1QZyNDZilFJT5OIGw61w+FDKPcIz2vkDPtyw8K1c9kncnO+nmwl5jAMve
	 mi82bMQ+wqhkw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dea72099eso594526e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qgRsnZjbbGRvfpbz7isw4X/vIa5vOSoaKX3CzkArlPhmb0Nj0Ju7sOktoQ5DkB4aA0VxsH/hvGQTULT7oG/o5@lists.infradead.org
X-Gm-Message-State: AOJu0YyeWmvzpTPesHFq2kMVdVJv1WTbvusCNDyjzSE3NYyE6ud95uM8
	dE/+C6ACoIUnjht4utiTWVlL8S0zGC3pNraYIbuHrQ55AGX57C5gwanxG9IcB45n1+e9wrA/dsK
	P6n01+72udwktOPVki+bXdEXmbpTzlSE=
X-Received: by 2002:a05:6512:3f23:b0:5a8:638d:6f53 with SMTP id
 2adb3069b0e04-5a887adaa88mr2727485e87.6.1778147083932; Thu, 07 May 2026
 02:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
 <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com> <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com>
In-Reply-To: <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 7 May 2026 11:44:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
X-Gm-Features: AVHnY4KA8TveR2zDsS46EaI7LI2muWnzNFMg-HaAe4yTbCLUY8SRows5ieuqqDs
Message-ID: <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_024448_087276_79052FBD 
X-CRM114-Status: GOOD (  31.13  )
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

Hi Petar,

On Thu, May 7, 2026 at 10:06=E2=80=AFAM Petar Stepanovic <pstepanovic@axiad=
o.com> wrote:

> >> +  '#gpio-cells':
> >> +    const: 2
> > Are you sure you don't want to use 3 here instead and split the 128
> > GPIOs into 4 "banks" second cell being the bank number?
> > <&gpio 2 4>; ?
> >
> > Maybe this also solves the 512 GPIO by grouping the GPIOs into
> > 8 banks...?
>
> Thank you for the suggestion. We would prefer to keep #gpio-cells =3D <2>
> to stay aligned with existing SGPIO drivers and current DTS usage.
> A single linear offset is sufficient to identify each GPIO, so introducin=
g a
> bank cell would add additional complexity without a clear benefit.
> Any internal bank handling can remain within the driver if needed.

If each bank also has its own associated IRQ line, for instance, then
this also reflects the hardware in a better way. But it seems this
controller has just one single IRQ line for all GPIOs, so maybe
this is better.

> >> +  ngpios:
> >> +    description: The number of gpios this controller has.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> > Same here, certainly the 128 variant has 128 gpios and
> > the 512 has 512 GPIOs? Just use the compatible string
> > to infer this.
>
> This seems to be platform-specific rather than strictly hardware-dependen=
t.
> We were considering keeping it as a separate property (possibly renamed t=
o |axiado,sgpio-ngpios|).
> Would you prefer that, or deriving it from the compatible string?

In this case it is fine to use ngpios.

ngpios is used when the hardware can actually do more
GPIO lines, but they are not routed out on the package of
the silicon, for example.

> >> +  dout-init:
> >> +    description: Initial values for the dout registers.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >> +    minItems: 4
> >> +    maxItems: 4
> > In:
> > Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> >
> > you find:
> >
> >   lines-initial-states:
> >     $ref: /schemas/types.yaml#/definitions/uint32
> >     description:
> >       Bitmask that specifies the initial state of each line.
> >       When a bit is set to zero, the corresponding line will be initial=
ized to
> >       the input (pulled-up) state.
> >       When the  bit is set to one, the line will be initialized to the
> >       low-level output state.
> >       If the property is not specified all lines will be initialized to=
 the
> >       input state.
> >
> > If this is what you want, use this standard binding instead.
>
> In our case, the hardware provides dedicated DOUT registers where
> each bit directly controls the output level (0 =3D low, 1 =3D high).
>
> The lines-initial-states property also encodes input state semantics,
> so it does not map directly to this hardware.
>
> Would you prefer adapting to lines-initial-states despite this,
> or using a separate property for output initialization?

Please use lines-initial-states, support also input mode setting
and write more than one register if necessary.

Setting up the dout-states for lines which are supposed to be used
as inputs just doesn't make sense does it?

It is better if the device tree has this deeper semantic which
provides useful information for the developer and makes the
author of the device tree be more careful and detail-oriented
around the actual usecase.

Yours,
Linus Walleij

