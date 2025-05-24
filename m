Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F23C54FC6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scs/tE+WGNF39OFm0gkxy/B0mzEszuoabH4OTHgtnWM=; b=iQjSwesu4zGuZ7uIbGgO9t1JMo
	ilgfDT96WorvLisg202TpU+OTpwk5ogeKpHaoeoAGeZVZOYsg0mS9x9O65i5pN4cq7g/Mv61csbJR
	2meEf9Xf4yv+wht6898PUcD1XYVmIxgd/kT575qtvMzotP7e0nwrGsMLjiVpTBkX5FCS07q8z8BlR
	3IHkfTZlu8KeUFhCLKKxOdiDoem9HKPm+r71KJqH2sJCSAA6i5GUDD5zayL+8lquDFKi0tAi2tnM/
	mBU8dKe9pZrOH3Q64clItRQS25edyx8YbfTA5UrMgjZ9WZmrKY9N+cRY/DMoQ/iGfXAp+VZUQOR3F
	0kKq+7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIp8d-00000005tSb-2HvM;
	Sat, 24 May 2025 13:42:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIp4M-00000005tEf-2PiK;
	Sat, 24 May 2025 13:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A803F614BF;
	Sat, 24 May 2025 13:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33215C4CEE4;
	Sat, 24 May 2025 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748093865;
	bh=Rr1Xa7yDBxx2hT3ic3Dq3kYtEe67rYrGKMaE4/DKIwA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FISFleckQqpX8PG34UP4oEbwrm5iGq6A8n3X69FzrvWxQWwvKJzQ9e+P/QM8S0u35
	 y9n1I82g2LTp2zNrb2xfRdZ7JifsjuiAoz0sGOLuGOCOUhedonT5hTdnLmSCyY1aHH
	 phoDVeau2VmbN8+vmT8zCRMxfo03oJiYSOBc+Z1ZBLrLgZnw/1I7lpWT+jaw/2q/R8
	 mF5JROn1rARZWhV8uFmDmYFt0739S8Sq2Znd411d+ouNpV793Xjc4/O42jyztXmXQt
	 WvmY9P9uXAh0I5kD/gpzTjz8ovjRIDyUf3Jf7GNoH+YOfOWB2vavu+xY3DHSHTtYEX
	 1PQL8CGIz1edA==
Date: Sat, 24 May 2025 08:37:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: teddy.chen@mediatek.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
 yunkec@chromium.org
To: Olivia Wen <olivia.wen@mediatek.com>
In-Reply-To: <20250524115144.3832748-3-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
 <20250524115144.3832748-3-olivia.wen@mediatek.com>
Message-Id: <174809386113.549698.18274088720500456314.robh@kernel.org>
Subject: Re: [PATCH v1 02/10] dt-bindings: media: Add MT8188 ImgSys's LARB
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


On Sat, 24 May 2025 19:49:54 +0800, Olivia Wen wrote:
> This patch adds support for the MT8188 Image System's Local Arbiter
> (LARB) in the device tree bindings. The LARB is a crucial component in
> MediaTek's ImgSys architecture, responsible for managing memory access
> and arbitration between various hardware modules.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
> ---
>  .../bindings/media/mediatek,imgsys-larbs.yaml | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.example.dtb: /example-0/imgsys-l11b: failed to match any schema with compatible: ['mediatek,mt8188-imgsys-larb']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250524115144.3832748-3-olivia.wen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


