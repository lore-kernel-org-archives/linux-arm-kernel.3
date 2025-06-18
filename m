Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E70C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4VTK3eCG8hx+8cOCHC03CRPEXFZEAFnEVMrfkQFbo4=; b=S2iXNf83YTCu7e91zTmmgAhWZc
	m9QgiJWEHNNYC9e8khvZ7u3ZKJ58q0ScXzT9aE857tC3Itqt5fb2Tr6h0fp7UFwSpVhhP2Sdg7zt2
	rgis33E/unyVLIpKzXY62jATFfi3pfYiuFvLgG+o3C15mnyHmYwhqKd8bcEV7zWUrHgelk3/1/AYH
	XXtoe4s3/He0PnP5xC/+iBlE3TfM7VHikkVoLRlQNCcgmx1N17h/eaBQ8e+6XEYHq/DWPqGcW1VjG
	1fxaKDvx86EYQVmfsyg1phJRZu53VLe0u/wab1f+WC81rkB53nogjjO6H8pQ9LvLtNModLfD+Ey6F
	y2/iySqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwP6-0000000ApAa-00SS;
	Wed, 18 Jun 2025 17:16:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsOa-0000000AD8n-43gt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B405C6112A;
	Wed, 18 Jun 2025 13:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F52EC4CEEE;
	Wed, 18 Jun 2025 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750251603;
	bh=MRqEecx1OOYe0w2vHR29KSY1Ek3v/BZj9saNCAG+GcU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hYpXFz/fg2f586yRIe9vDvlYwHywwIg0QM6bbGgAQbSHP2zJ3LRwkbMPvxZZhnD4j
	 5HML5apfyR7mLMacWrp0GHtla95F5QQ0Z8qAAImLDDNO8bcIOOXvT6EQo5ZWLsLvUo
	 CNtU84SZCzK5IopukR/e2cuBlEbpeMOEjWySxTHbEDW69nBk8Ph9xfIaRYsClnmsAE
	 0tvqhIhiYhigWID4OzVbfOoCLFZhp2rzX+Zwe2Y9Z8lKu9u4A7HgTDaWuhjy7IgFRH
	 NVrAV08GT0/wxvz7swU4LLhBPpEnSrFxN4eewqX8N17G5xWyZCcjWi2RV2g/3zW16a
	 MmUAKAPG6EkGQ==
Date: Wed, 18 Jun 2025 08:00:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Julien Massot <julien.massot@collabora.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250618095858.2145209-15-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-15-demonsingur@gmail.com>
Message-Id: <175025160249.1545873.9100402029038186913.robh@kernel.org>
Subject: Re: [PATCH v4 14/19] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
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


On Wed, 18 Jun 2025 12:58:50 +0300, Cosmin Tanislav wrote:
> The MAX9296A deserializer converts single or dual serial inputs to MIPI
> CSI-2 outputs. The GMSL2 links operate at a fixed rate of 3Gbps or 6Gbps
> in the forward direction and 187.5Mbps in the reverse direction.
> In GMSL1 mode, each serial link can be paired with 3.12Gbps or 1.5Gbps
> GMSL1 serializers or operate up to 4.5Gbps with GMSL2 serializers with
> GMSL1 backward compatibility. The MAX9296A supports mixed GMSL2 and
> GMSL1 links. The serial inputs operate independently, allowing videos
> with different timings and resolutions to be received on each input.
> 
> MAX96716A supports both tunnel and pixel mode.
> MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/media/i2c/maxim,max9296a.yaml    | 242 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.example.dtb: serializer@40 (maxim,max96717): compatible: 'oneOf' conditional failed, one must be fixed:
	['maxim,max96717'] is too short
	'maxim,max96717' is not one of ['maxim,max9295a', 'maxim,max96717f']
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96717.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max9296a.example.dtb: serializer@40 (maxim,max96717): compatible: 'oneOf' conditional failed, one must be fixed:
	['maxim,max96717'] is too short
	'maxim,max96717' is not one of ['maxim,max9295a', 'maxim,max96717f']
	from schema $id: http://devicetree.org/schemas/media/i2c/maxim,max96717.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250618095858.2145209-15-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


