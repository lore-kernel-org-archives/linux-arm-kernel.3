Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D4AC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dAFqdSK5Fh/+XJiVn6+9uE6z7eGK80bJ70RvSacXA0=; b=Cwh2MRxbr971os+fCHiT38OC4P
	NwpdXFPLwbQJ6k0XKoBoroW84V/6h90ckb6CMXbn3YFp1F52e94h+RsAn1F/yQ8nXHZ9z9py2Oa5O
	DuH3oamE4z3t6AZHx6FuvEWZtjAoIk/hPHulQGCqCzQ5FVn+Eqz0n1G8PUdGd2gHbgFmIbVwFpuv2
	v8HOZAA/3qu3qx4qZSwxhT5wypcd5IkNGIJeTAUFk4x3CqB97nsli1If2z/30XNHK9MVbQi1O1Yya
	s3l6BFl5GaSOLFY/m4lAu5olLd5JTpIJaZngTz0rEfO7FisbdYfMAAn1IQYnMyqvKYG3uFVLVo390
	K2x0OMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3up0-0000000H627-2zD5;
	Sun, 13 Apr 2025 10:44:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3un9-0000000H5t6-1TMd;
	Sun, 13 Apr 2025 10:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C520A41717;
	Sun, 13 Apr 2025 10:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2CFC4CEDD;
	Sun, 13 Apr 2025 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744540942;
	bh=+rVcpgNtIzq+wNAjUzyP7ADEcJbJHlPGwgRaSM2PZYs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JwiUZdXNvgCm5rC9KB0QbwTvs1csueUgHMAU+OTSyb3HbnXDC/yBC2ZrTgu614nBc
	 Fg5EGg65YnsSq8WQFz3lxh/duqGl9vpR/wCTIdXunTVgKum8GvlgGCMMjhjXB07t+/
	 FkyKwFwCnoguoWCT1Rn1bTDs9aGkV1zCoMXGh72qvoxCgx/hgqwcZBRDSUQuENCoO7
	 6VQXyWp1wuXRbGyrkW8H3dwmCwmFt2n2e0ofmT8xS5/CnoU9HhVdH01ozAe0nsXKhq
	 gGW42B/OcYDVhbbEp9ACCARXTDumXS4ssYApO/ffmI7rYZsZ0C767tkNnPhy4UPzRr
	 EIakemrI9smIQ==
Date: Sun, 13 Apr 2025 05:42:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Daniel Golle <daniel@makrotopia.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-phy@lists.infradead.org, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 MandyJH Liu <mandyjh.liu@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Frank Wunderlich <frank-w@public-files.de>, 
 Sam Shih <sam.shih@mediatek.com>
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20250413085806.8544-4-linux@fw-web.de>
References: <20250413085806.8544-1-linux@fw-web.de>
 <20250413085806.8544-4-linux@fw-web.de>
Message-Id: <174454094043.2074029.12190125666379219189.robh@kernel.org>
Subject: Re: [RFC 3/5] dt-bindings: power: Add binding for MediaTek MT7988
 topmisc power controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_034223_452640_5176D1E0 
X-CRM114-Status: GOOD (  10.12  )
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


On Sun, 13 Apr 2025 10:58:03 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988.
> Add binding for it.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../power/mediatek,power-controller.yaml      | 35 +++++++++++++------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:28:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:39:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:40:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250413085806.8544-4-linux@fw-web.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


