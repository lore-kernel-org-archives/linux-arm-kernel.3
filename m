Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D076C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 20:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm08M0duZG4a+ZLa4zK8PxczLpdU4JAEAYPjQRflnMk=; b=EG0qRfOj5fXV2xRhIAq4VlvLbL
	JtBMtCE5Fs54OKTeRsCX3KzsCXmqhkJS3r8duQijnTS31FXz+ZS0xQU7NKyzT2s1SdCzVbo59VDn3
	KW5RfFsDDl7IzSebgNbd5y2CB9Z5a/vGiKh6Hf8mpmGPe3DbRUWncf/kU/x2x1C+2KA9Wc2qRm9Yf
	EynAScYz0QjzSpuzMFu2K/8GbbQ8Y4t0zfe5mYq9qEUdPzeluFHBzAT5HTyaN+FyrT2kCbQDUNzh5
	KxPwwpXsHhXBOLFVRoD0GMXyY1LplLWGsVNyc68uy2+EW4UCtV71Ko25oU9lihZWE/AIfkPRHafnk
	kPxMjnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZyQA-00000006P2v-0xyu;
	Mon, 20 Jan 2025 20:30:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZyOs-00000006OuX-081E;
	Mon, 20 Jan 2025 20:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC8C9A40234;
	Mon, 20 Jan 2025 20:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D0CC4CEDD;
	Mon, 20 Jan 2025 20:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737404972;
	bh=WDoCCA3w5eEl8wS9Gz8iLhDSYRHG+YTayG/JhkEBJGc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bv9KogGjcVzMKThShlLVPH5bcRAthWi7voKuzUEu9kqWn7lLzjXhryTk0BqcA/Ez/
	 nq+4DHUN7cf1LExDN2+tfvEKmt+gaZUxSJpbfYFNKLrCi7R6EDWHzIFBa027H6Z84n
	 rSPXd191pPpIWvXVCME8S9xMY109URyY6+ie6X9jdkfXCPK8e3AEGAiZ8cna48xnYA
	 Gas3i4kt9YuhwZ3LZGUgfQDq0atH4FU3c+zdjvqSIphmXTAQor/z4A/kgx4QEdUpMP
	 6jsVGaxOLq880rmSRQ2geYQRYnRs9Uff7M1Pw58Cc2xgcz/Pwohs3QBofd1ippPaiA
	 zfI91BacpRp7Q==
Date: Mon, 20 Jan 2025 14:29:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 upstream@airoha.com, linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250120184728.18325-1-ansuelsmth@gmail.com>
References: <20250120184728.18325-1-ansuelsmth@gmail.com>
Message-Id: <173740497060.601130.3509016769870545640.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add eMMC for AN7581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_122934_136691_7D2EC982 
X-CRM114-Status: GOOD (  15.28  )
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


On Mon, 20 Jan 2025 19:47:01 +0100, Christian Marangi wrote:
> Document eMMC compatible for AN7581. This eMMC controller doesn't have
> regulator exposed to the system and have a single clock only for source
> clock and only default pintctrl.
> 
> Rework the schema to permit these new requirements and make supply
> optional only for airoha,an7581-mmc compatible.
> 
> Also provide an example for airoha,an7581-mmc.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v2:
> - Drop else condition
> - Move Required and pinctrl property to dedicated if condition
> 
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 116 +++++++++++++++++-
>  1 file changed, 110 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mmc/mtk-sd.example.dts:104.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/mmc/mtk-sd.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250120184728.18325-1-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


