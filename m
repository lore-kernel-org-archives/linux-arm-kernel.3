Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AA0C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG/6Fv2bcz1mAueTl+qPLK+unA1gaooKi0HCYFLNsdg=; b=Ri6A4K4h6ynHkcRXbAwZ0Twh8r
	rHahWCJ9JtQZvdFDVAlNyKIeIupQr8ljGoJZ6qG55to4dc9nmHS/DgfMXfTkctfE8Bkel+tqc5BLN
	gWcgvXRbJL4LuTlmxFnQa0S2rRckxRolv/hdfkRm6N+oGjrEiPNKS3xXpItxvqO6jyRx8NtdrTxuW
	Cc0XTa4uv71HTgUY4cVEMNR0raipOOdhLcrBEbDd395kUIi5/fFuZA+8cNLXcWmYdaA9jWiQ/PciP
	EMWCz67mIR9q6QX9CFlA9ot1YmnQPOYcbeE5F5vi1hCRi1zG9BMaFuQ86DterbEsx8NDUBIzsKMZ0
	vNtLrC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ldM-0000000BTAE-12pj;
	Thu, 24 Sep 2026 15:45:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ldK-0000000BT9n-1p2s;
	Thu, 24 Sep 2026 15:45:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B42E442AE1;
	Thu, 24 Sep 2026 15:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA981F000FF;
	Thu, 24 Sep 2026 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790264713;
	bh=sG/6Fv2bcz1mAueTl+qPLK+unA1gaooKi0HCYFLNsdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F+4CPVvGqRU7cWG77qGDCQaRPb8xepVCbRHAvZdCvk4o3dSF91r1bTtAW0I17qb4n
	 9om2NQ6/sdwiTQTj6MyZJEueL3EhxpOozpYEJJxZUSUqdp9g2KqralDt4l5SbkEt7Y
	 uKLdfdoqB+GrhrOSwfY2GiXSTZqtrPb7+tf7P1lPu3iHlyC5v+A27E4pL+jRvWKShT
	 1B2BJJohREERibFQ+Pe1wqD8isyDjeLbODb4+nvzgwhOC/S2T20nwzNMxN9TNjlB9s
	 6mztoDYsyBJXxFLbcCbFLGQOacEy4zD+90rDZ3qJYl5OPaR8LFKVndBGyzABZLzlK/
	 8Gi9eTh0br5xg==
Date: Thu, 24 Sep 2026 10:45:11 -0500
From: Rob Herring <robh@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: cjd@cjdns.fr, netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com, daniel@makrotopia.org,
	linux@armlinux.org.uk, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH v2 net-next 2/7] dt-bindings: net: dsa: mediatek,mt7530:
 add passthrough mode
Message-ID: <20260924154511.GA231859-robh@kernel.org>
References: <20260915174643.253660-3-cjd@cjdns.fr>
 <178967819278.22033.11186084049097912254@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178967819278.22033.11186084049097912254@kernel.org>
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

On Thu, Sep 17, 2026 at 08:49:52PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 0 · Low: 2
> 
> - [Low] The added `description` paragraph in
>   Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml (lines…
> - [Low] Concern (retained for policy combination, assessed as a false
>   positive): the binding advertises a passthrough mode that…
> 
> --
> 
> dt-bindings: net: dsa: mediatek,mt7530: add passthrough mode
> 
> This adds a paragraph to the mediatek,mt7530 binding description explaining
> that MT7530/MT7531 switches can be operated in a "passthrough" mode where
> traffic moves unconditionally between the CPU port and a DSA link port to a
> second switch. The paragraph also states that in this mode the upstream
> switch may have no other ports or switch configuration.
> 
> > diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > index 90b3582b76190..e29fb86934981 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> > @@ -73,6 +73,13 @@ description: |
> >  
> >        Check out example 7.
> >  
> > +  The MT7530 and MT7531 switches are capable of being operated in "passthrough"
> > +  mode. In this mode, traffic is unconditionally passed between the CPU port
> > +  and the DSA port which links to a second switch. To use passthrough mode, the
> > +  upstream switch is configured with a DSA link to the downstream switch. In
> > +  passthrough mode the upstream switch is restricted, with no other ports or
> > +  switch configuration allowed.
> > +
> 
> [Severity: Low]
> The last sentence states a hard device tree constraint, but it only exists
> as prose.  Should this restriction also be expressed in the
> machine-checkable part of the schema?

I don't know if that is possible.

> As it stands there is no new property, no if/then under allOf, and no $defs
> entry that limits the port set when a port carries a link phandle.  The port
> container in this same file is permissive:
> 
>   patternProperties:
>     "^(ethernet-)?ports$":
>       type: object
>       additionalProperties: true
> 
>       patternProperties:
>         "^(ethernet-)?port@[0-6]$":
>           type: object
>           additionalProperties: true
> 
> so a device tree describing an upstream MT7530/MT7531 with a CPU port, a DSA
> link port and extra user ports, plus gpio-controller/interrupt-controller,
> still passes dt_binding_check.  The layout is instead rejected at probe time
> by mt753x_check_passthrough() in drivers/net/dsa/mt7530.c, added by the
> following patch in the series:
> 
> 	if (passthrough_ports > 2 ||
> 	    (passthrough_ports == 2 && enabled_ports != 2)
> 	) {
> 		dev_err(dev, "Only two ports allowed in passthrough mode\n");
> 		return -EINVAL;
> 
> Two smaller points on the same paragraph:
> 
> Every other topology description in this description block ends with a
> pointer to a validated example ("Check out example 7." just above).  Could
> this one gain an example too, so the passthrough layout is actually exercised
> by dt_binding_check?

We don't really want more examples if there are actual .dts files 
upstream.

Rob

