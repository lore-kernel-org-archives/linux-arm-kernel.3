Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85EBCA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIxN2SBFJ0lb3ZYdW5jCUBr3Z1hhXN77qqK6t2yrAmY=; b=ySbokchgJ581qnOLSKNKA3sZzh
	Q2pc1y6QVt8QXPLi4lJMBeh3TnWAaIl801At4J/fjKCIVXt1c68YF9ald24kGoWMp0HYTAGDSZgTq
	kg/1tNozenLAcloacJsSr5mKztOpBubDg5gPdTwMwkB54RZjqy7/SQP6snV7mxWJY3PvlTIR7lMEa
	qOSaBLNGAujXqFaeiCu+StNc9z6p2EIdPMuW/0fNDXJ2/jUgDvjVzMx+PD0ksjBD7Ded7RNtmf3WC
	UIBKkY+jb+aRkUbGhUXLlECBy+wOtfTtxtQPLQwzHnBdyETiAda44+7/BX6eRZdLEbq5IejmgJ0/P
	Z3sSy7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0l5D-0000000BENV-2Ewn;
	Mon, 22 Sep 2025 18:16:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0l5B-0000000BEMi-0oK0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 18:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC7CA4020A;
	Mon, 22 Sep 2025 18:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50281C4CEF0;
	Mon, 22 Sep 2025 18:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758564972;
	bh=B27HomHuhJBTrQOAEO4poRW47y74aiAoiPzAwmJBk+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l30ktzbZF077F855O0xutvYLVis5e2kFa2zr5BK0uU49ekrNDOoOQLBOA34o5wvkd
	 lMkdIigJT6NGy45DFVdaagNhbioDHCJrIffvCjXqSUF3nRogRh+fdXQWxxlOUgb+hj
	 SfRWCroIxZR6dbzrqOIilUwA/f3LsnMB9Ch4OrCN7PF+whQvwqPvZvfm1MMvs9slPD
	 i2QkoELimpXiFIVj6O+hl97UNXIsOMlPWADFQJz3zVxzKH19EV23qPVRw7Z+G7Em9r
	 IJk1e8RhcOCT9I7sk72jMzp7viNPNOLxSCQzvb0fWOmi68xtbcVPDSxSUr5Pt1kwx+
	 Ak2BDG4SqdATg==
Date: Mon, 22 Sep 2025 13:16:11 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [RFC PATCH 1/5] dt-bindings: mfd: x-powers,axp152: Add
 polyphased property
Message-ID: <20250922181611.GA567602-robh@kernel.org>
References: <20250919000020.16969-1-andre.przywara@arm.com>
 <20250919000020.16969-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919000020.16969-2-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_111613_250351_1B67AC28 
X-CRM114-Status: GOOD (  20.71  )
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

On Fri, Sep 19, 2025 at 01:00:16AM +0100, Andre Przywara wrote:
> Some X-Powers AXP PMICs can combine some of their DC/DC buck converter
> outputs in a multi-phase fashion, to achieve higher currents and
> decrease the output ripple. The datasheets call this poly-phase. This is
> programmable in the PMIC, although often set up as the PMIC's reset
> default.
> 
> Add the "x-powers,polyphased" property to the binding, to describe those
> pairs or tuples of regulators that should work together. In the lead
> regulator node, the property lists the phandles of the connected
> regulators. Just an empty property means no poly-phasing.

Don't we have a coupled regulator binding already?

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/mfd/x-powers,axp152.yaml   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 45f015d63df16..260c4c0afc475 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> @@ -304,6 +304,15 @@ properties:
>                noise. This probably makes sense for HiFi audio related
>                applications that aren't battery constrained.
>  
> +          x-powers,polyphased:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +            description:
> +              A list of phandles pointing to other regulators that should be
> +              polyphased with this regulator. The linked regulators will be
> +              synchronised with this regulator, within the PMIC, but only if
> +              supported by the PMIC. An empty list means this regulator
> +              should be configured in a single-phase setup.

phandle-array is poorly named and is really a matrix because you can 
have arg cells. So you need:

items:
  maxItems: 1

And is there an outer max for linked regulators?

Rob

