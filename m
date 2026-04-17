Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DA5F43690
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 11:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIVr4civFt31Q4UG1btJRVgNKZQNEyrGI/O9+phoHgA=; b=WGK4vxpTJRe463XrBbeb5sbHm4
	Ke3KsCqVrcl8xk77wIjXuiGkRbLNavTkUGaBr6PnI98PMfARcongy3N/ZAh09B/Z/lZYq7qgbVDQK
	675amehJ77m/UH3n+7NtgLkMBGJPXTPGy+9T8Zm1AHf0xk65+eLfIj5Uov0dpU5lRctau3JF+xPKU
	82uv/x1bk9QypBb31L1DxdJY25zikqThpe21og7KZxqFSaqZoDbyKQ/Y1M0EN2HuBx51K0rhm2jyO
	J8NhbVabPjLzDYKNPwvPbL8vj+tK2t/lVbSfq0hRpwL42HI9TDebDartgBJV8zTTE72dCPkQ7e311
	b/g4OT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDh2e-00000003xDB-42ZY;
	Fri, 17 Apr 2026 11:07:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDh2d-00000003xD3-0LVw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 11:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2601160128
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 11:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637BBC19425;
	Fri, 17 Apr 2026 11:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776424037;
	bh=OGK/zzlf7s1Dj09xNmuiNKmF9xD2r6v8ccJ78dfRJlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCQpGuG94nCyCtZoshLDxP+GwjQ7pEZRNcQ5vbXp1rYAOWwV4oe+nPH9FyxPAIGGw
	 5cgvPahTPc8xpCGgi7CKDWDgovC3DcXiqoY4mmFjY7+4UWRMsILXrg2Wev862scKao
	 VDE2Tw4qQjJ1fcVOv8qN0zpsjj2eQW30xsOmLWWczyinQ4Lupna8hM+x+BOfMhGXpe
	 25Zk+yObc/WzHLv1+X0G2wqy857SZ1p4VHeAYwKXFqTw+JXTP3R6rfarMU2LU3JcDt
	 zDzqqaqQn5j8ev21bDQP7zo0op+I5I++Wd/H4ornBM/PJdwDQyog2hXe3TiKraAi1C
	 jEPEzKbQ+ds5A==
Date: Fri, 17 Apr 2026 12:07:14 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller: Add support for
 secure donated SGIs
Message-ID: <20260417-ruddy-pompous-rooster-b6d6de@sudeepholla>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
 <20260412-b4-ffa_ns_sgi_gicv3-v1-1-af61243eb405@kernel.org>
 <20260416121146.GA2736962-robh@kernel.org>
 <20260416-true-prophetic-centipede-3ad8e5@sudeepholla>
 <CAL_JsqLdSi2x-KibY7WXTEot8Bj=54XeE1VACtLTujxn0VTxRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLdSi2x-KibY7WXTEot8Bj=54XeE1VACtLTujxn0VTxRw@mail.gmail.com>
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

