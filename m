Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE82CC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 07:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8F627ALJhleDf0joQLUIY5WzrQ4sqzAfgG0V7XR4JzM=; b=nwvXZMeMlru7nsGLSv8H2to7R/
	Vm1TYrDMbdrBVk3qyAuvD7JQcx0MFgpulL7LD4LqjlQyl7T8PKxz4Ug7b3tusxR1FlijgdR6v6hxo
	tKiTwG7xyRxGHqu3yg5+mMFup7cq+cE3HLPMOKE/Bzh2jvo3PoC6FjBxM9tNsbF+Gbv6XfHNZwfZu
	gCisWmc7upAuaE9l1LZ0AL9H9fmhl5oP88AsSoUDb62vtIxZlAZwyBZvUibUMaKrF8j2BVpKCZLF/
	FxTQtZeDKfYXXrIOiClNowRtKbfTNfkY0dqqML9eRh6tEd1osb2OVz6zpZq8F6dr1VcJFZofx6FFn
	zDcwDUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSjf-0000000CY6a-3iOm;
	Mon, 24 Feb 2025 07:18:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmShf-0000000CXpH-2cmL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 07:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41E766117D;
	Mon, 24 Feb 2025 07:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48827C4CED6;
	Mon, 24 Feb 2025 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740381394;
	bh=2pBGmTogQCkZU/xIxkV1ntJSYG2JD2YqKohqWLQmXu4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dCsrvMjQLCzpbeyKIBH+s0BVDBGeHCz9RrZkebic83ktfM4vw0gqL8fje2cJ5ce7e
	 BaDVvtxsrgzSHK+16pwIQsUc5y3vkghLu8MY96zCwSEVhw6Pb2HYEDKE2jfCqmE8TC
	 Vtdc5FOmfpVaPd4TNIxN73EtlG0TwoJae/v9IRjHuOfHYL/Evaz+dIDXafrvMlZZ/J
	 x+Y92P5h6+h+F+IN6f9lZ1QOhhC7uTYvI4FhKjz+E3qEX8Gp8GA69GF2iSD31NXE/o
	 NspuiHPWB2/ZlbdGfFFJssj9Nrdvt5VtS5f0Ym8k/mHGz0Ssto5wY6vU7rc6qO1fmw
	 YE8PdOQ2jmDNQ==
Date: Mon, 24 Feb 2025 01:16:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: benh@kernel.crashing.org, linux-i2c@vger.kernel.org, 
 andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org, 
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, andi.shyti@kernel.org, 
 krzk+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, 
 andriy.shevchenko@linux.intel.com, conor+dt@kernel.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
Message-Id: <174038139252.1126908.7016492425946254564.robh@kernel.org>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
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


On Mon, 24 Feb 2025 13:59:34 +0800, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml:82:1: [error] duplication of key "allOf" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml:82:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/i2c/aspeed,i2c.example.dts'
Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml:82:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/i2c/aspeed,i2c.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224055936.1804279-2-ryan_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


