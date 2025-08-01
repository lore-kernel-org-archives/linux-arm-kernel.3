Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB582C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuY6/HSh6y6ghHTCNicd1M2f7zD07d8qiGFWh9pxQfI=; b=EmbRxpfHfg/iBujqaw0LVyM5fd
	jW+dULLLbZGRFNgtGoXCQiuiY7f+JQJC3+sHIZvQpqVsFNHgXxosgdq/6eZ+iWJB3XEg9lwRwl2vr
	6Vw/b/IPkmWxEY/XI1hIZKvj/B/XnSqNMMHEvw6OfYjZYcrf1EC1anSF/Yp+eeR7IWAwHIXwKMDDG
	EFlFuApkJDnwhCb1qB/LmZA8PnO0ReHppSm5Iqu5uusXo2S7v4WeqAi2524QV6yUovs0StyGNLuho
	Ow712Gk0UiaQBabvVW5Zu7okdOGqAakwUbtHrRQbSwFs+TYFp2GhZCLqBzETmxMdpuuI5ksMDw9Ln
	YiVUyIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqmC-00000006EnO-1Kn8;
	Fri, 01 Aug 2025 14:30:28 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqjN-00000006EQq-0TJn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 14:27:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE2D543A21;
	Fri,  1 Aug 2025 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754058450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuY6/HSh6y6ghHTCNicd1M2f7zD07d8qiGFWh9pxQfI=;
	b=ZmTgxucd39smaH/63V7RsE58gOzzqQ5Y8ChKpgAh9cG91AS41UvRS9kxFs8Fj4KuJTvA6b
	S4qm9JfQKAh7Aqn3xQzw8XXQthOl+EndZRmQqP5S5eXV2d0vEGKWjiBh2Az6Hq+dXFe3fd
	cIC//AjIRyiCLJYZWTXIB06x9jqcnw6WJH5yfGvMmB2X3UG7zWAniVIP8WuqaZmBF0bHBw
	179HcSPCxGV93V8ji/1GPDNBUT+6k6DkvFrv+jxE/wY5aZGycvl77q0k2fJhSfFA7+c/19
	L5Z+U8yvTR1OPCAsf9cOpoKTjyeFy7Vd1WdSCXfkRIvihR1LEMLxPxS7/HfdrA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Daniel Lezcano <daniel.lezcano@linaro.org>,
  Zhang Rui <rui.zhang@intel.com>,  Lukasz Luba <lukasz.luba@arm.com>,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-pm@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] dt-binding: thermal: Convert
 marvell,armada-ap806-thermal to DT schema
In-Reply-To: <20250702230030.2892116-1-robh@kernel.org> (Rob Herring's message
	of "Wed, 2 Jul 2025 18:00:29 -0500")
References: <20250702230030.2892116-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 01 Aug 2025 16:27:28 +0200
Message-ID: <87qzxv5d7z.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgsrghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghrohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_072733_484774_DB19465B 
X-CRM114-Status: GOOD (  11.53  )
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

Hi Rob,

Sorry for the delay, I don't know why I forgot these.

...

> +properties:
> +  compatible:
> +    enum:
> +      - marvell,armada-ap806-thermal
> +      - marvell,armada-ap807-thermal
> +      - marvell,armada-cp110-thermal
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: overheat interrupt
> +    maxItems: 1
> +
> +  '#thermal-sensor-cells':
> +    description: Cell represents the channel ID. There is one sensor per
> +      channel. O refers to the thermal IP internal channel.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

IIRC on these Marvell designs, there was one (or more, I don't remember)
Application Processor (AP) and several Co-Processors (CP).

[On the AP]
The AP8XX overheat interrupt was not directly wired to the GIC but was
going through another intermediate IRQ controller named SEI (System
Error Interrupt).

      Thermal overheat IRQ -> SEI -> GIC

[On the CP]
There was one interrupt controller per CP11X named ICU, which would be
connected to the top level GIC through MSIs. The ICU was however split
into several sub-controllers reaching different areas on the GIC.

                                      MSI
      Thermal overheat IRQ -> ICU SEI -> GIC

As the OS could not guess the internal connexions, I believe we had to
include in the bindings the parent IRQ chip we were connected to. In the
case of the thermal over heat interrupts, they were all going through an
SEI controller (System Error Interrupt) which, if I still remember
correctly, was not the default parent, hence the use of
interrupts-parent/interrupts-extended in the examples.

This is all a bit cloudy in my mind, but I believe these properties
matter and with 'additionalProperties: false' and without
interrupts-parent/interrupts-extended allowed, a real world DT
snippet would not pass the binding checks.

> +examples:
> +  - |
> +    thermal-sensor@80 {
> +        compatible =3D "marvell,armada-ap806-thermal";
> +        reg =3D <0x80 0x10>;
> +        interrupts =3D <18>;

I do not know how accurate the example must be, but maybe the example
shall reflect the SEI connection as well.

> +        #thermal-sensor-cells =3D <1>;
> +    };

Thanks,
Miqu=C3=A8l