On Thu, Apr 16, 2026 at 09:02:27AM -0500, Rob Herring wrote:
> On Thu, Apr 16, 2026 at 8:09 AM Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >
> > On Thu, Apr 16, 2026 at 07:11:46AM -0500, Rob Herring wrote:
> > > On Sun, Apr 12, 2026 at 06:04:37PM +0100, Sudeep Holla wrote:
> > > > In GICv3, SGI security is defined by interrupt grouping and configuration
> > > > rather than by SGI number alone. Linux conventionally reserves SGIs 0-7
> > > > for non-secure internal kernel IPIs, while higher SGIs is assumed to be
> > > > owned/stolen by the Secure world unless explicitly made available.
> > > >
> > > > Document secure donated SGI interrupt specifiers for the GICv3 binding.
> > > > It describes "arm,secure-donated-ns-sgi-ranges" for SGIs donated by the
> > > > secure world to non-secure software. It excludes SGIs 0-7, which are
> > > > already used by the kernel for internal IPI purposes.
> > > >
> > > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > > > ---
> > > >  .../bindings/interrupt-controller/arm,gic-v3.yaml  | 27 +++++++++++++++++++++-
> > > >  include/dt-bindings/interrupt-controller/arm-gic.h |  1 +
> > > >  2 files changed, 27 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > > > index bfd30aae682b..664727d071c9 100644
> > > > --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > > > @@ -45,17 +45,24 @@ description: |
> > > >
> > > >        The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
> > > >        interrupts, 2 for interrupts in the Extended SPI range, 3 for the
> > > > -      Extended PPI range. Other values are reserved for future use.
> > > > +      Extended PPI range, and 4 for SGI interrupts. Other values are
> > > > +      reserved for future use.
> > > >
> > > >        The 2nd cell contains the interrupt number for the interrupt type.
> > > >        SPI interrupts are in the range [0-987]. PPI interrupts are in the
> > > >        range [0-15]. Extended SPI interrupts are in the range [0-1023].
> > > >        Extended PPI interrupts are in the range [0-127].
> > > >
> > > > +      SGI interrupts are in the range [8-15] which overlaps with the SGIs
> > > > +      assigned to/reserved for the secure world but donated to the non
> > > > +      secure world to use. Refer "arm,secure-donated-ns-sgi-ranges" for
> > > > +      more details.
> > > > +
> > > >        The 3rd cell is the flags, encoded as follows:
> > > >        bits[3:0] trigger type and level flags.
> > > >          1 = edge triggered
> > > >          4 = level triggered
> > > > +      SGIs are edge triggered and must be described as such.
> > > >
> > > >        The 4th cell is a phandle to a node describing a set of CPUs this
> > > >        interrupt is affine to. The interrupt must be a PPI, and the node
> > > > @@ -136,6 +143,24 @@ description: |
> > > >        - $ref: /schemas/types.yaml#/definitions/uint32
> > > >        - $ref: /schemas/types.yaml#/definitions/uint64
> > > >
> > > > +  arm,secure-donated-ns-sgi-ranges:
> > > > +    description:
> > > > +      A list of pairs <sgi span>, where "sgi" is the first SGI INTID of a
> > > > +      range donated by the secure side to non-secure software, and "span" is
> > > > +      the size of that range. Multiple ranges can be provided.
> > > > +
> > > > +      SGIs described by interrupt specifiers with type 4 (SGI) must fall
> > > > +      within one of these ranges. SGIs(0-7) reserved by non-secure world
> > > > +      for internal IPIs must not be listed here. "sgi" must be in the
> > > > +      range [8-15], "span" must be in the range [1-8], and the range must
> > > > +      not extend past SGI 15.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > > +    items:
> > >
> > > As a matrix, you need:
> > >
> > > items:
> > >   items:
> > >     - ...
> > >     - ...
> > >
> > > However, given this is at most 8 entries, I would just do an array:
> > >
> > > minItems: 1
> > > maxItems: 8
> > > uniqueItems: true
> > > items:
> > >   minimum: 8
> > >   maximum: 15
> > >
> >
> > Makes sense.
> >
> > > Unless we need more flexibility in GICv5?
> > >
> >
> > IIUC, there are not SGIs in GICv5 and we may need to use one software PPI
> > as a replacement for SGIs. LPIs are used for IPIs.
> >
> > I am assuming Marc will soon post his opinion/rejection on this series 😉
> > based on some offline discussion we had with respect to how it fits with
> > GICv5.
> >
> > > Is there an example we can stick this property into so it gets tested?
> > >
> >
> > Not sure if [1] serves as an example or you are looking for something else.
> 
> In the binding example, but don't add a whole new example for it.
> 
> Did [1] pass validation? If it did, it shouldn't have and I need to
> investigate. If you didn't run it, then that would be the reason I
> want it in the binding example.
>

By validation, do you mean `dtbs_check` ? If so, yes I didn't see any
warnings. But it is likely that I might have missed some flags as I was
doing `dtbs_check` and `dt_bindings_check` after very long time. I will
check again. But the commands did produce warnings in other files.

-- 
Regards,
Sudeep

