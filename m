Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86810C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQLYVwticC0pQgJuG9CmU0MdkMzypGHsD12XmJ4q2jg=; b=le4MGkocqgerBzoMOKFaqgIOQT
	yf97OV069vQJkGNbJHz9qVpMLCNAYYf9WxKu90ovcLf8C7H8lnmWtiLsa41KEdr38xhLZVz/qEW7L
	/5lfefi8ZbHWBMBo2BRmWby7LGMyFwYu8I+ZaqnUaVyrAfhmsDLKT51WlWZw53LK81hQL0QSwofWw
	7JbvTrvHTTSZM7KFltC5pQgrJJbNwViuRXlJkPCO7lVSzNkzNFmfo7GBF6RWvfRK42jPTjwOhxWwa
	Nurl/8/lsohvjY8g8fD3sEdk0kd0q3n8WRK3OQQ1WRMn6mqsLdPdoJOG+lSdeFf2YpXYGKrnagpAo
	PG0zd6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnSE-00000000VGf-1fhE;
	Fri, 17 Jan 2025 14:36:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnOU-00000000Uk3-0aTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 14:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83508A430C7;
	Fri, 17 Jan 2025 14:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A352C4CEE3;
	Fri, 17 Jan 2025 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737124337;
	bh=26g0fdxxXJS5fHlyq0dbUxYx22VrCNq5Mgdt7Hy5xBQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CWHqKh+C4dmpNScj3bVkG9IP168qiggK99/98sB2wCn6tw0jwJzB4HERKmwu62sAq
	 +hr4YlCkAbXMxmJ7LYaTtJLEZvXPcQ9Eu1pRpSkumVapMDIDtL9Mf/QTfNA2t+BS4W
	 cIdStQ0vnrgUmHfSHfHQApJW1OiANlbcnkjudEhLYNoKU33uzgsrU+p23v+SPOUx+O
	 xsBtmk0IZJ1yE8thG2Jn+wF/pJZNJiksjsW1WmHWf0nw+/0UFLGDwrcGQtgBp/wShy
	 OVO084Oe1tr+yU1E+QGU7YtJGXWz13XDa4Pm0c4ZSo/Y38uxKRmXAfeDR+5238m/6I
	 HZDb4BBJKz7Nw==
Date: Fri, 17 Jan 2025 08:32:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, joel@jms.id.au, 
 linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 elbadrym@google.com, linux-kernel@vger.kernel.org
To: Kevin Chen <kevin_chen@aspeedtech.com>
In-Reply-To: <20250117095217.661070-1-kevin_chen@aspeedtech.com>
References: <20250117095217.661070-1-kevin_chen@aspeedtech.com>
Message-Id: <173712392559.810318.5052005402329647545.robh@kernel.org>
Subject: Re: [PATCH v0 0/3] Add AST2600 LPC PCC support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_063218_301982_C99BADA5 
X-CRM114-Status: GOOD (  12.09  )
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


On Fri, 17 Jan 2025 17:52:14 +0800, Kevin Chen wrote:
> The AST2600 has PCC controller in LPC, placed in LPC node. As a result,
> add LPC PCC controller driver to support POST code capture.
> 
> Kevin Chen (3):
>   dt-binding: aspeed: Add LPC PCC controller
>   ARM: dts: aspeed-g6: Add AST2600 LPC PCC support
>   soc: aspeed: lpc-pcc: Add PCC controller support
> 
>  .../bindings/soc/aspeed/lpc-pcc.yaml          |  51 ++
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   7 +
>  drivers/soc/aspeed/Kconfig                    |  10 +
>  drivers/soc/aspeed/Makefile                   |   1 +
>  drivers/soc/aspeed/aspeed-lpc-pcc.c           | 505 ++++++++++++++++++
>  5 files changed, 574 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/lpc-pcc.yaml
>  create mode 100644 drivers/soc/aspeed/aspeed-lpc-pcc.c
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250117095217.661070-1-kevin_chen@aspeedtech.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: lpc-pcc@0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/aspeed/lpc-pcc.yaml#






