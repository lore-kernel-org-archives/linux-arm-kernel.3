Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CDFCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 18:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAIqu1GlhMpJ08RArt8Sz2LVxQpAO7Pc1abOctlv/7k=; b=ye35oJcpG0eN7Mzk1NHx+6pBc+
	q8Om3dQ8zOher7vVgORqbt6VnpIGLNLqsayJyPTEhJYEveeRZwE27yDf16++0z5W+PaQn4N3qS3J9
	tNMD+Y4NFe+BPeONl+E0EmvQ9MUSM7SGLI8DLT7GEvLwsD8J/nQVer3Td5WnVqdyqCgdg5nouylVU
	IFfHwvtPo6GK2aAx77P2HMt8apd3RtaCmnwKoi9shpo2PpAZxi9wRZO3k663D88J9Scc70+DPUDGg
	0vI/7RIqA7f0y7z9EaxqJx779kDxQLXYjaL1CI+Yl3ogsIHS+5glo90CftuKY2z2Yovu4/fXNkNV9
	VhIlUKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3X5-00000006bgV-4AZP;
	Fri, 29 Aug 2025 18:09:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us04l-000000061CH-2Z66
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:27:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 375D544E4B;
	Fri, 29 Aug 2025 14:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B4C4CEF0;
	Fri, 29 Aug 2025 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756477654;
	bh=hju7Q0uxuSGvDaWgdSvbm9C1hLSofXR34ZTyBAn5zHc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=c+B/wrzqg00WSFdgQYwmioWH/awpZYdcKINrzUkM/vSlrIMkqlSffg8EnKt+oIOLa
	 H6JiI5jirYb/y2E9/+iLGYC/8LdhEaV0SJw0drk/w79xnIJ1F52vHY6lnfUOliwBPM
	 K1fCTWwkwIWkEECKJsGbbagXLefBDhlzAQT8hh34ZXyPmbjQO+OAr1++EB3KXNE/SV
	 KYjx+MjcFnZKDqgUz/j0XHmGN8YKfv3bUNKsV1q+NSyrPI1lEvCKxxrZVfjipj7MYY
	 qjeaLNx9XZCjUd5Jw2VKUuQk2zqhFTjX7YxTe8WUsSfXDECNuaoP/Eg9zok9MxrWdc
	 5E07BZmYt91Wg==
Date: Fri, 29 Aug 2025 09:27:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
 krzk+dt@kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linus.walleij@linaro.org, BMC-SW@aspeedtech.com
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
References: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
Message-Id: <175647746429.734506.7183662123343858780.robh@kernel.org>
Subject: Re: [PATCH v1 0/4] Add pinctrl support for AST2700 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_072735_697536_A64A8331 
X-CRM114-Status: GOOD (  15.10  )
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


On Fri, 29 Aug 2025 15:30:26 +0800, Billy Tsai wrote:
> Document and add the pinctrl driver for AST2700 SoC.
> 
> Billy Tsai (4):
>   dt-bindings: mfd: aspeed,ast2x00-scu: Support ast2700 pinctrl
>   dt-bindings: pinctrl: aspeed: Add support for AST27xx
>   pinctrl: aspeed: Add AST2700 pinmux support
>   arm64: dts: add AST27xx pinctrl configuration nodes
> 
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      |    2 +
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  |  135 +
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  |  452 +++
>  .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++
>  drivers/pinctrl/aspeed/Kconfig                |    8 +
>  drivers/pinctrl/aspeed/Makefile               |    1 +
>  .../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c   |  503 ++++
>  .../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c   | 2523 +++++++++++++++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c       |   47 +
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h       |   11 +-
>  drivers/pinctrl/aspeed/pinmux-aspeed.h        |   35 +-
>  11 files changed, 5071 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
>  create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
> 
> --
> 2.25.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250828 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/aspeed/' for 20250829073030.2749482-1-billy_tsai@aspeedtech.com:

Traceback (most recent call last):
  File "/home/rob/.local/bin/dt-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/rob/proj/dt-schema/dtschema/dtb_validate.py", line 139, in main
    sg = schema_group(args.preparse)
  File "/home/rob/proj/dt-schema/dtschema/dtb_validate.py", line 24, in __init__
    self.validator = dtschema.DTValidator([schema_file])
                     ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^
  File "/home/rob/proj/dt-schema/dtschema/validator.py", line 376, in __init__
    if '$id' in schema_cache:
       ^^^^^^^^^^^^^^^^^^^^^
TypeError: argument of type 'NoneType' is not iterable






