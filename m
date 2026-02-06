Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B1BEB28D4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zxvmzGfn77oMv8f/L64ck9Alqnf3zfR2ACLTuFHnTY=; b=ITZIBT5zxAjX91efV2/etC+loQ
	PJ/xYRIrR7Dtmis/j6a2fZIG4nJrQ+TEGflCzqH2AZn/8SF9xou1Vaf3Asm6ZqyQ0xpKrUleQlyGP
	G/ktNbfFO4CQoJjs0K0kOvR88EfPYKpdShfgKg+0bN/Y5Uq7iIYAX39uZI7wUXrkXdETBMFKE9TnK
	OZzh48oyaThV4X/WuVpnC0FPyvINcMzZXDAepKnWXNEfwaKctES6qJldtGX2DeFyF47A7kLrsfqBp
	3QruZ86f5z7gDfR7mIOQ16oT1xEltU1+ZfwcDKe11ryTDlO1HyX8aOUyL5ZVGWUGAvK2F8CJC0Q7O
	tPJqlk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voG8L-0000000Aysl-35pW;
	Fri, 06 Feb 2026 07:20:05 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voG8I-0000000Ays3-3Agf;
	Fri, 06 Feb 2026 07:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770362389;
	bh=6zxvmzGfn77oMv8f/L64ck9Alqnf3zfR2ACLTuFHnTY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XWfbtXZm184np09WhKFbaS0tWU1bijU/u7H3sLzCqp6rN9cBQBa9Welim19zq4OMT
	 xNE/+2j79PCI3RUrr0jqrqIUlEEdMKYQciDfgz391kQPC/2+MDN/yUS/9tgkuy8BKE
	 ZhNsoVLmBI54+0px9u9Foyq+j5pCq1zen8Bfll7lWOsgK/r65nDuZUbCQTJHGAyBSC
	 XWt2G4aS1aKN4SfpWS0dBkC0gTwQS2YENwPCQIOT53goAVv0BA/YqUbgAO9YKk/W5Z
	 jPPrMxwQ9I3vna6TtqmaxfZPhdmmnkvxUi/Gy1trFnzR6p+Ddy8+DDtGX2Bruf12uX
	 12zv2rnFODgrw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B90EC6015A;
	Fri,  6 Feb 2026 15:19:45 +0800 (AWST)
Message-ID: <6de719dc84324166ed60bb8ec130cf2c9ef351f5.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/4] Add AST2700 INTC0/INTC1 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti	 <alex@ghiti.fr>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org"	 <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"	
 <linux-aspeed@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"	
 <linux-riscv@lists.infradead.org>, Jeremy Kerr <jk@codeconstruct.com.au>
Date: Fri, 06 Feb 2026 17:49:44 +1030
In-Reply-To: <d5e45c9f-f3c7-4289-8991-02bd2c5b9587@kernel.org>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
	 <20260205-intrepid-vengeful-deer-14e2eb@quoll>
	 <TY2PPF5CB9A1BE69B07F90DFB245FAB735DF299A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
	 <d5e45c9f-f3c7-4289-8991-02bd2c5b9587@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_232003_035904_56ACFF3F 
X-CRM114-Status: GOOD (  36.43  )
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

Hi Krzysztof,

I've been working with Ryan to address what I considered some
shortcomings of the original approach. For reference, I outlined my
concerns on v4 of the previous series[1].

[1]: https://lore.kernel.org/all/1a2ca78746e00c2ec4bfc2953a897c48376ed36f.c=
amel@codeconstruct.com.au/

That reply proposed the new DT structure, and this series is a
refinement & implementation of those ideas

With that context:

> On Thu, 2026-02-05 at 10:56 +0100, Krzysztof Kozlowski wrote:
> On 05/02/2026 10:49, Ryan Chen wrote:
>=20
> > Subject: Re: [PATCH 0/4] Add AST2700 INTC0/INTC1 support
> >=20
> > On Thu, Feb 05, 2026 at 02:07:18PM +0800, Ryan Chen wrote:
> > > This series replaces the existing AST2700 interrupt controller bindin=
g
> > > and driver. The original implementation was focused on a narrow,
> > > PSP-centric view and could not fully describe the complexity of the
> > > AST2700 interrupt fabric:
> > >=20
> > > * It was focused primarily on the perspective of the Primary Service
> > > > Processor (PSP).
> > > * It could not handle interrupt route configuration.
> > > * It could not handle interrupt register protection.
> > >=20
> > > By contrast, the new bindings and drivers describe the interrupt
> > > controllers at the block-function level and provide a unified binding
> > > design that can be used from the perspective of any of the four
> > > integrated processors (the Primary, Secondary and Tertiary Service
> > > Processors, and the Boot MCU):
> > >=20
> > > Where and how did you address last feedback given to you here:
> > >=20
> > > https://lore.kernel.org/all/20250814-auspicious-thundering-jaybird-b7=
6f4f@ku
> > > oka/

