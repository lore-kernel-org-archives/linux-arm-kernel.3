Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBB2C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKLX5UnxOIO/FAoM2tTxB/S4m7rGd2/i+CUznn7DJNM=; b=eq55GCLNRupDfL5Gi9y+RMpSz2
	oH764kkjCFv4rKHHRfYpQ7Qsubeb9mC34PIzF6KwFOR5tC8OPR0HkI3TB6YfKLVwn1EK/C2uIZDUn
	wjoYW5I3K6x3Un3AtERUGTjTiyPKA+Olg3dysxT9D2XW53QUM1Dk44JPilfRId+aj/WRzhtGCSna8
	9Q0Fv9l3G0+bJMpVw+Z4reSDkgeXcfRO49LHOhRuSrIKNa2RUWiqvT/nUASRDtGJRIhf4rMbnX3Hk
	2qtB/hdx6zNGfE9Q6grO2BZyOzzT/NEE5rFKUjulwD1zqKtG/209jj7yIkzhgeayuKYfgl+l7f6b9
	uS9zgrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0eT-000000091BT-2hJJ;
	Wed, 02 Jul 2025 16:49:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX06K-00000008uwZ-15yA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 16:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D807A52E41;
	Wed,  2 Jul 2025 16:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4687C4CEE7;
	Wed,  2 Jul 2025 16:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751472863;
	bh=qAqCnDiXmDWDKpsRVEMIVXLauOz1Q2uyONAQFH9F8c0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XkDoA3qXcO87nKbrvLlQAOcEuefHPBdeAAhnCzoT3xJo364HpCdXMR1XT/fpybOb7
	 ZVKKm6zwfmDqUiZglStC/614VObrg24NyJzETSAuy0tG/78OJ4VL9BJQT26gC5G9Vs
	 SXe7ARU4hsSQoM8N29HOTpXCyY7JrlykGiZza9My7fFrlfjVhM8QdTnMM2Y89mIn+8
	 R2xoI7cmqcAdkyFIRBs72YU22l2yS4RWaOypt2DXFIHdqhHIIFa5CFVoqnT529jNKl
	 Ufvvg2YmIYjzrNwJKq3VOZcQnSCuZlTxafY2Eq9iXDPkv4uP+rERmf+YjLjhJmrLRX
	 fMIxVhWJ62qwg==
Date: Wed, 02 Jul 2025 11:14:22 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 linux-media@vger.kernel.org, Julien Massot <julien.massot@collabora.com>, 
 linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250702132104.1537926-15-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
 <20250702132104.1537926-15-demonsingur@gmail.com>
Message-Id: <175147286213.1836974.10095173958992106810.robh@kernel.org>
Subject: Re: [PATCH v5 14/24] dt-bindings: media: i2c: add MAX9296A,
 MAX96716A, MAX96792A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_091424_431612_7679BECB 
X-CRM114-Status: GOOD (  13.81  )
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


On Wed, 02 Jul 2025 16:20:40 +0300, Cosmin Tanislav wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250702132104.1537926-15-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


