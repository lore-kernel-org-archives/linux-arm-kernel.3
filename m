Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070F3CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiliuuOVjwYb2973zyov9AYHPa1hvkQkF2eaAVJrrMk=; b=srce4OcFkbRPHQCZk2ZiOiKD7+
	q71sdyRcP9+l6kIgjGTfRUqxNXElvQzQebgkbOhzjjvrtFb6jD/JB9fStN233Zru1VZxz1PtAqQtO
	5k0K/dShP28WOdo9GE7nYgB1KfKPDWQ89yRBslq4Q3+Xx/ZSO8nI0UYHopsAw7jn8IDfXzHa8FJCB
	zIW14y05jqg1QRsAygNoaF819qYtoUdgN5y89jRE91xN+ksbusiuGDf1ZZ+/oG8Au7/ceTH8N3H55
	u6bq2Vd6Ycd0NBl+C5T+jlFyd4rVepIfOUp3bpd8+UtbIUPmugaMVKjTkQL4HLIs1npor38h9Vo3b
	1T0nJaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbc61-00000004qez-3QtI;
	Mon, 22 Jun 2026 10:41:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbc60-00000004qer-40NI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 10:41:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E19741844;
	Mon, 22 Jun 2026 10:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC591F000E9;
	Mon, 22 Jun 2026 10:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782124900;
	bh=UiliuuOVjwYb2973zyov9AYHPa1hvkQkF2eaAVJrrMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a05AeJ2P5OTFGfve6EbbPxM5WUlF9yDZGZasSRH7idEdKv7LonTJwuOxaQKO/G8sU
	 FXW0FUDlgUCllct3Qv/WsefJcj5Q/eyB+3Z+RWD0WTXOFHz9ihTHU5KX+v+LROfSiT
	 G8gVyYfo45YxbyJvS4zITqMGN7jQDsSZrb6MBdCKM2YxqW/3WGMdEu4XPzAPkiRLjW
	 IoIfP/NnnL+YHjXUNq2VgUMX5reMy9ZOlVrNEc2xvEkTgqX+Un9CBTECh+Z3IMFzlB
	 pvozdIcjO7pMyo4lgflnXLL8BedQAtKeimsmKj2dLkFMROSxb69km9fGn/MSTJgKw7
	 XSJZMXQwBjSmg==
Date: Mon, 22 Jun 2026 12:41:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, samuel@sholland.org, wens@kernel.org, jernej.skrabec@gmail.com, 
	Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: dmaengine: sun50i-a64-dma: Add
 allwinner,sun60i-a733-dma compatible string
Message-ID: <20260622-fragrant-aquamarine-porcupine-4a3ebf@quoll>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
 <20260622-sun60i-a733-dma-v3-4-f697ef296cbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622-sun60i-a733-dma-v3-4-f697ef296cbc@gmail.com>
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

On Mon, Jun 22, 2026 at 01:36:26AM +0000, Yuanshen Cao wrote:
> Add `allwinner,sun60i-a733-dma` to the list of compatible strings for the
> `sun50i-a64-dma` dtbinding documentation.
> 
> While the A733 DMA controller shares many similarities with the sun50i-a64
> DMA controller, it requires a specific configuration due to differences in:
> - Interrupt register layout and mapping.
> - Number of channels per interrupt register.
> - Support for higher (32G) address widths in LLI parameters.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


