Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B803C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNZTfV6pczfNu1Rg3oRqU/J3iE2XBhck/GrUYWoWxGk=; b=v5SZiCaVo7zPCD7BkGaBgI8APN
	YlOqhfB5+G3XWYswuLT+p4TQk0/vDr2jykKDf7lE4FP+GYv2B0p5mba92vvXqB4MWJOoKO9CXB79U
	JceL1Pb1WUepzh6NG+Lbs/lexHDttngvnVEJEe9tuA8PpGQuQoEXKdvb9euZbGaOAcPmsuL+enZ7m
	18hCwgftpOo9BQj+AzWV4z34eeg3NAnf+OKGbhRCMDcEF0kF8d79/mA8O37gotdY8m+BgRcbLXswG
	aSyzlp/W/pSACGLoasUHZkr84sB4KF5qZQSskLpHpaUmVRUBudIgiWwe0/Z/78Q+UXvWy3G7bfiyI
	hDpFCPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYqb-0000000ETro-1kOF;
	Fri, 07 Mar 2025 14:38:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYnP-0000000ETSR-0x9d;
	Fri, 07 Mar 2025 14:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93C365C59B4;
	Fri,  7 Mar 2025 14:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100F4C4CED1;
	Fri,  7 Mar 2025 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741358126;
	bh=03Le1D/NeTxOVG5fsfF0nz70nJVlPT6k453TPDt8ntA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WlnmLA93thLv3i5tOxFwUz61WSRV046LkGcrinCZTDXqlRK0rj+/smuYbUKwxSChj
	 /548Q0GmcbYpexSCVo8842aUCn1cUkJCeMDfJ1qlRtfV1g7Lb3LW6qMoiHbHqXYJ8B
	 4npSRlOUQjG1QsqKLkBFGYOl6+GNLzABEy3hamYzgG16Dy2FzSPzdjOYN6vQ1Za7ET
	 ITiRLsHAhzq8FrjykkbMpLLKkVS5WcICPg5KleDVhyHxWNkYCnId2GLRlfFzadXEAc
	 AJBtln5dHXu3B4PrblpsgUn5pG4y6Wk/nN334Ty/O4Duip4HBnp6ogvoYgIj7R1n1q
	 dnYNMcyI4S3Og==
Date: Fri, 07 Mar 2025 08:35:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org
To: "Darren.Ye" <darren.ye@mediatek.com>
In-Reply-To: <20250307124841.23777-15-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-15-darren.ye@mediatek.com>
Message-Id: <174135812256.4140479.2757707814425375416.robh@kernel.org>
Subject: Re: [PATCH 14/14] dt-bindings: mediatek: mt8196: add mt8196-mt6681
 document
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_063527_324184_EBFB5ADB 
X-CRM114-Status: GOOD (  10.80  )
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


On Fri, 07 Mar 2025 20:47:40 +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add document for mt8196 board with mt6681.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  .../sound/mediatek,mt8196-mt6681.yaml         | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-mt6681.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250307124841.23777-15-darren.ye@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


