Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D2DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=misENF5z7hXRu4pyLJE5erm74j5CmbImUlp+T1d0VlE=; b=NE4AjanxJ7FU9naXdNjsEslG2h
	o4d2WRrBTxOQnIhZjtTWLdyqBW9VFzYSftvYGseDsnp/FAQ2nOaOlAtLdhDx1VK3594Ms49f0Dl9t
	0Dt07OCrz+R06Rphn3pr6sK2+ggevRWVXyIOucCFKxpO7giIXqAXvX/oeHsk17rp/G0OwfDi9E7eF
	4bxm14jO5FG6mJFN97bCylHvh2V55KAy8b+rO43Vk3rvoCd1Z5nbFPMY4pcj+xg7Y3qXufIcjL/O6
	cUZzixP82djQkeD0LJH1TvIaKS/207fQb3hvk5GY91Mqqsx4UH0o1bAxiVI1wb499nyCT2Xs7/Q2k
	CMazmySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUY0B-0000000A0Gz-3MJm;
	Wed, 25 Jun 2025 21:49:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVtQ-00000009l83-0vLn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:34:49 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4EE886F3;
	Wed, 25 Jun 2025 21:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750880062;
	bh=KX8ESLOsVI5lykUMCHvwiR4DNef+po6luXp0o93XLls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZldvsvGL7NWob8nF/x4LAYjano2AsMONQ28+SbO3taxdV/7eKtyo/Ab5G/FSeWkS5
	 WN4HTy9KnQLleqbdxPrDOroEHBwi6uY9DthYK+D3bMSg/ehFWT22YcCnms4E2Cw31Y
	 FTQQge526MV+/DVxrguvJJMh6p2tYYSr3DV092kg=
Date: Wed, 25 Jun 2025 22:34:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Adam Ford <aford173@gmail.com>,
	Frank Li <Frank.li@nxp.com>,
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
Message-ID: <20250625193418.GA32071@pendragon.ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
 <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
 <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
 <20250609182033.GA11428@pendragon.ideasonboard.com>
 <aEcxN7xClLfp0STx@lizhi-Precision-Tower-5810>
 <20250610081829.GC11428@pendragon.ideasonboard.com>
 <20250619210237.GA21935@pendragon.ideasonboard.com>
 <20250625192728.GA2072001-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625192728.GA2072001-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_123448_391745_114EC9F3 
X-CRM114-Status: GOOD (  39.50  )
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

On Wed, Jun 25, 2025 at 02:27:28PM -0500, Rob Herring wrote:
> On Fri, Jun 20, 2025 at 12:02:37AM +0300, Laurent Pinchart wrote:
> > On Tue, Jun 10, 2025 at 11:18:29AM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 09, 2025 at 03:08:39PM -0400, Frank Li wrote:
> > > > On Mon, Jun 09, 2025 at 09:20:33PM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jun 09, 2025 at 12:53:48PM -0500, Adam Ford wrote:
> > > > > > On Mon, Jun 9, 2025 at 10:32 AM Frank Li wrote:
> > > > > > > On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > > > > > > > The CSI-2 receiver can be instantiated with up to four output channels.
> > > > > > > > This is an integration-specific property, specify the number of
> > > > > > > > instantiated channels through a new fsl,num-channels property. The
> > > > > > > > property is optional, and defaults to 1 as only one channel is currently
> > > > > > > > supported by drivers.
> > > > > > > >
> > > > > > > > The only known SoC to have more than one channel is the i.MX8MP. As the
> > > > > > > > binding examples do not cover that SoC, don't update them.
> > > > > > > >
> > > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > > ---
> > > > > > > >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> > > > > > > >  1 file changed, 7 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > > > index db4889bf881e..41ad5b84eaeb 100644
> > > > > > > > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > > > > @@ -68,6 +68,13 @@ properties:
> > > > > > > >      default: 166000000
> > > > > > > >      deprecated: true
> > > > > > > >
> > > > > > > > +  fsl,num-channels:
> > > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > > +    description: Number of output channels
> > > > > > > > +    minimum: 1
> > > > > > > > +    maximum: 4
> > > > > > > > +    default: 1
> > > > > > > > +
> > > > > > >
> > > > > > > Look like it is fixed value for each compabiable string, So it is not
> > > > > > > suitable for adding new property. It should be in driver data of each
> > > > > > > compatible strings.
> > > > > > >
> > > > > > > I met similar case before. DT team generally don't agree on add such
> > > > > > > property, unless there are two instances in the same chip, which have
> > > > > > > difference channel number.
> > > > > >
> > > > > > If the DT changes are rejected, can the number of channels be added to
> > > > > > the data structure inside mipi_csis_of_match?  We have compatibles for
> > > > > > 8mm and imx7.  If we add an imx8mp compatible we could add a reference
> > > > > > to the number of channels.
> > > > >
> > > > > I thought about it, and decided to add a new property because the number
> > > > > of channels is really a synthesis time configuration parameter, and
> > > > > could differ between different CSIS instances in the same SoC.
> > > > 
> > > > Need add such information at binding doc's commit message,
> > > 
> > > I'll update the commit message.
> > 
> > The commit message in v2 will state
> > 
> >     dt-bindings: media: nxp,imx-mipi-csi2: Add fsl,num-channels property
> > 
> >     The CSI-2 receiver can be instantiated with up to four output channels.
> >     This is an integration-specific property, specify the number of
> >     instantiated channels through a new fsl,num-channels property. The
> >     property is optional, and defaults to 1 as only one channel is currently
> >     supported by drivers.
> > 
> >     Using the compatible string to infer the number of channels has been
> >     considered, but multiple instances of the same CSIS in the same SoC
> >     could conceptually be synthesized with a different number of channels.
> >     An explicit property is therefore more appropriate.
> > 
> >     The only known SoC to have more than one channel is the i.MX8MP. As the
> >     binding examples do not cover that SoC, don't update them.
> 
> So how many channels does i.MX8MP have in a DT without this property? 
> It's either 1 or the driver overrides it to 2.

Only 1. I only realized a few weeks ago that the CSIS has multiple
output channels on i.MX8MP. This wasn't documented anywhere, and
understanding how all of this works took lots of trial-and-error.

> > Rob, Krzysztof, Conor, are you fine with adding this property ?
> 
> Yes, but seems a little late.

It is, I wish I had known about this hardware feature years ago. Now I
need to figure out how to properly support it in the driver and expose
it to userspace through V4L2 without breaking backward compatibility
with existing applications. The DT binding is the easy part :-)

-- 
Regards,

Laurent Pinchart

