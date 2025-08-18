Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2709DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orlLbjq+sgGr5+6ssZeUwBMPmXSZOnQsaPLP4nXswkg=; b=Db+K6h9wygXBSC5sD7RL5phTNo
	PEmHP65Dygik4gf4hZz1VqNlJAp0eIyeStmfNhgeP3g1c8aJtQkxPiGdU8R5CwUWefCWkwMWSfcFr
	Df+5dLDZGlMR90K7EKRD4TXszRzk+q/34M7ishg4t9lJaVVFAoFMGhXyuMEbwOZx/IuXG4eWxBRJC
	5DOtkVdAf0JjIRHiwa87Z9Da3LfOlqRfsmw8k8URhCyAwlsFPZOd6HLbZE08b6oEb8E5GmrKsLegn
	O3aVA4VeHACWsKuEVNOInpUQaoRkkhMWpastLxSaaGjyQrQXaosqKceVeqy+g+IwQabG/UOMPtTBf
	GvlUF2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo185-00000007nhA-1zrE;
	Mon, 18 Aug 2025 14:46:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0ys-00000007m2A-29IA;
	Mon, 18 Aug 2025 14:37:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5E675C5EE0;
	Mon, 18 Aug 2025 14:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63474C19422;
	Mon, 18 Aug 2025 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755527821;
	bh=W4/OLIkNQoKN0jnkznTsepA876QEW7U+ue1hYsKNaH0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aofF9fJlEhlYoZ/K2HbzIr4HZ1ZEq4MGsQ4F5/eyZVP/CZuY9ro3cVyQ2WfnxxVHO
	 g6P2tSEj9VU+fjwnOi3jIkFxSDOjh/aC1nv8K16JTqf4cT2TB7Pg9d4Y23fpZBqmCm
	 tMP4MXwUXcMqkUKb9xwtqvg+zPER+rFILsA90/yJyQGDdySvVyUF/JsKFciDs8JUam
	 mDiHT7fB/Tklg4TdlQCM107p7e3OQpG6Q9vS26DQ/tqoWAEDjbYeItkDk37jPpxrkL
	 UO6sjEQa661N21yMwHu3cqLdmTE/eg7hljFJkF7eII8IAcy0IamHB8ZWbKS3K2Qta5
	 hnlZ4xj+zQ+KQ==
Date: Mon, 18 Aug 2025 09:37:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, vince-wl.liu@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 sirius.wang@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 jh.hsu@mediatek.com, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Qiqi Wang <qiqi.wang@mediatek.com>, netdev@vger.kernel.org, 
 Richard Cochran <richardcochran@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-clk@vger.kernel.org
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
In-Reply-To: <20250818115754.1067154-3-irving-ch.lin@mediatek.com>
References: <20250818115754.1067154-1-irving-ch.lin@mediatek.com>
 <20250818115754.1067154-3-irving-ch.lin@mediatek.com>
Message-Id: <175552781827.1170419.2767571062327495497.robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: power: mediatek: Add new MT8189 power
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_073702_639291_0B907917 
X-CRM114-Status: GOOD (  13.07  )
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


On Mon, 18 Aug 2025 19:57:30 +0800, irving.ch.lin wrote:
> From: Irving-ch Lin <irving-ch.lin@mediatek.com>
> 
> Add the new binding documentation for power controller
> on MediaTek MT8189.
> 
> Signed-off-by: Irving-ch Lin <irving-ch.lin@mediatek.com>
> ---
>  .../mediatek,mt8189-power-controller.yaml     | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt8189-power-controller.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/power/mediatek,mt8189-power-controller.example.dts:18:18: fatal error: dt-bindings/clock/mt8189-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/mt8189-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/power/mediatek,mt8189-power-controller.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250818115754.1067154-3-irving-ch.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


