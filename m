Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFFDC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rm/KaI4gS5txCax60X3cOFqmUOa0+shLoOnPWo3LZg4=; b=id4UAee8KSs4C+f83wPY0s51wo
	Trcjj4Id1GUMon1t6l51qkXUHyegsTd9lOEiimldYNBBrNA9xWertCYErqaDg+cw6qXtVII7Lbb0Z
	o3f4b52MieaT+138uZe47OrYzxF5ByO/mNcq9U3+YOPgquPl7BExz9tbcmY/POBQjX+ZQjqrpb0s1
	4zeJXwrzWmGlCTEkGB8dul3IC6kJeSOUgR104oTWJQjhpoKp5Rn3xVS2W/aMBS5R2dFDxs/4sKtiU
	kIc/sZGhrjZveh/fGLNjy1gk8TuA3pq/40GM2nM6v5hW/NNjkLt5YX7QB7nNOa1yeI6b17MRUBe/N
	cgj/4f+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukT7P-00000003YuB-3ykX;
	Fri, 08 Aug 2025 19:51:11 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukT4s-00000003Yis-2mlj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 19:48:36 +0000
DKIM-Signature: a=rsa-sha256; bh=rm/KaI4gS5txCax60X3cOFqmUOa0+shLoOnPWo3LZg4=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1754682419; v=1; x=1755114419;
 b=Gr2Alh4hi11EAN9rear4dDOE8QlaR46SNQPsFD1ooegKRm0HJHYnFWdUO9dBzTAtGiENCnPM
 huKFchm21m8KKgRpiQItKnlXXQDpE80TXeVrwL2HUT8EpOrgrv2g2D3/zqdBH3cPO/qFaOEtuKk
 oY7LL1TFJB9sCPodsO66g3HWZeR+Tv1Len1w/BvMvToZbblZG4k3kJQY8n//8yTuBFcwHdikJUN
 ssJk/LQlEjCXtiG/hpDsFSVMqhJPwPf1tlX++/avZQObwj3Oibn5qL4bFFm2HQ0LRDzFeRj4UmC
 kkzB0oBE0bugbMVT1WJnhN5pklZ8atDGCn8ZRWUbwzF6w==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id ca151574; Fri, 08 Aug 2025 21:46:59 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Wronek <david@mainlining.org>,
 Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH RFC 2/5] dt-bindings: power: Add Marvell PXA1908 domains
Date: Fri, 08 Aug 2025 21:46:58 +0200
Message-ID: <2017616.PYKUYFuaPT@radijator>
In-Reply-To: <20250808-portable-expert-turkey-4f8f19@kuoka>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
 <20250806-pxa1908-genpd-v1-2-16409309fc72@dujemihanovic.xyz>
 <20250808-portable-expert-turkey-4f8f19@kuoka>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_124835_452146_0CF6BE43 
X-CRM114-Status: GOOD (  15.71  )
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

On Friday, 8 August 2025 09:34:54 Central European Summer Time Krzysztof Ko=
zlowski wrote:
> On Wed, Aug 06, 2025 at 07:33:21PM +0200, Duje Mihanovi=C4=87 wrote:
> > +          A number of phandles to clocks that need to be enabled during
> > domain +          power up.
>=20
> This does not exist in your example, so it is just confusing.

This is because I have not implemented any of the clocks used by the
domains at this moment.

Actually, I am not sure anymore whether it is necessary to assign
clocks to the domains as I have just yesterday successfully brought up
the GPU with some out-of-tree code and that did not require giving the
domains any clocks even though the vendor kernel does this. Should I
just go with that and drop all clock handling from the power domain
driver, at which point there would be no need for the individual domain
nodes? If not, how should I in the future assign clocks to the domains?

> > +examples:
> > +  - |
> > +    #include <dt-bindings/power/marvell,pxa1908-power.h>
> > +
> > +    clock-controller@d4282800 {
> > +      compatible =3D "marvell,pxa1908-apmu", "simple-mfd", "syscon";
> > +      reg =3D <0xd4282800 0x400>;
> > +      #clock-cells =3D <1>;
> > +
> > +      power-controller {
> > +        compatible =3D "marvell,pxa1908-power-controller";
>=20
> No address space, so this should be folded into the parent.

By this, do you mean that the clock driver registers the power domain
controller through devm_mfd_add_devices()?

Regards,
=2D-
Duje



