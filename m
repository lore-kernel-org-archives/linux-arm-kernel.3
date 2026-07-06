Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26F7C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4G2+USFAeZTDisSq/eM4nDWS0t6QootkKLNwL7GEI6s=; b=j9Dkn9sbQm9q8tD4H4kEBh/ers
	PiR/hAw6G8G70CgzgHCwXvVlQopgAjNENIjgPvw0e/Y5TkMCyxj2xz+Pz2yB1rqpWxxaZHRM6RRk+
	I5me6IN+QxZmyx2kfxJPk4XcSU8iiYRql0VG85ZLxLl3o+2y3vvB3xjsPt+kJyu/yvtBIuyu9gJBt
	kBKcp66KAf+dFxKsdVJOpsWfwli8F/lJqCYWqrOMkW/e9hoeLY4LVLRktd4x269cmH9ZTta3AZ7Kj
	IzblmXasxg3Hde/wZ1HoNsAqfM0GgoArUvicIi+GC0cuqirMMr9iI0gjb8h4SbMMopQGG/s8q1tZ/
	lfWtYvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf0R-0000000Btb1-2DiX;
	Mon, 06 Jul 2026 08:48:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgf0N-0000000BtYM-1tjf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:48:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29905C8EC65;
	Mon,  6 Jul 2026 08:48:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17D68601A2;
	Mon,  6 Jul 2026 08:48:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6922C11BB9D9D;
	Mon,  6 Jul 2026 10:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783327717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4G2+USFAeZTDisSq/eM4nDWS0t6QootkKLNwL7GEI6s=;
	b=gW1AZif3NdWuwJpcaSREpPyyzuzLVd6yQeWN/RWYlglDm0RwfTJdyVqzGj2HaxYgqGb15r
	SI5y5Jtp6apxHnFT3jd5CKjLqUDoukQNNZ6T47eGareIAu+Vj0a+MwOm6j17N2t5v+Itsy
	I6bmUZdZ1Xn4YFbvDRlORuo/quhrnQyqTdRLXtYOMjuuevVQjLX7KR00jqSc/EHkmD812F
	LkIoPE9qnTCZ7hVcb36epMNvJ35G+b4CplTfizscLw+l9t4n6lh6SkRn5Ohq4SROCD5iVb
	iphsKW7hpvYrGOOv2tSBXA6qa3bHMKVscFwAojrisvLbZNZaqPgshagL764ZOw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 10:48:32 +0200
Message-Id: <DJRCWXDUGFY8.1AIUFSEBFTG94@bootlin.com>
Cc: "Qiang Zhao" <qiang.zhao@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 04/12] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-4-6c3e706e27dc@bootlin.com>
 <20260706-elfish-cornflower-bullfinch-604e0a@quoll>
In-Reply-To: <20260706-elfish-cornflower-bullfinch-604e0a@quoll>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014843_825061_03F40B19 
X-CRM114-Status: GOOD (  23.03  )
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

On Mon Jul 6, 2026 at 8:52 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 03:30:12PM +0200, Paul Louvel wrote:
>> Some QE GPIO pins have an associated interrupt line in the QE PIC to
>> signal state changes on the pin.  Add the corresponding
>> interrupt-controller / nexus properties to the QE GPIO binding.
>>=20
>> Because the GPIO controller does not perform any interrupt handling
>> itself, a nexus node (interrupt-map) is used to map each GPIO line
>> supporting IRQ to the parent QE PIC interrupt domain.
>>=20
>> As the QE PIC can be configured to generate an interrupt on either a
>> high-to-low transition or any change in signal state, three
>> interrupt-map entries are needed per GPIO pin that can yield an
>> interrupt (falling, both, and the "none" case which defaults to both in
>> QE PIC).  This overhead is necessary because the interrupt-map-pass-thru
>> property is not part of the DT specification.
>>=20
>> The interrupt-map property is optional: it is not required for GPIO
>> banks that have no interrupt capable GPIO line (e.g. port D on MPC8323),
>> or when interrupt functionality is not used.
>>=20
>> Update the example to show a scenario where each bank supports a
>> different numbers of IRQs, or no IRQs at all.
>>=20
>> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
>> ---
>>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 69 +++++++++++++++=
++++++-
>>  1 file changed, 66 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario=
-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-ba=
nk.yaml
>> index 1af99339ff40..0c849a5698f4 100644
>> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.y=
aml
>> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.y=
aml
>> @@ -27,6 +27,17 @@ properties:
>>    "#gpio-cells":
>>      const: 2
>> =20
>> +  "#address-cells":
>> +    const: 0
>> +
>> +  "#interrupt-cells":
>> +    const: 2
>> +
>
> If this has interrupt-cells, then it is a nexus, thus why isn't this
> also a "interrupt-controller"?

