Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECE9CA0EF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpb5Jf1l8YxGb+df6fsbNBUPkCmlxNTJSLMMDt3Kt7Y=; b=noMrDjYLCzgYnWGn/mftbNTt1j
	48o5DYmYvfjL05dTnDt5PNnP+f7/7SO/3eQjZEyBWHi4+wzrkBJye0dcs25OVu6esOdEeox6J8OJP
	MPp208kZMlyb0Al1GD5QnvzWj7vyqlGkv07aG2q1z23BWuJWwXEbypiVg3Zf0PFimXzZbukP7UQm6
	U7nEoEanxk2B9eagbOHjiTjV7zSS4ftmAZNTXpist1Eb4sc/VatW1XAnne5sToP1P6mhiKMyjyMxU
	faWQK7SbuwRzhHQJ4Qkea3yM3K9ETSKwdiyKCL/MlchWNUhXP4RajRrYPBMgCV11QBZXTC4EU5xvo
	PL7ONwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3hF-000000088Ys-1KsZ;
	Mon, 18 Aug 2025 17:31:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0yr-00000007m1g-0rTa;
	Mon, 18 Aug 2025 14:37:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC0B25C5E8E;
	Mon, 18 Aug 2025 14:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675E4C4CEEB;
	Mon, 18 Aug 2025 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755527820;
	bh=jyvUe/Uvlpxb8/WNMi/NIGIZMsdMiJ0vXIXKRErcUzo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=StG9+XEFrgzNq+p79mD4ztZh0jbQ1vCwRuSeLqB1qS7Iu+Hc6Dfv4L7qwJOeHaktO
	 6/fmIiqF9ac1+tO36JaKI+zl2+ZEUliWcQ/ODtzUbqjqvvPWAOS8pVpeE2sT9l+VDb
	 ex4s6gE53WqcTeibIamkuc8N8Fmzt0nb9ZZSEvOc1Css7SabPCqh0xuj9EdtZ8moG/
	 YrZeo0YIhIRUo2D93AMpTEG2YgyqV+LLy8LrVPUq2c0+Qd2vJfBy8z5WNJFjtC6gPk
	 PJ5N2LmpwpflXWqZUf0Ptng9v1BBoqlb2a7+s1LwEWOB+mf4iV1W7XrW2WCtUDy2Dj
	 0p5yTt0prT/7g==
Date: Mon, 18 Aug 2025 09:36:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-clk@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, 
 netdev@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, 
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, jh.hsu@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-mediatek@lists.infradead.org, vince-wl.liu@mediatek.com, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
In-Reply-To: <20250818115754.1067154-2-irving-ch.lin@mediatek.com>
References: <20250818115754.1067154-1-irving-ch.lin@mediatek.com>
 <20250818115754.1067154-2-irving-ch.lin@mediatek.com>
Message-Id: <175552781756.1170283.17952756043799676005.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: clock: mediatek: Add new MT8189 clock
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_073701_319648_93FDE034 
X-CRM114-Status: GOOD (  11.15  )
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


On Mon, 18 Aug 2025 19:57:29 +0800, irving.ch.lin wrote:
> From: Irving-ch Lin <irving-ch.lin@mediatek.com>
> 
> Add the new binding documentation for system clock
> and functional clock on MediaTek MT8189.
> 
> Signed-off-by: Irving-ch Lin <irving-ch.lin@mediatek.com>
> ---
>  .../bindings/clock/mediatek,mt8189-clock.yaml | 89 +++++++++++++++++++
>  .../clock/mediatek,mt8189-sys-clock.yaml      | 58 ++++++++++++
>  2 files changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-sys-clock.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.example.dtb: imp_iic_wrap_ws_clk@11b21000 (mediatek,mt8189-iic-wrap-ws): reg: [[0, 296882176], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8189-clock.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/mediatek,mt8189-sys-clock.example.dtb: topckgen_clk@10000000 (mediatek,mt8189-topckgen): reg: [[0, 268435456], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8189-sys-clock.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/mediatek,mt8189-sys-clock.example.dtb: topckgen_clk@10000000 (mediatek,mt8189-topckgen): reg: [[0, 268435456], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250818115754.1067154-2-irving-ch.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


