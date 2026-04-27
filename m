Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372A4FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w38CNbfpTIhzkEDDUqc0w67jztq2m2LTaiL2MV7vWfo=; b=OewErjOIsG7WKOyyKFfDcOeVHn
	4F3da3PBiCCcAUaxWcP/zXEdYnhrDEUYrPrYVHjB+4RGn/SglN8fD4InvNjEWkhTOCzx9o7szOCWU
	5R4miOvuHU5DSmqJm0+oiZbF7uxmw8sxh0AbONkU76+DaT9Q6NKuvcwrsQ8zefwj8i57DiaboIfYX
	EV9N95X88D67frvNDDrSJSHwruLfeqCA2kyWYprVhGRGZ1mkWizjXz8Zsz/wj//VOizqF8vxVowMy
	ZhpBfFWFqCB0c3TQxN/GwGRRWIxd+VCRKUNoFPWkzLGeXEd/DOZbJaDR9E8neKXvD8jP3WLIXSlu3
	+Th0/j9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLFi-0000000GvU9-0hN2;
	Mon, 27 Apr 2026 12:39:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLFf-0000000GvTl-1H6s;
	Mon, 27 Apr 2026 12:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49B20440AD;
	Mon, 27 Apr 2026 12:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA629C19425;
	Mon, 27 Apr 2026 12:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777293590;
	bh=B6VXB3n93X8gQas+e8Yh7Mmm6pVyLJdNvfAKeHZtWuI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SEdolQrkY49wv+MM4qEkvALcwMpbb0oXZH16A8bc8mYX5c+E7xMGPIxt06/5wBMk2
	 xhswo/oTLqCb2cOsjDqgTHUhr2pvauHIITQNBY2qmsm0308ZmnEPDszb2o8huKxCNN
	 f5CCUvp9jlbjuhCT3ZdQkmTJiVsCdkmVO2aNL5mkwNfhKi1Ko/aJcmLmwYxlT7Vwsw
	 RzZGzuzwE7jJciqCr9ar7VMpi8vOBjkMZbTGaN2nSHvJuDs0Mz/bFlUrb8tXzZgUYN
	 7zGBgT2/OW/aQrUdd9p/kkFHGy+YWBb+dXpyHwj61BXnsvTS1BMAbothMwKyCT5CEM
	 vYJw0fb2MhYHg==
Date: Mon, 27 Apr 2026 07:39:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hailong Fan <Hailong.Fan@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Justin Yeh <Justin.Yeh@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
 Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Vince-WL Liu <Vince-WL.Liu@mediatek.com>, 
 Huayu Zong <Huayu.Zong@mediatek.com>, 
 Jarried Lin <Jarried.Lin@mediatek.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
In-Reply-To: <20260427111446.22955-2-xiangzhi.tang@mediatek.com>
References: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
 <20260427111446.22955-2-xiangzhi.tang@mediatek.com>
Message-Id: <177729358821.1983670.16657208241339249962.robh@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: remoteproc: Add MediaTek mt8196
 VCP binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_053951_446903_16FEA3D9 
X-CRM114-Status: GOOD (  14.51  )
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


On Mon, 27 Apr 2026 19:04:40 +0800, Xiangzhi Tang wrote:
> Add device tree binding for the MediaTek Video Companion Processor
> (VCP), a RISC-V based coprocessor used for video processing and
> multimedia tasks on mt8196 and future MediaTek SoCs.
> 
> The VCP is a heterogeneous multi-core processor that can contain
> multiple RISC-V cores with different hart (hardware thread)
> configurations. Key features:
> 
> - Supports both single-core and multi-core VCP configurations
> - Each core can have 1 or 2 harts (hardware threads)
> - Shared SRAM memory space partitioned among cores
> - Communication via 5 dedicated mailbox channels for IPI messaging
> - Integrated with SoC IOMMU for multimedia memory management
> - Boot and power management coordinated with ARM Trusted Firmware
> 
> The binding defines both the top-level VCP device (with mailboxes,
> interrupts, and power domains) and child nodes for individual VCP
> cores (with SRAM allocation and hart configuration).
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  .../remoteproc/mediatek,mt8196-vcp.yaml       | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dts:26:18: fatal error: dt-bindings/power/mt8196-power.h: No such file or directory
   26 |         #include <dt-bindings/power/mt8196-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1635: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260427111446.22955-2-xiangzhi.tang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


