Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73588CA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiSeSFm/kvhrLzh49a4fyoEhiJlFq4d9oEzzedhJddY=; b=d8iRp5tRPaickzOPFNDw//CfVT
	zImYt+2g1kWQJaXnhkSVFW/CpzLNjB2N5l+orb3flUHa/IeXAjv1Qgu2uDSLdzyQuBhKgzUuKLBTk
	xiK7+SUhWGf21RJ2bAT1NesAy3Y0qKOHxzn/407iGBxsOPL8UlQfx8WST7sYDrprVKkNw2FiLcZzI
	t4wIwKGUYlHPGLR0NETwqM0J5oqxMH/qVzZuRA/HdD90a60T86x/vps1aq+fSuQpAE3NLkfXkxEi9
	BFgDhCnVxcPxMHXxVV7GC0nOKehyeBY5x6NCQam6ruOj75mf4e6wgR1dkwXHktGz0b0oIjXpuU5HR
	gUuH+pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrS3-00000005kEh-1Vy3;
	Wed, 30 Sep 2026 10:22:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrS1-00000005kEL-0eDa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:22:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 96980600D4;
	Wed, 30 Sep 2026 10:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D7F1F0089D;
	Wed, 30 Sep 2026 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763732;
	bh=EiSeSFm/kvhrLzh49a4fyoEhiJlFq4d9oEzzedhJddY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N1E8EkoI0GGLlh0efxN+9NG47E0OkIxtsBgMxqAi+aviD+YvVKadlqMSpkJPzVMlD
	 h5RVFJ/fCY6vzN7ybGnMpz23Gz+ytXgUqEZW2hwwPXeeGak/bHkVYPtlbZcOEM1vPo
	 zYrwIqnJNFzUJkc50gQ+09EjE7nTuCcwkt3ODbxjlq6hNb1ArLwzGwhlaKeZgJMcCj
	 GsnYzm8uLZP3Z5vr3sqJ+AgXqNqJPndhPjp2Kk8z3BlRpYBP9wgUB/bwml+wCtBNY6
	 6djCPwjkOekD1mhAxyr9ZY9Tpf9Jydp3YlY/eFEODDoAIc2UpojC/bV1GngcTLp6z0
	 T6bK5IHMHWTTw==
Date: Wed, 30 Sep 2026 12:22:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com, 
	gehariprasath@ti.com
Subject: Re: [PATCH v10 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Message-ID: <20260930-reasonable-lemon-salamander-c23e99@quoll>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-15-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928025749.1055383-15-s-adivi@ti.com>
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

On Mon, Sep 28, 2026 at 08:26:20AM +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for Texas Instruments K3 Packet DMA (PKTDMA) V2.
> 
> PKTDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml | 189 ++++++++++++++++++
>  1 file changed, 189 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


