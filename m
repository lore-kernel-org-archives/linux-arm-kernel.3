Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56878C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 20:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijYKTMz+7SRoVeYzu7lFepC6tYQuKzO42395DULg/9M=; b=nK8DsEl8gTcHwv/nBlv2c7dLl9
	QgeX2cV21gVP8ecS96icqGbJICLCbUvwoMUauaqlKbGT6/iMFFOyYFZOyOJCNI8FnB3I8EUdAuu0q
	FhmubFZaP0yxzpngV9ccWyqaJhstAOwlaN6luRZEfN5wp5hbgg5ZGAYXixQDgJpY2NKSPMFqajL9k
	55sMHhJarQFPF0BIX80GkD+s5v4cgkJ7ygnKAEQI6p92Sa3VNIFsgcWZOFDAMB2TVJQtkC4lkJH1d
	GCDB6Nl0OsGEbD5UBmyiW+kCUAgvoAF94pQfIrMqOw+DM//UTdOleg4nbVtLE3RmwxJ6wB7/Gaj8H
	xDnDvplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug88F-0000000DDlQ-0WGU;
	Sun, 27 Jul 2025 20:38:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug7yD-0000000DCZB-1eBu;
	Sun, 27 Jul 2025 20:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2206F44124;
	Sun, 27 Jul 2025 20:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCCEC4CEEF;
	Sun, 27 Jul 2025 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753648065;
	bh=dRmKTiw1fab4d1US1qUGI0FYfA7qFL9ZBkYLrxz0Ggc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jq5JtLZEZpLoCNWFTg+zyA6D89n/H1dyZw3w1qZbULqPLAxOSoJemrH0NHFYWcYR8
	 m2PbU+k6BVHaas8uwmq2yiUr1lLcSH67hMd2QB2PFFn8YgjzrDmXAGZBxo/0YCGUOj
	 nS8IC4yAr/u3V6dujSb4H4od8rJgzO280UBhct+GDvjLbSdqxjV0zNDkKYCJyhx3m+
	 19IknIcUtPOw0HhHcmRMArA3z/062HBkg43Py2FvAX83n1O9flKfEs2MSD7i0J2NKH
	 UoUrlfO/20L7950bYyElqd5459B7duUsjhjAODcWxHFWMSvSvjQMio/UsFRKL8LHy4
	 Bvnv50yD5h4LQ==
Date: Sun, 27 Jul 2025 15:27:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
To: Jay Liu <jay.liu@mediatek.com>
In-Reply-To: <20250727071609.26037-8-jay.liu@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-8-jay.liu@mediatek.com>
Message-Id: <175364805939.3229.16063506192573561035.robh@kernel.org>
Subject: Re: [PATCH v2 7/7] dt-bindings: display: mediatek: gamma: Add
 support for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_132745_454261_673620B9 
X-CRM114-Status: GOOD (  11.59  )
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


On Sun, 27 Jul 2025 15:15:57 +0800, Jay Liu wrote:
> Add a compatible string for the GAMMA IP found in the MT8196 SoC.
> Each GAMMA IP of this SoC is fully compatible with the ones found
> in MT8195.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250727071609.26037-8-jay.liu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


