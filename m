Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2F8C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIl37IDSYE5BYRg+APo99CZFbK4PgAh12KYOJeQesTg=; b=KanFSpzaO/ItON6hoUB/n1L771
	jjACejq4xCwHVixXw0y11Sadw7MIa4C/ZCaMKmeF0C6xDGaAFvwUuu74yV5LfYbg9L36i2fStfZaa
	a//qJPmPNBMivtS+oqwDZgbpraNbgQSS/CAq0toWnsc4kFfvoGgOhUoJMzEdCph0XQwRJdZpKuc8G
	g8t1t7BoAv5QAoGjGZCEDNlkwHnDNggp/eOBMpN0FzlpSbtw0/6+0obnMDWMeyRhvyxZ19/jdBXAb
	cXNgoNbb3zy3RAsgzNmnJi1WypD/KBinPkf0NWL+n0yNJ9bP5pP3duONKKS97xYD32fpH8QD8YurR
	3VGvayfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9ow-00000008iHj-3NpA;
	Wed, 16 Jul 2025 21:37:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9mV-00000008i8w-2DMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 21:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85F0D601BB;
	Wed, 16 Jul 2025 21:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CE1C4CEE7;
	Wed, 16 Jul 2025 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752701714;
	bh=I+SsuYKuKb1oPJn8xEiqBq/dE2QgqTu7aIwJzz2nSGM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TIYCGT6KEhF7zj5LNSho42EyJc1rH7Veqeu4TNU3xuXjY10FO0fGt9OdG/o9ZEPIi
	 TqifTc+caMjefREvUC2W6hZutwGSG4S/jDenIoeuSKkBDOhgxDzBhXXCaAIV9R7vyc
	 tNVDpbGA/yxi/fHzZWljc3+u7E7Jt3QELfNn7TuViQ6wxYBovpIO6GvExdHpFBv6Qu
	 HG0WWH296RmLIrHnJByQZw5Rv+owREEvR7MgvBDCj3lG4TkFfoX/RMcX9Xmf4r0u96
	 Gd4Nvo/IhlEQn6aatWlC4xrZQTBMz2tqAJ6TN0obzv+SEsk3MzpKnKIC6kESvHSnCZ
	 uJtUnAS/kAhZA==
Date: Wed, 16 Jul 2025 16:35:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, linux-staging@lists.linux.dev, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250716193111.942217-15-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
 <20250716193111.942217-15-demonsingur@gmail.com>
Message-Id: <175270171321.1284786.126748563521510901.robh@kernel.org>
Subject: Re: [PATCH v6 14/24] dt-bindings: media: i2c: add MAX9296A,
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


On Wed, 16 Jul 2025 22:30:59 +0300, Cosmin Tanislav wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250716193111.942217-15-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


