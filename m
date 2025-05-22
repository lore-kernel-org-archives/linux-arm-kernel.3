Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F9BC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oi7qpsqgSJz0CCd/I93mpkfbq9SJ19EV49FCcy7VTM=; b=BF9UJJmmtVsOWj0jQEZhsDS7Hk
	7iQGNsVZyrppJvuGa/R6Yd180zvhxEQNkW3DfvO1nQls+IIB1+nQo30bPcUbF0jC7m7/EtLUWm+Zk
	8jUWKguIFWxEMREU+RpV+4d8M+tkkjbH32Fv4HOi23+4n138Y5TNDGEyUnJVbyBxhJefphPtWrDL8
	6JvLpsTv02/+lSmsyR1JuAEAHa59qfBLJDeMHV+sbNn4VQzoYE4y0Wl++mySTmMnQeOhtKkcTe/D8
	V0QskznAgDvpU3+/JZEiALC4sV2G0yfOZcFNMAW/o0LuM3wpAujxZBp1+Z5PjmwOy/EceL+uwb4ub
	qPgX0zMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8p6-00000001aoX-3UXc;
	Thu, 22 May 2025 16:31:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8m4-00000001ZE5-3IWG;
	Thu, 22 May 2025 16:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76B8D44E74;
	Thu, 22 May 2025 16:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DECC4CEF2;
	Thu, 22 May 2025 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747931284;
	bh=NyiPQIIfELwduH7AoKb4g6Ijqllck0NOU16OdARE5yg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EU1YcPV62lPn2CDEwd3NrUGdn48rE5kYlZ++IbC4/dLPjPpxWUzazHIDEyZy8PIar
	 ETTDfZaUNv0/d/Pv8N2uTcYNA1emnk+VG8Ixdnt+p09G3w+mzPxPDKDqzinKn8aB0i
	 52J1sTctfVP/8x4+9fJ2N+I7fJcjBGry3O7ufXMWqbMXV5z3Lm48Qn4JdP8/LHZorC
	 VDasXLPQztgJHAKZFv2TaL0GUo4gozfo6F3OVYobXLYVrJWz8BhcptWQi4ERHeqUlQ
	 BEFLaZcN7HrAOIHCuPEWFylkfAh+KolaaTK/V1vtRboBP49B8TS9N8Cm+9pOzT3jL6
	 g45hOMmMUqvvw==
Date: Thu, 22 May 2025 11:28:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Mark Brown <broonie@kernel.org>, 
 paul-pl.chen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, singo.chang@mediatek.com, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 jason-jh.lin@mediatek.com, linux-arm-kernel@lists.infradead.org
To: "Nancy.Lin" <nancy.lin@mediatek.com>
In-Reply-To: <20250522150426.3418225-2-nancy.lin@mediatek.com>
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
 <20250522150426.3418225-2-nancy.lin@mediatek.com>
Message-Id: <174793128032.2927822.14103783450131636692.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm
 controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_092804_931844_80960FE6 
X-CRM114-Status: GOOD (  13.24  )
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


On Thu, 22 May 2025 23:03:33 +0800, Nancy.Lin wrote:
> From: Nancy Lin <nancy.lin@mediatek.com>
> 
> Add a device tree binding document for the MediaTek MT8196 VMM (Vcore
> for MultiMedia) regulator controller. The VMM controller acts as the
> main power supplier for multimedia power domains, such as those used
> by display, video encode and decode subsystems. It provides virtual
> regulators that serve as the power sources for various multimedia IPs,
> and coordinates with the hardware common clock framework (hwccf) and
> the Video Companion Processor (VCP) to manage the power domains of
> these components. The regulator is controlled by the VCP firmware,
> and the operating system signals its requirement through a voting
> hardware block (hwccf).
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> ---
>  .../mediatek,mt8196-vmm-regulator.yaml        | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml: patternProperties:^(vdisp|vdec-vcore)$:properties:regulator-name:type: 'string' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.example.dtb: vmm (mediatek,mt8196-vmm): vdisp:regulator-name: ['vdisp'] is not of type 'string'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt8196-vmm-regulator.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.example.dtb: vmm (mediatek,mt8196-vmm): vdec-vcore:regulator-name: ['vdec-vcore'] is not of type 'string'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt8196-vmm-regulator.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250522150426.3418225-2-nancy.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


