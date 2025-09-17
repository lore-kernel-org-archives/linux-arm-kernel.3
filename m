Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A95CCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9X9SRomRIqFLLyLbtv8hRhY2feBIVD5fkhJqLTPdug=; b=TT5k/0pPi94FDKL7V/ipqaOTCk
	pXWgVFkdjp9DYhEJQJEbobf8GmDXiIaM40e7fc6POv2o7L0mOJkq/r64ozkkTHlHuM3xgnGTgRId/
	kYm7kbjJFLyVJWwLcrTn4KBAHY/dqcTvHv5XhbcJi0a6mY1Si8WII8ulojfJYkIF/lhDgy+aWmoO7
	NBQayHx32NYRJeHFOs7Hh3d/JeT58wi09wn4foH1sBgnLLg9r+xIMrMwixeLpPiMRvH5q9luKs/B3
	DxDKL/7q7SMOCFIQCzdxn+QkTpiUkEGJncvj7kdrQIPeM55R5HXsWV/vzYAvppd7t/ECWHTUYoRyL
	ezDWp31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypOe-0000000Ayop-1UAl;
	Wed, 17 Sep 2025 10:28:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypOc-0000000AyoW-2Igt;
	Wed, 17 Sep 2025 10:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA4E6601B5;
	Wed, 17 Sep 2025 10:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7C5C4CEF0;
	Wed, 17 Sep 2025 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758104897;
	bh=HkIDtJKBhiORcxYgG/tKUBLECQnj2hugI4gQ2Ch0RiA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GQ4aLEPMm2MYWmyRIVwCEa9zK+w8zBhaUeKfXqMzoQ8EH/5ImCLhxkVaMJ9QRqlBp
	 Aa37xRt98MsD5pP1t1iv+nxmhCx1Qsl23tJ77lY0LBet83cc3mHBWdmwZfDj4kYDz/
	 JDURvT9bBdTtyDyT7avTATWd+/CFk5cBiCrzS1ojUYPpiuKHS7heKku3KeLQkbqq+7
	 rxLzczVduphC1ZxQ6YDk6/IQYXV+ISZ7G/jNil75+FGK9GqT+afv49GnMh7p3j28yG
	 L4D5vhFWskjjNu4DiQog0U4b8ARgcEnvOlRbHPHTpcJD7PmYhjnomcjKWbmk+L5OZl
	 1ZbgGsjr9asnA==
Date: Wed, 17 Sep 2025 05:28:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 sound-open-firmware@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, 
 devicetree@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: "hailong.fan" <hailong.fan@mediatek.com>
In-Reply-To: <20250917075336.5985-2-hailong.fan@mediatek.com>
References: <20250917075336.5985-1-hailong.fan@mediatek.com>
 <20250917075336.5985-2-hailong.fan@mediatek.com>
Message-Id: <175810489672.1450298.11416938707985420274.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: dsp: mediatek: add mt8196 dsp
 document
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


On Wed, 17 Sep 2025 15:53:05 +0800, hailong.fan wrote:
> From: Hailong Fan <hailong.fan@mediatek.com>
> 
> Add device tree binding documentation for the MediaTek
> MT8196 DSP. The DSP is used by the Sound Open Firmware
> driver node and includes registers, clocks, memory regions,
> and a mailbox for DSP communication.
> 
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> ---
>  .../bindings/dsp/mediatek,mt8196-dsp.yaml     | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.example.dts:18:18: fatal error: dt-bindings/clock/mt8196-clk.h: No such file or directory
   18 |         #include <dt-bindings/clock/mt8196-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/dsp/mediatek,mt8196-dsp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250917075336.5985-2-hailong.fan@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