Because these these banks are not interrupt controllers.
Interrupts are handled by the QE PIC, and the GPIO controller does not do a=
ny
interrupt handling itself.
In this setup, does it really needs an "interrupt-controller" property?

>
>> +  interrupt-map:
>> +    description: |
>> +      Specifies the mapping of GPIO lines to the parent interrupt contr=
oller, as the
>> +      GPIO controller does not do interrupt handling itself.
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -37,9 +48,61 @@ additionalProperties: false
>> =20
>>  examples:
>>    - |
>> -    gpio-controller@1400 {
>> -        compatible =3D "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-par=
io-bank";
>> -        reg =3D <0x1400 0x18>;
>
> I don't get why you rewrite existing example instead of adding new one.

I could yes.

>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    pic: interrupt-controller {
>> +      interrupt-controller;
>> +      #address-cells =3D <0>;
>> +      #interrupt-cells =3D <2>;
>> +    };
>
> Drop node, irrelevant.
>
>> +
>> +    gpio-controller@1418 {
>> +        #gpio-cells =3D <2>;
>> +        #address-cells =3D <0>;
>> +        #interrupt-cells =3D <2>;
>> +        compatible =3D "fsl,mpc8323-qe-pario-bank";
>> +        reg =3D <0x1418 0x18>;
>
> And now you are not following DTS coding style.
>
>>          gpio-controller;
>> +        interrupt-map =3D <
>> +          7 IRQ_TYPE_EDGE_FALLING  &pic 4 IRQ_TYPE_EDGE_FALLING
>> +          7 IRQ_TYPE_EDGE_BOTH     &pic 4 IRQ_TYPE_EDGE_BOTH
>> +          7 0                      &pic 4 IRQ_TYPE_NONE
>> +
>> +          9 IRQ_TYPE_EDGE_FALLING  &pic 5 IRQ_TYPE_EDGE_FALLING
>> +          9 IRQ_TYPE_EDGE_BOTH     &pic 5 IRQ_TYPE_EDGE_BOTH
>> +          9 0                      &pic 5 IRQ_TYPE_NONE
>> +
>> +          25 IRQ_TYPE_EDGE_FALLING &pic 6 IRQ_TYPE_EDGE_FALLING
>> +          25 IRQ_TYPE_EDGE_BOTH    &pic 6 IRQ_TYPE_EDGE_BOTH
>> +          25 0                     &pic 6 IRQ_TYPE_NONE
>> +
>> +          27 IRQ_TYPE_EDGE_FALLING &pic 7 IRQ_TYPE_EDGE_FALLING
>> +          27 IRQ_TYPE_EDGE_BOTH    &pic 7 IRQ_TYPE_EDGE_BOTH
>> +          27 0                     &pic 7 IRQ_TYPE_NONE
>> +        >;
>> +    };
>> +
>> +    gpio-controller@1430 {
>>          #gpio-cells =3D <2>;
>
> So two new examples? But old one was wrong?
>
>> +        #address-cells =3D <0>;
>> +        #interrupt-cells =3D <2>;
>> +        compatible =3D "fsl,mpc8323-qe-pario-bank";
>> +        reg =3D <0x1430 0x18>;
>> +        gpio-controller;
>> +        interrupt-map =3D <
>> +          24 IRQ_TYPE_EDGE_FALLING &pic 8 IRQ_TYPE_EDGE_FALLING
>> +          24 IRQ_TYPE_EDGE_BOTH    &pic 8 IRQ_TYPE_EDGE_BOTH
>> +          24 0                     &pic 8 IRQ_TYPE_NONE
>> +
>> +          29 IRQ_TYPE_EDGE_FALLING &pic 9 IRQ_TYPE_EDGE_FALLING
>> +          29 IRQ_TYPE_EDGE_BOTH    &pic 9 IRQ_TYPE_EDGE_BOTH
>> +          29 0                     &pic 9 IRQ_TYPE_NONE
>> +        >;
>> +    };
>> +
>> +    gpio-controller@1448 {
>> +        #gpio-cells =3D <2>;
>> +        compatible =3D "fsl,mpc8323-qe-pario-bank";
>
> Wait, three examples? But isn't this the same as previous one?

I wanted to outline that each bank do not have the same number of GPIO line=
s
that support interrupts.

>
>> +        reg =3D <0x1448 0x18>;
>> +        gpio-controller;
>>      };
>>=20
>> --=20
>> 2.55.0
>>=20

Thanks,
Paul.




--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


