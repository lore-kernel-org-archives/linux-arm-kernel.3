Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695BCCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMB2+OBOhHvjtcjOVbhC4Uj4jiqIRbaW+a/Lb9TNIDs=; b=SehLg+/i4SImFJwFKQ9VXrezI2
	071hyFEzgEUbBW50ue6TB/+7Q+uifv8ufwN+9HHYI98kr6RYNuURpvNgwv0su07iN/593bfRJD6PZ
	SYFsYMSwmZNWDv9Y1+678C9f+HK+mbcKElQNm/2ZVBLjduQfOFiZhax1bGiVl4pEbAwBqk07Ou65y
	F4etevTYT2oRZAYOfWO1ABOg//xpS0PdPd6HFJW1C1i8D/ccM2w3P2m6+DX5/qlqu+K4yYVjSJeUZ
	Tp7X2V/eifi1kNymz9UkAOR9Y+rNpJDc6otQLKpwVpqa41R9FkPuIgzOUO8Bh3qVhX79oFmJZiZ2J
	+4+tCsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7YC-0000000EK6E-2N5K;
	Mon, 15 Jun 2026 13:40:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7YB-0000000EK5w-0YkD;
	Mon, 15 Jun 2026 13:40:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 78A2841AD8;
	Mon, 15 Jun 2026 13:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F531F000E9;
	Mon, 15 Jun 2026 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781530826;
	bh=rMB2+OBOhHvjtcjOVbhC4Uj4jiqIRbaW+a/Lb9TNIDs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=hbDNoefCWx2DjqI4528QInxoQ4xq4D7gRMX3Ae2g9Gec3MUp7O/HNgEQhGE6adQAn
	 mFD1eVf6PsxEp6UMlscpQ8hM9+gS7uGo+lqQcKDopeAivrN7RAjB9RHucJO/B5I5zT
	 Km4+71BmvuGQv7BtgfhQeb3oN2CH9E0zOsx30E1ekB88P9oNs5LgAPaKUYuYs6r55Y
	 kqT/35e+Oy+rpi4pJ6gA+c5xQxH9fuPvn+LS5FxG8vFgbVWSo35nJ5ZJqGX7xzMJAK
	 7ORgb99ZzxljwFqe61veexQ8MGNUaQ10yYV/4vFEH0tGJSGJSSj7nwyav10wlBFJaY
	 H9Mewsp4NPu4g==
Date: Mon, 15 Jun 2026 08:40:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hui-Ping Chen <hpchen0nvt@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Joey Lu <yclu4@nuvoton.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-phy@lists.infradead.org, 
 Shan-Chun Hung <schung@nuvoton.com>
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260615054911.48821-2-a0987203069@gmail.com>
References: <20260615054911.48821-1-a0987203069@gmail.com>
 <20260615054911.48821-2-a0987203069@gmail.com>
Message-Id: <178153082322.1456470.14205688450934768854.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port OTG support
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


On Mon, 15 Jun 2026 13:49:09 +0800, Joey Lu wrote:
> The MA35D1 has two USB PHY ports managed by the same hardware block:
> 
>   - PHY0 (index 0): OTG port shared between the DWC2 gadget controller
>     and EHCI0/OHCI0 host controllers.  A hardware mux follows the USB
>     ID pin automatically.
> 
>   - PHY1 (index 1): dedicated host-only port for EHCI1/OHCI1.
> 
> Extend the existing binding to cover both ports:
> 
>   - The PHY node is now a child of the system-management syscon node
>     with a reg property.  The nuvoton,sys phandle and clocks
>     properties are removed; the driver derives the regmap from its
>     parent, and clock gating is owned by each individual USB controller.
> 
>   - #phy-cells changes from 0 to 1: the cell selects the PHY port.
> 
>   - Two optional board-tuning properties are added: nuvoton,rcalcode
>     for per-port resistor trim and nuvoton,oc-active-high for
>     over-current polarity.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 62 ++++++++++++++-----
>  1 file changed, 48 insertions(+), 14 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): '#address-cells', '#size-cells', 'usb-phy@60' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): compatible: ['nuvoton,ma35d1-reset', 'syscon', 'simple-mfd'] is too long
	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.example.dtb: system-management@40460000 (nuvoton,ma35d1-reset): reg: [[0, 1078329344], [0, 512]] is too long
	from schema $id: http://devicetree.org/schemas/reset/nuvoton,ma35d1-reset.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260615054911.48821-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


