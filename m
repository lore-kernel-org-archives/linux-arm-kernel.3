Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C255CD41150
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73WOwkJLL7iSfNQnuhhw0SEVGcjxcZqbf/znKTcFg2Q=; b=vcYit/dO/iUIldxKNh8yH20ntV
	1F69PcwIpvCRJHIE3e/zi+sESZARjPOu5mzeWWNVl6H32h+fcqoFHTt9ZCmbs/VYzAuc+PEV1QGe7
	CZ6YDCOix0uuB++05qnAKOPq6sI26vmDeXUfkuVjbMDPznDUzwqyMe9qBdQt6yWAhAfwTeG8ID5JE
	EXd9Tc9xy0nIrpQo3ITBal7TDnjcE4HAjMn0L4Hu1V43yNhjOn8oQOj8docu0LTHsoSLBe2SCfY9N
	IVpFWYvJMeAtQ7p8TDMaamGKOU1TfT5mGbLkBHy1BFBqt8GLvnWUokSyZbQPt97XWxQ1s0mCIf1Og
	PTyMFggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK3I-0000000C70w-3svf;
	Thu, 15 Jan 2026 09:54:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK3H-0000000C70e-3wmK;
	Thu, 15 Jan 2026 09:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DA94601B3;
	Thu, 15 Jan 2026 09:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C13C116D0;
	Thu, 15 Jan 2026 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768470843;
	bh=rkwmLhl2NdMkUxqtMKpON4EP2ZPIE5XSzoXvo0xv198=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lGYM9Ku4NOF+zHabNVCMzyZz6JHwydepB5DeMtLL8+Gi5kFK2EGFz7vjFpQTErOk/
	 +yTyrBwGatJcfNAlQ+ArcnCg45NghWuqqOHz6nItZV6lMvm+/5CA8m3nme7TtP3Dd/
	 r9S3RJYxgG/G6WYCr/TyQfqPpeMw9NuaV5Ms4jXSweXjHK1eye66cxaAYFeR32/3hN
	 nxeyEOIzQWgUQIKcp3tU7lbnTw2E15qsmOtNOrI/Uzq78NC737x5pVnCqYYg3V6msS
	 JMEN8vUVdQiEzqep2nnhYDxQrYn3aUCYQqt5wZNUT7OgnzpHzXFtDmP/529+Ma9XGA
	 xRbAXI5W9eMKw==
Date: Thu, 15 Jan 2026 10:54:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: aspeed: Document AST2700 USB3.0 PHY
Message-ID: <20260115-tricky-invaluable-snake-abec06@quoll>
References: <20260114-upstream_usb3phy-v1-0-2e59590be2d7@aspeedtech.com>
 <20260114-upstream_usb3phy-v1-1-2e59590be2d7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114-upstream_usb3phy-v1-1-2e59590be2d7@aspeedtech.com>
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

On Wed, Jan 14, 2026 at 03:13:10PM +0800, Ryan Chen wrote:
> Document AST2700 USB3.2 PHY. This IP is connected between
> USB3 controller and PHY module.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/phy/aspeed,ast2700-usb3-phy.yaml      | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml
> new file mode 100644
> index 000000000000..83da224d99b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/aspeed,ast2700-usb3-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 USB 3.2 PHY
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-usb3-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: USB 3.0 PHY clock

Drop description, obvious, you just repeated the block name

> +
> +  resets:
> +    maxItems: 1
> +    description: USB 3.0 PHY reset

Ditto

> +
> +  '#phy-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - '#phy-cells'

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


