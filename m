Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F190FC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 05:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmJaIEI8lsY05cHrE6ubYwsHWbg/zXQVmUY+k7Bf+wo=; b=tKjqHZ2O/TMNNAVwtpNIsur75P
	C2warBRKrbBCU483+kvbqyTRvs1IN+faFMCoMPiQbVtj9NLXJNbH8ZfRMQhWKA2Q6I7LaomtEB20Q
	RLZWEJ9VOEBP/Gf+S0WSsrO96ac8Y5STnUxvuDs2houMMyEdm6vHcnyY4Scs2w1YG8dHXAMy8hyxF
	GfvAJtgbFfrSRbPvDAnoxLLY4UTRVnKjZ71VefFJCKNax9RDmcpQKUUCZLch3smP2oe2gSLVZiCuG
	VxDrW8WU/4CfTuxEAOi10esgSAZVxiz6tGrfoWcljwxTFtrTq8wr8h+p7gid+Xig1aFLVeGsQ0tjO
	rhBq9n2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQVm-0000000DEt2-3qb1;
	Fri, 07 Mar 2025 05:44:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQU9-0000000DEZz-2icc;
	Fri, 07 Mar 2025 05:43:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ECF95C57C0;
	Fri,  7 Mar 2025 05:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4E4C4CEE2;
	Fri,  7 Mar 2025 05:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741326180;
	bh=d6P3+GeoANuNR+y6EWdLUIcEG+o+je61v4CL1BkvFVc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=la4OyzAAvaX0xU8H4oPoH4tX6uTSOfYArgPd+EM3TMX6vSxx0dnHyzdAQ3l+Tg00q
	 riJthLtqHIZltVkxfeUfgLMip24vlO2xaYtIjliAXl8OiwElCwKOV86NYjOYMkZ0kx
	 4V9Kc/uyKiZNnd4oWNk0HDq8/3v45oypwVJJQeNVuu2CH3R3Iv2C2jc7qlBbdL85Ao
	 ve/xV/8+EZeFsRhM3/Efl23U32cU38MyJ3igzIdUyslM+O7oOfWa6NaBW+3kVtQ0TN
	 yo23R7NWCa+trDtUtxKXqBmfzKqVVMWVEQG0Nh8Iw8pXja46OiNu6KReR2VIXpez5C
	 irF8AcJHYda0Q==
Date: Thu, 06 Mar 2025 23:42:58 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
To: Guangjie Song <guangjie.song@mediatek.com>
In-Reply-To: <20250307034454.12243-13-guangjie.song@mediatek.com>
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
 <20250307034454.12243-13-guangjie.song@mediatek.com>
Message-Id: <174132617868.2934304.16819918690236058573.robh@kernel.org>
Subject: Re: [PATCH 12/13] dt-bindings: power: mediatek: Add new MT8196
 power domain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_214301_728141_06E20A48 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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


On Fri, 07 Mar 2025 11:44:36 +0800, Guangjie Song wrote:
> Add the binding documentation for power domain on MediaTek MT8196.
> 
> Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
> ---
>  .../mediatek,mt8196-power-controller.yaml     | 74 +++++++++++++++++++
>  include/dt-bindings/power/mt8196-power.h      | 57 ++++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.yaml
>  create mode 100644 include/dt-bindings/power/mt8196-power.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.example.dtb: power-controller@1c004000: compatible: ['mediatek,mt8196-scpsys', 'syscon'] is too long
	from schema $id: http://devicetree.org/schemas/power/mediatek,mt8196-power-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/mediatek,mt8196-power-controller.example.dtb: power-controller@1c004000: reg: [[0, 469778432], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250307034454.12243-13-guangjie.song@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


