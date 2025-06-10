Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A5FC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPwniuOw/UC5M8mRZ5Xe4o7jaZg1Q+N/DNW1OFzS0Ao=; b=F7cXYfH/7mkyGgiegV2M76woVf
	A/S/KMz4irbmHShZaXk7gVLlNzeQIXCqGK9Au1QT0o4TPQpVCNXuIRJwebRPNiYKsU/Aevd+yReRF
	8A2C/duKg5COo3bK8aANb2T9vMx5nCsgC/2G/vaCqOzvn17GJT+B0rEbYqEhTMKWjHBC1FG61uJeV
	XhsQadoTgCFiYSd4XubcIhqDrPrmXGiWTIvYIRE7OVnT0BIWILl061d6tNOm+Wz6gNqwnK4UgZj+o
	aCCtUxaCIqLShXPm8JvyFTZRJaFBt+4ghg+f9tGSPDu6S0K7I8eN8/wmZrJ+PcrErT92h7EXu7IQ8
	AkRy+46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuE6-000000069LZ-3Vxx;
	Tue, 10 Jun 2025 08:20:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuBw-000000068l6-39GC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:18:45 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EF1B564;
	Tue, 10 Jun 2025 10:18:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749543515;
	bh=UtUb1iQXrY/a1g4NHyi1atjiccmilNz0yGxCMNeqNKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsuNlTXPi/Sg4moEI1TKklrd0QuQm1Xt3GsYEPQHfIAmkCPDy/RF5sh/5/9zAxS6b
	 xzD5+xBFvpzel4jhSA8pEi1zaAqh/cdRqwK41jk1ao4LnesQMfCeeTxYqGkFcLmtck
	 wInQyyRIjOc4Ze92p2+GWQk0mdNbwlujWdx5DHeM=
Date: Tue, 10 Jun 2025 11:18:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] dt-bindings: media: nxp,imx-mipi-csi2: Add
 fsl,num-channels property
Message-ID: <20250610081829.GC11428@pendragon.ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-7-laurent.pinchart@ideasonboard.com>
 <aEb+iTlDh0H/bRMY@lizhi-Precision-Tower-5810>
 <CAHCN7xJjR1zZXeJAvkXmdNYroP6Jm6TLjHjnPUOF4z7yaL7EFw@mail.gmail.com>
 <20250609182033.GA11428@pendragon.ideasonboard.com>
 <aEcxN7xClLfp0STx@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEcxN7xClLfp0STx@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_011844_929002_D7E7107A 
X-CRM114-Status: GOOD (  30.74  )
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

On Mon, Jun 09, 2025 at 03:08:39PM -0400, Frank Li wrote:
> On Mon, Jun 09, 2025 at 09:20:33PM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 09, 2025 at 12:53:48PM -0500, Adam Ford wrote:
> > > On Mon, Jun 9, 2025 at 10:32 AM Frank Li wrote:
> > > > On Mon, Jun 09, 2025 at 02:58:38AM +0300, Laurent Pinchart wrote:
> > > > > The CSI-2 receiver can be instantiated with up to four output channels.
> > > > > This is an integration-specific property, specify the number of
> > > > > instantiated channels through a new fsl,num-channels property. The
> > > > > property is optional, and defaults to 1 as only one channel is currently
> > > > > supported by drivers.
> > > > >
> > > > > The only known SoC to have more than one channel is the i.MX8MP. As the
> > > > > binding examples do not cover that SoC, don't update them.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > >  .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml       | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > index db4889bf881e..41ad5b84eaeb 100644
> > > > > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > > > > @@ -68,6 +68,13 @@ properties:
> > > > >      default: 166000000
> > > > >      deprecated: true
> > > > >
> > > > > +  fsl,num-channels:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    description: Number of output channels
> > > > > +    minimum: 1
> > > > > +    maximum: 4
> > > > > +    default: 1
> > > > > +
> > > >
> > > > Look like it is fixed value for each compabiable string, So it is not
> > > > suitable for adding new property. It should be in driver data of each
> > > > compatible strings.
> > > >
> > > > I met similar case before. DT team generally don't agree on add such
> > > > property, unless there are two instances in the same chip, which have
> > > > difference channel number.
> > >
> > > If the DT changes are rejected, can the number of channels be added to
> > > the data structure inside mipi_csis_of_match?  We have compatibles for
> > > 8mm and imx7.  If we add an imx8mp compatible we could add a reference
> > > to the number of channels.
> >
> > I thought about it, and decided to add a new property because the number
> > of channels is really a synthesis time configuration parameter, and
> > could differ between different CSIS instances in the same SoC.
> 
> Need add such information at binding doc's commit message,

I'll update the commit message.

> ideally provide an example for it.

That I can't provide because the few SoCs I'm working with do not
integrate multiple CSIS instances with different parameters.

> > > > >    ports:
> > > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > > >

-- 
Regards,

Laurent Pinchart

