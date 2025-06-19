Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D1EC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfN8i5fcB9FTxMF14FBU2K/kHwd7PP5Au+Rmh3uaX8k=; b=OjigEi4gQ5kc8nYpxj1G9Gu6Ik
	nTFiTij2aWTAg1EF5I6PlAA32eK/db+Mh/d8bmNAPifuHYK271XeC9xaKWtf8x9w3ig8k1kP4BbYU
	NeHo/enMEeHort6mBI2daf7xd5BcHmmGa/GrQowaui10DcSRqJdRApjtXZa6Ix7lqSzvaugTEqS0Y
	gD7bpIffsgDpYgn13FOPkb0ag9IsmZeyFvJToDG89HXrAouTpHK6agtN4FdMzdjgJOVy6BE/p/Wt5
	Falf3+vbU/4rJ7bsJ3obNhjkRl1gHhZJNnjzMkpnmx7VlrwFNI0DmA8JAb1YHDvVeT8Knh0O0LL0J
	l9nT6X1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHTS-0000000DUfv-0CKw;
	Thu, 19 Jun 2025 15:46:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSE6V-0000000D0N7-2RGV;
	Thu, 19 Jun 2025 12:10:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2264A106F;
	Thu, 19 Jun 2025 05:10:30 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02EB23F66E;
	Thu, 19 Jun 2025 05:10:46 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:10:44 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Aleksandr Shubin <privatesub2@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?=
 =?UTF-8?B?Zw==?= <ukleinek@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp
 Zabel <p.zabel@pengutronix.de>, Cheo Fusi <fusibrandon13@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20250619131044.20b45d8d@donnerap.manchester.arm.com>
In-Reply-To: <20250619094407c4c849f3@mail.local>
References: <20250427142500.151925-1-privatesub2@gmail.com>
	<20250427142500.151925-2-privatesub2@gmail.com>
	<20250512235619.30cff739@minigeek.lan>
	<20250619094407c4c849f3@mail.local>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_051051_722089_61A3A417 
X-CRM114-Status: GOOD (  40.53  )
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

On Thu, 19 Jun 2025 11:44:07 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

Hi Alexandre,

> On 12/05/2025 23:56:19+0100, Andre Przywara wrote:
> > On Sun, 27 Apr 2025 17:24:53 +0300
> > Aleksandr Shubin <privatesub2@gmail.com> wrote:
> > 
> > Hi,
> >   
> > > Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> > > controller witch is different from the previous pwm-sun4i.
> > > 
> > > The D1 and T113 are identical in terms of peripherals,
> > > they differ only in the architecture of the CPU core, and
> > > even share the majority of their DT. Because of that,
> > > using the same compatible makes sense.
> > > The R329 is a different SoC though, and should have
> > > a different compatible string added, especially as there
> > > is a difference in the number of channels.
> > > 
> > > D1 and T113s SoCs have one PWM controller with 8 channels.
> > > R329 SoC has two PWM controllers in both power domains, one of
> > > them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> > > 
> > > Add a device tree binding for them.
> > > 
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> > > ---
> > >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 84 +++++++++++++++++++
> > >  1 file changed, 84 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > > new file mode 100644
> > > index 000000000000..4b25e94a8e46
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
> > > @@ -0,0 +1,84 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Allwinner D1, T113-S3 and R329 PWM
> > > +
> > > +maintainers:
> > > +  - Aleksandr Shubin <privatesub2@gmail.com>
> > > +  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: allwinner,sun20i-d1-pwm
> > > +      - items:
> > > +          - const: allwinner,sun50i-r329-pwm
> > > +          - const: allwinner,sun20i-d1-pwm
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#pwm-cells":
> > > +    const: 3
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Bus clock
> > > +      - description: 24 MHz oscillator
> > > +      - description: APB clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: bus
> > > +      - const: hosc
> > > +      - const: apb
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  allwinner,npwms:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: The number of PWM channels configured for this instance
> > > +    enum: [6, 8, 9]  
> > 
> > Do we really need to be so restrictive here? The IP has an
> > "architectural" limit of 16 channels (due to the MMIO register layout
> > and status/control bits usage in some registers), so can't we just leave
> > this value to be anything between 1 and 16 here? If people configure
> > this wrongly, it's their fault, I'd say? Without confining this further
> > based on the respective compatible strings this enum is less useful
> > anyway, I think. The Allwinner A523 uses the same IP, and supports all
> > 16 channels, the V853 implements 12, that's what I quickly found
> > already, and there might be more examples in the future, so I'd rather
> > open this up.
> >   
> 
> Do we really need this property? I feel like the number of PWM channels should be
> something the driver could infer from the compatible string as we are going to
> have one compatible string per SoC anyway.

Well yes, this would work, but I feel like it creates unnecessary churn to
touch the driver every time some new SoC with the same IP pops up, and
where just the number of channels is different - see above for a list of
SoCs we already know about, and there are more in the pipe. It also means
stable kernels would already work.

And after all the code is perfectly able to handle this: the channel
numbers used come from the PWM users in the DT, and using non-existing
channel numbers just would not make sense. I can run some experiments, but
I wonder if programming an out-of-range channel would actually do anything
harmful at all - my hunch is it would just do nothing, so there is no
risk even if the DT specifies a wrong number.

So I wonder if the channel limitation is really needed at all. If the SoC
just implements six channels, there would simply be no pin available for
channel #6 or #7, and no PWM user would ever request those channels.

But regardless of that, I would really like to have just one fallback
compatible string, covering all SoCs that have compatible IP.

Cheers,
Andre


> 
> > > +
> > > +allOf:
> > > +  - $ref: pwm.yaml#
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: allwinner,sun50i-r329-pwm
> > > +
> > > +    then:
> > > +      required:
> > > +        - allwinner,npwms  
> > 
> > Can't we just simplify this by always requiring this property? As
> > mentioned, there will be more SoCs with different values, so just
> > omitting this for the D1 seems odd.
> > 
> > Cheers,
> > Andre
> > 
> >   
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - "#pwm-cells"
> > > +  - clocks
> > > +  - clock-names
> > > +  - resets
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/sun20i-d1-ccu.h>
> > > +    #include <dt-bindings/reset/sun20i-d1-ccu.h>
> > > +
> > > +    pwm: pwm@2000c00 {
> > > +      compatible = "allwinner,sun20i-d1-pwm";
> > > +      reg = <0x02000c00 0x400>;
> > > +      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
> > > +      clock-names = "bus", "hosc", "apb";
> > > +      resets = <&ccu RST_BUS_PWM>;
> > > +      #pwm-cells = <0x3>;
> > > +    };
> > > +
> > > +...  
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv  
> 


