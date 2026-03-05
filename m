Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517F6EFCE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghr3uI93WpwtSyesRNymYMt2VX85GapSXkijoAurTe4=; b=how59RYslK/fPf/YQckrIKY89k
	FQSwmZUVKTS0YyhO6tXwcefOo7zEQHVGtzXvWg2ik8F2c7JTTzHFYvj0dq7FibwcHrxzyNNVkD5qQ
	TELCvStBKY3s1EC55P4qznw4EWK0zzDycHNoX7QXPyMnFea87+8+0C7zQmcW2QLy8YQdfIEQA5Rq2
	nvpuuqB1zYB0uQl8M0eGF2IPN67YSciJSIQuPC9e1GcYs17jvFDlP8U9TcEaL6XjEsUC0uZw69224
	Fz7hlLJmUyYDDY0ZR1+i2UwHqS0/spJ57zrUGUYIeSTIe2c0tmULX41O9YR4vKut2YXl+hbHRapMy
	UuOk11lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzWd-00000000reC-1fBB;
	Thu, 05 Mar 2026 03:37:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzWa-00000000rdE-2OCo;
	Thu, 05 Mar 2026 03:37:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A624843968;
	Thu,  5 Mar 2026 03:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E2AC116C6;
	Thu,  5 Mar 2026 03:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772681839;
	bh=4CChaQiwX+2W8fCaoWno/DcM/mSm9HaXiOce0Px9PGY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QKKrvh/vwUqdQ7CABCR64QJ6mNeP341xSZOGi2IP7zyqEpzWlS//ncythdDmn7/Cj
	 91G4MUWMCsL+7ZK37AWXtVeesAzbduu/9Sf0aPagC3ZJT2z419gN6eJ7k5pEB2f1L1
	 MHlBXF/sHvpKYla1Or3hRoJXGllqTzwd8vu87vP+hcno16YsjRN41yKIx/2VCvBzBo
	 buE8tWz7v8RG35IGx5m3jtD86WjoFTJ2R2k24fhRq2yCIPmiHT61IDMfYpMBKcXGLj
	 Tjb/77k1PD3EJq6p8uq+sDwVI/4KzrJBvj/1sRXxrESet1XMXTjyZ45H1sOmk1OrHs
	 dAI51fgyU+KYQ==
Date: Wed, 04 Mar 2026 21:37:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bayi Cheng <bayi.cheng@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 vince-wl.liu@mediatek.com, Mark Brown <broonie@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 sirius.wang@mediatek.com, linux-spi@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 jh.hsu@mediatek.com
To: Meiker Gao <ot_meiker.gao@mediatek.com>
In-Reply-To: <20260305022740.2334033-1-ot_meiker.gao@mediatek.com>
References: <20260305022740.2334033-1-ot_meiker.gao@mediatek.com>
Message-Id: <177268183719.3308732.11684734825825109153.robh@kernel.org>
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193720_674443_7353CDEB 
X-CRM114-Status: GOOD (  17.72  )
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


On Thu, 05 Mar 2026 10:27:36 +0800, Meiker Gao wrote:
> Update mediatek,spi-mtk-nor.yaml to add conditional clock and
> clock-names bindings for the mt8189-nor platform. The mt8189-nor
> controller requires five specific clocks and corresponding clock-names
> ("spi", "sf", "axi_f", "axi_h", "axi_p"). This change enforces these
> requirements in the device tree binding schema.
> 
> For other platforms, the minimum number of clocks and clock-names
> remains unchanged. The patch also adds an example for mt8189-nor,
> illustrating the new clock configuration.
> 
> This update ensures correct hardware description and validation for
> mt8189-nor, improving compatibility and reducing configuration errors.
> 
> Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
> 
> ---
>  .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 78 ++++++++++++++++---
>  1 file changed, 68 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml:20:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:else:properties:clock-names: {'minItems': 2, 'maxItems': 2, 'items': [{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi'}, {'const': 'axi_s'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:then:properties:clock-names: {'minItems': 5, 'maxItems': 5, 'items': [{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	False schema does not allow 5
	[{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}] is too long
	[{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}] is too short
	1 was expected
	5 is greater than the maximum of 2
	5 is greater than the maximum of 3
	5 is greater than the maximum of 4
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.example.dts:69:18: fatal error: dt-bindings/clock/mt8189-clk.h: No such file or directory
   69 |         #include <dt-bindings/clock/mt8189-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260305022740.2334033-1-ot_meiker.gao@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


