Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEC4CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ingqkDdP9i6d9yaKS1z8ZkAs1ncOpCXA6S4pkODU3OI=; b=PFGHTDY0cHZEg/ZkkjfmfpMT59
	7JBeEu9R1q+Jsl8g2J72Zb4TI2/Sq5C11wiH9FLRbxRis0BmHsLbt4gVPJbGtwBk+EYV+u84qgmtm
	Qr4eIu5/0ERFTTY+NM50OpCNqcJabNJo4HJPv1e5hpHUjlgSOS+nyJjZmsAfhILVDqwIWPt3cO2cu
	OI5gB2hoen66ifNakD8eCG4z6M50Es/Hv/G21Aqpb6wclRCT9QBCCeI5STzd8KpyD6g0aP197mZ4o
	mNt8oHq7cDCB9qLcaLTHUWQygEenkKQ5K4HHmA6yqVLkjBXXYGm1PvJoXJJUG4aCwBDZOBt/Z7Ilf
	uV19cnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtb3-00000009oca-2DIT;
	Mon, 03 Nov 2025 12:23:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtb0-00000009oc8-2rc5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:23:40 +0000
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E5E7F99F;
	Mon,  3 Nov 2025 13:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762172501;
	bh=HEShMzZKAsuD2pJQ1j+0chm5T3Nli1m/xpt2pjx+ejY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APEaBeGRxHqPYPNuEVrAcHNep/jjdgFLhbG9UWla37ARJU0RUb2V20wikG9Y5WtAc
	 Jb4OimaCU+KfrW35gTqmK6nrnaMqy7Fc2sdC9dX8JXa9q5w610E5Tw1iy8FiYPCvLl
	 5s+Pl1rwsehi3cDP7nFSXLUHRSe9QB8r3+d+yUkc=
Date: Mon, 3 Nov 2025 14:23:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Message-ID: <20251103122320.GT27255@pendragon.ideasonboard.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-1-3ad1af7c3d61@nxp.com>
 <aPuAVqVUHjrPCbIH@lizhi-Precision-Tower-5810>
 <20251026220438.GG13023@pendragon.ideasonboard.com>
 <aP/F3joJ0RnL0G1z@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aP/F3joJ0RnL0G1z@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_042338_884467_05897B69 
X-CRM114-Status: GOOD (  34.02  )
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

On Mon, Oct 27, 2025 at 03:19:58PM -0400, Frank Li wrote:
> On Mon, Oct 27, 2025 at 12:04:38AM +0200, Laurent Pinchart wrote:
> > On Fri, Oct 24, 2025 at 09:34:14AM -0400, Frank Li wrote:
> > > On Fri, Oct 24, 2025 at 05:46:52PM +0800, Guoniu Zhou wrote:
> > > > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > >
> > > > The ISI module on i.MX95 supports up to eight channels and four link
> > > > sources to obtain the image data for processing in its pipelines. It
> > > > can process up to eight image sources at the same time.
> > > >
> > > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 26 +++++++++++++++++++++-
> > > >  1 file changed, 25 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..eaab98ecf343a2cd3620f7469c016c3955d37406 100644
> > > > --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > > @@ -23,6 +23,7 @@ properties:
> > > >        - fsl,imx8mp-isi
> > > >        - fsl,imx8ulp-isi
> > > >        - fsl,imx93-isi
> > > > +      - fsl,imx95-isi
> > > >
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -49,7 +50,7 @@ properties:
> > > >    interrupts:
> > > >      description: Processing pipeline interrupts, one per pipeline
> > > >      minItems: 1
> > > > -    maxItems: 2
> > > > +    maxItems: 8
> > > >
> > > >    power-domains:
> > > >      maxItems: 1
> > > > @@ -109,6 +110,29 @@ allOf:
> > > >              - port@0
> > > >              - port@1
> > > >
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            const: fsl,imx95-isi
> > > > +    then:
> > > > +      properties:
> > > > +        interrupts:
> > > > +          maxItems: 8
> > >
> > > should minItems: 8 because you already limit maxItems at top;
> >
> > As far as I understand, when no "items" are specified, minItems defaults
> > to 1, and maxItems defaults to minItems (if specified) or 0 (if minItems
> > is not specified). This is implemented in dtschema/lib.py of
> > https://github.com/devicetree-org/dt-schema.git.
> >
> > Then, in dtschema/fixups.py, if only one of minItems or maxItems is
> > specified, the other one is set to the same value. I believe relying on
> > this is frowned upon by the DT maintainers.
> >
> > We could specify minItems only here, as the top-level constraint will
> > ensure we don't go over 8. That's not very future-proof though, so I
> > think specifying both minItems and maxItems would be best. Confirmation
> > from a DT maintainer would be appreciated.
> 
> I pretty sure I am correct. please below thread, I met many similar cases
> before.
> https://lore.kernel.org/imx/72c29785-eb7a-4cc8-a74c-3aad50129a23@kernel.org/

I discussed this with Krzysztof on IRC last week. He said that in
conditional statements, both minItems and maxItems should be set, except
when one of them is a border constraint (being the same as the top-level
constraint). In that case it can be omitted.

So in this particular case you're right, we should specify minItems
here, not maxItems.

> > The fsl,imx8mp-isi block above should then be fixed. It currently only
> > has maxItems set, minItems should be set to 2 as well.

The fsl,imx8mp-isi conditional block should specify both minItems and
maxItems, and set both to 2.

> >
> > > > +        ports:
> > > > +          properties:
> > > > +            port@0:
> > > > +              description: Pixel Link Slave 0
> > > > +            port@1:
> > > > +              description: Pixel Link Slave 1
> > > > +            port@2:
> > > > +              description: MIPI CSI-2 RX 0
> > > > +            port@3:
> > > > +              description: MIPI CSI-2 RX 1
> > > > +          required:
> > > > +            - port@2
> > > > +            - port@3
> > > > +
> > >
> > >      else
> > >        properties:
> > >          interrupts:
> > >            maxItem: 2
> > >
> > > to keep the same restriction for existed compatible string.
> >
> > We already specify the number of interrupts in two separate conditional
> > blocks above, with any else statement (for all but fsl,imx8mp-isi first,
> > and then for fsl,imx8mp-isi). Both specify maxItems, so I think we're
> > fine.
> >
> > > >  additionalProperties: false
> > > >
> > > >  examples:

-- 
Regards,

Laurent Pinchart

