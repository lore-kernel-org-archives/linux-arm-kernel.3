Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B80DF55138
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXngfF65hS04GfOACT7lxz/4s398V++RkR6b3PhHSnw=; b=Y+8G9G+tuo4bi+HIYLE7RLcPhP
	LMmso8Fizv+dEJqxR00a5es8VTcdHLBAn0JctRZevLJQWffBfAEnoxvFgUwjMkkOBvh/MY/4ziwIF
	TPVjs6eK9kWlWbNjzq6ZftAxhM4jMMBZP8nsEinrcLRKmGAPbY171pZ36nfts+DVebVVmoK5e98qX
	lkl13MQdfwsvcxFedEJx4eq9/Fxyo6iz/C2kfs0GfUQ7lTMbZb465Bxl92zIJ6SiU9zZOCSAuaQf6
	nmkvMi2L8J0c2lazhCrQiVnMIfyclhUkeyolF7sX8+ZdcidQH6pcpUfRwg+vf98fUFH7D+VMLXE+F
	GWXMHYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAM7-00000005q5f-0FFC;
	Sun, 08 Mar 2026 09:23:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzAM4-00000005q5I-1ETA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 09:23:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F7F243AB2;
	Sun,  8 Mar 2026 09:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954F3C116C6;
	Sun,  8 Mar 2026 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772961797;
	bh=NEB1M50nTMnxvScDgTWtPQCJnftjAXFrgFRMMp7y984=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M37YQ8edEOeCCWj5Up3vBaddVLy3OxGfpBbuUN3cAGBqO+rZLYvK04JWOpeo4EgnT
	 FanZLNVcW2wawRgZXMpVgpuFwvnDBhKwkHz7KT6UEgseuDpeGBMK0aTE6C8bFRpudQ
	 /CX7DfMdH1/T2QI81qOIEDHUUDbfsqaOuwzfVnuTvyrSXvspFvu0nENC1e1heB8bV7
	 syPsb9fKkrbsK7fUHtFUQLQ1Ifhm0PSlvzCNF9WRczGI3VaHtRoY+3oIQMC+3UqAnd
	 bUCXZuAj5zNtocaRwFACIpc8QT2v6TqONIGnB3AWJ/+05Ur4QYtuvTz1aDR9duiLou
	 Tb4CiIWgwYHzw==
Date: Sun, 8 Mar 2026 10:23:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Herve Codina <herve.codina@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
Message-ID: <20260308-camouflaged-sage-warthog-fdbb7d@quoll>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-2-3dc48fe772be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307-atmel-usb-v3-2-3dc48fe772be@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_012320_369955_D94EA3DC 
X-CRM114-Status: GOOD (  20.41  )
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

On Sat, Mar 07, 2026 at 09:16:19AM +0000, Charan Pedumuru wrote:
> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
> to the generic OHCI schema.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/generic-ohci.yaml      | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> index 961cbf85eeb5..a8a94b9c1fee 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> @@ -55,6 +55,7 @@ properties:
>            - ti,ohci-omap3
>        - items:
>            - enum:
> +              - atmel,at91rm9200-ohci
>                - cavium,octeon-6335-ohci
>                - nintendo,hollywood-usb-ohci
>                - nxp,ohci-nxp
> @@ -137,6 +138,16 @@ properties:
>        The associated ISP1301 device. Necessary for the UDC controller for
>        connecting to the USB physical layer.
>  
> +  atmel,vbus-gpio:

gpio is deprecated. All bindings use gpios. Also, pins do not use vendor
prefixes.


> +    description: GPIO used to control or sense the USB VBUS power.
> +    minItems: 1
> +    maxItems: 3

Why is this flexible? There is only one VBUS, no? Which pin is it
exactly on this device?

> +
> +  atmel,oc-gpio:
> +    description: GPIO used to signal USB overcurrent condition.
> +    minItems: 1
> +    maxItems: 3

Same question here - how is the pin called in the schematics?

> +
>  required:
>    - compatible
>    - reg
> @@ -144,6 +155,28 @@ required:
>  
>  allOf:
>    - $ref: usb-hcd.yaml
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: atmel,at91rm9200-ohci
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: ohci_clk
> +            - const: hclk
> +            - const: uhpck
> +
> +      required:
> +        - clocks
> +        - clock-names

There is already if:then:else covering clocks, so this makes multiple
clauses being applied to same device. That's not really readable.
Unfortunately that's a bit of a mess from existing binding. This can be
solved by moving this to separate schema, especially that you want to
add some specific properties to this device.

> +
> +    else:
> +      properties:
> +        atmel,vbus-gpio: false
> +        atmel,oc-gpio: false
> +
>    - if:
>        not:
>          properties:
> 
> -- 
> 2.53.0
> 

