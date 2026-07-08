Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6B5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnkgHBD26F/8kXqiFVoT59yFz6TX2aNaiI+Qen/RktQ=; b=ygOuchPyFni2QoZb5f1+303yvC
	iysh5MPQyLyd0dUJpUY5lGS8LNlUBp0F34XlTLAcVx3OHickblsR+OtJ3YQ4o9n00UHftEjxsRWvw
	nGvGFdIJe6uhUYGgDBfZ6f+anL9JeDTJh1O51U2WpeB+7TPyvRpWgdW85XyO67SBEcB6LjHT3TNlt
	VkEkq6Vj9KK0X6nk1jXFD1vYhp7VcGduUeXcQ7V9yaMcxod+eIFfoXn5kNO59r1j/KWy80srdPl34
	XNQBPgpXKAqVPAlZU8DPPhx1HINuIrFwXfOt2eB6aKITX37k7TxRnUsa4I9n3R8qqqFOsBmvseqCF
	p2Yy2vFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPoz-0000000GwSs-3GPj;
	Wed, 08 Jul 2026 10:48:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPoy-0000000GwSh-3soo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:48:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14CEE601EC;
	Wed,  8 Jul 2026 10:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E1D1F000E9;
	Wed,  8 Jul 2026 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507683;
	bh=UnkgHBD26F/8kXqiFVoT59yFz6TX2aNaiI+Qen/RktQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KFGEJMBqQe+PjrBWqjLmjnWV/JsYzB172brSP6VwoHXDx7xS1ZcLCbVgtMXZufrTW
	 9fYrMj6at+MD4WpHch8E9OcjYOFKZ00/LVyYUTTTys/2rkXqJcTS2PcI1Ne6swd7qY
	 XNDdlddJfFCUqjhGtq2n+UD/JstJBmUye+lM3MRgmXIsdbq91QM8rf86qAEwofPVjy
	 eKBOhffTbvdrIWmxVU0k77Artkj8kd3ORRo48Kl1pjc2tlIV1E9kmYiVm1XWu0iU/I
	 XoynEpx7w6VlPa0M62hCCsbaGJV13MAAkYsuolH6YW85A2jqKW0L8p3/MNuBMeImir
	 i+4N+Uy/hIMXQ==
Date: Wed, 8 Jul 2026 12:48:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Add Aspeed AST2700 DWC3 controller
Message-ID: <20260708-crafty-copperhead-of-whirlwind-1d89e9@quoll>
References: <20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com>
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

On Tue, Jul 07, 2026 at 02:12:04PM +0800, Ryan Chen wrote:
> The Aspeed AST2700 SoC integrates the Synopsys DesignWare USB3 core with
> no vendor glue logic: it is functionally compatible with snps,dwc3, uses
> the standard DWC3 clocks, and the only SoC-specific part is a USB3 PHY
> that is handled by a separate driver.
> 
> Add a dedicated binding document rather than adding the compatible and a
> conditional to snps,dwc3.yaml. This follows the established per-vendor DWC3
> convention (apple,dwc3.yaml, socionext,uniphier-dwc3.yaml, ...) and keeps
> the AST2700-specific constraints - notably the mandatory USB3 PHY - out of
> the generic schema.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---

Why are clocks unconstrained?

Best regards,
Krzysztof


