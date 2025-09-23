Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43C8CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bS3QLJH/Fh2EBBqb29UXXDqFiGzgFy2k5dwToQhWh38=; b=118jhYSFmDnH/gaZDwm8pg2que
	9qaTst6PSXbgGo1vjnuYJ95N15GCRw8c2Wd5CENod/T/HIMDA4wdneIN4MinwWuHTDHA5+nYzMKI8
	gKOBOoR0unv1UF5gNSPeTlAuTskI67rfRwUz3vFfm2gFxXktS15TtBpAJOTH+UBub32tTOS1JzUxa
	vuQlpYQW4UCNDNqePEHcvMeuiJMrjitR9A/pcoNpNhASaDxbB3+QD+Uv6vBFVrmnO4x1lzKq/Doa6
	Zf0HHRb87kecA4GA6S6nSsBLN8RMFRoh21UWPUnd2PI56FCSF4Ze+RNgBA1lVPDpMq56+WYcWShH7
	xgOuX7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v101J-0000000D27R-2YFk;
	Tue, 23 Sep 2025 10:13:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v101I-0000000D26l-2tGs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 10:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D4D8160007;
	Tue, 23 Sep 2025 10:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497BDC4CEF5;
	Tue, 23 Sep 2025 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758622391;
	bh=BjUWFq46ZQch4IkuXbiRNszqG0RdslZ/OPhCHkN14Lc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=W2Va0rebdl5VOUh8BSEVgc2XMpiX5BCGIvk8cttUs23XsscvQkEa7wQURtFWH48rb
	 oZOfapa7klZKEc3A7sBlzLRVllO1o1wZevL4jsnV7fQYI7ZlpF53j6EhwPHRKUYlkA
	 12bLDtG6BWZ7BbfahTHwodhCU4pjZfX3DQkBk/2C59xRqH0tpjPq085DTwMx6jaqIH
	 ymptmCC34ZUYCIx72v3AMazfD2RVwvFcpdQM/xmvnVV3Am7UGM5S2oczliaUcMM2ui
	 oYmvqbS0Vzqz8aH4g/h7IrgR1SlhgWbqCD375ZGGLuB5kFZwxDQweK1vHVFAR/7fUO
	 5GzpSXX8w5z1A==
Date: Tue, 23 Sep 2025 05:13:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>, 
 Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mmc@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>
To: Albert Yang <yangzh0906@thundersoft.com>
In-Reply-To: <20250923-v4-patch-final-v1-4-2283ad7cbf88@thundersoft.com>
References: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
 <20250923-v4-patch-final-v1-4-2283ad7cbf88@thundersoft.com>
Message-Id: <175862238966.2427901.366123788055800395.robh@kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: mmc: add binding for BST DWCMSHC
 SDHCI controller
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


On Tue, 23 Sep 2025 14:10:10 +0800, Albert Yang wrote:
> Add device tree binding documentation for the Black Sesame Technologies
> (BST) DWCMSHC SDHCI controller.
> 
> This binding describes the required and optional properties for the
> bst,c1200-dwcmshc-sdhci compatible controller, including register layout,
> interrupts, bus width, clock configuration, and other controller-specific
> features.
> 
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> 
> ---
> Changes for v4:
> - Remove Signed-off-by line for Ge Gordon
> - Change `$ref: mmc-controller.yaml#` to `$ref: sdhci-common.yaml#`
> - Change compatible string from `bst,c1200-dwcmshc-sdhci` to `bst,c1200-sdhci`
> 
> Changes for v3:
> - Switch reg schema from maxItems to explicit items with per-entry descriptions
> - Improve example: add irq.h include and wrap under a bus node with address/size cells
> - Drop status = "disabled" from example; keep example concise
> - Add Signed-off-by: Ge Gordon
> 
> Changes for v2:
> - Simplify description, remove redundant paragraphs
> - Update $schema to reference mmc-specific scheme
> - Correct compatible to add soc name (bst,c1200-dwcmshc-sdhci)
> - Remove all redundant property descriptions
> - Drop invalid mmc_crm_base/size properties, use reg for all address ranges
> - Clean up required properties to only essential entries
> - Standardize example DTS format, fix reg syntax and property ordering
> - Remove additionalProperties: true
> ---
>  .../devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.example.dtb: /example-0/bus/mmc@22200000: failed to match any schema with compatible: ['bst,c1200-dwcmshc-sdhci']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250923-v4-patch-final-v1-4-2283ad7cbf88@thundersoft.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


