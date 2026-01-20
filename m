Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EBBCA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQTF8c4ZsqQoRC0ubc4oPx9YD7DU7os2e8IiLQ2g2lA=; b=soMpBRiMU7teH2Qr219PYPzdZv
	jOpauUABfaYAIvMze67IftxZkjT4fqnBoqjUnaeN3ydNKga15y536YTqi9h4p2HoE+qk0KlyyS7dN
	HeWYhAhBN2KLFoavv+F7+bL+BgtxKioV6Br5cQO8CZBXFG34VwckM1AGwjqxoXrASSxNVPpY7F000
	ooxSn6uEuaN/Q+TMNOfDI7qdDnIDRROUF7hkERL8Fd3FMkumSShGaZDTY5IBkhCaNmYsQODchADSA
	UCT591gNFi8zZjGfHK1BJawcEjIToqDmbjBeRAeRsML/5u1YAyiBOpydI/T1mWPqsi4lW9Vlrnm59
	ULAKMaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEci-00000004AWd-2BN8;
	Tue, 20 Jan 2026 16:30:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEcf-00000004AW6-31F1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBA6E60126;
	Tue, 20 Jan 2026 16:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56429C16AAE;
	Tue, 20 Jan 2026 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768926628;
	bh=vIjUCN1/aJjjc1ZkXHXSm+HKwMh8UJJEGjwRNhvFFBk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CjH6fBTc42FQxOY9HdoBNAdfN8NKDkc1H93MOW7f5bsWRIHYYjgXXZo21KP3gSxYO
	 kzoU/c5kNAbfkRiCjw+lfuiKzQtUa6of84HZ2qMWOSktnTg5SRR7bmQtN4LLB4wCvP
	 s21jscC1TTHkzJRjtuIXOgRHlJlJH7y0dAnTQxsP8u4oMTiQYeZUFwi1VpotL0SR5g
	 WFwZHdSGKwHUcJ8uirHGHI3o7L63YyFNwCU/X9YHBiAuB1xj4FonMNAPSnUJMN21/4
	 9Az2m6ouu58iTf14pINtHyLCyUpsb8t4nIvp/X9wC+5jAfFoDB9aDP8GTWdx2JYHfm
	 73Z9y5Ua/PwHw==
Date: Tue, 20 Jan 2026 10:30:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Ryan Wanner <ryan.wanner@microchip.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
In-Reply-To: <20260120154502.1280938-3-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
Message-Id: <176892662758.41946.5094529075263781406.robh@kernel.org>
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add
 required clocks
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


On Tue, 20 Jan 2026 16:44:43 +0100, Alexander Dahl wrote:
> The OTPC requires both the peripheral clock through PMC and the main RC
> oscillator.  Seemed to work without explicitly enabling those clocks on
> sama7g5 before, but did not on sam9x60.
> 
> Older datasheets were not clear and explicit about this, but recent are,
> e.g. SAMA7G5 series datasheet (DS60001765B),
> section 30.4.1 Power Management:
> 
> > The OTPC is clocked through the Power Management Controller (PMC).
> > The user must power on the main RC oscillator and enable the
> > peripheral clock of the OTPC prior to reading or writing the OTP
> > memory.
> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v3:
>     - Removed clock-names (led to confusion, and not used by the driver anyways)
>     - Removed redundant example
> 
>     v2:
>     - new patch, not present in v1
> 
>  .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.example.dts:19:18: fatal error: dt-bindings/clock/microchip,sama7g5-pmc.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260120154502.1280938-3-ada@thorsis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


