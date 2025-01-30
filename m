Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1604EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js/jp2ZY0Qw1uDhX/fPqyZjKJAMo4Qa7joANpefjY5o=; b=hvY0Lsg/dGgA2SYz5OLLI9Y8xT
	X/45Kk0ajUlGYSUcnilrRFoZJumgY0GnKPSlY9UrJ0vlLX590R5cy5EbEPsUNigp8ILJV2g4SeQ1n
	lFwwvG+hCA27Q+SjZuZguZXmb60nsfjtPJ7dzGr5Po2EcZcDhLJ1U9RD04BrFmDD4xOJNtwSi4ods
	R5x+a5dQt6zDpYJ4r3U3dNulMfi/VYeP6j9n41CoHatLRzVTmUTQ5xV1zynyPAPv0r/uyr+dfVMxP
	oyBIVuxgGQ4BfqCGZID766RppJp5/NLWuWgO93JQgCucik8f8IWd8x6NPrN53hVhHi/LBkbfCV8fV
	2KUzxx+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdeFr-00000009ong-0QIk;
	Thu, 30 Jan 2025 23:47:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdeBf-00000009oLv-1euu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:43:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8046A4258D;
	Thu, 30 Jan 2025 23:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9C9C4CED2;
	Thu, 30 Jan 2025 23:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280586;
	bh=kGamlnZuXM/luZYB3EXKEGCyON9TbAXiQo4Ki9RcCIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKD2DAFEHSWmHOxoRZxHSvYGppN4hzv+Kx/waC17L8ORp8M3GS4bjMeTUwa7RJy8E
	 OJ3oNxubfspnI7VFe7H8Fqi8ykSk0sxQ52TRtg1uLuq6oB4vywRMULCNpYDPQquQrf
	 Podu6TF8HqqQvCMhaw6+ex0DKR3HPjfxTaI39qZmkOXTR2yJRwBgfgwwpMRKYBYjxx
	 CHHiBnF3Dlda+nj3UsQo03o6Ps6vF+ZdCYQkPujPGLvngm4D6O4YYdu82208F7jZe7
	 9ODqDwKHqBoapfxrHwSb779mgHCK53ZxiuG6Kwf6D+qvKyNLy1KdxaWmQu85tpNENC
	 5HXcRsFKyvgrg==
Date: Thu, 30 Jan 2025 17:43:05 -0600
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 06/16] dt-bindings: rtc: at91rm9200: Reorganize
 compatible items
Message-ID: <20250130234305.GA1887365-robh@kernel.org>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
 <2846391c5ffab332ad7a4b65aa60aac9c49a3496.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2846391c5ffab332ad7a4b65aa60aac9c49a3496.1738257860.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_154307_499695_89EB6E9A 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 30, 2025 at 10:33:46AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Reorganize compatible to allow more devices to be added to this enum.

This is doing more than reorganizing. It is changing the binding. Now 
7g5 is compatible with 9x60?

> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml        | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> index c8bb2eef442dd..30d87b74c51dc 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> @@ -21,9 +21,10 @@ properties:
>            - atmel,sama5d4-rtc
>            - atmel,sama5d2-rtc
>            - microchip,sam9x60-rtc
> -          - microchip,sama7g5-rtc
>        - items:
> -          - const: microchip,sam9x7-rtc
> +          - enum:
> +              - microchip,sama7g5-rtc
> +              - microchip,sam9x7-rtc
>            - const: microchip,sam9x60-rtc
>  
>    reg:
> -- 
> 2.43.0
> 

