Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B9DC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7IpEflrvA/2kvxZTTilFfI1MRRiaZDIoLS5WRWIJdU=; b=Nq9y4/8KjcC3aUPBrjo4Sa7cEj
	rdiDA8mv7A3ZetZ7XYR/IGIvSXG7rem9RXuvCo2A1HRX2HAnyC8jZj3kFTVFWU+LVH2Zt4GB9A+TE
	Qw0/e6la9L5GwLNXQ2UBl7/X3Tfva0Ab487pNigTNhYY4e/rO6TynNlh3Erscq5g7yM0urLYM/Xok
	0E8qjVkt9eHrUcp6TfUgBKlj30EjrAbsDUURkz5nrQsgcPICZIBFcq5miKUh+BvnI7BQAW1gPLuES
	V0mFzXga3CCi68Q8CuvGAwaBp6+VlP15NRaeyst+JfCLcEhC3OStNAlJeYQMRxqFrBXT8dFNOYKvW
	M0wNglTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNA4V-0000000FWeE-2Yzk;
	Thu, 05 Jun 2025 12:51:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNA2I-0000000FWNF-3ltJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 12:49:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CE854A268;
	Thu,  5 Jun 2025 12:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E53C4CEE7;
	Thu,  5 Jun 2025 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749127773;
	bh=wOyBq9EpZecYJyv7wq3MR1rHkJcXHOvYjUqxSvokmTs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TfKV+Pmr4EFYF/h1fgPP3YxemfqOZpw0nMbXRgxITIFZqso5TKk+Hx5jlEPHLyuxt
	 3mc62gPFkfv23qGaYPR+uvCLsKbTCFGzaAEgdShaPBslHe76A95rzyd3wjsOu+Wrls
	 zbghj0o+6XGS2r4+wSocF3xWXtaow9AkfCk0x2J9IMFLPCZoscSohWBmJX1AC0X3Yo
	 VVU8OWdUUUI/PgCUkNtG9PInP4pjTJ2lkql8HaUqm98hk9jGPiosrXKo+RGbT8jW5T
	 jUut+9pTd8famE37mdM/khYhJdXvmnBxz98WJKPCCG39In05ee+3moUlePAaz2gdVK
	 I4sKpERPkZ/og==
Date: Thu, 05 Jun 2025 07:49:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ray Chang <ray.chang@technexion.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
To: Richard Hu <richard.hu@technexion.com>
In-Reply-To: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
References: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
Message-Id: <174912725086.2341088.4909342714758146412.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add TechNexion EDM-G-IMX8M-PLUS SOM and
 WB-EDM-G carrier board support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_054934_977900_8497B451 
X-CRM114-Status: GOOD (  19.18  )
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


On Thu, 05 Jun 2025 15:09:40 +0800, Richard Hu wrote:
> Add initial support for TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G
> carrier board.
> 
> Change in V2:
> - Ensured accurate `To:` and `Cc:` addresses by utilizing
>   `b4 prep --auto-to-cc`. (Thanks to Krzysztof Kozlowski for the
>   tip on this command and helpful suggestion from Rob Herring)
> 
> in patch 1/2:
>         - Add Acked-by tag
> 
> in patch 2/2:
>         - Generic Node Naming: Refactored device tree node names for I2C
>           GPIO expanders, the USB Type-C controller, and the PMIC to adhere
>           to generic naming conventions (e.g., `gpio@21`, `usb-typec@67`,
>           `pmic@25`).
> 
>         - Removed Unused SPI Node: Eliminated the `spidev1` node due to an
>           incorrect and non-existent compatible string (`rohm,dh2228fv`).
> 
>         - Minor formatting improvements (e.g., whitespace, indentation).
> 
> Signed-off-by: Richard Hu <richard.hu@technexion.com>
> ---
> Ray Chang (1):
>       dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board
> 
> Richard Hu (1):
>       arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS SOM on WB-EDM-G carrier board
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml    |   7 +
>  arch/arm64/boot/dts/freescale/Makefile            |   1 +
>  arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 403 +++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi   | 839 ++++++++++++++++++++++
>  4 files changed, 1250 insertions(+)
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250604-add-technexion-edm-g-imx8m-plus-som-79adf0b397eb
> 
> Best regards,
> --
> Richard Hu <richard.hu@technexion.com>
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
 Base: using specified base-commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com:

arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: i2c-gpio-brd-conf (i2c-gpio): $nodename:0: 'i2c-gpio-brd-conf' does not match '^i2c(@.+|-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: i2c-gpio-brd-conf (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#






