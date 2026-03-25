Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473DF108B91E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 01:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07p2AHTHoMybNDBcsrSuuplzOKpydQ2b3XLkDqGvEbg=; b=AW0m3+KAGv7ZEuDsdctl3GXvSN
	rUauGbwv/U1NSlkuR6xEeZe2CAKuzWmiXWfU214WzprUu5B5NdSdpyDGCbJWJqQtMJqpo5p1oOWsQ
	S1lKLRVlWGGqnW5luyso2X6K9UXm8HtDbV3iZFwSC9hvnXwQwyXW4C77lOOWTMU23jAf5Tw3MUt/y
	1jn009U4r/7jVwvWc3sB/7Df9dLlsDXXuuLxITdgviI0JhRHfaWrOMtkDmkqDp0lwYzxyY7p5kEk7
	Rf60mCVojhsvdor8kEvIUrYeRMRj49onIVN710txEdZIefB4+f+ALXsGaOfygoZbNQI/U0qNwrC+r
	pXMVa62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DJt-00000002Smf-03jE;
	Wed, 25 Mar 2026 01:46:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DJr-00000002SmW-0oN0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 01:46:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3951260103;
	Wed, 25 Mar 2026 01:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82E9C19424;
	Wed, 25 Mar 2026 01:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774403161;
	bh=HvRVk/YPY3gKc9XAyt9raBZ1qgC/+JELgZiZx+SJ6N4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=P44exNmxQ70a5hsAAw7auqSfc7E3xhP6zmBLbY4VKOeDbOBlza3XzQg6kWsfAEFW4
	 cxI9ZsxnlQhX9NxVYWkUAdeng9+r8dhX1Mr0hig5YUDL/Yr8c5UPAjWhSxiW1CCZ1D
	 qKBJyAingduujPrMri2ea23aolKVEqeXU3CUIvZEVczw73geOtQ5rqVYe4vxQW1PM4
	 KjkJa4P0bYdQY4fC6Yk1YdbFO25qrm0jaz73De8BF3IAnl/pleeGI6tadvBh5ypnE5
	 K92aL6SnMpHQUMSE54vM7nGYX5crg96AMONStV7M3W1ZL1M/1hSbrRMMPsY238m1GR
	 q/XKQSgLSUtIg==
Date: Tue, 24 Mar 2026 20:46:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: jk@codeconstruct.com.au, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Rayn Chen <rayn_chen@aspeedtech.com>, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
 andriy.shevchenko@linux.intel.com, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20260324-upstream_i2c-v27-2-f19b511c8c28@aspeedtech.com>
References: <20260324-upstream_i2c-v27-0-f19b511c8c28@aspeedtech.com>
 <20260324-upstream_i2c-v27-2-f19b511c8c28@aspeedtech.com>
Message-Id: <177440316087.2477729.6574194979133287654.robh@kernel.org>
Subject: Re: [PATCH v27 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
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


On Tue, 24 Mar 2026 11:06:27 +0800, Ryan Chen wrote:
> The AST2600 I2C controller supports three transfer modes (byte, buffer,
> DMA). Add "aspeed,transfer-mode" so DT can select the preferred transfer
> method per controller instance. Also add the "aspeed,global-regs"
> phandle to reference the AST2600 global registers syscon/regmap used by
> the controller.
> 
> These properties apply only to the AST2600 binding and are not part of
> the legacy binding, which uses a mixed controller/target register layout
> and does not have the split register blocks or these new configuration
> registers. Legacy DTs remain unchanged.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v27:
> - change aspeed,transfer-mode to aspeed,enable-dma.
> ---
>  .../devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.example.dtb: i2c@80 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,transfer-mode' was unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260324-upstream_i2c-v27-2-f19b511c8c28@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


