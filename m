Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33413D1266B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3yJqC3ypONG67sfW18aA3TvWs+ZdO9Rsz+M0GDBdZo=; b=3LrQG4H62+uVAlEs04wweMvpJ5
	gEDydeBSwPaXs8WcgqEJwKVoQwmVxAFrAiFPE+ad9CHtsiaTeJOanFIRQeL8KLn+czCrm9jpKslyo
	z7otAFGB20ijcwGftrSuqGOisOmiDMLAhhnVcdXmXUqM35oO7U5a/pQNaBOJE8QWXAfU6T3XSdBXv
	MKCX1uL6Qg+FIQs+X6r6+Eljd6vPcygqg1ywzwzb0Czr5a5xsKAcYsxoB3S+jUkgVxWYUMJeGucqP
	/oeDoA6yG4UhRNkWCh3qmJawtbouADW8lS9mAl1zwxBv7JqBSeyLAbtrvYZu0YlJTItsp2LRPhOtW
	Q9hnZYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FSb-0000000GQlr-3Rx0;
	Tue, 05 Nov 2024 09:02:49 +0000
Received: from www.linux-watchdog.org ([185.87.125.42])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FQ5-0000000GQ9o-2v5x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:00:17 +0000
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 80D2540A06; Tue,  5 Nov 2024 09:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 80D2540A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730795575;
	bh=b+cUcGREjwIVOb8iVPWQ1xX9l5pWIaGxnqXDOFCzuIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HsbnN/Tx+/Bvj8KL+ri+wWbTFp5C/N3vOAEZg0J4qoqhzSNsjJG1yl0RT1yU7xkvV
	 3QOwZ2PWKt8zKELSK5Q699hFHBLRUkxAQrUh37XyMjN8cLi7UEYNNfOUixdIpCAAKr
	 Ct0C2dZFrEG7Ytszd9Io//ao6Y3TMSBIQfV6PUzo=
Date: Tue, 5 Nov 2024 09:32:55 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
Message-ID: <20241105083255.GA24194@www.linux-watchdog.org>
References: <20241007212434.895521-1-Frank.Li@nxp.com>
 <ZyPUWaINgupm7dZ3@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyPUWaINgupm7dZ3@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_010015_861179_A57BC60D 
X-CRM114-Status: GOOD (  22.24  )
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

Hi Frank,

> On Mon, Oct 07, 2024 at 05:24:33PM -0400, Frank Li wrote:
> > From: Animesh Agarwal <animeshagarwal28@gmail.com>
> >
> > Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema. Only
> > allow big-endian property for ls1012a and ls1043a.
> >
> > Fix dtbs_check errors.
> > arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000:
> >     Unevaluated properties are not allowed ('big-endian' was unexpected)
> >
> > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Wim Van Sebroeck:
> 
> 	Any update this patch? Kyzy already acked.
> 

Acked-by: Wim Van Sebroeck <wim@linux-watchdog.org>

Via which tree will this go upsteam?

Kind regards,
Wim.

> 
> Frank
> 
> 
> >
> > Change from v1 to v2:
> >   only allow big endian for layerscape platform.
> >
> > previous post at:
> > https://lore.kernel.org/imx/20240806103819.10890-1-animeshagarwal28@gmail.com/
> >
> > check spec, and dump watch dog reset value
> > at ls1043a platform.
> >
> > 0x02A80000:  00 30 00 00 00 10 00 04 00 01 00 00 00 00 00 0
> >
> > It is big-endian. imx2_wdt.c use regmap which call regmap_get_val_endian()
> > to handle endian.
> >
> > So this change is corret.
> >
> > big-endian for wdt is necessary
> > ---
> >  .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > index 36b836d0620c9..0da953cb71272 100644
> > --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
> > @@ -48,6 +48,8 @@ properties:
> >    clocks:
> >      maxItems: 1
> >
> > +  big-endian: true
> > +
> >    fsl,ext-reset-output:
> >      $ref: /schemas/types.yaml#/definitions/flag
> >      description: |
> > @@ -93,6 +95,18 @@ allOf:
> >        properties:
> >          fsl,suspend-in-wait: false
> >
> > +  - if:
> > +      not:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum:
> > +                - fsl,ls1012a-wdt
> > +                - fsl,ls1043a-wdt
> > +    then:
> > +      properties:
> > +        big-endian: false
> > +
> >  unevaluatedProperties: false
> >
> >  examples:
> > --
> > 2.34.1
> >

