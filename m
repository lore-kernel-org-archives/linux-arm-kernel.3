Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FDF1093177
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 05:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyqCuHeJ4yoYJ7QJNk7Gc77s/EmQgwDzAwFECpYA+P0=; b=xmilVrqwpSZb4JNudGIthA2SzX
	wJSnbnDPWkBzZX83jtFB5+xMbxfckAz2xVuBhikFVHcGYTIT8arMWt+THJr6hRoZySxJWCCYyYw92
	GjOnKp9ZRmwxFa6jod0Bu2s2AQ3R6NwoXjNABDKtIhKT9BT2gruMeyzFv5p2szc4ZYX53zk0q2NGF
	9783wW9wLlGdMu6XMvTU8xjnpgiHjQhEhNhDrZQHMCE7sz2TWCmiC+H/r2FmGzUDc31T8GM0UuyLh
	cy++mWDt+lMAy/iKqlq42B9r/oPjSwjOzOu6yUlIRnUCP0YDpKi3go19l9HR2eZXSJCn9UzVaFCfc
	I+MwJ67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3SM9-0000000C6OP-28a4;
	Fri, 20 Mar 2026 05:25:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3SM7-0000000C6Nc-0gjU;
	Fri, 20 Mar 2026 05:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43EF341B34;
	Fri, 20 Mar 2026 05:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF02BC4CEF7;
	Fri, 20 Mar 2026 05:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773984305;
	bh=zaGWASU9+JAdJi4fUavTf9Khqp16CUkVbyblJANVq4s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XgJ4/xi591n6pjBVAauY6nfQ+8bDXa+YT7ICN+1HiuoTPZznzj7jHrkfdJWoiVCaq
	 jwRc1YsTzudfLWScxQbeWsWVO0uMNun2ngs9u8KC2/kIz1kv/XHMD19H0xDX/6v9KI
	 QfZnsWhwELFwoiiuzXhW+Yqxgkj1NRKi+vOCa8LqDFdsvGFfeN0CtRLEw9mVIGXHrp
	 gCB05pIYSEtqvSmWi+O1hROa4Wy5YPRHhw9qFYiCouBqt/7AL5GGN5QqcX1sVnuHWD
	 Wx1rxErjwOAyeIm2x/SUP2zIwsgVE9bp5pDysUNK+F+wFQp1OnXhFpzUlXGR1gZ4gM
	 2vbFUmShVRQDg==
Date: Fri, 20 Mar 2026 00:25:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-mediatek@lists.infradead.org, 
 Hailong Fan <Hailong.Fan@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>, 
 Huayu Zong <huayu.Zong@mediatek.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
In-Reply-To: <20260320032014.13608-2-xiangzhi.tang@mediatek.com>
References: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
 <20260320032014.13608-2-xiangzhi.tang@mediatek.com>
Message-Id: <177398430412.27959.15021574635894371072.robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: remoteproc: Add VCP support for
 mt8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_222507_267868_F6AD9A84 
X-CRM114-Status: GOOD (  11.92  )
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


On Fri, 20 Mar 2026 11:18:03 +0800, Xiangzhi Tang wrote:
> Add the new binding document for MediaTek Video Companion
> Processor(VCP) on MediaTek mt8196.
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  .../remoteproc/mediatek,mt8196-vcp.yaml       | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml: patternProperties:^vcp@[a-f0-9]+$:properties:mtk,vcp-core-twohart: 'anyOf' conditional failed, one must be fixed:
	'description' is a dependency of '$ref'
	'/schemas/types.yaml#/definitions/uint32' does not match '^#\\/(definitions|\\$defs)\\/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dts:26:18: fatal error: dt-bindings/power/mt8196-power.h: No such file or directory
   26 |         #include <dt-bindings/power/mt8196-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1614: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260320032014.13608-2-xiangzhi.tang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


