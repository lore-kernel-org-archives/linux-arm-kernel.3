Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29D4C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 20:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXBb7wC1OwSNwPJLQXnya9bvduehTWDi8U3N7qYhPhE=; b=bvwsMwRq/Xec/xSM+vMYgytxLF
	RY1WMEBFt7jn+8oL79Z01wA/OM45xvGJetzTMtwmeMZzi7BPQRgSci0guaAT4kzDcQ3iCZcvNgq72
	QUT5F7iuEAZvrE2N3KEoX6ZZxZLU3lifOHPlJP9Vd4FxKuGTS96fiIkflzyEGnA+SoIKtdhhF+ukj
	zJnVqHenouv5/u/4JNgwkL/z9Yyy4l+KVSiyPADJFJ+8l2gIFvnDNHCyVfgySRJlp408aiLPe4PKi
	u23jxdqhJnq5aqfyhcP+alZiTFgD3KqxbJLsdogKKMyB7zQ9IiCCSoGIecongtpvBPCZgzHCLJ7ml
	EsGlYk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug83E-0000000DD8W-3fbw;
	Sun, 27 Jul 2025 20:32:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug7yC-0000000DCYX-1BK9;
	Sun, 27 Jul 2025 20:27:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 926E45C58F5;
	Sun, 27 Jul 2025 20:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFFCC4CEEF;
	Sun, 27 Jul 2025 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753648063;
	bh=xcyCCQzerNA14uLlW6X/eFydzN3xJH2S9fgLzi5zBs4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=n6FO4yQgcR3IGIV5K6DYGzoed2HmMLk78SfvyMkTM5UVHxzeHdy5S0fiIeoCfTWUD
	 8qf/Ow/E4PbCk/FKBsRfX+w31JMb2t5JpUTrdJoYrBlNZUew3G7XQjEPvR24A/HnPU
	 J7v9iktZ6xy39qzPZv287DLpYRCxmgeny0T72QX/xUSDh/W2mujOFfzwpi6AizwSDf
	 sh+ivvAJvrnXwUWTsZfooYW56X3Jfq0YKNiOgegLSE4GJv1xljfG+JAcpKS80c5/hq
	 71Odhy1jMellQpX5VVsUGbgf9aYwqlhYAp2oghUsius0VA/mje+B8dQAU/+LrAA8ja
	 NrXJv3u68WnXw==
Date: Sun, 27 Jul 2025 15:27:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 CK Hu <ck.hu@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org, 
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-kernel@vger.kernel.org
To: Jay Liu <jay.liu@mediatek.com>
In-Reply-To: <20250727071609.26037-6-jay.liu@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-6-jay.liu@mediatek.com>
Message-Id: <175364805752.3183.16770186959720392810.robh@kernel.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: display: mediatek: ccorr: Add
 support for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_132744_360622_6D2B9004 
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


On Sun, 27 Jul 2025 15:15:55 +0800, Jay Liu wrote:
> Add a compatible string for the CCORR IP found in the MT8196 SoC.
> Each CCORR IP of this SoC is fully compatible with the ones found
> in MT8192.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250727071609.26037-6-jay.liu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


