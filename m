Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D451C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 07:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i18NPnv5eIUf6UbsI/khDMHH0nd6uxFV8xlsBSgXCP4=; b=dhF2zh4zZdu15RN2Vw4VCH3QdF
	pyuJzthfdm6S2UL3AkmfSzrGANB+ONlIeACxQubfIFx+hNAUO8TN84wehiuJVlWIdg/86el/bf8Zy
	dE+4E692oWYKa7eX1M7AVUXT+U9tCTnnZeJIZbIQXv20umcceDBYrmURrX2J0pLlimJv3IO+fpOOf
	xvUn7G1ci9sM+swmGVNu/+wjm9vMD+ovnJ6FOA7KKXfcDDQkQtwIOm3vy54jmoW0QKzB4TYB9sz1u
	9UoJROFWyQCUa8JfnUtkm798DLRGoDFJOktALs7xvxrblOCGSXXx56P1kQB/UsszBUzEdxvNlbpF8
	JQjyDrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipZc-00000009onM-1gIx;
	Mon, 04 Aug 2025 07:25:32 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipX3-00000009oZo-1a5d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 07:22:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31AA1438DF;
	Mon,  4 Aug 2025 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754292169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i18NPnv5eIUf6UbsI/khDMHH0nd6uxFV8xlsBSgXCP4=;
	b=pVPoUrdp9u9L5F0YNFRXy/hoYu5wW9UM+VQzEkzatsRDj/oy2153NEgYFKAZn5+SYkbz0w
	57YrnYt01cllo/jlXfqOk1DgSyGgQq3NAWPfgR9PLKBJs5Bw9SM8xuAVpRj+c/RjnuAeLb
	JRXqk0R0A2mwHD+stOhsLZNXHX1J+5/Jn80ttBZaDKcJV3HOKfVGD87dLh/wIvmiQLkS8W
	jX+YslVsKZ2epzqSQQPWl8ZeBqUWAOh2XJeaWC1xN0UEOngtp7O/7mkAsd18bTeUsuiWCV
	MxsxbSd62ml9mtLAP/hXA5GaVxWbuUXp3lYxbLKGLCdI4rAaUKxMCIPvAOFqcg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Daniel Lezcano <daniel.lezcano@linaro.org>,
  Zhang Rui <rui.zhang@intel.com>,  Lukasz Luba <lukasz.luba@arm.com>,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-pm@vger.kernel.org,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dt-binding: thermal: Convert
 marvell,armada-ap806-thermal to DT schema
In-Reply-To: <CAL_Jsq+fV-W+PqZpvns5oFNyGXxKYYrHe1ipG7gj6dN-c2JJ6g@mail.gmail.com>
	(Rob Herring's message of "Fri, 1 Aug 2025 15:22:20 -0500")
References: <20250702230030.2892116-1-robh@kernel.org>
	<87qzxv5d7z.fsf@bootlin.com>
	<CAL_Jsq+fV-W+PqZpvns5oFNyGXxKYYrHe1ipG7gj6dN-c2JJ6g@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 04 Aug 2025 09:22:47 +0200
Message-ID: <877bzjo8jc.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_002253_556735_30FCFD82 
X-CRM114-Status: GOOD (  19.25  )
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

On 01/08/2025 at 15:22:20 -05, Rob Herring <robh@kernel.org> wrote:

> On Fri, Aug 1, 2025 at 9:27=E2=80=AFAM Miquel Raynal <miquel.raynal@bootl=
in.com> wrote:
>>
>> Hi Rob,
>>
>> Sorry for the delay, I don't know why I forgot these.
>>
>> ...
>>
>> > +properties:
>> > +  compatible:
>> > +    enum:
>> > +      - marvell,armada-ap806-thermal
>> > +      - marvell,armada-ap807-thermal
>> > +      - marvell,armada-cp110-thermal
>> > +
>> > +  reg:
>> > +    maxItems: 1
>> > +
>> > +  interrupts:
>> > +    description: overheat interrupt
>> > +    maxItems: 1
>> > +
>> > +  '#thermal-sensor-cells':
>> > +    description: Cell represents the channel ID. There is one sensor =
per
>> > +      channel. O refers to the thermal IP internal channel.
>> > +    const: 1
>> > +
>> > +required:
>> > +  - compatible
>> > +  - reg
>> > +
>> > +additionalProperties: false
>>
>> IIRC on these Marvell designs, there was one (or more, I don't remember)
>> Application Processor (AP) and several Co-Processors (CP).
>>
>> [On the AP]
>> The AP8XX overheat interrupt was not directly wired to the GIC but was
>> going through another intermediate IRQ controller named SEI (System
>> Error Interrupt).
>>
>>       Thermal overheat IRQ -> SEI -> GIC
>>
>> [On the CP]
>> There was one interrupt controller per CP11X named ICU, which would be
>> connected to the top level GIC through MSIs. The ICU was however split
>> into several sub-controllers reaching different areas on the GIC.
>>
>>                                       MSI
>>       Thermal overheat IRQ -> ICU SEI -> GIC
>>
>> As the OS could not guess the internal connexions, I believe we had to
>> include in the bindings the parent IRQ chip we were connected to. In the
>> case of the thermal over heat interrupts, they were all going through an
>> SEI controller (System Error Interrupt) which, if I still remember
>> correctly, was not the default parent, hence the use of
>> interrupts-parent/interrupts-extended in the examples.
>>
>> This is all a bit cloudy in my mind, but I believe these properties
>> matter and with 'additionalProperties: false' and without
>> interrupts-parent/interrupts-extended allowed, a real world DT
>> snippet would not pass the binding checks.
>
> 'interrupt-parent' is implicitly allowed anywhere. Who is the parent
> is outside the scope of the binding given it can vary.

Ok, good to know.

>> > +examples:
>> > +  - |
>> > +    thermal-sensor@80 {
>> > +        compatible =3D "marvell,armada-ap806-thermal";
>> > +        reg =3D <0x80 0x10>;
>> > +        interrupts =3D <18>;
>>
>> I do not know how accurate the example must be, but maybe the example
>> shall reflect the SEI connection as well.
>
> No one has cared about converting the Marvell bindings, so *shrug*.

I was still mentioning the same interrupt-parent property here ("the SEI
connection"), not how accurate the values were. So if we do not care
about interrupt-parent because it is allowed anyway,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for the conversion,
Miqu=C3=A8l

