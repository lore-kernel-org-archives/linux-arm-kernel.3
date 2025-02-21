Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F71EC021B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 23:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qffpqQkGhSqwojTraU7C604pn2LcGPlPbrQyW4A0DZc=; b=Gy4NO7ANJwCXwj8QCXfcWvroId
	Qzns6hpe/RIkWarLJ1w9QD+s1IjLNUYD9gn1qKhRfAymoWlp4sgKtgCIP5A+yfqvzNsQMBr0Bv5t4
	+hzJ4ARlaU8lVXmeqGfqs48UlYKOn6jnBKZ6gKjt+46yMH/EllFqEeOY6C9bhn4q+BjX81dicSvar
	jPsAyznGsFDJ/hfzHSkSOnRGB6JasIUNVtXu2Brw/dJntk1AYwlzduHfkTkxG0IovPzcXj2XaC/G0
	UMX9LklOIHTKpmPQ8gg4COGY5nYLdAkKJ9tK0VtFRlOa+v8cfqOOUUgBQPP3a66jf9YjWCWqTJc5E
	N3IQG6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcet-000000079cW-0aUo;
	Fri, 21 Feb 2025 23:42:15 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcdQ-000000079Tz-2V6u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 23:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE5B961474;
	Fri, 21 Feb 2025 23:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC6FC4CED6;
	Fri, 21 Feb 2025 23:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740181243;
	bh=OMCDVsQbn+5F1Lg61OuxMEK9sGVYuBuiegxwEU46gMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VoyY0X+yQSKVMby/G/x1/JrL2hCHNW6yv8JGE75JrTxe+fq9Unhw/+Vtj5yJcsRRs
	 pIgCcW1fyPhIWTyJTL5EkRhTkGlejWIiS/M9/Pm+JCpGw8w9kf08avnMFjFLAIG6/6
	 ziY0DWe9TR5E+ptGSkJe535KTcbsM8fRz68GVN5H9zX16ZRH7Ydiz8jVlxq1fXfRlt
	 GPZKYyYqVC1q/QWSdZOomG/Wr/bY3sS7RxivYIqJ0piVyyqATaDHKX+LQztzLh2l56
	 TtDX+njNQbwvSDUG3ZSoSV6TiKen1HYWKZ+qoubdcXNux+xgx8VtUtWwGgxBjcJUg5
	 62RjqvADws+Lw==
Date: Fri, 21 Feb 2025 17:40:41 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wilson Ding <dingwei@marvell.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, salee@marvell.com,
	gakula@marvell.com
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: Add Armada8K reset controller
Message-ID: <20250221234041.GA387671-robh@kernel.org>
References: <20250220232527.882888-1-dingwei@marvell.com>
 <20250220232527.882888-2-dingwei@marvell.com>
 <20250221-icy-flounder-of-potency-ee1a05@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-icy-flounder-of-potency-ee1a05@krzk-bin>
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

On Fri, Feb 21, 2025 at 09:46:01AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Feb 20, 2025 at 03:25:24PM -0800, Wilson Ding wrote:
> > Add device-tree binding documentation for the Armada8K reset driver.
> > 
> > Signed-off-by: Wilson Ding <dingwei@marvell.com>
> > ---
> >  .../reset/marvell,armada8k-reset.yaml         | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml b/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
> > new file mode 100644
> > index 000000000000..b9f7f3c24d3c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
> > @@ -0,0 +1,45 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2025 Wilson Ding <dingwei@marvell.com>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/marvell,armada8k-reset.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Marvell Armada8K reset controller
> > +
> > +maintainers:
> > +  - Wilson Ding <dingwei@marvell.com>
> > +
> > +description: The reset controller node must be a sub-node of the system
> > +  controller node on Armada7K/8K or CN913x SoCs.
> > +
> > +properties:
> > +  compatible:
> > +    const: marvell,armada8k-reset
> > +
> > +  offset:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Offset in the register map for the gpio registers (in bytes)
> 
> That's neither correct nor needed. Your device knows ofsset based on the
> compatible.

Or use 'reg'.

But really, just add #reset-cells to the parent node. There's no need 
for a child node here. The parent needs a specific compatible though.

Rob

