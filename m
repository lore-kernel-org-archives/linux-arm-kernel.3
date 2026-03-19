Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843CA1075276
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTay6HW1vOlUEykKQjRl3cGI92ygI3Xv6fEhrv/vumA=; b=kZeZ0E5i/7zhgb/+lx7LPk0Hm/
	OERlEO+PFCgpngK+Qp+flOXH8OkNiVIY+tRWA3rn9lE/4ywih45g8KpLbhgxMi6wVVpCqvOHUP0/m
	UUahfk2ga8pdo3zxvtjg0qD36aDFlOWDDnioD+izA4nw8S7kKJBzSFlehrHkDwvNTGPZAVqUTo7jy
	GXsIMsArW1SENlf4wZnK3zsX3XAThl6mlNz6KeAiHyTHPa1EIC87bz1r1S8zqOjI7Iw4UIDMgAPUO
	oCyqR+XrUs43HeKX0b+eJxZLI+CUCN1I5JsQex/aTdP8nAF2t4U+kZFE6Bjimv+KRC79AqLsYCj5X
	sf7LNj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38hU-0000000AEkg-26A4;
	Thu, 19 Mar 2026 08:25:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38hS-0000000AEkU-2hcL;
	Thu, 19 Mar 2026 08:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nTay6HW1vOlUEykKQjRl3cGI92ygI3Xv6fEhrv/vumA=; b=JJHfMxq8SrdIbHyGnDMIPmkyNG
	G8JfXcZQcLKpZ2tRUclIZxRwIBRxdcnFAp00UP9L/WwyG7THIVBiFFKWhSZMr+SSOKNERZJ3hT5I/
	VgFLXuvH1hlBrxxeQBHJuilYIG9kmIm3NrV9olKIh5tV3XRqCQeuSSNBEYxvGBIl+1M5eQ2wnKj7M
	EavAyIuesgf5UKMC2sh9R8vhEnIQAbT4NF49NJtEI6BrZz3apfiTCYcBB1eM+Akdp6fZnyTCvEohs
	VVWvCmk24FNMXfsYJ0ZL5pFLkVrvKu2SbUj3mLRlzkjyf8Pylp3WuHIkpD+entKj92Kd0t9mXOsUH
	tzW7wg1g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38hP-0000000D1Q2-1ba8;
	Thu, 19 Mar 2026 08:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2919143F58;
	Thu, 19 Mar 2026 08:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D94C2BCB0;
	Thu, 19 Mar 2026 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773908745;
	bh=z+TpFp6nPNBq4Ax+izUKlEte0F/VUwfkflI1noqu3+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSw7W9ZBGkxkV7OtU+THE13NqQf5fze8xwAoHQspODcTz/JbBnflomepscOdBBEAq
	 ZPzpOtThiDvc33MyTv3TH7n+GqhQeArEwl5WPNVkbrI0OowDo88HENlGfSOTGKWh+T
	 rehUeFXWH/A9YCVy9hdGfe+s0di9ku2drQY6bILA04lYDumaQMQCuM9vdziSWOSLWM
	 Bos+qKhUB/LlAieN8oAKgBd9JS3ih1Nb7jRmEPoalnZ4lJ16yDHYroCsf9k3KDZaAU
	 hqsFsOCa4IusOFBZ61B5QrY5Vyj/RLDH2B9Sr/vmfO6mDQIA1Be62FR1bB6j4nlU5Z
	 tSDYeHxUDnrQQ==
Date: Thu, 19 Mar 2026 09:25:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org, 
	ardb@kernel.org, martin.petersen@oracle.com, ebiggers@google.com, tytso@mit.edu, 
	cristian.birsan@microchip.com, adrian.hunter@intel.com, jarkko.nikula@linux.intel.com, 
	kees@kernel.org, npitre@baylibre.com, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip
 SAMA7D65 compatible
Message-ID: <20260319-witty-gopher-of-teaching-b8c00e@quoll>
References: <20260318055230.307030-1-manikandan.m@microchip.com>
 <20260318055230.307030-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318055230.307030-2-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_082547_971968_EEB225FF 
X-CRM114-Status: GOOD (  14.33  )
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

On Wed, Mar 18, 2026 at 11:22:26AM +0530, Manikandan Muralidharan wrote:
> Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
> HCI binding. The Microchip SAMA7D65 I3C controller is based on the
> MIPI HCI specification but requires two clocks, so add a conditional
> constraint when this compatible is present.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> Changes in v4:
> - Define and describe the clock in the top-level properties
> ---
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 26 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> index 39bb1a1784c9..a946a8920046 100644
> --- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> @@ -9,9 +9,6 @@ title: MIPI I3C HCI
>  maintainers:
>    - Nicolas Pitre <npitre@baylibre.com>
>  
> -allOf:
> -  - $ref: /schemas/i3c/i3c.yaml#
> -
>  description: |
>    MIPI I3C Host Controller Interface
>  
> @@ -28,7 +25,13 @@ description: |
>  
>  properties:
>    compatible:
> -    const: mipi-i3c-hci
> +    enum:
> +      - mipi-i3c-hci
> +      - microchip,sama7d65-i3c-hci
> +  clocks:
> +    items:
> +      - description: Peripheral bus clock
> +      - description: System Generic clock

Missing blank lines. Also, clocks go after reg.


>    reg:
>      maxItems: 1
>    interrupts:
> @@ -39,6 +42,21 @@ required:
>    - reg
>    - interrupts
>  
> +allOf:
> +  - $ref: /schemas/i3c/i3c.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,sama7d65-i3c-hci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

Drop, pointless. You already said in top-level they are exactly two
items.

> +      required:
> +        - clocks

else - clocks: false. See example schema. Or explain in the commit msg
why existing compatible gets clocks now.

Best regards,
Krzysztof


