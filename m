Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A51BE92FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 20:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hXJ9VKZ+qgO9sXVJY5VLaceN+IBBoqhvgGYVD+dUrc=; b=0S19J7t3gOo1gs4l086aDEmlrs
	z/fQbunzn97JbEj8w/opjz6S61jm5hIoXWywURdkiUMT4RCNrbaNkGu1UgrxqiSLTo2CSwMu2jYC6
	klqNlL+erOafN0/oVKItWG6Z6NYBHZ9F3jMQutOWFU93Hhq/3pew057jmw71yq4mhDfv8MVDW1ZNh
	4WccBDy+bVezmpqgxlJiXw70A49pn4OUlYCuhI/gep3it+MUu9lqjYjpi9G2DGZeeKljBNc/2uxKh
	Ek0ynuUZWYcWil90JOKi5kMySdIGFs8fKK8nmFY1vKF5LCHzgIKkhAlud9D85X1eXQyZnQImXF5VT
	oC8VQIhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaK1c-000000043NY-15ID;
	Mon, 29 Dec 2025 20:39:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaK1X-000000043MN-3KBA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 20:39:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33418444D1;
	Mon, 29 Dec 2025 20:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E217CC4CEF7;
	Mon, 29 Dec 2025 20:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767040766;
	bh=8HiZDGiFI1Ej64HDHXl6T0blCYp6fT2OhJ3cyCelRKU=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=PA5VvINckjhy4V91bcU3EZ2+mTR8tSVR3Oy4ve5TUmnE2AMeiRMtdvDAN3oKV/6ch
	 SuS/pYBISnOn7ZPurKX/hWny5LPJas8W3FvgZEGUpilFYsnutsmShIsmX2BkHAe5ES
	 1F5Fyz6pxmMMjQF4xLk6QnutvUf7oEDIIDQn5XncAUWL/e3abzDMx2XX2xuh4rfnka
	 WmiFghSe8RSjd3JRT+okRsJGWZp0PmCNskgXDFaTJ83UJNg00RTsZCiaxQ6ZEvHt9K
	 uvW/u8A1vJO7P63IhpHuGuwRRa0ZBsec+ObGO8pOhg5egOisAnHY2vExM7zrvckxDi
	 FvH9guXxu1dGA==
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Dec 2025 14:39:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 jserv@ccns.ncku.edu.tw, conor+dt@kernel.org, eleanor15x@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linusw@kernel.org, krzk+dt@kernel.org, 
 arnd@arndb.de, devicetree@vger.kernel.org
To: Kuan-Wei Chiu <visitorckw@gmail.com>
In-Reply-To: <20251225173118.580110-1-visitorckw@gmail.com>
References: <20251225173118.580110-1-visitorckw@gmail.com>
Message-Id: <176703895443.2172504.7231951665641312391.robh@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: integrator: Fix DMA ranges mismatch
 warning on IM-PD1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_123927_873886_2A4E6E2E 
X-CRM114-Status: GOOD (  18.55  )
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


On Thu, 25 Dec 2025 17:31:18 +0000, Kuan-Wei Chiu wrote:
> When compiling the device tree for the Integrator/AP with IM-PD1, the
> following warning is observed regarding the display controller node:
> 
> arch/arm/boot/dts/arm/integratorap-im-pd1.dts:251.3-14: Warning
> (dma_ranges_format):
> /bus@c0000000/bus@c0000000/display@1000000:dma-ranges: empty
> "dma-ranges" property but its #address-cells (2) differs from
> /bus@c0000000/bus@c0000000 (1)
> 
> The "dma-ranges" property is intended to describe DMA address
> translations for child nodes. However, the only child of the display
> controller is a "port" node, which does not perform DMA memory
> accesses.
> 
> Since the property is not required for the child node and triggers a
> warning due to default address cell mismatch, remove it.
> 
> Fixes: 7bea67a99430 ("ARM: dts: integrator: Fix DMA ranges")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Changes in v2:
> - Switch approach to remove the unused "dma-ranges" property instead of
>   adding "#address-cells" and "#size-cells".
> 
>  arch/arm/boot/dts/arm/integratorap-im-pd1.dts | 1 -
>  1 file changed, 1 deletion(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20251219 (exact match)
 Base: tags/next-20251219 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/arm/' for 20251225173118.580110-1-visitorckw@gmail.com:

arch/arm/boot/dts/arm/integratorap-im-pd1.dtb: display@1000000 (arm,pl110): 'port@0' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml






