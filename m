Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C636BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 05:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiGtwoPUHm2LKcxW6fZx/3aamAm5XYlTqpOjgktt4wc=; b=M5BeUjRaAQmdo9lufe86ReueTN
	zLHyIERq4pnaSVPK4IfWkv/8BaO1rttnoiGeFHeyYCKDMfOWSrqMV1aukW/3BKdiIuYT9gy37736n
	qNiHHz/XSHQXZc9DugYgpxmgQvR7gb5rjcKKcLRnt6XDIVXWuOm3/iJ3Iw/glqBbusFt1ZpzJi3vq
	S/ii/gNf8iwKiS5bMS/IlJlxZlBzV2YNXnfASNy615GyLlK3UeMjBju86i4BnvaRAE2M2JnyB2x+O
	l6KCTPZ/kc9N5lJPoYobr5NUqvqT0Q0jlxyicAwADW+qRu//1Ubtbipwu6tPvVJfw+EXcY9gITh91
	nxAT32yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOq7a-0000000EDRo-1B4X;
	Mon, 18 May 2026 05:02:30 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOq7W-0000000EDR0-457f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 05:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779080541;
	bh=MiGtwoPUHm2LKcxW6fZx/3aamAm5XYlTqpOjgktt4wc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V537ku1DUKlUnpyvBfXQTRmZtwO0M9khnjhFoZkwPTTuzgNGZqasZSPR5Te2AfLL8
	 ItvG8QguMR+XGSAv6MWwz3a0bet/9Lp/HiNboJXGR/8CJ80lkx3QfL3epnsseycq8S
	 0h/zIuGQjFnu8hhGLLhBePg9654iI5vzrPDdYjeRcyX06qP/srM8ht6XAnce+hZAAY
	 Z6xFiVbkR9MFSXnPOsYGwZ2UvL3Nu5uKIvmgXcSTkKsm88+hWVyef070efjPirRHbb
	 XWHGtVvqACFfk4jEQW17pzudzceTavrZNNDrg8d/AtrJ0kpi/Ka7eqeQgBnaeLz2ab
	 cUPr/h6oqO78g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A23266025D;
	Mon, 18 May 2026 13:02:19 +0800 (AWST)
Message-ID: <23203c124a158536c272d1bffb2657a0d713f8ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and
 bindings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Lee Jones <lee@kernel.org>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Date: Mon, 18 May 2026 14:32:19 +0930
In-Reply-To: <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
	 <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_220227_211715_EEFCCEC7 
X-CRM114-Status: GOOD (  18.82  )
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

Hi Dawid,

On Mon, 2026-05-11 at 16:14 +0200, Dawid Glazik wrote:
> On 4/24/2026 10:20 PM, Dawid Glazik wrote:
> > This series reworks and resubmits AST2600 I3C DTS updates that were
> > originally posted in 2024, but stalled without further upstream
> > progress.[1] The series was rebased onto the current tree and merge
> > conflicts were resolved.
> >=20
> > The patches first move I2C controller nodes under the APB simple-bus
> > for layout consistency, then document aspeed,ast2600-i3c-global in
> > the syscon binding, and finally add AST2600 I3C controller nodes in
> > aspeed-g6.dtsi.
> >=20
> > Jeremy agreed in a separate email thread that I can continue this
> > series under my authorship.
> >=20
> > Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c=
88e.1714647917.git.jk@codeconstruct.com.au/
> >=20
> > Dawid Glazik (3):
> > =C2=A0=C2=A0 ARM: dts: aspeed-g6: move i2c controllers directly into ap=
b node
> > =C2=A0=C2=A0 dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global co=
mpatible
> > =C2=A0=C2=A0 ARM: dts: aspeed-g6: Add nodes for i3c controllers
> >=20
> > =C2=A0 .../devicetree/bindings/mfd/syscon.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 543 ++++++++++--------
> > =C2=A0 2 files changed, 318 insertions(+), 227 deletions(-)
> >=20
> >=20
> > base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
>=20
> Hi all,
>=20
> Gentle ping for this series:
> https://lore.kernel.org/all/cover.1777058942.git.dawid.glazik@linux.intel=
.com/#t
>=20
> I received Reviewed-by from Krzysztof Kozlowski (thank you).
> Could I please get feedback/ack from maintainers on the remaining parts,
> especially ASPEED DTS?
>=20
> If preferred, I can respin/rebase the series.
>=20

Sorry for the delay.

Given Krzysztof's R-b tag for patch 2 I've applied 3 (along with 1) to
the BMC tree. Patch 2 should be picked up by Lee through the MFD tree.

Cheers,

Andrew

