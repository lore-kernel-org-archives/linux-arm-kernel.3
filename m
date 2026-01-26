Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85425CF65D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70XkH2/SXRbR8ODG/xIB13yKYaKsFBNAdxElPjrjkqQ=; b=GVWANOAkfiYYi5P0boI+3RbFjc
	Mr9i/Mo9Wuz6+asL649v+xOD+LiVLOl9goe2SNnFF5uobJ0hCJ7QRO0PgiF2N6imzd5lHmjA2kGS7
	oMRLjfZrOR+ix1noFbZzAelrIP45klfoUUohZcG1pilARSqvvTyr6cPXp+LTzYLQIkg9/y2mwuoop
	hKNoxgNc+g5SVG+0oNSKf5tPabYRsNxNnYqS+c1RWSBUJLZNnVWZKdXoFk3eTW+nSboyOzlsKeu2C
	amiIh1xE3qjK+g3kTjfYDEkwp8BAPiUqWIRJc2nN3aBNkAAegySyij5P79Zee4li1Zh8edKCBQeJ4
	TmrXQ8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJs4-0000000CIDC-2ykM;
	Mon, 26 Jan 2026 10:31:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJs2-0000000CICs-2rkw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C58DD60007;
	Mon, 26 Jan 2026 10:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B8AC19421;
	Mon, 26 Jan 2026 10:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769423457;
	bh=y8YlnBBYdukWkLM4gI4CeIjxBlYWDFXvVo4EZdvNX/w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HKmY1k3MJihWWPe6EOHqv0VHZKWuHc8NR7drsAPmiVG7wW9FtIMMVtU9M6LRVaRCU
	 14zoiljY30Ynrg//ohr8DUocHiyaCL4blvI1BWec0uPmjNeMK/tXlhR65kyx/2Btus
	 Z89yNcyZ2scUAgBTaoB+UwloBP/mMFloIeGonn/FG0GNg87FSZAl9S29XTyOdwHWO4
	 2fxJ3bWaF/64oqIU94r1y0IQ/2Lc9fYgb1u2zxgLCGdop7tMLIE/VGWQYAbG3oybNI
	 +lACoMAC4W3RwH3VhRbp0+EeFk3LPoSUyqZl1xF+IhLlZb3RRZFW/Aj4ciS0DPq3oy
	 mYOO2f2Y1b5Vg==
Date: Mon, 26 Jan 2026 04:30:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, schung@nuvoton.com, tzimmermann@suse.de, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com, 
 linux-arm-kernel@lists.infradead.org, maarten.lankhorst@linux.intel.com, 
 yclu4@nuvoton.com, airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 mripard@kernel.org, simona@ffwll.ch, krzk+dt@kernel.org
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260126085727.2568958-2-a0987203069@gmail.com>
References: <20260126085727.2568958-1-a0987203069@gmail.com>
 <20260126085727.2568958-2-a0987203069@gmail.com>
Message-Id: <176942345650.1493690.6680592088886642042.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU
 binding
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


On Mon, 26 Jan 2026 16:57:25 +0800, Joey Lu wrote:
> Add Device Tree binding documentation for the Display Control
> Unit (DCU) found in Nuvoton MA35D1 SoCs.
> 
> The DCU is a DPI-based display controller supporting RGB output
> with optional external bridges or panels.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.example.dtb: /example-0/display@40260000: failed to match any schema with compatible: ['nuvoton,ma35d1-drm']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260126085727.2568958-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


