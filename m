Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD69C5ACAB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 21:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0GWgFWa+KBYW+SsUAsbFeygA58QMJKApP/borqb9+I=; b=Y39SdP21Z+WOjbBvTL97jraBIZ
	lwbNfznD4lx5HFJGP7/I8+Hcbdp+nHCCtERG+RWdNRibZsm7jZNp4hEFxyhEFgFef3C/L2TgDkhNK
	MJd4Kp1nb8S0d0UsrEjA5EuJm8gAYOTmDD27wP9Bg/8lrdBP6hXbmo904ND4FaDHrf3EYkXAD+D/5
	XesfBdL780i6UQuCYyGUpgXi10jB08Wspkp4LVHXqXvIkwREnp0kc9BXGJI5avqZSNGQoYEYajUuC
	OXM+pkrV4rShjkcV4Si+/g4yLePoaxQQjD3NrdDlGJ9pG1zCwqiFqQ43GDz6bRfZihLUUYt3anEJh
	KH4eHNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSLh-00000008m79-1WpD;
	Fri, 07 Aug 2026 21:43:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSLf-00000008m73-2jLB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 21:43:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D36F243AC9;
	Fri,  7 Aug 2026 21:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3AF1F000E9;
	Fri,  7 Aug 2026 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786139006;
	bh=O0GWgFWa+KBYW+SsUAsbFeygA58QMJKApP/borqb9+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FCsmZMORxswv2bDdmcWQFXbFXcIjplPP1RneiT0TWSZiPP8H0kubyXerByucctfk8
	 FtIlCV4dr4M15leD5VGrIfr+wGoGA9cRwUF9v+3wfLmmW6mlSlUVf7MSGaA5HNFFj3
	 PnEtyivYrP6jJvQeWzCUv0KUcGBFUj9LE6bim8hQoC1H/eQ+LRXMcYLLCfcy2vkQKD
	 YeK6DWtGst5v2i3fobrRN38C8ZOZqZTmsdtCX3x5Q8+76XcaFeSTiA4D/PQXkFMb//
	 GCfer1AOJQmHmTEIOfy/ja9FMLnssIPt8tUxvRvgztwx5p209uONfwwRPSk7Xcs9Xy
	 KCKM7ZsYKkVUw==
Date: Fri, 7 Aug 2026 16:43:25 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: lcdif: Add endpoint bus-width
 property
Message-ID: <20260807214325.GA2070489-robh@kernel.org>
References: <20260723093813.180089-1-francesco@dolcini.it>
 <20260723093813.180089-2-francesco@dolcini.it>
 <amI3HKLECuZBHLs0@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amI3HKLECuZBHLs0@SMW015318>
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

On Thu, Jul 23, 2026 at 10:45:32AM -0500, Frank Li wrote:
> On Thu, Jul 23, 2026 at 11:38:08AM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > The DPI output of the LCD interface can be configured with a bus width
> > of 16, 18, or 24 bits. Introduce a bus-width property to the output
> > endpoint, specifying the number of parallel RGB bits connected.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > v2: use the common bus-width property instead of the legacy interface-pix-fmt
> > ---
> >  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > index 2dd0411ec651..6931f0ae3829 100644
> > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > @@ -71,6 +71,15 @@ properties:
> >      $ref: /schemas/graph.yaml#/properties/port
> >      description: The LCDIF output port
> >
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> 
> Is it better by use video-interfaces.yaml# ?

Yes.

Rob

