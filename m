Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9044C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 19:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zrr8qOY5AroKW6DfKo2xALklKHaHMS61VgN2ae8lGd4=; b=pWs72H/25ivJ+t6tT7JB2Nxf15
	bew634Ncd3wvJbHUHKgEHWiwwS3q8p3KM/jsZqOd9QnXdB7I/PysmJMMMuZccPCicJg4RyO5ZJ0sE
	lJ1C07+wXnX6XD3CVZaaPMy+D55L5+3uvSm59kqXLUTauz8v/xIk5RQDpFmWrWDjH4bA9vKnxq0tG
	5yGuOzwcbDUSqBaUYpuYyEBCHKcf9VlfH4wXA5M4sZrOF4UEV/g/As1UQXuv8hjz5rpWnD3/X+CxN
	80lqGLsc82P5ll2WpcwVodmyf/wWHnp+m6L8DoHmb/bzXdHkMad0QPxSC2VXNXzGY1seLU0rA8BJw
	cg7NIQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trirn-00000003jvV-3EdQ;
	Mon, 10 Mar 2025 19:32:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1triqB-00000003jsZ-1zcL;
	Mon, 10 Mar 2025 19:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zrr8qOY5AroKW6DfKo2xALklKHaHMS61VgN2ae8lGd4=; b=nnLiHwqCXra8vWkf1q0iD36j+w
	QvHsbDdQkti3DSY2ixnanNFPEnh4op1ZNJY6+5T3keKngFHZnS3t1eQKJZ0x2+PaQPcxoGS9ZRr+J
	M8cVM9ZV3lUopUaBgAkm5i9ZDivmodd2L8HYHhbbEBAO9abD+Vn6vTx5mCuNciDeMhb2/cZJWnMF5
	oC3YY25HhUw4PpdcjKnlQRJRET6XXsmHMEsQj+m/HaB8chIwfhEYQDKBzA89nSLNGyea26CqtHwzq
	Roz65irHg79fScBKGJ4GZcH6zJRdQlP9VRhIg6FT7qwuR5k+N6kW0SWAtKTJ7UWIk46RV5eRk+xbe
	BI7PxROQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1triq7-0000000220p-2lVc;
	Mon, 10 Mar 2025 19:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5127DA43335;
	Mon, 10 Mar 2025 19:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22595C4CEEC;
	Mon, 10 Mar 2025 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741635059;
	bh=v4yFecT2Oniyy1NPYOTfbARYRqI9e57Xhic4hOu+GeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YEsJI4SW1f/4rNuYiyHSu6/QnSExJ4x+d6iQjI9VDYrZoNADxke2mnXUwP9afkihL
	 hTuuH7V0VvVUg5uJFbcLaV3P7z7RXNhKKuijQf+ljuhhIZy4j+4VTXINMoR1mxU6mu
	 9oYCm4t8FMpXLRBV22kEbpTDdhoxwjLbeq0rMzzReSuaVBXcAgYjIAZq3BHxisBfVj
	 GLFn9UmZ/rHmt/8ArwgEiV5JpYwhB5ksIkuxE1S5ZZfX7MMhJRKQW4RKzxHjSn4O1U
	 ToiRFxu1+MR8QXk+J8FtqIwrbQ6ID67F5bBBCPBS5GARlRPIQNUENI/DTESUA/ZxXY
	 2OvQqUx3x58Hw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2ae81dd81so176459066b.0;
        Mon, 10 Mar 2025 12:30:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYkuLdK8wR37zH0XHsguwCaJQdiRGkpg6ehE5b3JCCUXVZ3w1+/Ctj5XPI/eI2NKFxe1HQcNKsaau3doJPmfA=@lists.infradead.org, AJvYcCV5wEq4kXq81U06ZgdJc9hOXUH3w5DxOQPAiwO6z6ixhPsGsBFBUBGESq01m88s5b7uP6w88IPwYoEMQy6aWrmB@lists.infradead.org
X-Gm-Message-State: AOJu0YwFHR6xzsKxQ4qXH1gzGrwAREcxTjeyT4k0jKQkhjzqDuyUP8dG
	/WSBhKCRG7SMPJWhCKA6l1qvDiBKrcSDt7s+mlqytENDjLD9LDjoj4EiPJGtNe8sy50sUZ+1cLp
	XNRMvVfZdBLiThRnRezEB6uZ3tg==
X-Google-Smtp-Source: AGHT+IGxBKdAQOOWVnO3ZEjAzX0VnUi4wg5gUyfxa5EYDnUv2ipBTTlxmPR9u72RbqgdJn4WQkU1sK0SjNez+497cro=
X-Received: by 2002:a17:906:7308:b0:ac2:6582:1564 with SMTP id
 a640c23a62f3a-ac2b9e1d1d1mr100096466b.27.1741635057630; Mon, 10 Mar 2025
 12:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250307093309.44950-1-krzysztof.kozlowski@linaro.org>
 <5417098.31r3eYUQgx@workhorse> <20250310124956.GA3875809-robh@kernel.org>
In-Reply-To: <20250310124956.GA3875809-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 10 Mar 2025 14:30:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJShHSMzMwiYA79OppJYKKR8qN=1soXPV_hCZiXGyVkSg@mail.gmail.com>
X-Gm-Features: AQ5f1JosXmbTct3QI9ZnK1eBDcQPU7QRj7_3mqIgKtvsQToiQl1meMSpHXHswhc
Message-ID: <CAL_JsqJShHSMzMwiYA79OppJYKKR8qN=1soXPV_hCZiXGyVkSg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: rng: rockchip,rk3588-rng: Drop
 unnecessary status from example
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_193103_966739_A1C0A441 
X-CRM114-Status: GOOD (  28.23  )
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

On Mon, Mar 10, 2025 at 7:49=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Mar 07, 2025 at 03:05:50PM +0100, Nicolas Frattaroli wrote:
> > On Friday, 7 March 2025 10:33:09 Central European Standard Time Krzyszt=
of
> > Kozlowski wrote:
> > > Device nodes are enabled by default, so no need for 'status =3D "okay=
"' in
> > > the DTS example.
> > >
> > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >
> > > ---
> > >
> > > Changes in v2:
> > > 1. Drop unnecessary full stop in subject prefix after ':'.
> > > 2. Add Rb tag.
> > > ---
> > >  Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rn=
g.yaml
> > > b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml inde=
x
> > > 757967212f55..ca71b400bcae 100644
> > > --- a/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> > > +++ b/Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml
> > > @@ -53,7 +53,6 @@ examples:
> > >          interrupts =3D <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH 0>;
> > >          clocks =3D <&scmi_clk SCMI_HCLK_SECURE_NS>;
> > >          resets =3D <&scmi_reset SCMI_SRST_H_TRNG_NS>;
> > > -        status =3D "okay";
> > >        };
> > >      };
> >
> > Hi,
> >
> > is there the possibility we could make dtschema as invoked by `make
> > dt_binding_check W=3D1` (or W=3D2) add a warning for examples that have=
 disabled
> > or explicitly listed status properties when not needed? Or is this some=
thing
> > better handled in, say, checkpatch.pl?
> >
> > The question arises because dumb mistakes by me like this should ideall=
y be
> > caught before they waste precious maintainer time.
> >
> > If it's best handled in dtschema, I can look into working on that so yo=
u guys
> > don't have to do even more work due to me.
>
> Trust me, I'm always looking for things to check automatically. :)
>
> I have something like that which adds a schema for examples only. I
> think there were some corner cases. I'll take a fresh look at it.

I got my check working again. i2c/i2c-demux-pinctrl.yaml is the
problematic one. Not sure what to do there.

Rob

