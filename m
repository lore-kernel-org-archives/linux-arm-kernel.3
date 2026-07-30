Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B706C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CU+ENcPYcmdbwm2Mz6p4kmUYZCDdIKr4KPR9KNirpJA=; b=IOYNCckRHmDx1svQ8uR5JJZirc
	+zARGWQKZPI6LblOUDG+p7TeXFFvt/sw8zgHvgaleATudQwWryIDZBWDFclZ0IljZ5J8iwawdBPQ5
	KE/id2G/imeX73A7X/erUcrbqXdIo1C/8AXafDmXNkqRPQhpTC/HU5ZvgGFiCyTWND2/VPV1f2l6e
	kHSvMM40whuY1lvmLo+d3NaMgbD8c6Hc2HcsEhoAaKEs/Q0FR7EoKD/7lyxImQUm81NJpPXFDix8T
	4/R1NKx9Jl0OEXrUXPiw+8nD+MEjAy7ZeyemhXYHqy8QiUFtl+K8SK/efhzFPHUMQPNbKBWmhtjp3
	CtM5oLrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQ65-0000000AUog-2li0;
	Thu, 30 Jul 2026 12:42:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQ64-0000000AUoJ-0Puj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:42:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5714411C9;
	Thu, 30 Jul 2026 12:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7021F00A3A;
	Thu, 30 Jul 2026 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785415367;
	bh=CU+ENcPYcmdbwm2Mz6p4kmUYZCDdIKr4KPR9KNirpJA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=EIsQy804JqSOGgVoEGjOo1nFtYf95U4b5AMjQ22HeCiBSJ+5JM9FPTAyawlUbsmGC
	 AhTuyX8EousxHkoQk4/vbw3q04BgsavNZMwiIz3k22JNJ+NMzLcyRjsdmNF2/Rz0jm
	 Tcq0g2/qp262EgRSTRJtBrJCZLbmGUm+BkYX7rNTzRVvQqFjno7lxlgS2iHu9XPkn1
	 TL91K8OyVZ28W/2o821acBC7kHzQ0jkupq9HvS22s4GhCAKataATprvfvHGwDFsA5i
	 v0js8JOZPm/kI7KuVitQpCq1aBhLODbUbWNACdAvLYjO/ElbxO9YIInIv6dDYZkFAB
	 ZhWa4EsgRjNHQ==
Date: Thu, 30 Jul 2026 07:42:47 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: soc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 linux-arm-kernel@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Will Deacon <will@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
In-Reply-To: <20260730104330.81367-5-longzhao@ambarella.com>
References: <20260730104330.81367-1-longzhao@ambarella.com>
 <20260730104330.81367-5-longzhao@ambarella.com>
Message-Id: <178541536614.2602004.2083911306176491952.robh@kernel.org>
Subject: Re: [PATCH 04/10] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
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


On Thu, 30 Jul 2026 18:43:24 +0800, Long Zhao wrote:
> Add the CV75 pin controller binding and pinmux ID header.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../pinctrl/ambarella,cv75-pinctrl.yaml       | 167 ++++++++++++++++++
>  .../dt-bindings/pinctrl/ambarella,pinctrl.h   |  11 ++
>  2 files changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/ambarella,pinctrl.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-tdshp.example.dtb: tdshp@321e0000 (mediatek,mt8196-disp-tdshp): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196-tdshp.yaml
Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.example.dtb: display0: fsl,pcr: b'\xf0\xc8\x80\x80' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml
Documentation/devicetree/bindings/clock/ambarella,cv75-rct.example.dtb: / (ambarella,cv75-evk): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260730104330.81367-5-longzhao@ambarella.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


