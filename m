Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D058C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 02:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5ZreXDWvtzHODLXy+MgJC++axafZQrQ/liSPi6O1cU=; b=QiAkv8dvl7hkN3WD0Kylhz7XSX
	tgfeZsPxx914SImo9q7HYFbxapLxpR981vTo47TtEzGQRHTVFojSExpjBLSQ6qFtV5ebrzjFCeOcm
	3ESmibp1Hlv68gd3rWqUAmx5pMbW+uxB1btzDfhuEyG02mmIyUuwpGgfvWpwQ74UzhMY+p7S8MpjR
	EFA74WcxafXmmJBt3Kzj26B6xaofaOsB2JtkwXXhmxnSJKcM5KIcVWSj49Q7lgCj8dsRRyGh9264G
	rRabJrgn2MZZy8OJkA9A7R2guLkIdHPoB2OboT3amkZwvEga+e57ZXP6S2WlxZor3rKjSwhi6E1og
	aym7VRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQdaq-000000029nP-0M2f;
	Sun, 15 Jun 2025 02:59:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQdWW-000000029aD-1QKd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 02:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 03AFCA4F38F;
	Sun, 15 Jun 2025 02:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C39BC4CEED;
	Sun, 15 Jun 2025 02:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749956106;
	bh=lP+M1tHC6k+ERpDkYV+GZRpVMaVufRE54fR5PaAN/Tk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Cjph3BkvQf+7BHCYIZcnzzDty7AqnGdjDZGfxRK8Ktn4CttdRumzhp14Nxa4RDPfh
	 kUO29FG7DHY2Qa4mURoW7utlBws42aiL+LrDzYBZgKEJWvPaUqgTmX3ZTDexPXo4kT
	 vaJX4M0adv0vHgK8M1qza8/6EZZuNuEejMokXCyXd7F7F5LY8FqCjmoCple6aFX0xA
	 w1T/5IQKr9xf8eCQdsSIdeyKHBtMD2E/ttYnBnIqFKsC6mToTsGYj/DhiEpHMJl5aM
	 nEsotaBiKfyZAMkL/xhzQzqNTLQeoen5oNvDrE/mVGNllfhX68nnUDIJyBWAedmWDM
	 ogWO7WmH4me5w==
Date: Sat, 14 Jun 2025 21:55:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, soc@lists.linux.dev, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Harshit Shah <hshah@axiado.com>
In-Reply-To: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-3-327ab344c16d@axiado.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
 <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-3-327ab344c16d@axiado.com>
Message-Id: <174995610418.3364372.5364960681855010915.robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: gpio: gpio-cdns: convert to YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_195508_444380_ECF6C9EF 
X-CRM114-Status: GOOD (  11.06  )
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


On Sat, 14 Jun 2025 18:12:49 -0700, Harshit Shah wrote:
> Convert Cadence family GPIO controller bindings to DT schema.
> 
> Changes during conversion:
>    - update the naming as per the other files.
>    - add gpio maintainers
> 
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  .../devicetree/bindings/gpio/cdns,gpio.txt         | 43 ------------
>  .../devicetree/bindings/gpio/gpio-cdns.yaml        | 81 ++++++++++++++++++++++
>  2 files changed, 81 insertions(+), 43 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-3-327ab344c16d@axiado.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