At this point the answer is that there wasn't a direct response.

I acknowledge that I'm not Ryan, and that it is important that he
responds directly to queries on his own patches. However, with the goal
of having an upstream binding that better represents the hardware
(along with a capable driver), I've pulled the concerns out of your
linked feedback for discussion below.

> > +  +-----+   +---------+
> > +  | GIC |---|  INTC0  |
> > +  +-----+   +---------+
>=20
> Same problem as last time. This tells me intc0 has not children...

...

> > +            +---------+
> > +            |         |     +---------+
> > +            | INTC0_11| +---| INTC1   |
> > +            |         |     +---------+
>=20
> ...This tells that inc1 has no children (only intc0_11, which you said
> is aspeed,ast2700-intc-ic !!!)....
> (keep scrolling)

...

> > +patternProperties:
> > +  "^interrupt-controller@":
>=20
> ... but this tells me that intc0 and intc1 has children.

...

> > +        intc0_11: interrupt-controller@1b00 {
> > +          compatible =3D "aspeed,ast2700-intc-ic";
> > +          reg =3D <0 0x12101b00 0 0x10>;
>=20
>=20
> ... and that's quite wrong unit address. Also no resources in the
> parent, so this entire split seems superficial and incorrect.

This gets to the heart of it. I share the view that the split was
superficial. It tried to recombine existing components to account for
some change in hardware design between early revisions of the AST2700
SoC. The original binding from Kevin was too fine-grained.

I don't think the design of the diagrams helped the cause for
understanding the proposed binding or the hardware architecture, and
were misleading in the manner you outlined in the comments above.

My reply at [1] above was an (indirect) attempt to address your
concerns, though again I acknowledge I'm not Ryan and that review
feedback needs direct responses from patch authors.

The binding proposed in this series eliminates the subnodes and enables
a complete implementation of routing for the hardware, as demonstrated
by the proposed drivers. I think it better conforms to the documented
DOs and DON'Ts for writing bindings by moving anything implied by the
compatible to the driver implementation. I hadn't yet merged the base
arch patches for the SoC because I had contentions with the already-
accepted binding, and merging the arch patches would make an already
difficult job of reversing that acceptance harder again.

In essence, this is some pain, but I view it as pain on the path
towards better DTS outcomes than we had for prior generations of ASPEED
BMC SoCs.

> > >=20
> > > "This binding is not improving. You are not responding to REAL proble=
ms
> > > described to you. What's more, you send it in a way making our life
> > > difficult, look:"
> > >=20
> > > So how did you make our life easier now?
> >=20
> > Hi Krzysztof,
> >=20
> > Thanks for your feedback.
> >=20
> > The series you commented on in Aug 2025 (v4 1/2) attempted to model
> > The hardware by introducing parent compatibles (aspeed,ast2700-intc0 /
> > aspeed,ast2700-intc1) with child "interrupt-controller@" nodes using
> > aspeed,ast2700-intc-ic. In hindsight, that approach did not align well
> > with the actual hardware structure and resulted in inconsistencies
> > between the diagrams, the schema, and the register layout (including
> > unit-address issues). It was also difficult to review in isolation.
>=20
> Read my question again:
>=20
> "So how did you make our life easier now?"
>=20
> And then read the earlier comment - what I expected of you. Please
> answer these after the "look:" part.
>=20
> Answer these please. I am not going to review any of these because you
> keep ignoring our process of handling patches and not really responding
> to review comments.

For what it's worth, Ryan has adopted b4 and so hopefully some of the
expectations around the mechanics of patch review are less of a
concern.

In this specific case, because of the divergence in direction, we went
with a separate series. The failure to link that earlier series in the
cover letter was an unfortunate oversight. I'll take responsibility for
that, as part of developing the series with Ryan.

Sorry for causing you frustration.

Is it acceptable if we take the following actions:

   1. Do some b4 magic to transplant this series back onto [1]
   2. Send a follow up revision with a link to this discussion in the
      cover letter

Andrew


