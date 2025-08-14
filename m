Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343AECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfgJciRNklEhQy9/SMbilruCKDUdlbErP1FrRSYRFjY=; b=K1aawJ7dBEbKbrgQ5ntPhJWQx+
	ZCwUa8SwDrRXHlXX6o2JTQruCYToQyCP3vboKtPPC34+LpHofP+q/OvS0Du2uc//DeTK3LuzW7CON
	6bhLYwWxXETJNlh9vtnW+FhU+bT7/u4nqIRfHImDPs6mTWFZ5U26o8ztJntK7Zo3J1uWOldMn2K2G
	CT64osN/iw6qfZEfq9NfAdRDbita1LR3IItqoHQTVDKdywOHqHpY27YbTqJJ5EHChkxmHV7ImazVP
	vj0ioveaxLkIEfsAFWLYjRzcpiauUsU6igeSfwJSZ9lOfIQvoazqphiBFo2LKAANR6MdnSMCVsMSx
	76YzXi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUUN-0000000GRN1-3PbD;
	Thu, 14 Aug 2025 09:43:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTfL-0000000GInu-3axx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 08:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4771144CAB;
	Thu, 14 Aug 2025 08:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4CDC4CEED;
	Thu, 14 Aug 2025 08:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755161431;
	bh=zBBMpjxchhWiyBvmzjN70hDruHm4DDlsdqIjn1UqLmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnE9x6U1d7F/Z3sEtqC8/X2KEujCLsIqKoaqSJCeVAKH8Z0X15DjpNdHuI8eHAYzP
	 cMfsgKb+HtuMYLFyFwElj1VcH6HtkxSTovxwpsB0biJocVMgewveKV2yN41GSkbnSS
	 nhEabxtcrAXMXz0XTsxCe2DxAo2JGJrlYNJRWksfT+MOFVempws+56All8eRxNI4uT
	 FkgIwTwCXSkl/eraHB0chEg2NyQ+/Rr3xyPNs1K5Scqllgh70KvJJhUDqWGufIdDu5
	 JNhnnEgwygPMK6amDXdkU0xJ3b5ts+R19c2lEr2t9lsq719B6H4GkfDd/sM9CrZXUc
	 xR+WNqd77frCQ==
Date: Thu, 14 Aug 2025 10:50:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ulf.hansson@linaro.org, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	adrian.hunter@intel.com, robin.murphy@arm.com, ding.wang@bst.ai, gordon.ge@bst.ai, 
	bst-upstream@bstai.top, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, soc@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] dt-bindings: mmc: add binding for BST DWCMSHC
 SDHCI controller
Message-ID: <20250814-first-camouflaged-worm-51ee57@kuoka>
References: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
 <20250812123110.2090460-5-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250812123110.2090460-5-yangzh0906@thundersoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_015031_943788_1D752C93 
X-CRM114-Status: GOOD (  19.28  )
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

On Tue, Aug 12, 2025 at 08:31:06PM +0800, Albert Yang wrote:
> Add device tree binding documentation for the Black Sesame Technologies
> (BST) DWCMSHC SDHCI controller.
> 
> This binding describes the required and optional properties for the
> bst,c1200-dwcmshc-sdhci compatible controller, including register layout,
> interrupts, bus width, clock configuration, and other controller-specific
> features.

Please drop this paragraph, it's completely redundant. You should
rather describe the hardware.

> 
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> ---
> Changes for v3:
> - Switch reg schema from maxItems to explicit items with per-entry
> descriptions
> - Improve example: add irq.h include and wrap under a bus node with
> address/size cells
> - Drop status = "disabled" from example; keep example concise
> - Add Signed-off-by: Ge Gordon
> 
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
> ---
>  .../bindings/mmc/bst,dwcmshc-sdhci.yaml       | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
> new file mode 100644
> index 000000000000..aa72ce60259f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/bst,dwcmshc-sdhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Black Sesame Technologies DWCMSHC SDHCI Controller
> +
> +maintainers:
> +  - Ge Gordon <gordon.ge@bst.ai>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#

You want sdhci-common.yaml instead.

> +
> +properties:
> +  compatible:
> +    const: bst,c1200-dwcmshc-sdhci

Keep just one name, so bst,c1200-dwcmshc (sdhci is redundant, right? Do
you have more than one dwcmshc?)

> +
> +  reg:
> +    items:
> +      - description: Core SDHCI registers
> +      - description: CRM registers
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1

Best regards,
Krzysztof


