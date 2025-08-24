Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFA5CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ac8W/jRJyN5pZ9kUXZM38V1YT0dRtX7IyeTF62/O0N8=; b=aBeqzJJdSGcf/FWogbBQknHtl5
	k7dtgmVAxBjR6PBPyaTInIZiJKlpXFtTiIkrjo5hLblVpJh2vry78XlJmiW0mDMwNfu6ggoD1rrqw
	irRzvRE1wRr6ZfrqT6Jda1m/fuUChG9hkqmoQsnWDhxSCSqiIt7Rff3G0bwiY9D3r1KH5G6n9LXmu
	AVYuOnTdDFeZKK0fsVbHT0qXQrgXtS5MVmxEVjmVEAubC6umgZ0smuFzJwjqanwq0iL5snlrHS2Ot
	dYdrrqNunznLEqVD4SPn/PMxk2RH2UYztFyZKPpZZoFcxyyqsrLY972mAzigR9k2EmohoC/Ua0vcp
	qivj1y3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq7eo-00000005zHo-0CYQ;
	Sun, 24 Aug 2025 10:09:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq7cB-00000005z8y-3CBW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 10:06:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68F12434D7;
	Sun, 24 Aug 2025 10:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC38C4CEEB;
	Sun, 24 Aug 2025 10:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756029979;
	bh=4mLEnNFd4EpeNGIxEHBP3OJwfgbd05akBDpKZWI1BRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D5KrAY3H3VYZfk4OirfR4BXFGb3RpS6zQHISuwoVfNVzo+5MKvN9xZE4zleXOz5zu
	 RHX+Q8nULuVT/zJGW4fpEep4COFtxWreZaAQj1gPf2jf5wE4M/H5Lyru6zNDdLBITf
	 XTamOG/eRZHQVGVZFg1KSYxVVMGq2khK+7IAHwZdWBntR9HDLHu9azBmnlQpbtnYf0
	 FoMNBFdODr2s96MMlBlv+5w8qZq2n1QmMkaN+iuKGBzvPREQZVacClkvytsJ4jk54f
	 lvODxSdgPmIpXkiiEYk5PnIyQ9/SlIdcv3pcIPAMpvgd/CZtKfuVl/8tDXuWL6Z1km
	 5323e9P9lgh8w==
Date: Sun, 24 Aug 2025 17:49:01 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/14] dt-bindings: dma: dma350: Document interrupt-names
Message-ID: <aKrgDVaynJxnmR9r@xhacker>
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-9-jszhang@kernel.org>
 <eda79403-375b-4d49-9fec-12bc98bf9e47@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eda79403-375b-4d49-9fec-12bc98bf9e47@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_030619_827533_25EB3587 
X-CRM114-Status: GOOD (  20.58  )
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

On Sat, Aug 23, 2025 at 06:09:22PM +0200, Krzysztof Kozlowski wrote:
> On 23/08/2025 17:40, Jisheng Zhang wrote:
> > Currently, the dma350 driver assumes all channels are available to
> > linux, this may not be true on some platforms, so it's possible no
> > irq(s) for the unavailable channel(s). What's more, the available
> > channels may not be continuous. To handle this case, we'd better
> > get the irq of each channel by name.
> 
> You did not solve the actual problem - binding still lists the
> interrupts in specific order.
> 
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> > index 429f682f15d8..94752516e51a 100644
> > --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> > +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> > @@ -32,6 +32,10 @@ properties:
> >        - description: Channel 6 interrupt
> >        - description: Channel 7 interrupt
> >  
> > +  interrupt-names:
> > +    minItems: 1
> > +    maxItems: 8
> 
> You need to list the items.

I found in current dt-bindings, not all doc list the items. So is it
changed now?

> 
> 
> > +
> >    "#dma-cells":
> >      const: 1
> >      description: The cell is the trigger input number
> > @@ -40,5 +44,6 @@ required:
> >    - compatible
> >    - reg
> >    - interrupts
> > +  - interrupt-names
> 
> That's ABI break, so no.

If there's no users of arm-dma350 in upstream so far, is ABI break
allowed? The reason is simple: to simplify the driver to parse
the irq.

Thanks

