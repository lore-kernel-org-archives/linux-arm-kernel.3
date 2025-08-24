Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06560CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei0yXT9OhNKw5vd9ouM+VEZ+M8Vwwvu7fAobgqJgyZw=; b=IB8soZrP3wfgHwMP8GGXoynnn+
	FbiTrv+N24sLYQ0zRnJejCjjpXt0TyKZWiO25BtLggXdC2WDxzGAjyVhW0h0RbrVUEMDzHRD2VAcz
	VXKNfriEdI7Jftk+RBM3uOa/9DxFB0W5PCVvd39kiEOu52N9Ihw295+ezQXV4h8MKBCcsV9gdb4BO
	qWg42/JGGVAlWogZEAtjxl+HYYEFoP1hidPey41/ttGl/5i3NAm6EEDT7jqaqN2tqIeeFDbHp6ruJ
	uNZ78vrZPMt+wYBAdR4NcUEa2Tw89J921ZwNKbKQU7KeXOCCrxZCyJxImFQ4ryFuffR2wmDcMBcjN
	BYBiqk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqAwN-00000006C8C-3lwx;
	Sun, 24 Aug 2025 13:39:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqAtn-00000006BtL-2Zz5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 13:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AEF5601F7;
	Sun, 24 Aug 2025 13:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DDAC4CEEB;
	Sun, 24 Aug 2025 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756042601;
	bh=fcGUraZ1oJA1YVuwW6DMgYgjKRehssHsmjbx5Lc2lTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRvm6Mx6/1ockfTRhz2Brx4DLmpJLHOJtJ/PnG98dNVAZYvrbljdn1zikb2icUpg3
	 LWt140p3aamp9WlXVIUR8glS29TnUO94Yy7rTfd+6zOU6D9IpeODBMr/O1kUc8VDg5
	 4n8AQTW06jZmGZON8IeXFK27Nb61HA9QEJEph6lB9QjEwDim+7nycfh+ORLouqHMvd
	 T6RdqzFY+BhwcUixTeE9UGIlHTd8Q44pa3g9KJEKp0tVmAIMlevzKESkpqp3++TQiV
	 2wkh6PphmZLyAuhV0c8Z9ZJ6QI0XCC7MTp1X0ZkGayDTLTXWcgUqk17I1T0b9fkBHM
	 xXcP9pEXmgGOw==
Date: Sun, 24 Aug 2025 21:19:24 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/14] dt-bindings: dma: dma350: Document interrupt-names
Message-ID: <aKsRXFZ8h08w-vbf@xhacker>
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-9-jszhang@kernel.org>
 <eda79403-375b-4d49-9fec-12bc98bf9e47@kernel.org>
 <aKrgDVaynJxnmR9r@xhacker>
 <f28fd898-83f2-46af-9f5d-b98be4518520@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f28fd898-83f2-46af-9f5d-b98be4518520@kernel.org>
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

On Sun, Aug 24, 2025 at 12:30:40PM +0200, Krzysztof Kozlowski wrote:
> On 24/08/2025 11:49, Jisheng Zhang wrote:
> > On Sat, Aug 23, 2025 at 06:09:22PM +0200, Krzysztof Kozlowski wrote:
> >> On 23/08/2025 17:40, Jisheng Zhang wrote:
> >>> Currently, the dma350 driver assumes all channels are available to
> >>> linux, this may not be true on some platforms, so it's possible no
> >>> irq(s) for the unavailable channel(s). What's more, the available
> >>> channels may not be continuous. To handle this case, we'd better
> >>> get the irq of each channel by name.
> >>
> >> You did not solve the actual problem - binding still lists the
> >> interrupts in specific order.
> >>
> >>>
> >>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> >>> index 429f682f15d8..94752516e51a 100644
> >>> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> >>> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> >>> @@ -32,6 +32,10 @@ properties:
> >>>        - description: Channel 6 interrupt
> >>>        - description: Channel 7 interrupt
> >>>  
> >>> +  interrupt-names:
> >>> +    minItems: 1
> >>> +    maxItems: 8
> >>
> >> You need to list the items.
> > 
> > I found in current dt-bindings, not all doc list the items. So is it
> > changed now?
> 
> Close to impossible... :) But even if you found 1% of bindings with
> mistake, please kindly take 99% of bindings as the example. Not 1%.
> 
> Which bindings were these with undefined names?
> 
> > 
> >>
> >>
> >>> +
> >>>    "#dma-cells":
> >>>      const: 1
> >>>      description: The cell is the trigger input number
> >>> @@ -40,5 +44,6 @@ required:
> >>>    - compatible
> >>>    - reg
> >>>    - interrupts
> >>> +  - interrupt-names
> >>
> >> That's ABI break, so no.
> > 
> > If there's no users of arm-dma350 in upstream so far, is ABI break
> > allowed? The reason is simple: to simplify the driver to parse
> > the irq.
> 
> You can try to make your case - see writing bindings. But what about all
> out of tree users? All other open source projects? All other kernels? I

make sense! I will address your comments in v2. Before that, let me collect
some review comments, especially from dmaengine maintainer and Robin.

Thanks

> really do not ask about anything new here - that's a policy since long time.

