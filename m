Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F93CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6BqH/yZqqamfLVukmDf/rY/Qu5OyQBwyrHbGMFypLk=; b=Pdj/iWspoJ9OVJtcCDjql0NYOD
	xRGHI7BBEgZzp8+CZyyr0bv4yG7ATGqtzn4JwO4eljJQqQhRLj/vByQcdftZKMWNUeereHNlVimOz
	B7AK9oJJ5vLfe0Syn0JOe/cjVa7iVXdpv3yWC4z56W702Cym4DY+DrIeW8p1RmoEcmZ1DK/G13fcx
	7baWoKZ9NLan+hW8e/ALe2k1TYNydpDn2Lg19yhSJOWcpt206sSldD4aqWiniK+UPywfI58I5A6VK
	emYkfRJjhOsGsEl+Vr9szPML7X4HykUtWpri3jsHDvT0hc6oKPrYpcyPhq1bA0y6AppE5WqDAvUuU
	0zFuE9Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB947-00000000PK7-2aZp;
	Mon, 28 Sep 2026 10:58:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB946-00000000PJi-2JFV;
	Mon, 28 Sep 2026 10:58:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D547143CBF;
	Mon, 28 Sep 2026 10:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95101F0089C;
	Mon, 28 Sep 2026 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593113;
	bh=X6BqH/yZqqamfLVukmDf/rY/Qu5OyQBwyrHbGMFypLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ns+HJAuX8MZW2S8YIT3Le/zJN+nCV8ge55j9YedS41I99A+PRZUK6XvaZlLSyjC+8
	 JU8YRnfm082rBhoRP7YHW6ngTNMi8IARYyvLtBDsj6O5HnKesAnfg+huj010/ndQDZ
	 ylgLp/WSGZCTmgwonyDVpaKaKL4PvgoEl8+0oIYkL5FiL6HOIfxXIHpi6Oqb+k6OAR
	 lH+jQdrjtPwNbHEJbGirAXXNZGPuYe1mIK+qKmZVCALDw0cO5kiOVxVifuUwQwEzMm
	 Nt5J1/ZnwytNKmrt7kUiCIgoB04VZ0q1VpzbhGOlfcW90j6ByErEShHlCxSJc2Lqlw
	 5Q8c2JE6hJGYA==
Date: Mon, 28 Sep 2026 12:58:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v10 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Message-ID: <20260928-efficient-secret-manatee-2fcca6@quoll>
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
 <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
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

On Thu, Sep 24, 2026 at 03:55:10PM +0800, Zhentao Guo wrote:
> Add bindings for Amlogic hardware decoder accelerator.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 000000000000..751043c3d9cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Video Decode Accelerator
> +
> +maintainers:
> +  - Zhentao Guo <zhentao.guo@amlogic.com>
> +
> +description:
> +  The Video Decoder Accelerator present on Amlogic SOCs.
> +  It supports stateless h264 decoding.
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-vdec
> +
> +  reg:
> +    minItems: 2

What is happening here? Previous version was different.

Best regards,
Krzysztof


