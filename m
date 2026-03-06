Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E510F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKhjG2ju+3n6EJEqWYuXaeTyKqx3a2E7quAxba74Ht4=; b=stjxskrHQqqq/E3LOPV9fKIcll
	drewMbPOF5ac/qKDw/SxRfVUD0O80xGwXzLtiGunG5NGAX6Wjp+gc1Vol2udf3ceHW6DrkR459SYu
	1n3d5ABiAJGm761eCdVMvAMbRsYRelx85A/MUJuTtCyPxLaFsWg/1L1MEe+tY6aC0Vb6JMljFdu4/
	mGRI0DcwsEAUwDQna78pGvzTl+iGjuyPOgkpYDdVJNA7sUpw5T49qJyseyymhWfW7YVbrMOIcNS3n
	kWIZ35UkeCebScNRwQf066fv3gv0eC6hV3PHM0AIxkFKOwIgP6q64m7l2g5Rf13C2GcCFBjFW2pYv
	HmkiJGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJJw-00000002nVZ-2bMx;
	Fri, 06 Mar 2026 00:45:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJJv-00000002nVK-340m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:45:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB8EC600B0;
	Fri,  6 Mar 2026 00:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A96C116C6;
	Fri,  6 Mar 2026 00:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772757934;
	bh=RfZ6JfMteBUvtPa+L1il2dXvDwwhTUW7cGhcZfzVpl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7PFHuzxFF2xXjeSHFWX9UKCutem6Sp6gftOvOM80oDAJlI5qKbdGXhziaAjxDOqb
	 juukfdodr41K3ImYrEeas+GnrL9FrrcyveNHXn5tgXQpPIW1YHOY/kFFYf+YXfBVY9
	 sRYMqE6K/uim4woWg8ygo8Dot5HRkAquC/LH5D8+qKEuKN+SvXgInXAPgVrRj2d+32
	 OxtYCaadBseZsR/VmsTYmIwZmBFwUP/OgMGjjrDIkgdZfJpQ2TNSGHy5OXQjfQbOAL
	 1U4qAnFk5mKaMzfPbuVJMoQrzfUdBa03R1oy9uJUiiZJPosuE0rnVzjcVVyCuuyuS+
	 MMeqIALwU9PXQ==
Date: Thu, 5 Mar 2026 18:45:33 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
Message-ID: <20260306004533.GA870954-robh@kernel.org>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>
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

On Tue, Feb 24, 2026 at 01:12:58PM +0000, Charan Pedumuru wrote:
> Add binding support for the Atmel AT91RM9200 OHCI USB host controller
> to the generic OHCI schema.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/generic-ohci.yaml      | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> index 961cbf85eeb5..ab8a49142386 100644
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
> +    description: GPIO used to control or sense the USB VBUS power.
> +    minItems: 1
> +    maxItems: 3
> +
> +  atmel,oc-gpio:
> +    description: GPIO used to signal USB overcurrent condition.
> +    minItems: 1
> +    maxItems: 3
> +
>  required:
>    - compatible
>    - reg
> @@ -144,6 +155,22 @@ required:
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

       else:
         properties:
           atmel,vbus-gpio: false
           atmel,oc-gpio: false

>    - if:
>        not:
>          properties:
> 
> -- 
> 2.53.0
> 

