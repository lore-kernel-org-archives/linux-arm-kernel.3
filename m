Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A610CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 01:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aTsBsG3b0stGVUU3MEZdAy7klaOCIs/53nUSWSvKzs=; b=MKq898BDiwEbVQlFYvRloz0DNs
	Dvs54ZIg0bKN+S/ZuQW4kk3EuSz4xSIPlLcr533qf8gxtkhwCflxblYsWFTJe+GSHUyF3UYO+vvrI
	oi51WvX2nvkgIhI5tOYz8IA+cAba+HUQJ+li8xMEFxbXjx72pY5DJTjeE6vjLhI9dxoPRFyo53N1w
	viGvvLKMhMJJWJqBqmYjBohTJsW1IKtkSuXgwMmYpDofmHLR1a60e5Og5MvpHpeT7dU1sNtrwnIDX
	pNj/SYkjf8jrUbP1296kFrhapJvY1XMZLq5PuxbTkm+GO+GDbmQPWpobJGCjZ3BSplek4D5HwKfz3
	vxMQfY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1EmX-0000000FKS3-1wts;
	Wed, 24 Sep 2025 01:58:57 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1EmU-0000000FKRB-3gD8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 01:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758679127;
	bh=6aTsBsG3b0stGVUU3MEZdAy7klaOCIs/53nUSWSvKzs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aup8ujOgSj/tebaHKpzgUVZXqYRu+3zaYauaxooNC9jEP6uu7nz8yhZdMa19xEJcJ
	 98JW49+VdRenKr1ok13J+k/6gPdVHD7YEMPtOOmILnppIgnTJSCeV8GCb0jjE7T9CV
	 IN0K/eGxkqsC3dFDYRJJTPC7zipVDXUEHsiyQUBp/p0d+k2fKPopKk5gDV6AjsWEuC
	 2ORJdOpZr2PQajFzMwFKM+VKKmChXg+Ie7+GbzQVHgr0JDBQ87ldx1JevgxwkyQqzX
	 Bm9KkmjEyLrQjjcm+r4wIzCKn8x/lz6317TR24RzgrHMLfGoG/U3kWeqmfDxIQ9HSo
	 nvTqGTK6t0dxA==
Received: from [IPv6:2405:6e00:243d:a853:dbe5:4849:b82e:5665] (unknown [120.20.205.123])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EA720647A7;
	Wed, 24 Sep 2025 09:58:44 +0800 (AWST)
Message-ID: <3c310312cc401bbec13b0935e7b0a83284efdcc5.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tan Siewert <tan@siewert.io>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 24 Sep 2025 11:28:37 +0930
In-Reply-To: <0c7a28b7-8d6d-4f91-ac6c-8cf37e128139@siewert.io>
References: <20250919185621.6647-1-tan@siewert.io>
	 <20250919185621.6647-3-tan@siewert.io>
	 <20250922200738.GA1124791-robh@kernel.org>
	 <0c7a28b7-8d6d-4f91-ac6c-8cf37e128139@siewert.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_185855_133727_8B776BD0 
X-CRM114-Status: GOOD (  12.69  )
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

On Tue, 2025-09-23 at 16:48 +0200, Tan Siewert wrote:
> On 22.09.25 22:07, Rob Herring wrote:
> > On Fri, Sep 19, 2025 at 08:56:18PM +0200, Tan Siewert wrote:

*snip*

> > > +/ {
> > > +	model =3D "Asrock Rack X470D4U-series BMC";
> > > +	compatible =3D "asrock,x470d4u-bmc", "aspeed,ast2500";
> > > +
> > > +	aliases {
> > > +		serial4 =3D &uart5;
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path =3D &uart5;
> > > +	};
> > > +
> > > +	iio-hwmon {
> > > +		compatible =3D "iio-hwmon";
> > > +		io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> > > +			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> > > +			<&adc 10>, <&adc 11>, <&adc 12>;
> > > +	};
> > > +
> > > +	leds {
> > > +		compatible =3D "gpio-leds";
> > > +
> > > +		heartbeat {
> >=20
> > led-0
>=20
> I guess `led-heartbeat` would be fine too, right?
>=20
> >=20
> > This should have given you a warning. You did run "make dtbs_check"
> > check the warnings, right?
>=20
> I did and there were no warnings, even after a full clean. The full=20
> command I ran before submitting was `make dtbs_check W=3D1=20
> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/arm/aspeed/aspeed.yam=
l`

Ah, so that's probably unhelpful, as you're excluding all the other
schemas. Rather, try:

   make -j$(nproc) CHECK_DTBS=3Dy aspeed/aspeed-bmc-asrock-x470d4u.dtb

Running that on your series locally produces:

     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
     HOSTLD  scripts/dtc/dtc
     DTC [C] arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/memory-=
controller@1e6e0000: failed to match any schema with compatible: ['aspeed,a=
st2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/syscon@=
1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspe=
ed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/display=
@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx=
', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/timer@1=
e782000: failed to match any schema with compatible: ['aspeed,ast2400-timer=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/pwm-tac=
ho-controller@1e786000: failed to match any schema with compatible: ['aspee=
d,ast2500-pwm-tacho']
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: fan@1: aspeed,fan-tach-ch: b'\=
x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
           from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: fan@2: aspeed,fan-tach-ch: b'\=
x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
           from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: fan@3: aspeed,fan-tach-ch: b'\=
x03\x0b' is not of type 'object', 'integer', 'array', 'boolean', 'null'
           from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: fan@4: aspeed,fan-tach-ch: b'\=
x04\r' is not of type 'object', 'integer', 'array', 'boolean', 'null'
           from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: fan@5: aspeed,fan-tach-ch: b'\=
x05\x0e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
           from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: lpc@1e789000 (aspeed,ast2500-l=
pc-v2): lpc-snoop@90: 'clocks' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.ya=
ml#
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: kcs@24 (aspeed,ast2500-kcs-bmc=
-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast24=
00-kcs-bmc.yaml#
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: kcs@28 (aspeed,ast2500-kcs-bmc=
-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast24=
00-kcs-bmc.yaml#
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: kcs@2c (aspeed,ast2500-kcs-bmc=
-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast24=
00-kcs-bmc.yaml#
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: kcs@114 (aspeed,ast2500-kcs-bm=
c-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast24=
00-kcs-bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/lpc@1e7=
89000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-=
lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/lpc@1e7=
89000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2500=
-ibt-bmc']
   /home/andrew/src/kernel.org/linux/origin/build.arm.aspeed_g5/arch/arm/bo=
ot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: leds (gpio-leds): 'heartbeat',=
 'identify', 'systemfault' do not match any of the regexes: '(^led-[0-9a-f]=
$|led)', '^pinctrl-[0-9]+$'
           from schema $id: http://devicetree.org/schemas/leds/leds-gpio.ya=
ml#
  =20

Andrew

