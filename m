Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD72E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFeAaK4TtrAQlQM8SW6hjFz2nZTiRUd0Zp19yyom9Cs=; b=Ucz17oUTBA58h/zOs/7u+DCvN9
	sW1eo4a7qd2pOPHC/VbZl1MuwNhWyqo6hx3U3W+RhgfE+oSR7iQmpT5h3QQlXHHEWMAM2aRsCke7l
	ZyDllHmpSZkOMQz5piRFwtfMVfn6rCooSPY9S3iKvPlcN6Nzf1RgpZav+1DBmdpLPXLx705qQh/6/
	Lj8BVuJmo1RElB2Cf5xVbsK6m58g3RnyFop73qkWQSgkohTMtFis4OUW3NTN2dM5V9SZbcS5rAhNW
	QVFYVY0JiOKozcJTYoZ8La8/vnpWYwHHvDgAGIztcXWaA+3spGB1Tz8M7BmyQOhx7/8eiaZrhkVgx
	lyvp9vfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgQd-000000003fB-3y5p;
	Thu, 12 Dec 2024 10:28:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgPZ-000000003TP-0Zij;
	Thu, 12 Dec 2024 10:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C669A40837;
	Thu, 12 Dec 2024 10:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7E9C4CECE;
	Thu, 12 Dec 2024 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733999232;
	bh=O5MNq+swzioBvBLOZxeS4g6SPUmFvnMVaaoek3tzGZA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sJdAXnxCRWeXQcDr3Zb1CweOsPMgxjN6XylfVWbNkLOXd3rs8aYq3oktQz9PYcn4w
	 xLUQ9NG8J8+q0vKm+vNJEr77bVkfPvQqs3+jw1wkYwKxYjHmg52ZnO0KiiCCP4P92Z
	 DBSF0tN60yIijGV3U+wyn8+Uqb1ZHBCXj+hrw1GVsG9QFf5r9Em1Q0pmnaYncNajtx
	 qAXtCYrIeJnNsXs4shvH8ghpr1PRqHqZz6ZjJOafLpEmyNe2XFWQ67ktPRFQ90qcAe
	 dWFyR+pbtQ69F0QpelojBgT+KEHChz3njH4ZJw/MRX7eTX2zPCGi1ypatbJGmDeqq2
	 rND1ONGwe2ZvQ==
Date: Thu, 12 Dec 2024 04:27:10 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
To: Crystal Guo <crystal.guo@mediatek.com>
In-Reply-To: <20241212090029.13692-3-crystal.guo@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
 <20241212090029.13692-3-crystal.guo@mediatek.com>
Message-Id: <173399922996.1678560.9494303027075425033.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_022713_313458_1D0A47B5 
X-CRM114-Status: GOOD (  11.17  )
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


On Thu, 12 Dec 2024 16:59:48 +0800, Crystal Guo wrote:
> Add devicetree binding for mediatek common-dramc driver.
> 
> The DRAM controller of MediaTek SoC provides an interface to
> get the current data rate of DRAM.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  .../mediatek,common-dramc.yaml                | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: support-ch-cnt: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: fmeter-version: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: crystal-freq: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: shu-of: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: pll-id: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: shu-lv: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: sdmpcw: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: posdiv: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: fbksel: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: dqsopen: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: async-ca: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/mediatek,common-dramc.yaml: dq-ser-mode: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241212090029.13692-3-crystal.guo@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


