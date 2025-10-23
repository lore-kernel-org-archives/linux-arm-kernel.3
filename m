Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4F2CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 06:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js2b1t0Q75iojHrX4A1NQiTsoUSJx0l+G9nOouSkE3k=; b=i9Fn+jE5b1A5RIi+ixOfJ0Yos9
	WL3k9P9MDa/4Al1Uk97gvdS63BZ+0RKYJhf2VqvOJohSdheyLqZbQdaOfKpdcw9KIj3YGLKBY6uJ6
	914RPvtthwQXNlGtlK2Z5KoLhJoWkSixad7sCYGl6d7hI4MHqLifzaz0sSGNITz26gGlp7jHgfgqM
	s9CZxOGw1iFOyGInePGZrOBjzMurwf31/c4RT+hPNsBA05VSI2X0BeQBzqh5AZCH5uE/TN7ywVfGv
	AbGRkaGIy1z6YJ3wXGFBYWYl/WcwNgsrkjQVL5aFLKhTF6bgaC4mwH+sgIKPO0RHPw7EvDOFeqgoy
	gf3O0NRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBp3H-00000005EhX-1a7J;
	Thu, 23 Oct 2025 06:43:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBp3E-00000005Eh0-2WcV;
	Thu, 23 Oct 2025 06:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D31C548C52;
	Thu, 23 Oct 2025 06:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC70C4CEE7;
	Thu, 23 Oct 2025 06:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761201835;
	bh=wq+PR3JQ5rz4ZSLM4QLGVeX/gN+W7vLpvlbttzeFtxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UOGZ6THX+KPz+fnPS5IScnjRV0adu4aQoy6YNzJ+hZrkQ7aeE9Ms19UvzFAVImC1E
	 6QlKvIyK47+4zHYNw+rZnANKkid7mEn6aX/h9hIf3MrFgTLAk/MIcfagQD5MyuFijV
	 vSlQyyDsYGYBK0zsR6y4yjEcbe7gpgbWSd2benJxLYFlPAx19knlG7j1f3PXB5oAeu
	 oYKjMgn018VPkjFeAV3D5wAf2RW+LQFZF1dBZ1HMR3KVANuH6n/2BE5B3zFYBilpNq
	 wGlsZXsShmlWcPwcWUF5QHN6WgdJSwBxGCo45QA1rBJtO8h6sqdCvM7lFtzSW8hj5m
	 R+ZAR0vgmbEjA==
Date: Thu, 23 Oct 2025 08:43:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: google: Add Google Tensor G5
 USB PHY
Message-ID: <20251023-collie-of-impossible-plenty-fc9382@kuoka>
References: <20251017235159.2417576-1-royluo@google.com>
 <20251017235159.2417576-2-royluo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251017235159.2417576-2-royluo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_234356_703335_AE4DFCB9 
X-CRM114-Status: GOOD (  18.69  )
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

On Fri, Oct 17, 2025 at 11:51:58PM +0000, Roy Luo wrote:
> Document the device tree bindings for the USB PHY interfaces integrated
> with the DWC3 controller on Google Tensor SoCs, starting with G5
> generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
> 
> Due to a complete architectural overhaul in the Google Tensor G5, the
> existing Samsung/Exynos USB PHY binding for older generations of Google
> silicons such as gs101 are no longer compatible, necessitating this new
> device tree binding.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/phy/google,gs5-usb-phy.yaml      | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> new file mode 100644
> index 000000000000..c92c20eba1ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025, Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor Series (G5+) USB PHY
> +
> +maintainers:
> +  - Roy Luo <royluo@google.com>
> +
> +description: |
> +  Describes the USB PHY interfaces integrated with the DWC3 USB controller on
> +  Google Tensor SoCs, starting with the G5 generation.
> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 PHY IP
> +  and USB 3.2/DisplayPort combo PHY IP.
> +  The hardware can support three PHY interfaces, which are selected using the
> +  first phandle argument in the PHY specifier::

Just one ':', anyway this sentence and below does not belong to
description but to phy-cells. You describe the cells.

Or just mention the header with IDs - here or in phy-cells.

> +    0 - USB high-speed.
> +    1 - USB super-speed.
> +    2 - DisplayPort
> +
> +properties:
> +  compatible:
> +    const: google,gs5-usb-phy
> +
> +  reg:
> +    items:
> +      - description: USB2 PHY configuration registers.
> +      - description: USB 3.2/DisplayPort combo PHY top-level registers.
> +
> +  reg-names:
> +    items:
> +      - const: u2phy_cfg
> +      - const: dp_top
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: USB2 PHY clock.
> +      - description: USB2 PHY APB clock.
> +
> +  clock-names:
> +    items:
> +      - const: usb2_phy

core

> +      - const: u2phy_apb

apb

> +
> +  resets:
> +    items:
> +      - description: USB2 PHY reset.
> +      - description: USB2 PHY APB reset.
> +
> +  reset-names:
> +    items:
> +      - const: usb2_phy
> +      - const: u2phy_apb

Same here

> +
> +  power-domains:
> +    maxItems: 1

Best regards,
Krzysztof


