Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF54D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnOxp005sIMEnvq/K4jns2kWF0Urxo8s7JX9Uv97umo=; b=rmebbrFlz01yeoweN3jzuLMQtW
	2247TFvbG56+antKsTyADgs9YGM1UfBv5GtKYdrsOc63INcZc3BhsDnXi67NLPwdqf6Op/uHxqp6o
	jjtnSJT2Iz5OYbPfnxki8W6Hitw4JSNZvY3yxf5F5gTF+4xQj5P6A7oaOqJ2hgFyPBJ3eMFOql7zX
	r71xQQLEtONefl/Rr+AGeZ3Fz/qPvY4mXULeR7l0283vB9Km3Q6gMpzFkJjY2kyIpJFlUUQbKK5J6
	C7KKlVp0DxBuHdX3EgtEtVl0I9QT4AnUD/8xvYjUMMAZ0wdYZY+/u8MBr1OXE6o9CjQk6UH1sEXtZ
	R8bHGGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtgD-000000008Rn-0Sd4;
	Fri, 28 Nov 2025 08:18:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtgB-000000008Re-09Z6;
	Fri, 28 Nov 2025 08:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1154602BA;
	Fri, 28 Nov 2025 08:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42062C4CEF1;
	Fri, 28 Nov 2025 08:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764317889;
	bh=Oycb6ot6Iyhsttxtig2/z+FAxLCxcG3XAiysNbp4Vdw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=D2UPU2kIouxukoByIRpHeE7yB9hi0j1p5g3O4zP4ENqRSX/Z8+pl1Mm3LrvHm5thq
	 tB+erSWVHiFBi468A5rhzTTijwcJRvjThyH25MuhVCTYf/clYHKWKVm3lh1V72qlXG
	 2vZtDiEQt0ztKR4wv1qVGsVxzE9eapDp4spc713WubXGWJ/X8zAV59AXLP7MS3xhmJ
	 CyXloozgNe7Z+dQyhjfh5tnCWIjJFFm61r3UAhsZ5pw4XAkGBrFB3EYSXIE88gH2zA
	 QLMsACSuWwqig8N/ShJdPcSX+Zl9vqxavU1nWZLOSOObZYkUbgnqtI0JBsTvrKVHuR
	 7UgUFLawaXy+w==
Date: Fri, 28 Nov 2025 02:18:07 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, 
 Will Deacon <will@kernel.org>, linux-rockchip@lists.infradead.org, 
 iommu@lists.linux.dev, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
To: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20251128071322.92-2-kernel@airkyi.com>
References: <20251128071322.92-1-kernel@airkyi.com>
 <20251128071322.92-2-kernel@airkyi.com>
Message-Id: <176431788757.1500601.18210148365739838676.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iommu: rockchip: Add support for
 multiple interface clocks
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


On Fri, 28 Nov 2025 15:13:21 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The iommu found on RK3576 NPU and RK3576 RKVDEC have 4 clock instead of
> 2 clock. Their clock names might differ, but I don't think that matters
> much.
> 
> Add support for them.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Rewrite dt binding.
> 
>  .../bindings/iommu/rockchip,iommu.yaml        | 52 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251128071322.92-2-kernel@airkyi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


