Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D80F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBTvu7NXwMqJkI/fJlPTvddkmoBzX7NAmKT7nsQ4K9E=; b=FyK2kJ28uAIwtxqrIThpEfkTLC
	QjycViI69Wa3zQUHN+wyEFm7JuqNGyvm+4QEX0da+bK/LhfbaRjvFBtK9uoQT0eaWX9hl1GO/h+qT
	twCfb79qjIdh76VjSPeMq8SIk9Zvv0dpmBsBTLdUDwa+0gqxPkUtGscJDZ5TvMfa/GqVgASd2FEo2
	YenZHa8GAiBswn2A+jT9feCQQzfL3EhjP3M5Zw7U+bup89rTdwmfHngD6pYKPOee7ixUZKJyiZ1p3
	0xWhKIi316GCEp1d14zyYl4RWJHT6DwjtOtJOI1QLWoWK3EWeOgKE2gVq9ar7Fgq1b7/e4BAMtzfE
	F3QZSQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJsR-00000002pr2-1a38;
	Fri, 06 Mar 2026 01:21:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJsO-00000002pqd-3lgN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3565C42D69;
	Fri,  6 Mar 2026 01:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E324DC116C6;
	Fri,  6 Mar 2026 01:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772760072;
	bh=qK1Pb6PRMN/5EDxvXqpnSPidQtcYgcosLSdYEdyfatM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KVyGZAvLUG+NSKuzln4XZyGN8vBdTQZCO+wfrI72GYmPmuT59ZhGLpwL2675wNms9
	 t0eVBagXnb2DSWMQDLH5eflZgku70KfBUkjUWw+YCWdC6d0FKRgV2zWhgRkCwicupb
	 Z9VpW3lZZXj6Yd5iOpnc4B/iL8okqwFpmkEZv/MEYVJ3BD2cYcew5e8CBA5GSFZ7r/
	 WpodTtVWnu7GVfsCcSSwysVZx5KcY5Um8kY7gnHb4/QfRSTbuypExZbbIBd6gQyeAS
	 vJl7qct/qLdcKP5bQH3JRSIBbLuPoSPM4EA+67xPuZU2lXstWAPiKL93SoaaGqVxE7
	 t0V+Z2wcXt4VQ==
Date: Thu, 05 Mar 2026 19:21:11 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com, 
 linux-arm-kernel@lists.infradead.org, rjui@broadcom.com, 
 conor+dt@kernel.org, krzk+dt@kernel.org, sbranden@broadcom.com, 
 linux-mmc@vger.kernel.org, ulf.hansson@linaro.org, 
 devicetree@vger.kernel.org, nsaenz@kernel.org, linux-kernel@vger.kernel.org
To: Lee Yongjun <jun85566@gmail.com>
In-Reply-To: <20260305234703.38490-1-jun85566@gmail.com>
References: <20260305234703.38490-1-jun85566@gmail.com>
Message-Id: <177276007097.977010.11624734015908520209.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: allow dma-coherent
 property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_172113_004461_925BF7F3 
X-CRM114-Status: GOOD (  12.83  )
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


On Fri, 06 Mar 2026 08:47:03 +0900, Lee Yongjun wrote:
> The Broadcom iProc SDHCI controller supports DMA, but its binding
> schema does not allow the 'dma-coherent' property.
> 
> As a result, dtbs_check reports the following validation errors
> on the Northstar2 SoC:
> 
>   mmc@66420000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
>   are not allowed ('dma-coherent' was unexpected)
>   mmc@66430000 (brcm,sdhci-iproc-cygnus): Unevaluated properties
>   are not allowed ('dma-coherent' was unexpected)
> 
> Allow the 'dma-coherent' property in the schema to fix the validation
> errors and accurately reflect the hardware capability.
> 
> Signed-off-by: Lee Yongjun <jun85566@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml:46:3: [error] duplication of key "dma-coherent" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml:46:3: found duplicate key "dma-coherent" with value "True" (original value: "True")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.example.dts'
Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.yaml:46:3: found duplicate key "dma-coherent" with value "True" (original value: "True")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/mmc/brcm,iproc-sdhci.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1605: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260305234703.38490-1-jun85566@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


