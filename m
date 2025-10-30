Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DC5CCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 06:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUv49txHvrAzjdgWs80ani5/jiFVnH1I1J/VQnA/JbY=; b=XIBvI++Bx8aq5qvkrpTEujW2rB
	4/Vm6SHbU/8eAYQnp/04YrG7F6CjWObJ3DiT47BQMSpIQArni+IVKYiNdBHdlOIbGQoBS4ubVOkaQ
	lsgT1Sv9lMOcDECSnJwIznCkdXngqx12qn7jpCrf1MydUjAFectkpXBlH4odcNeu49erzysgEdvRR
	ML0IrFTr6uVjhyr300+5KOhy6Phz8zszkxyZddMSbUyhKUBEanNflGrbEBT/MrWhJnl9wBZPPlxNd
	tL05DlVSoK0+xYFtRVKPHpTTRwyrm9q2YR7l0ejVumOVty2XsQzwMi2hcdJ6HYVCjojC3Nocs2L+S
	AsrmyOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELlv-00000003XeT-0kd6;
	Thu, 30 Oct 2025 06:04:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELlq-00000003Xdl-0YZW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 06:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761804259;
	bh=FUv49txHvrAzjdgWs80ani5/jiFVnH1I1J/VQnA/JbY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=VNcTJt4cIN2/f4WEgxABC6Id7AAblH/HICBg+PaRPVG+ji+iJv43te7VZKyYtZMc0
	 pAo0haH4Uqg1V7ki/IASKd0f6fTmhAjTQPBaRdNvvhiPp4SKWK2/Wtef+/9tCi/bpu
	 SAuz5YgVaLZUs8McGlWx9QY8lGAcCZbEKXtiJgFs9kLQx8d91MOSSTe20kKbNvG8Gz
	 ORlORw1Rl+GSloNCrshWXebTlQd4lb6hWFM8dpxutMHVJivq0uBOvyemIq2DTUI/wy
	 c14EsHCY/aQmvBRPlJ1UqMfYHPCxTPgn3AR9FUKjEKg8TdbuHO+GEtWmqQTIUeidhm
	 IMbhNU3/dSQYQ==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 59CA379118;
	Thu, 30 Oct 2025 14:04:18 +0800 (AWST)
Message-ID: <0b9abd87b877595c13011a3d8b4e80e05488effc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v21 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>,  bmc-sw@aspeedtech.com,
 benh@kernel.crashing.org, joel@jms.id.au,  andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Thu, 30 Oct 2025 14:04:18 +0800
In-Reply-To: <59d4d107-4f35-4906-8524-f45b9b85f0ff@kernel.org>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
	 <20251027061240.3427875-2-ryan_chen@aspeedtech.com>
	 <59d4d107-4f35-4906-8524-f45b9b85f0ff@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_230426_387565_56766ADF 
X-CRM114-Status: GOOD (  14.13  )
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

Hi Kyzysztof,

> > +++ b/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/ast2600-i2c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED I2C on the AST26XX SoCs
> > +
> > +maintainers:
> > +=C2=A0 - Ryan Chen <ryan_chen@aspeedtech.com>
> > +
> > +allOf:
> > +=C2=A0 - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2600-i2c-bus
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 minItems: 1
>=20
> <form letter>
> This is a friendly reminder during the review process.
>=20
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion
> and
> either implement all requested changes or keep discussing them.
>=20
> Thank you.
> </form letter>
>=20
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: address offset and range=
 of bus
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: address offset and range=
 of bus buffer
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
>=20
> Nothing improved

That was mostly the point - this first patch just splits out the 2600
definitions to the new file, with zero change.

That means the *actual* changes to the binding are visible via the diff
in 2/4, and not hidden by the copy.

This was mentioned on v20, and you replied saying it was irrelevant to
the separate discussion around the rationale for the change, but didn't
object to the split-patches approach.

If your preference is to *not* do this via a verbatim copy as an initial
step (and essentially squash with 2/4), that's also fine, but I'm sure
that knowing your preference would help Ryan out here.

Cheers,


Jeremy

