Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FCECA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgUX0ii0uYxzjf7gvJ6LbuMXqEimXK9XD6l6fEYf20Q=; b=aPyXKUDEWTof51xvih+u7E7IL5
	tPnF5gNNRko2Y3wmS+5i5O6pYPuU0zVLJtpwzqP4bDIWRoVc7hPYA90X5kyCR68uIQLX0tV8xZK4U
	IVK94LeL8Mex5f/a1af0tieOEaz2rYFc6v0t+Lp+ljGd7N7piOrdv8sE4rjqGtuD0lf1xB3+ssbw0
	KsiZMhsO241YCgZkdESZJZrjVtiBwz5JVM/plmbNTHzfL/zqTWKTJVYO+ubsNaxmWsTo1ETQaUsL6
	ES7raGSjaBFCMPoRUCTNFDiQ5RZbSEEOXID4+4jsXsp0/mg/6gJOU4yloc3yGQ4GyZRSlugkSTIKo
	ixV54Sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFb6-00000008yd3-3bJi;
	Thu, 01 Oct 2026 12:09:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFWo-00000008ozK-3vyB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:04:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46F1B40840;
	Thu,  1 Oct 2026 12:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCCB1F000FF;
	Thu,  1 Oct 2026 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856286;
	bh=hgUX0ii0uYxzjf7gvJ6LbuMXqEimXK9XD6l6fEYf20Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RPrwRMNeyziaNxy1CS1ZueSBS6AiEcQ1A+jWl175wRKI5L5gbEJNbGPySgltpn0xA
	 9mTG1XF1EqUaS/Qyywo/aRjV+x8Ed39TA0d0L2z0YDJan9xAErjESPO4pLLFMtUp7k
	 HlDETdYjFtMr3Wl3RF2AgpXD3XuMWsSqS9diq1ONUliPQJb8xNwwF7qPsOo7/PgTut
	 Pi8INglaVY9/afFE7ilJERMc/VUioeJG3JX6AX7+BY0OAWJ619q2BjNH2lKpG0gkJq
	 XdrgyAQyJj3GDBm9G+bXGQ4WjLJatED4SiNu7dHFhsDRjIriAXPYJ+VnU5BS2SlMmL
	 6d6iJDp1gfO8A==
Date: Thu, 1 Oct 2026 07:04:44 -0500
From: Rob Herring <robh@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Message-ID: <20261001120444.GA1048975-robh@kernel.org>
References: <20260921232834.3138571-1-robh@kernel.org>
 <20261001100455.GL14479@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001100455.GL14479@e132581.arm.com>
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

On Thu, Oct 01, 2026 at 11:04:55AM +0100, Leo Yan wrote:
> Hi Rob,
> 
> On Mon, Sep 21, 2026 at 06:28:33PM -0500, Rob Herring (Arm) wrote:
> > Some static funnel nodes have APB and AT clocks. Allow one or two
> > clocks and the apb_pclk and atclk clock-names entries.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > ---
> >  .../bindings/arm/arm,coresight-static-funnel.yaml      | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > index 9598a3d0a95b..4a3d08f9568c 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > @@ -30,6 +30,16 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >  
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: apb_pclk
> > +      - const: atclk
> 
> The question is that a static funnel does not need to program any
> registers, so in theory it should only need atclk as the module's core
> clock, but not the APB programming clock (apb_pclk).
>
> Maybe I did not get this right when I initially enabled the static
> funnel in hi3660-coresight.dtsi. We should probably remove pclk from the
> static funnel node.

Yes. I suppose in theory it has some clock, but if pclk needed to be 
enabled, it is shared with all the other coresight components and 
enabled anyways. And there's no atclk defined, so 'clocks' can just 
be removed. Can you send a patch to do that, and I'll drop this one.

zynq7000 is even more of a mess I just noticed...

Rob

