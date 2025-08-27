Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA66CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgYviQ928N44tOhN8cqLF0bpgn7tKCcF4t8AwwoD1xM=; b=PXrwh1xp3OvDRpvqOTi6cFA2KX
	BcsQzfK2ahatbtUbZPpPbHoWCDv9S2trOg3ao1hfPk8W6F6icGDLUkwzrk/K/1CbcqjmEf6m0wGBI
	qM+2Nurv2UO9uopkoSkbpMTqoOYm2KDbO8OE3sad6kSY+OrAJY1O71SBcwp98ulwNpLJJO5ExBaur
	pJ9MDz0bGSGtGVzjG2H4i1mV0D9Cax5rBU2XZNt4NJcvZTZsFVnbMQhqlnyiAH+PlMRMwhTYxhNt7
	NOxlJ1ub2GvcLOCE18Ip5e8a9V8kp3A8QbpGZOmWeSHIJiicw2yd5Mpg+MMgrjgK2f38uZJdyn3Fb
	lsjF/4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDza-0000000F9js-3pKy;
	Wed, 27 Aug 2025 11:07:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urC4u-0000000EmCt-10HQ;
	Wed, 27 Aug 2025 09:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756285462;
	bh=+RpJe2xt313pvzyWmm1FpG9QmaJsYu4M/l2cej6ESFQ=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=BYm4kJGYABV9d0yv5RsVER1mkHTkqzdDJMBn5MibYf4CqzzMMNTwJ2TDcKxkUSBpE
	 Vv9//c8jVzXKNxCN1LWQVju6BWkiMIaxIwy+0NC5RWrCkW4QlwYNxxphTXOJ22ELsm
	 fB1qs7gwU0S5ZLfQTaYx7fF+5z4wQ0sls8HvbEzDR51btkyoqKx45JaR3ka3D8clc5
	 CU/5LCboWVyHEbRqUq/PShhhBEqBvL1vWi6xVtZAJK0JchhjyxR5+bt+3losqxisWm
	 zQzOFhPL6e3DIrUz6u1TIZAQz9SvHFTmCEtntcw2PuRUtv1wVSoS7mpMNStrIadIB1
	 oAlF6H3fE3ACg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7513D17E0676;
	Wed, 27 Aug 2025 11:04:21 +0200 (CEST)
Message-ID: <3e0d30b1d717c8788aa95eb045a034c18e33c88e.camel@collabora.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8395-nio-12l: add
 support for blue and red LEDs
From: Julien Massot <julien.massot@collabora.com>
To: kernel@collabora.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Louis-Alexis Eyraud
 <louisalexis.eyraud@collabora.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 	devicetree@vger.kernel.org
Date: Wed, 27 Aug 2025 11:04:20 +0200
In-Reply-To: <20250827-psychic-exclusive-be9758124693@thorsis.com>
References: <20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com>
	 <20250826-radxa-nio-12-l-gpio-v2-3-7f18fa3fbfc8@collabora.com>
	 <20250827-psychic-exclusive-be9758124693@thorsis.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_020424_433672_2835AE02 
X-CRM114-Status: GOOD (  20.38  )
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

Hi Alexander,

On Wed, 2025-08-27 at 09:40 +0200, Alexander Dahl wrote:
> Hello Julien,
>=20
> Am Tue, Aug 26, 2025 at 04:01:54PM +0200 schrieb Julien Massot:
> > The Radxa NIO 12L board has an RGB LED, of which only red and blue
> > are controllable.
> >=20
> > Red and blue LEDs: no need to choose, both are enabled.
> >=20
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../boot/dts/mediatek/mt8395-radxa-nio-12l.dts=C2=A0=C2=A0=C2=A0=
=C2=A0 | 31
> > ++++++++++++++++++++++
> > =C2=A01 file changed, 31 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > index
> > fd596e2298285361ad7c2fb828feec598d75a73e..12288ad4d2932b7f78c96c0efe36
> > 6a046721f919 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> > @@ -10,6 +10,7 @@
> > =C2=A0#include <dt-bindings/gpio/gpio.h>
> > =C2=A0#include <dt-bindings/input/input.h>
> > =C2=A0#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/leds/common.h>
> > =C2=A0#include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> > =C2=A0#include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> > =C2=A0#include <dt-bindings/spmi/spmi.h>
> > @@ -73,6 +74,28 @@ button-volume-up {
> > =C2=A0		};
> > =C2=A0	};
> > =C2=A0
> > +	gpio-leds {
> > +		compatible =3D "gpio-leds";
> > +		pinctrl-0 =3D <&gpio_leds_pins>;
> > +		pinctrl-names =3D "default";
> > +
> > +		/*
> > +		 * This board has a RGB LED, of which only R and B
> > +		 * are controllable.
> > +		 */
> > +		led-0 {
> > +			label =3D "rgb-blue";
> > +			color =3D <LED_COLOR_ID_BLUE>;
> > +			gpios =3D <&pio 6 GPIO_ACTIVE_HIGH>;
> > +		};
> > +
> > +		led-1 {
> > +			label =3D "rgb-red";
> > +			color =3D <LED_COLOR_ID_RED>;
> > +			gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
> > +		};
>=20
> The label property is deprecated, and if I'm not mistaken not
> recommended for new boards.=C2=A0 Do you have a reason to set it?
> If so, it might be worth adding in the commit message.

No, I just wasn=E2=80=99t aware of the deprecation, but I can now see
it in the common LED binding.
I=E2=80=99ll wait a bit for any other potential reviews and then resend
the patch without the label. The LED will then appear as 'blue'
instead of 'rgb-blue' in sysfs.

Regards,
Julien

