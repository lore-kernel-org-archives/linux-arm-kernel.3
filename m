Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4896CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 05:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlRldqzZo1wQb/Zh7RHVeZqHHv6FPSaM9qvUWuHIyvY=; b=rSCn33UGoVl0Qg8owtQssRZdLV
	YUM0yT2KLP0AdCQ8tdkNjK9KozWVCOIijIpez6UyzRI61uhYv77SRHfctJOonCHn9tW93UDMt3yHG
	H+SpRd+avusT8rUxQ6n+xBi4o+4BUmVCNFlxiLpEMA7MxyW1fhMRpvayDFozEnEDlzFxlNk1hXJn9
	4adsWCDu5ysonw3bBJy2lZgL2eF93Xdi+/C8HpW6KcMrfpFor7DDuaqtccpDt64IK8ujZGf4v0wFv
	BR03EsgwraIjDTciuT4CFPATmaJrwrMjZ5HVFxFXAccQPgQK9Qx8CHUhdx57+VhsVE0n5WBaOYUko
	z7pdPKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCWpu-0000000Ays3-0NOt;
	Sat, 25 Oct 2025 05:29:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCWpr-0000000Ayr0-25sX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 05:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BD4A4428E;
	Sat, 25 Oct 2025 05:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A84C4CEF5;
	Sat, 25 Oct 2025 05:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761370142;
	bh=MBe+jjtIDr5IzoKNMAI2MGqHi0h3OkoveqndsJQpEK0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HLGSFs9rY1X/SHLe+lLF9c+e3TE8ymj+c9UGRxTkzXVc/ublB4JRB8wN7MngtMawh
	 LZBHigEL6GrNk6xZRJtpS3KCaZjizM1aYu0bTsrI3bDUOowU/36cQ7ocU8f9BWEJk8
	 /kdIpkC1EeHaejB3xc/dxjUb3fOh0iIPYpYp7QWvD3WoTWMNOuajya9NW4Vm0WxP+4
	 h9SrzHniO8fP1zcbGLtQerjTk9/M7zLb+1BM0gv+zUZwE36T+0zUqUwyp3Z/p8fW9l
	 /IUVa5J/aN8qUz2ZrZ66yYREm3nBmAwTgYzAzRqEoj9PMES7yXZ2DQMRyRCW/v7/lX
	 o5RTO9O2snzeA==
Date: Sat, 25 Oct 2025 00:29:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, 
 Zhang Rui <rui.zhang@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lukasz Luba <lukasz.luba@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yangtao Li <tiny.windzz@gmail.com>, Samuel Holland <samuel@sholland.org>
To: iuncuim <iuncuim@gmail.com>
In-Reply-To: <20251025043129.160454-2-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
 <20251025043129.160454-2-iuncuim@gmail.com>
Message-Id: <176137014046.3772400.925640654044482315.robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_222903_577748_023A12D1 
X-CRM114-Status: GOOD (  16.11  )
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


On Sat, 25 Oct 2025 12:31:24 +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
> description of the thermal sensors in the A523 processor.
> The controllers require activation of the additional frequency of the
> associated gpadc controller, so a new clock property has been added.
> 
> The calibration data is split into two cells that are in different areas
> of nvmem. Both controllers require access to both memory cell, so a new
> property nvmem-cells has been added. To maintain backward compatibility,
> the name of the old cell remains the same and the new nvmem-cell-names is
> called calibration-second-part
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 56 ++++++++++++++++++-
>  1 file changed, 53 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml: allOf:4:else:properties:nvmem-cell-names: {'maxItems': 1, 'items': [{'const': 'calibration'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml: properties:clock-names: {'minItems': 1, 'maxItems': 2, 'items': [{'const': 'bus'}, {'const': 'mod'}, {'const': 'gpadc'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
Lexical error: Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.example.dts:126.25-32 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.example.dts:126.36-55 Unexpected 'IRQ_TYPE_LEVEL_HIGH'
Lexical error: Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.example.dts:127.26-37 Unexpected 'CLK_BUS_THS'
Lexical error: Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.example.dts:127.46-56 Unexpected 'CLK_GPADC1'
Lexical error: Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.example.dts:129.26-37 Unexpected 'RST_BUS_THS'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1528: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251025043129.160454-2-iuncuim@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


