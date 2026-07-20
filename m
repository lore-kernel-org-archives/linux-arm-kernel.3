Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9828CC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJ27NF5mECz+3CgTj2zpeWRieXtQbm3hXE1VmWAZHXw=; b=wPOjK3/iBq+aNDLlZmLxMlmx9G
	lWuGLT+kMKA9WNxPtMdIdQRoyeyScYjl6PO7q06lr4U+9DoQTXxl0ysrXc8+kREbyXa6cdMQnJdaJ
	VzmMMF00bUu4lVJItEXhPOkyozUpXMQ0SocyRWYsK9Jd0mzC94tzG+KPIdI4PZ2xeSaf3llCkrQCH
	tZtTRJeIaE5eZdsuaL/qdh0Yw0LKdZv07g3yO7Xhc5oPH8jMUT2kSC/jnR1w/F6R+B/KJGJ/EssPx
	RbBOUR6bU131bBg0Dsm71Hil9BdRG8uljn80q4YbMQPPNczXAZeGYI46EDmPQDJJkeDP2Agjhw5fT
	K5O/Cesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlh8U-00000005ujJ-1lb6;
	Mon, 20 Jul 2026 06:05:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlh8S-00000005uix-3ie0;
	Mon, 20 Jul 2026 06:05:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07A8B60103;
	Mon, 20 Jul 2026 06:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A8E1F000E9;
	Mon, 20 Jul 2026 06:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784527551;
	bh=XJ27NF5mECz+3CgTj2zpeWRieXtQbm3hXE1VmWAZHXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e7D7u13kECFetN8Izj+Rcn/rbnQG7q63xIVDEa3daZ8SA4jfAWStwp4dxY98P66GK
	 rWL9OkDaoReq4Njv5zpmiAX5sqAg41YD4DAsOorAfnb3L3uDapvkqm1hAIVU/tNJQP
	 JUP+1O5ixM5y31G5dE4dqsm29OC0oH4tEafaEQcaLGmpl7TtXfS+uy4UuD8e2HTtpC
	 SRMhpxIi7znvhUJR/ZzzVhpnWZlzfl+4oQqYa0/3VgwFYny2T4ZO5VlLh+/Z0EnOK8
	 rWvU0hhRuffggv77ph/JgVf3A0yUk/JDKoQmxdul01sNJQZ5ZFHtOJLvHYV3UhrPy2
	 2vlF4bPjgMDkA==
Date: Mon, 20 Jul 2026 08:05:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikolai Burov <nikolai.burov@jolla.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ulf Hansson <ulfh@kernel.org>, 
	Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	Nikolai Burov <nikolai.burov+review@abscue.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add MediaTek MT6858 power
 domain controller
Message-ID: <20260720-vigorous-groovy-cassowary-9912d9@quoll>
References: <20260715-mt6858-pmdomain-v2-0-6293e87fc093@jolla.com>
 <20260715-mt6858-pmdomain-v2-1-6293e87fc093@jolla.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-mt6858-pmdomain-v2-1-6293e87fc093@jolla.com>
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

On Wed, Jul 15, 2026 at 04:54:05PM +0300, Nikolai Burov wrote:
> Add a new compatible and document bindings for the power domain
> controller of the MT6858 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

To provide review, please open and read the entire file.

> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
>  .../bindings/power/mediatek,power-controller.yaml  | 21 +++++++++++++++++++-
>  include/dt-bindings/power/mediatek,mt6858-power.h  | 23 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 070c6e5666dc..d03e4a925163 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -25,6 +25,7 @@ properties:
>      enum:
>        - mediatek,mt6735-power-controller
>        - mediatek,mt6795-power-controller
> +      - mediatek,mt6858-power-controller
>        - mediatek,mt6893-power-controller
>        - mediatek,mt8167-power-controller
>        - mediatek,mt8173-power-controller
> @@ -56,7 +57,7 @@ properties:
>        faults while enabling or disabling a power domain.
>        For example, this may hold phandles to INFRACFG and SMI.
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 6

And the rest? Why does this device have flexible number of access
controllers?

Best regards,
Krzysztof


