Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32882D6E2C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKO/i6FUaf+HkjUbQtGrDtENdvpP8oF7zo5D+6dW57E=; b=yQGq3AaI6wlQNG2utJ1+wsEo2p
	8/DM8urVwkn1tqv+pad1YGoQSoPkJRCJRbaxcSObLud3Br5nMjIlva9f3JqY3UMIGr4fjMOpc58xw
	P1voeddSMWxhUWrG7pbRcMFLn+y1Y8/Y/ozX63Ira0Sz+RhZIeI5dDECwNMahY1N6mvpYmdF9B0+8
	DeoYOPk+s6FRnsAP7HXAmBKhm5r+sHedJMfMJO1EKN2aToPGkyuWVgFnm4SMUAYZIyqTIXO1a61ow
	bki3ZFw8yGOQXgNQGgLz38K0W0zeCYyx2wuBOI5ZvjWsbi9c73bPyzE0O9DDVCzSqk7GmBgA7qz5T
	OHryJdKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDfNr-0000000EdYO-2hZC;
	Wed, 20 Nov 2024 07:44:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDfMv-0000000EdMp-0Qcd;
	Wed, 20 Nov 2024 07:43:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FA175C5A8D;
	Wed, 20 Nov 2024 07:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E8AC4CECD;
	Wed, 20 Nov 2024 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732088600;
	bh=e/qUlesIoPvZnfcqTn241IZzsmmY5zAWI/3JuDmPcI4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aRelD/ugp1snYM/kKpdtKr6Pccv4S5hAB/A9s1gzKwQBRXVnfQ8quE1f0Z44TZE1u
	 LTqnBiIsXd2yWB//vRsHfL9toCQh9Rh87Hg5nnJmI/zNqUWg585bvcKrv61I3P3LyX
	 Ee0UrHMabol2nP5m92aIZuf4CL3GYZkeTQ8O3NvMcrQ8a5jGQnHIM6/JF+jar7v8CP
	 h5R3U8BP1vrxqlYi/EnhckthUaoxd2/XS9eHEXz5aglZFK0HXBkpXZ8pHjC+6yJ5yA
	 883SIV5DDA+1aFi0DHdwzAKZ8omi4WNLkYHEnO6aHQs5EvmGsM4rDD0BzZMFeGhYdl
	 l1UKaSlMI2m8Q==
Date: Wed, 20 Nov 2024 01:43:18 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Yong Wu <yong.wu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
To: Friday Yang <friday.yang@mediatek.com>
In-Reply-To: <20241120063701.8194-2-friday.yang@mediatek.com>
References: <20241120063701.8194-1-friday.yang@mediatek.com>
 <20241120063701.8194-2-friday.yang@mediatek.com>
Message-Id: <173208859835.3697069.14880651940019418279.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: mediatek: Add SMI reset
 and clamp related property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_234321_226499_E0FE81BA 
X-CRM114-Status: GOOD (  19.23  )
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


On Wed, 20 Nov 2024 14:36:38 +0800, Friday Yang wrote:
> On the MediaTek platform, some SMI LARBs are directly linked to SMI
> Common. While some SMI LARBs are linked to SMI Sub Common, then SMI
> Sub Common is linked to SMI Common. The hardware block diagram could
> be described as below.
> Add 'resets' and 'reset-names' for SMI LARBs to support SMI reset
> and clamp operation. The SMI reset driver could get the reset signal
> through the two properties.
> 
>              SMI-Common(Smart Multimedia Interface Common)
>                           |
>          +----------------+------------------+
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>        larb0       SMI-Sub-Common0     SMI-Sub-Common1
>                    |      |     |      |             |
>                   larb1  larb2 larb3  larb7       larb9
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
> 
> Although this can pass the dtbs_check, maybe there is a better way
> to describe the requirements for 'resets' and 'reset-names' in bindings.
> But I don't find a better way to describe it that only SMI larbs located
> in camera and image subsys requires the 'resets' and 'reset-names'.
> I would appreciate it if you could give some suggestions.
> 
> .../mediatek,smi-common.yaml                  |  2 +
>  .../memory-controllers/mediatek,smi-larb.yaml | 53 +++++++++++++++----
>  2 files changed, 44 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml:143:13: [warning] wrong indentation: expected 10 but found 12 (indentation)

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.example.dts:29.43-44 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241120063701.8194-2-friday.yang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


