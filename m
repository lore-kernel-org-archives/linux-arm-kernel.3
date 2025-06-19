Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DF6C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTgeYCNyJnLktrGH3I99aO/kS8QSjXIj84RbzuEqqeY=; b=f9cBMOg0hAGaeUA8W2ZiQMRPqs
	xzePOFJ98rUGTD/I9WlaAuKETrN9xLZIxL+UalocaY6/taLJUNbYsalSVHDOIpp0HlSRI4Z72d/i9
	Vg+oRO4MxzV5VyWKZ9EDtjWD1I97Gd6q2hLozaVxTXO6dckTjRijexz11G43ivJVSxpUpeZg5nHaz
	e2LyB8adw8PbukcAIcfcTen7EIAJVg9M/RsjSyKQXXahjFOhRLkHWqYQTI3qtoy7dyuzy+718lECZ
	M+XKIucLMCwuUfd1F/6ga7yUb5wDXTXQFhHREfp6oj+jZzia2/RiJyg60/Az7wcagwl2RpZG4xPDi
	yScQTvXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMSb-0000000EGkY-32BJ;
	Thu, 19 Jun 2025 21:06:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMPZ-0000000EGWR-1D3V
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 21:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oTgeYCNyJnLktrGH3I99aO/kS8QSjXIj84RbzuEqqeY=; b=MlAq8+k4MC1LspyFuDXhqbX3CK
	r11ftoddt+fXQG4qHfCYXt+mL75/+hQxDQxwH2HdVsApCBcjg4tw2ySfkcy9//0x5Wu/FMotoL1kr
	qcUAoWwKniKZl/KzV+S42EzxCUVSjFx4Dd2tqa78qwkfs19LjW2ABtX1UVF6tsoYVLXhGTqpb9i70
	GAN9OrKTFFbdTgYopWxUEBgtudYQFbmZWHXKFdqGiiBBiQrbHUVc4GZNAiDDgotIj3MbFmO4UYl59
	Vjh6aLDngBbi73nAp2CuHaKW6e1qPEbsu6YpwaG7DwWGZgV/FS+N6V99P4+wbr4MXjPTGgrN51ymO
	P0eQdM1g==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMPV-00000004a5s-1w0K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 21:03:04 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE9192EC;
	Thu, 19 Jun 2025 23:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750366962;
	bh=cMcgUkKcU4XsVXe3puMc1IqvW3rgKBUEbIiiJLipLQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHzBpkMpW+52bQS9MZNB33ymQm5kq4+JmXeNbxNXzA99jYVDEyEzQxuNgb231G0vw
	 p9w1Q2rETQcwko4GJ8gIE6Fky1RgWDPPfJ3wYVTN6SdwEkcjARLPrpURRXbzR2YeF8
	 dGpVql/nGJTd4hl4rsPmDL4igkyFSI1zJgZjmn38=
Date: Fri, 20 Jun 2025 00:02:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Adam Ford <aford173@gmail.com>, Frank Li <Frank.li@nxp.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Purism Kernel Team <kernel@puri.sm>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
Message-ID: <20250619210237.GA21935@pendragon.ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
 <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
 <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
 <20250609182033.GA11428@pendragon.ideasonboard.com>
 <aEcxN7xClLfp0STx@lizhi-Precision-Tower-5810>
 <20250610081829.GC11428@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610081829.GC11428@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_220302_452419_851CFE7D 
X-CRM114-Status: GOOD (  34.37  )
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

On Tue, Jun 10, 2025 at 11:18:29AM +0300, Laurent Pinchart wrote:
> On Mon, Jun 09, 2025 at 03:08:39PM -0400, Frank Li wrote:
> > On Mon, Jun 09, 2025 at 09:20:33PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 09, 2025 at 12:53:48PM -0500, Adam Ford wrote:
> > > > On Mon, Jun 9, 2025 at 10:32 AM Frank Li wrote:
> > > > > On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > > > > > The CSI-2 receiver can be instantiated with up to four output channels.
> > > > > > This is an integration-specific property, specify the number of
> > > > > > instantiated channels through a new fsl,num-channels property. The
> > > > > > property is optional, and defaults to 1 as only one channel is currently
> > > > > > supported by drivers.
> > > > > >
> > > > > > The only known SoC to have more than one channel is the i.MX8MP. As the
> > > > > > binding examples do not cover that SoC, don't update them.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > ---
> > > > > >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > index db4889bf881e..41ad5b84eaeb 100644
> > > > > > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > @@ -68,6 +68,13 @@ properties:
> > > > > >      default: 166000000
> > > > > >      deprecated: true
> > > > > >
> > > > > > +  fsl,num-channels:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +    description: Number of output channels
> > > > > > +    minimum: 1
> > > > > > +    maximum: 4
> > > > > > +    default: 1
> > > > > > +
> > > > >
> > > > > Look like it is fixed value for each compabiable string, So it is not
> > > > > suitable for adding new property. It should be in driver data of each
> > > > > compatible strings.
> > > > >
> > > > > I met similar case before. DT team generally don't agree on add such
> > > > > property, unless there are two instances in the same chip, which have
> > > > > difference channel number.
> > > >
> > > > If the DT changes are rejected, can the number of channels be added to
> > > > the data structure inside mipi_csis_of_match?  We have compatibles for
> > > > 8mm and imx7.  If we add an imx8mp compatible we could add a reference
> > > > to the number of channels.
> > >
> > > I thought about it, and decided to add a new property because the number
> > > of channels is really a synthesis time configuration parameter, and
> > > could differ between different CSIS instances in the same SoC.
> > 
> > Need add such information at binding doc's commit message,
> 
> I'll update the commit message.

The commit message in v2 will state

    dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property

    The CSI-2 receiver can be instantiated with up to four output channels.
    This is an integration-specific property, specify the number of
    instantiated channels through a new fsl,num-channels property. The
    property is optional, and defaults to 1 as only one channel is currently
    supported by drivers.

    Using the compatible string to infer the number of channels has been
    considered, but multiple instances of the same CSIS in the same SoC
    could conceptually be synthesized with a different number of channels.
    An explicit property is therefore more appropriate.

    The only known SoC to have more than one channel is the i.MX8MP. As the
    binding examples do not cover that SoC, don't update them.

Rob, Krzysztof, Conor, are you fine with adding this property ?

> > ideally provide an example for it.
> 
> That I can't provide because the few SoCs I'm working with do not
> integrate multiple CSIS instances with different parameters.
> 
> > > > > >    ports:
> > > > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > > > >

-- 
Regards,

Laurent Pinchart

