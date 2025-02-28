Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEF5C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKVkZLXRtJ0H1yDIkyGrgPYNFEgO/XKza3g9lf0wDtE=; b=jDmNkyr2MRdEzaO4OX3pikQYs1
	lJXMApC/UefubWJ57Rdpio92ry/QmdyXC8AH9AeDXj4jGO25rjwDqeTjGf9TUZdXLogRy5DEqqOFd
	9qkP16PmXF+KRNmWNvqZaK1/flfh5FzM3IjXmbUDzOmrYS/X9oZKYeBgivjG5Bt4SjSMIN4BpFLwJ
	+TxEpNvr9J5QzIBjx48iMbdmJzBxmSThhm5XiAvzNroQTQEZ4eP5xsrFD/lZD3tIe7b/+nr5aHdBA
	4sgPlYi9Te58iOpRllqwvInDr+wZi7gUd4QCB+3zH/J/YsACrRYgrVAW3atzdFRLNXaanXr6FlU6C
	luXCrYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnq8A-00000009Uky-3KrC;
	Fri, 28 Feb 2025 02:29:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnq4w-00000009UKw-09xT;
	Fri, 28 Feb 2025 02:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B22D45C61DD;
	Fri, 28 Feb 2025 02:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEC2C4CEDD;
	Fri, 28 Feb 2025 02:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740709577;
	bh=4XXZ9I7t+Z962ZjSI+scZzu97ELOgs2wjrA6GJcuow0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KCFy01YvCZ614Qe+4DKOYJYaFXRvq2OU8rY7p+/81nMc6UTkuJsKfqka27v7s+sLO
	 lhxbRyTDODwe+79/khyCtu1J8DIdJre/1LR/1U84VYGIC83q4Z34WjJo08WKpS+xxE
	 7UXTMPaxfXCp2Bhp91NYhnYZp9SK1MMEb+7U9W3qfS6zZ/KE4EkFjaLRBrB/lwb/qn
	 f88qaT2IFYfmWxCZ6QmgPht+Nti1vWwOuEEoGhSGuaA1NthTcnAoc2mHTMOYy41DIV
	 L88Zy5gbns1HRCe64kLWI7yHYJslvwfrr+D+YbZWexeOv5duApkKoLdaBS5mawDm6T
	 Vn3POcEwigSFw==
Date: Thu, 27 Feb 2025 20:26:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Yong Mao <yong.mao@mediatek.com>, 
 Axe Yang <axe.yang@mediatek.com>, linux-kernel@vger.kernel.org, 
 Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Guodong Liu <guodong.liu@mediatek.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>, linux-mediatek@lists.infradead.org
To: Cathy Xu <ot_cathy.xu@mediatek.com>
In-Reply-To: <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
 <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
Message-Id: <174070957527.867625.13463640154036333781.robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_182618_118296_0B94D477 
X-CRM114-Status: GOOD (  12.19  )
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


On Fri, 28 Feb 2025 09:16:25 +0800, Cathy Xu wrote:
> Add the new binding document for pinctrl on MediaTek mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 241 ++++++++++++++++++
>  1 file changed, 241 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.example.dts:24:18: fatal error: ../../../../arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h: No such file or directory
   24 |         #include "../../../../arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h"
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250228011702.16493-2-ot_cathy.xu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


