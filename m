Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2E0C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIh/sjEJIAqL9dh/20Py+eC/kL9eQWLDCf5fH9B72os=; b=HFBZ9UhRErw2k+zOboZH8zOmR9
	ZsppABLTmnWroNlDpkQv505o3Wr7/jUt5RTA26Bt+AGjoWLV60lQ0z5YYH0bc3C4fSWZFWs7JixWW
	yb+g403wwXeYs1xS23fmHVBeWRCbMbxJ4N6STi/LzwRQLXUHufaXA8Dk5bWSeZsuicW5jkF07UCc8
	ntwwdYHfsNkI+4DtFzfc99Y5sg5rI2lS9cVyNUs7B0NlxZ3gDF3mGB/l0ALNcb89+XG1oRG4F7mWA
	GB11xSZXJXg2bT47rQ/28SZblTJ6fiG05ymVMItsg7wZ9mIo+/A5IIy9kYJkszLtFiEtwJsCnvsjS
	pDCM3FZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8cA-0000000Eptw-3gfS;
	Fri, 14 Mar 2025 17:14:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8aT-0000000EpYT-0mDi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:12:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B18E1424;
	Fri, 14 Mar 2025 10:12:52 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 251433F673;
	Fri, 14 Mar 2025 10:12:40 -0700 (PDT)
Date: Fri, 14 Mar 2025 17:12:35 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 03/15] dt-bindings: watchdog: sunxi: add Allwinner
 A523 compatible string
Message-ID: <20250314171235.25db7044@donnerap.manchester.arm.com>
In-Reply-To: <20250307005712.16828-4-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
	<20250307005712.16828-4-andre.przywara@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_101245_303792_DAF97AA1 
X-CRM114-Status: GOOD (  19.45  )
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

On Fri, 7 Mar 2025 00:57:00 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi Wim, Guenter,

> The Allwinner A523 SoC features a watchdog similar to the one used in
> previous SoCs, but moves some registers around (by just one word), making
> it incompatible to existing IPs.
> 
> Add the new name to the list of compatible string, and also to the list
> of IP requiring two clock inputs.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

is there any chance that this DT binding patch (and patch 04/15, touching
the actual driver) would make it into -next any time soon, and hopefully
into v6.15? From what I can see it's the only binding left before the
sunxi maintainers can merge the devicetree patches for this new SoC (most
others are in, pinctrl and NMI should show up in the next days).

Let me know if I can help with anything or if you need more information!

Thanks,
Andre

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 64c8f73938099..b35ac03d51727 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - const: allwinner,sun20i-d1-wdt-reset
>            - const: allwinner,sun20i-d1-wdt
> +      - const: allwinner,sun55i-a523-wdt
>  
>    reg:
>      maxItems: 1
> @@ -60,6 +61,7 @@ if:
>            - allwinner,sun20i-d1-wdt-reset
>            - allwinner,sun50i-r329-wdt
>            - allwinner,sun50i-r329-wdt-reset
> +          - allwinner,sun55i-a523-wdt
>  
>  then:
>    properties:


