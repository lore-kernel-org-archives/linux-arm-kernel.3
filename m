Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC9DC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBwjIZDKfun2zrL9E4dNc/T4J4zF9FUO6dKyh0B3FjE=; b=EnRGMC+HDSOhWNL44Yf1eixNE2
	IezWPE9Ej2ObTgV9v9HFkq21MtybcKHuS3Ru2xMrpFXFw+i9jebzarr9LmBKFb87gK8tmPZzZVUwE
	H54mBGRngnjIrXGEYjZ2VScB5eXKBjmtyc+Z3iGeXyMK6nJjszY/FhQ8Gan8AjOhTb7hsPonire7z
	MHixrFbfFGoFlGYRRYo00CAHffkH9GLkXul1UyYrvxlKx63GhJGRy7XFqtB7jHnqyJ7sGOBc3ohSH
	p5CMGuf1f8EzjzcGrOML5zmK3aMVyPwyqifiTAd7ozfY0fulmTOtDiolqrcvzA4nDYeJ4lhVb4ePD
	SqGIp3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OW6-00000008cfw-0M5A;
	Wed, 23 Sep 2026 15:04:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OW3-00000008cf6-3ncX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:04:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05DCA6021A;
	Wed, 23 Sep 2026 15:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCBE1F000FF;
	Wed, 23 Sep 2026 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790175850;
	bh=EBwjIZDKfun2zrL9E4dNc/T4J4zF9FUO6dKyh0B3FjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NCTa9NLGFZRIWCIe1CzcwAWNx7b/8EYkY9lKFagdQvCwYIz1XSrjFaGXEfivEPSLU
	 gBd3eFL9t7JZe4K0Yl4ZIcd+TjgH2//fXhi6us4SKoiZCm47DsxM7KsADJHMjGaYzr
	 pT2eWqe4Eqi7+uRBsFkAb1Urxra6w+zsdncC94Z5QsPIUZHUxpZ9lU6Pmenn+DGn8H
	 bDrww/sOyZMwE8vYh5YMlskX8zEYJC7v6N//s7ec/rH8uAVa6HSZ1bgafifYO/nHG0
	 hXXoUItPc2Q/ofoWzq2WPhauKOz3DpRUV3Av+ltK877NQzYa/aGbX6TwBcHtJVHeg4
	 G5KXF3IlLDSHQ==
Date: Wed, 23 Sep 2026 10:04:09 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Message-ID: <20260923150409.GD27237-robh@kernel.org>
References: <20260921232540.3128596-1-robh@kernel.org>
 <20260922-cheer-reference-c31fc6fb946d@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-cheer-reference-c31fc6fb946d@spud>
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

On Tue, Sep 22, 2026 at 07:06:02PM +0100, Conor Dooley wrote:
> On Mon, Sep 21, 2026 at 06:25:39PM -0500, Rob Herring (Arm) wrote:
> > Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board. The
> > node only contains the compatible string and one register window on the
> > local bus.
> > 
> > Assisted-by: LLM
> 
> Guidance to the LLM should probably include including the reason that
> this is being added to the commit message.

Not sure what you are looking for... I told it to convert all the .txt 
bindings to schema. Then I told it fix all the errors. Then I fixed some 
things throughout the 900 commit branch upstreaming things bit by bit.  
Then it mostly sat for a year and I told a new model to review them and 
fix these common problems a, b and c. Then I said fix all the 
dtbs_checks warnings on arm64. Then I said there's still warnings, do it 
again. Repeated that ~10 times. Now I'm going thru to weed out all the 
wrong and sometimes unnecessary changes.

So LLM did all the easy parts and I did everything that requires any 
judgement. The hardest part is typically just figuring out the 
correct maintainers...

> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
> > new file mode 100644
> > index 000000000000..f9d48b871a4b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
> > @@ -0,0 +1,35 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/hisilicon/hisilicon,hip05-cpld.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HiSilicon HIP05 CPLD registers
> > +
> > +maintainers:
> > +  - Wei Xu <xuwei5@hisilicon.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: hisilicon,hip05-cpld
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    local-bus {
> > +        #address-cells = <2>;
> > +        #size-cells = <1>;
> > +
> > +        cpld@100000000 {
> > +            compatible = "hisilicon,hip05-cpld";
> > +            reg = <1 0x0 0x100>;
> 
> Also what's with this example? 1 0x0 0x100 should be 0x1 0x0 0x100?

Shrug. Sure. Honestly, I think the example can just be dropped.

I'm converting all the crap no one cares enough about to convert. That's 
pretty much all of the HiSilicon stuff. Mediatek needs some renewed 
public shaming too. I only care about getting arm64 down to no warnings.

Rob

