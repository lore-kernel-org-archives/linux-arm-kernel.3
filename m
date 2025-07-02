Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3F2C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TM79hk22Sg0p0tWWinZFi8TyucyhUf3IYRqVf91TdE=; b=NT8fEk/xy+ypjIqyesuRQ9XXzc
	wAp37qEgM2FrCK+5DoSIPHCrKpu1pM4KKF+QOxEa7UDuoR7rBWsht3Ui4J5az+i00McpTVl3o4yE4
	x/JR2kHmriD+t9blu9ObMBfGUYVWpbc/StR4J5rdJ/phkvaX9+k0WQGpi8SNQOzGzrlMBIA0yZTda
	+4BkTQ+OixphfTTQb5Dh3i5hA1ZuoWtNfOD9WoweaKAa9hUM0DbvyXC1YlvfvEnkx/wl5PCBH7mcu
	No0jAG/nl943EM9vdIrhHhTVkhKM4bj1WpUK2JG3fq5Pra4050K5yFWelmp63XFgMM3pnsQ+qk7c0
	ksThfvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyhn-00000008fCZ-0x5v;
	Wed, 02 Jul 2025 14:44:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxVo-00000008SWo-1iJ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:28:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5A6961129;
	Wed,  2 Jul 2025 13:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7ABC4CEED;
	Wed,  2 Jul 2025 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462911;
	bh=HOh/U2jjhpt3b0ncodfdVaIpcAFRoWXCxIDJv1aaaiY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LuYpeq2pMsJv1WcpV1kQwxOWzJ41FmhhGElleCfZJTuIQ6v71aiH6MLEgPD7jZmv2
	 icusDw3bfy60Vao5HfzKmYAfVFWbfX2hqVWFLteRbrusoovpXK9RVbxwl2d7Ulx8iC
	 rfVnqpcoB1OeWeGkkPKbnnw0pmuPQjIqH1hdaqN1V5xJukVK7NiTpWq35yULr02st+
	 Elmb8VxP8b3Mgd7qrd+SacBs8b8diuSllXk8bW6aRa04F2MAqLkd25rtVh+TccLVLY
	 s09Y4M3qMaN8j+rHxlnXNIZHOOXDNG+pIpF9g48N2dOIyEumKTofjoQ50AxVF7m0Ks
	 BcEKnaoqf8oow==
Date: Wed, 02 Jul 2025 08:28:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andersson@kernel.org, krzk@kernel.org, victor.shih@genesyslogic.com.tw, 
 will@kernel.org, quic_tdas@quicinc.com, nfraprado@collabora.com, 
 mani@kernel.org, ebiggers@google.com, geert+renesas@glider.be, 
 geert.uytterhoeven@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shanchun1218@gmail.com, nm@ti.com, arnd@arndb.de, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 jonathan.cameron@huawei.com, bigfoot@classfun.cn, catalin.marinas@arm.com, 
 linux-kernel@vger.kernel.org, soc@lists.linux.dev, gordon.ge@bst.ai, 
 kever.yang@rock-chips.com, ben.chuang@genesyslogic.com.tw, 
 bst-upstream@bstai.top, ulf.hansson@linaro.org, neil.armstrong@linaro.org, 
 linux-mmc@vger.kernel.org, adrian.hunter@intel.com
To: Albert Yang <yangzh0906@thundersoft.com>
In-Reply-To: <20250702094444.3523973-5-yangzh0906@thundersoft.com>
References: <20250528085403.481055-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-5-yangzh0906@thundersoft.com>
Message-Id: <175146290763.1131398.8272632937196214694.robh@kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: mmc: add binding for BST DWCMSHC
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


On Wed, 02 Jul 2025 17:44:40 +0800, Albert Yang wrote:
> Add device tree binding documentation for the Black Sesame Technologies
> (BST) DWCMSHC SDHCI controller.
> 
> This binding describes the required and optional properties for the
> bst,dwcmshc-sdhci compatible controller, including register layout,
> interrupts, bus width, clock configuration, and other controller-specific
> features.
> 
> ---
> Changes for v2:
> - Simplified description, removed redundant paragraphs
> - Updated $schema to reference mmc-specific scheme
> - Corrected compatible to add soc name
> (bst,c1200-dwcmshc-sdhci)
> - Removed all redundant property descriptions
> - Dropped invalid mmc_crm_base/size properties, use reg for all address
> ranges
> - Cleaned up required properties to only essential entries
> - Standardized example DTS format, fixed reg syntax and property
> ordering
> - Removed additionalProperties: true
> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
>  .../bindings/mmc/bst,dwcmshc-sdhci.yaml       | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.example.dtb: mmc@22200000 (bst,c1200-dwcmshc-sdhci): reg: [[0, 572522496], [0, 4096], [0, 587227136], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mmc/bst,dwcmshc-sdhci.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250702094444.3523973-5-yangzh0906@thundersoft.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


