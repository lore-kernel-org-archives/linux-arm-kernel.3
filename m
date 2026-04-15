Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C35F433CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7o2D3wvzMntOCnPcrvsa+oxe8pjqXUltjCcehmZT1mg=; b=3guEVx++0Qc/L7g5rKxHcHRzTX
	q3HgGXMCBLsjHRo59qBral8ehrOS/ka2pKnFZHSzcObDinAodopZbYrVYUTXgox4dC9soXEpK0uoM
	XkCvHQpvk4NntiHFsA6HwOoZKRxvJlzDLNsScaoAFI5UxnZU6B/MRjJcIrFz27Pk4xVzXxBKEq7/I
	63a+f9FP0Ee7wsNXshyQ7L25J8MEy0d3GGd9PvHIvE5v4RugkStJxX2RZTJOL7Kvubkirvpsofc16
	iZrnqoS+5Ek2NsQVgjLJm8IB1wQWI3wdxZlgOSXbTZ5da4d0y7BJYenBrarkrSLAET8JfVanUgt0Z
	OSPsEdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8mB-00000001hQ1-1Amf;
	Wed, 15 Apr 2026 22:32:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8m3-00000001hOk-00Vz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 22:31:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06BC360128;
	Wed, 15 Apr 2026 22:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A6BC19424;
	Wed, 15 Apr 2026 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776292313;
	bh=usjqRhUrHdefvg550NoYkdLrbpoiUwaN7du2pNz9Hfk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RgPGHcG7qAh3Bm8lSOD0W1RTlWds35ZM7iCvHAVan/F0bxi5KjXOn14BpCMHdLTYm
	 MnM1nW03Pq8s0gQLoZzGlLYk9YFR94+YdPqh1eI/zmMzkI4kvKbwNYK1WhY8gOQcSk
	 bImXyxcThqQ17u22HZLrtys2sZzNOmSYiHojjyziivyWExaAbK3bVYS0aoPLYEGzP3
	 YmdpuQ1BSjJByAnJVErMpOiLlQO6EhyX5YbHZNsGdGG0+skpFMsfRhFdsiTUyPUS5m
	 o3tikdeBqR56sbjiyt1e82q/CayP2M4xNeBK5EnJxIMZOjoeJ0KeMd7xJ3/jL6p1mM
	 P7udaw+Ph2+Vw==
Date: Wed, 15 Apr 2026 17:31:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Joel Stanley <joel@jms.id.au>, Conor Dooley <conor+dt@kernel.org>, 
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
 Andrew Jeffery <andrew@aj.id.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20260414-upstream_pinctrl-v6-1-709f2127da33@aspeedtech.com>
References: <20260414-upstream_pinctrl-v6-0-709f2127da33@aspeedtech.com>
 <20260414-upstream_pinctrl-v6-1-709f2127da33@aspeedtech.com>
Message-Id: <177629231003.934121.15016914373469082341.robh@kernel.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
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


On Tue, 14 Apr 2026 17:38:59 +0800, Billy Tsai wrote:
> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
> 
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
> 
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 170 +++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'if'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'else'
	hint: Keywords must be a subset of known json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260414-upstream_pinctrl-v6-1-709f2127da33@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


