Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB43C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0Dyf0O5qsd2O0wkwEV3APMOPZn9BpCHwoGyAkHKWSo=; b=Qv+Nqn2r8otvkjyOy785KmGxoV
	HfEY23GnrVJf97lXqY5YqeVTOqFQhJi6UnS0SyEMcurjFdYcdkxDOEfh6oupSOWBfuM6f6i9k6l+6
	VWOIh1w2EOoTNKw2sONI9y+i2JQ8TWdFNR8N4mm6MIBg4kj2sl5h06oys3YCD2p1X/woO926VCTtj
	Mo1Y80fp93cHVBBkcAGJsjJyOwSMp1wkXdqlxDERaJojLDKnrGH51umjWPfvEpvoQ29PNVtz3FXPg
	B4X45F6QCgdMf60VH2G70B6ML2lvDs/aiJ7qHDLfMCphTSixujnH1Iocmi6fJzYe/amJ2Zv50Nr8P
	bXwrTtfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ztV-00000005Lpl-3oQ6;
	Tue, 22 Sep 2026 12:46:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ztU-00000005LpQ-3KVv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:46:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 34B6943C99;
	Tue, 22 Sep 2026 12:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62C71F00898;
	Tue, 22 Sep 2026 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790081204;
	bh=d0Dyf0O5qsd2O0wkwEV3APMOPZn9BpCHwoGyAkHKWSo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=JqSwa+yQbvWbjOBqQCLEP/8vpkYVdZSulDVVCVnruLKhhQYoiyqJMsuyObayafQX1
	 IOStS6bCOQom7/8zyFAdXMtC++4yDoAjyvfvR+J4vTkYO5wwNYPk2a+JMAuBs1ZICc
	 EIdHHq8tss+bleMbyPdb/wIcXEqN/wMnVg7UPrR/OMv9MSKBrMritfm801X1bDZofi
	 rtTX5tbZ4T3I3BXmKXYKtDWeGcAFG5JsRwKhw25OJDu4KQK6nFIfUZOXiz0zecRBOI
	 KsgRdPiyNMvDyj0yC4lInGJxfuTBLOiHUguWQCS0H3+Z6aZSb4F1uLJbqqJ1wXFRO3
	 lsiCSkyVwTmQg==
Date: Tue, 22 Sep 2026 07:46:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: samuel@sholland.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-remoteproc@vger.kernel.org, jernej.skrabec@gmail.com, wens@kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-sunxi@lists.linux.dev
To: Tim Michals <tcmichals@gmail.com>
In-Reply-To: <20260922034711.190253-5-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260922034711.190253-5-tcmichals@gmail.com>
Message-Id: <179008111726.3145450.12515884714286046202.robh@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: remoteproc: add allwinner sun55i
 rproc binding
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


On Mon, 21 Sep 2026 22:47:08 -0500, Tim Michals wrote:
> Add Device Tree binding schema for the Allwinner XuanTie E906/E907
> RISC-V remote processor found on A523, A527, and T527 SoCs.
> 
> The remoteproc node manages the co-processor lifecycle (clocks, resets,
> boot vector) and IPC (hardware mailbox). Memory regions are expressed
> via reg entries named "cfg", "r_sram", "r_sram1", and "remap".
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Signed-off-by: Tim Michals <tcmichals@gmail.com>
> ---
>  .../remoteproc/allwinner,sun55i-rproc.yaml    | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.example.dts:29.32-53 Unexpected 'CLK_BUS_MCU_RISCV_CFG'
Lexical error: Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.example.dts:30.32-45 Unexpected 'CLK_MCU_RISCV'
Lexical error: Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.example.dts:32.32-53 Unexpected 'RST_BUS_MCU_RISCV_CFG'
Lexical error: Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.example.dts:33.32-54 Unexpected 'RST_BUS_MCU_RISCV_CORE'
Error: Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.example.dts:40.3-41.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-rproc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/linux-dt-review/Makefile:1714: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260922034711.190253-5-tcmichals@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


