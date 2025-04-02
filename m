Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA99C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2Chr44f9vlOMc7f4E8oimX2NcpgIX6xoXL220imPLo=; b=ywnh8Y0W+daTuO/+70I8mtiUdH
	hmQOvwDUtUyZyu3+9BPeD8HQnsuLWAEwW5U64/hJhOhwOMhxLF4+RLAvhZHUEBHVmiXk3hEZ+Z8tM
	qfXKeUvkUkmQNNMViAXwRVp6zZo15fJEc3G1sfOpW16EVt+nUVJuveWsEGCZo75SwMmseDsR6JBbH
	tm/a8xykJ8F2AZZN1JiNdpdQs8IoRot1Dz+6wgVGCqiTbG5yRFa+Kw0lUjg/0gQCOBRTZXdvuEy2P
	LMCzKnXEEzdIWSyBKvGLOqiMmU6Seper4EK7p278DReEso0O4S3n7lEXwlMKHhIr0+Eq7QUp1cbyR
	yeAsvOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxg8-00000006ATg-0xHB;
	Wed, 02 Apr 2025 12:58:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxcu-000000069uF-1zA3;
	Wed, 02 Apr 2025 12:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D504661162;
	Wed,  2 Apr 2025 12:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2860C4CEDD;
	Wed,  2 Apr 2025 12:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743598527;
	bh=KLUcO4PETxRtJ7bSzZDcl4QzL3KsG5+5Tq3fAEUTpLQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IXkHxxk41GO44tK70RVcRfKfgdhBtcyxVbaLKM7n4Z3jxTjVgb3zuO0Sb3Dzzu+22
	 wdHoqCt+9NhCXNfexVLwZU1cheoCxr6z97bLZF5ZMoGy/p3Kg0kGcKtU0mcka0FdhB
	 LRJGQD+ODZNaI6ID56uO1l9rR7hjfxaD5is34slsc3l+sRBEt05yah6cGDXNSSr1+o
	 vVAXjen+z1rwrHTUvB1Rzg+wQ0F9Gs6+O2Fy6nbLmVtfQ2dc03MGPh2pCCddjauqNR
	 d9rBiHU91AUWGHp2Y3l86l3+Jly/zOTeMBsW7/Fbp7FMRR+g2jWIkcW/QhwNQ+frK7
	 zlCYyYqqzbigA==
Date: Wed, 02 Apr 2025 07:55:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-remoteproc@vger.kernel.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, hailong.fan@mediatek.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, jjian.zhou@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
In-Reply-To: <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
 <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
Message-Id: <174359852621.53914.11998352307162389918.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add VCP support for
 mt8196
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


On Wed, 02 Apr 2025 17:19:24 +0800, Xiangzhi Tang wrote:
> Add the new binding document for MediaTek Video Companion
> Processor(VCP) on MediaTek mt8196.
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  .../remoteproc/mediatek,mt8196-vcp.yaml       | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dts:26:18: fatal error: dt-bindings/power/mt8196-power.h: No such file or directory
   26 |         #include <dt-bindings/power/mt8196-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1522: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml: Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250402092134.12293-2-xiangzhi.tang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


