Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC67F5A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSFVYrBAtbQ9qdrVfzJA6TdOq+8xjRFPpxAcxdB5L0Y=; b=qb1bwDVgcljM95uQMPvdjitys4
	Yd5SiwUJQzaRZ5szNlheJ3r39iA5Vu+Rzvi6IkmFO5zCMSCiFwUejtDvC64D5SsHuUttv/4xQLoek
	JNu/jMbSoZCfpGhlJUT1u9pYO6Z0mrZ4wqalWsokHmEmt1mPbpLCLTTGLpJbRBfPbWqixaxoZOlUm
	qXug6hfQ/Xo7uZyZ6DX9DvNfmJLyCJaN2yXQj8ftDjlaYcXW08TRL7CE5ATRMT0iamxFzgNF6d29d
	3XXTR02igaE4iQ5VtMhXJPY5v1y/R77PLpNm9HVtZR8y/fb3/5ymxczMnYaQnYu9cD7mZpGBXWQuK
	Cbp+804A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwAn-00000007jHq-02Rc;
	Mon, 20 Apr 2026 21:28:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwAl-00000007jHR-0gL9;
	Mon, 20 Apr 2026 21:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA3DA43643;
	Mon, 20 Apr 2026 21:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A7DC19425;
	Mon, 20 Apr 2026 21:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776720127;
	bh=mjEpaLxSeGJIi/E0Mk9VsQjmxZArPUCWwKsTFhO9mds=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PPmIN6KzYMkx8H+gNe+dHvNqCZtT8bcaaknJZzCrIzxIiw5hQHHRDt1JM1jy11WoC
	 CYqRDpnMuf82halSQcTdoRR5urNhda6CZm2dSnt7eV9SVepyHBQ7S0T0s45cIQif2J
	 nZmy0Zg+a41jXuhi33HjwPI1q/FQxpSKsaL455RCIrVZz88ZJjQyKmVMGObd0QQLsA
	 pPGn8iT2uRKo9b1MGULfBa2SzhaVwdjtUjNBLMcgH0j/i6e3ahJbIvwEei/kSYNuVB
	 FgUK6PBdoYcgWLch/GHzntlffxssh11n7Xqspbr4Z01Hqap+Y0IrxzficLnzTPHR9D
	 e4la+NjUZ4PLw==
Date: Mon, 20 Apr 2026 16:22:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
In-Reply-To: <20260420204514.1640995-1-l.scorcia@gmail.com>
References: <20260420204514.1640995-1-l.scorcia@gmail.com>
Message-Id: <177672012448.3390448.3487317884636919174.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to
 DT Schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_142851_244781_6C3096A5 
X-CRM114-Status: GOOD (  10.68  )
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


On Mon, 20 Apr 2026 21:44:30 +0100, Luca Leonardo Scorcia wrote:
> Convert the mtk-btcvsd-snd.txt DT binding to DT Schema format.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../sound/mediatek,mtk-btcvsd-snd.yaml        | 54 +++++++++++++++++++
>  .../bindings/sound/mtk-btcvsd-snd.txt         | 24 ---------
>  2 files changed, 54 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml
Lexical error: Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.example.dts:28.25-32 Unexpected 'GIC_SPI'
Lexical error: Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.example.dts:28.37-55 Unexpected 'IRQ_TYPE_LEVEL_LOW'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1635: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260420204514.1640995-1-l.scorcia@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


