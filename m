Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88243CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZbbEb+TphuLp7fkKA+DrK5i8dQdGSY1TsbKXS0jOH4=; b=x8ZCpSxNUqz84Jmns/b7BRO0AE
	SdeVzMjqrZRPvfMvSR1hJThozq3LtOoogXDNuslHPEfFGyaEn5YFbzLhc1IU9cIyRA5e44EO147xE
	OC2KFvHBLrOcs970bTf5jqXPThW6ZANDAPHDCyBVXfwEW9QRdBPNOgJHnG1sz4IeyKCRlHPOleYk6
	obR5GB2SX5w/PI/MqclbTfYAfrzYuROGIxzFLeAyp/B0SZJDGX6qzy1zL5kseDXbaUsmUJ/d0HWFz
	LeqNQkxaGQhVFFjC+ozZ628nxDkfekSBxnVrkzX3cfiNWoIXYCL+XwUJszCiVlzxzM0THR1KHpA+T
	4MdN2ScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8rB-0000000CnIQ-0NUb;
	Sun, 26 Oct 2025 22:04:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8r8-0000000CnHw-0YNB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 22:04:55 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 16FBA1F0E;
	Sun, 26 Oct 2025 23:03:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761516185;
	bh=QXwwajsozN6n52An7A1QJ6FAATGmuWpgmNPS6tMrYos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8Qszwq0/C+49obn6G7bQx8qm/+xz2LGOKY9U/QnB1L6FDKfytKEXDR0wZ5c+qhEv
	 bATLGKhxcL1J2VWMrE0BL8CMEVOtJyg3+yDEQVDxhTGj5/FyAuxWgE+97i1Q+NqsD/
	 UC7aqdd2YoMRsNlevHl5e+otCs5ovLhCfNZpoycw=
Date: Mon, 27 Oct 2025 00:04:38 +0200
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
Message-ID: <20251026220438.GG13023@pendragon.ideasonboard.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-1-3ad1af7c3d61@nxp.com>
 <aPuAVqVUHjrPCbIH@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aPuAVqVUHjrPCbIH@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_150454_313728_A3FADD21 
X-CRM114-Status: GOOD (  22.86  )
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

On Fri, Oct 24, 2025 at 09:34:14AM -0400, Frank Li wrote:
> On Fri, Oct 24, 2025 at 05:46:52PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > The ISI module on i.MX95 supports up to eight channels and four link
> > sources to obtain the image data for processing in its pipelines. It
> > can process up to eight image sources at the same time.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 26 +++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..eaab98ecf343a2cd3620f7469c016c3955d37406 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > @@ -23,6 +23,7 @@ properties:
> >        - fsl,imx8mp-isi
> >        - fsl,imx8ulp-isi
> >        - fsl,imx93-isi
> > +      - fsl,imx95-isi
> >
> >    reg:
> >      maxItems: 1
> > @@ -49,7 +50,7 @@ properties:
> >    interrupts:
> >      description: Processing pipeline interrupts, one per pipeline
> >      minItems: 1
> > -    maxItems: 2
> > +    maxItems: 8
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -109,6 +110,29 @@ allOf:
> >              - port@0
> >              - port@1
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx95-isi
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 8
> 
> should minItems: 8 because you already limit maxItems at top;

As far as I understand, when no "items" are specified, minItems defaults
to 1, and maxItems defaults to minItems (if specified) or 0 (if minItems
is not specified). This is implemented in dtschema/lib.py of
https://github.com/devicetree-org/dt-schema.git.

Then, in dtschema/fixups.py, if only one of minItems or maxItems is
specified, the other one is set to the same value. I believe relying on
this is frowned upon by the DT maintainers.

We could specify minItems only here, as the top-level constraint will
ensure we don't go over 8. That's not very future-proof though, so I
think specifying both minItems and maxItems would be best. Confirmation
from a DT maintainer would be appreciated.

The fsl,imx8mp-isi block above should then be fixed. It currently only
has maxItems set, minItems should be set to 2 as well.

> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: Pixel Link Slave 0
> > +            port@1:
> > +              description: Pixel Link Slave 1
> > +            port@2:
> > +              description: MIPI CSI-2 RX 0
> > +            port@3:
> > +              description: MIPI CSI-2 RX 1
> > +          required:
> > +            - port@2
> > +            - port@3
> > +
> 
>      else
>        properties:
>          interrupts:
>            maxItem: 2
> 
> to keep the same restriction for existed compatible string.

We already specify the number of interrupts in two separate conditional
blocks above, with any else statement (for all but fsl,imx8mp-isi first,
and then for fsl,imx8mp-isi). Both specify maxItems, so I think we're
fine.

> >  additionalProperties: false
> >
> >  examples:

-- 
Regards,

Laurent Pinchart

