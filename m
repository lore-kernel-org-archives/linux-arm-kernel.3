Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602CFC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 15:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNhe4W7vZH7v6vb2ZLAgr6koqFkN+mn2b012qM/UmVs=; b=PsxOksOUsZM+PW44DdhMnQ0/vK
	8TJYHOo7ZYiyuU+ouognuvalZTYkmDW7Q1PI7kSJbpXH2bnzPvZjpyTWYgDm/xCRqjxsQmHE13X3V
	r5tKQ1rzNT9Mz77apPV12/Vcj8sjSBaLfcRq/w/GmlrEfXGiCmPbOiWRlb60ilHNLKVgaZdMZlATG
	RRYOT8sXermHCFJznijR2uTtal2bUnaAfLckyzenlJ5V/r1tYPY5QcderTqmyVlFCFJpZqhT0EFuU
	v3dP13mCnFtw6399XlwvbpLB8ObEtp6bKXdw1Kui+Y3yNN/VdyQPH5l6NGTeQBeRAqaTVTFU4W6fP
	unvqce0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaYv-00000005kex-14PV;
	Wed, 21 Jan 2026 15:56:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viaYu-00000005kea-1jNa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 15:56:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9ABC3600AD;
	Wed, 21 Jan 2026 15:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3561FC4CEF1;
	Wed, 21 Jan 2026 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769010963;
	bh=B6U1Ofk9F1wTEsHuFfC1/BhHkDnhP0tr/NtPJUGxDIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdKGfU+zIV3gmykIXhiL/Av+WT3F+Aq1N9fsUZfjQwGpTgJZytuVkb3sBVA7WPDDh
	 bX2ZwzvH0GfaCHtrBD9brhMXMIkwDyNZoBNJ3Ot9lU5COkWgJMsu9l7l02E67gQFd9
	 uCbIGui53xUfRh+fcQUKx9JGYOAxwItdnnWHn4GiLccGb0VoyQBrw85e5XNrmcfnDf
	 S2JcOXYrcJPC3NI4SJ19UjJcMlvUZlB6boYWr1R7yUUp2MF1cJbSWC3Z15ApenP215
	 MrYhGiDRTsyCiW81zD/RbyWjejwnta+7HAeL7BMx9KFjjxnd3WwIWbZ3tOLgDKwduI
	 vmim4kIwzdpwg==
Date: Wed, 21 Jan 2026 09:56:02 -0600
From: Rob Herring <robh@kernel.org>
To: Aniket Limaye <a-limaye@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, u-kumar1@ti.com,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, j-mcarthur@ti.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: ti,sci-intr:
 Per-line interrupt-types
Message-ID: <20260121155602.GA3196596-robh@kernel.org>
References: <20260120-ul-driver-i2c-j722s-v2-0-832097c6b64f@ti.com>
 <20260120-ul-driver-i2c-j722s-v2-1-832097c6b64f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-ul-driver-i2c-j722s-v2-1-832097c6b64f@ti.com>
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

On Tue, Jan 20, 2026 at 04:13:46PM +0530, Aniket Limaye wrote:
> Update the bindings to allow setting per-line interrupt-types.
> 
> Some Interrupt Router instances can only work with a specific trigger
> type (edge or level), while others act as simple passthroughs that
> preserve the source interrupt type unchanged.
> 
> In addition to existing edge or level interrupt setting, add a third
> enum value 15 (IRQ_TYPE_DEFAULT) for "ti,intr-trigger-type" property, to
> indicate that the router acts as a passthrough. When set to 15,
> "#interrupt-cells" must be 2 to allow each interrupt source to specify
> its trigger type per-line.
> 
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
> Changes in v2:
> - Reword Commit msg to better describe the patch
> - Link to v1: https://lore.kernel.org/r/20260116-ul-driver-i2c-j722s-v1-1-c28e8ba38a9e@ti.com
> ---
>  .../bindings/interrupt-controller/ti,sci-intr.yaml | 42 +++++++++++++++++++---
>  1 file changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> index c99cc7323c71..59c01f327f3b 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
> @@ -15,8 +15,7 @@ allOf:
>  description: |
>    The Interrupt Router (INTR) module provides a mechanism to mux M
>    interrupt inputs to N interrupt outputs, where all M inputs are selectable
> -  to be driven per N output. An Interrupt Router can either handle edge
> -  triggered or level triggered interrupts and that is fixed in hardware.
> +  to be driven per N output.
>  
>                                     Interrupt Router
>                                 +----------------------+
> @@ -52,11 +51,12 @@ properties:
>  
>    ti,intr-trigger-type:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [1, 4]
> +    enum: [1, 4, 15]
>      description: |
>        Should be one of the following.
>          1 = If intr supports edge triggered interrupts.
>          4 = If intr supports level triggered interrupts.
> +        15 = If intr preserves the source interrupt type.

Why do you need this property in this case? #interrupt-cells == 2 means 
preserve the source type and this is redundant. Just disallow 
ti,intr-trigger-type when #interrupt-cells == 2.

Rob

