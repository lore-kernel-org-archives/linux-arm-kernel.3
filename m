Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB12FF60D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47r9K84aQHii4xa02ABxmq26rEj0BLUtumOM+BCsiV4=; b=X98znw1hTxd9GyCRcNMlSTRqIA
	sBHeCmIPpf4Wed2aEwhodx0Ium0APqTgRfcdvpW+0UcEGI+mIeRYqKryRENKiL95s/r2Ri6s4S/jZ
	UQRrSIIUZYg9a1P+IBSzy8lfpb5YDLy+R1v7mLX6BV9kF5bJrQDIHTf/bi1V8elqXPSY8VZASKM52
	xM8K2sGtLQhVdY4xQe3oAqrh7UTgKVX0cukbsle5zywwusi2k1MjALzilxL2JhdiU9y9nZ0Yr45ep
	YOapDyAGF9HWzX9lEaeTF8MBuWuCe0fQ6BPKR6Uvm2LhFpb9BG0BP/8L5rzBr1kOWw/Zj/E48WyLZ
	6CAp5UtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SsY-0000000CP3v-1gpm;
	Tue, 31 Mar 2026 06:47:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SsV-0000000CP3X-2trj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 06:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F0C241791;
	Tue, 31 Mar 2026 06:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F053C19424;
	Tue, 31 Mar 2026 06:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774939627;
	bh=9Im09qmYZGWCtbT+mlfJFXb6Hn2kX5UH/o7ZzZP/L1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GtbBV9lGOF8Kq+J0uN0/aq0fHcjswO5NXh1oX/mmeHALzTL8VVJJ2U3XkcddvCK5/
	 2Zvo0pb4scqWdq9bt0PFAmwFSTlMQWAelrJbltpF3veYac79TSmRPJr07KJut3caek
	 UAzHx/T9MW9c3pCEYQUlMQocGKL8kA2Hy4Y2sL5+JG3OLeYhxR6KyqqClA6TfBeH13
	 LUsI70JcLiQbQl6F0EyKiZQnbH8aXtSFuAbYcDzW7ptApDNqJ07dwbZ0jQBAbxzSOV
	 qy8+soVAjjX+hVjRzUAopj0cI8bR3QgL890Kz73gwhJH6vFvwB0zCbCKoo6qzasK+b
	 dIpeH0HNEPLQA==
Date: Tue, 31 Mar 2026 08:47:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: jk@codeconstruct.com.au, andriy.shevchenko@linux.intel.com, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rayn Chen <rayn_chen@aspeedtech.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v28 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and enable-dma properties
Message-ID: <20260331-fanatic-certain-bustard-fb13bc@quoll>
References: <20260330-upstream_i2c-v28-0-17bdae39c5cb@aspeedtech.com>
 <20260330-upstream_i2c-v28-2-17bdae39c5cb@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330-upstream_i2c-v28-2-17bdae39c5cb@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_234707_750536_27B2C7A2 
X-CRM114-Status: GOOD (  16.18  )
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

On Mon, Mar 30, 2026 at 04:21:47PM +0800, Ryan Chen wrote:
> Add aspeed,enable-dma boolean property to indicate that DMA is
> available for transfers on this I2C bus.
> 
> Also add the aspeed,global-regs phandle to reference the AST2600
> global registers syscon node, containing the SoC-common I2C register
> set.
> 
> These properties apply only to the AST2600 binding. Legacy DTs remain
> unchanged.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v28:
> - update commit message correspond with aspeed,enable-dma.
> - remove aspeed,transfer-mode and add aspeed,enable-dma property and
>   description.
> - Fix aspeed,enable-dma description to reflect hardware capability rather
>   than software behavior
> Changes in v27:
> - change aspeed,transfer-mode to aspeed,enable-dma.
> ---
>  .../devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> index de2c359037da..67b23d1a4cec 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -37,6 +37,16 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  aspeed,enable-dma:
> +    type: boolean
> +    description: Indicates this I2C controller instance has DMA capability.

Compatible implies that "I2C controller instance has DMA capability", no?

How two same devices, with exactly the same or compatible programming
model can have difference in the programming model for DMA (one lacks
it)?

Best regards,
Krzysztof


