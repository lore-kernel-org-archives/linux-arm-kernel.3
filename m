Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE0FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOsVK9WA4YOxrfCwYof4IVV5vtkbV5JYJmz6GFqIxVs=; b=IMGKtHvJ6evYeg4Ikbzu9NHtgn
	cU+z5hKUKCzhO4Ck3zh5vtksmkIvbYbh/+XXmy7jfGuO8L5mgcWFR5SkrZ5vQpwVbJrLlJ0u4MwPP
	WHT+ZSy7I+5kKkW8sWWDVxt1y6sm3qxpAtR8ZfhSIPVYT3aVqmxD/b30OIB1SGEYavi99D500GPjW
	8Wc+UirJEFoqwqlA25UqdEHkE56TlL4sUCjqq2Y8IKY8kutkADHyXCh2cmfWGMkVCACrLUOVvrtyi
	2n5pkQlHoZra/eRCqDgb6S5VjAPJ+TLcwhFH+roraUDirqBpi6hgk215fMm9+0BNwH7rC6WRr4t7B
	JtPVMmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ytT-00000005CZ4-1otP;
	Mon, 21 Apr 2025 21:41:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yqa-00000005C7K-2eH3;
	Mon, 21 Apr 2025 21:38:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A36E6115F;
	Mon, 21 Apr 2025 21:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AD3C4CEE4;
	Mon, 21 Apr 2025 21:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271515;
	bh=teUYICP7yxIXUdOVNrYCte8DQh1l8t6HHmNsrha758w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=brih1nJa/PjX5hVF83+YmG1qJS+oDhbzGboBmkmjVmmkWCf7VGmK7+sX/GaHn8RWQ
	 WQcdc4fYLk7MF2rwQ3fnV5xIRtRs+zxHla5KLEswQuAPMkhd1du5EIFrKd3W2bWljJ
	 oauBvw4tfteGbe/lF4yR7+ozUr91LXlJ9PwlCEzJyMt0BicuYfYQCEKXxBbI1nCleX
	 9ZTNAig5mE7XglwCcA1oK9Awy8soREhYWX6UmcxJ5e5pMPXpMGFo83FdtlgVuDQvTU
	 TLNcl37f/y4YbXWxQdjwHmHbXD0PFsXQpv6zwScJXbOHbfLqArW3wYuGFgt/MLIPFK
	 UKRKEK4ZqjNag==
Date: Mon, 21 Apr 2025 16:38:33 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, houlong.wei@mediatek.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: mailbox: mediatek,gce-mailbox: Add support
 for MT6893
Message-ID: <20250421213833.GA2966253-robh@kernel.org>
References: <20250416120230.147844-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120230.147844-1-angelogioacchino.delregno@collabora.com>
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

On Wed, Apr 16, 2025 at 02:02:30PM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
> SoC using MT8195 as a fallback, and add a header for the GCE
> mailbox found in MT6893.
> 
> Similarly to MT8195, this SoC has two GCE hardware instances, but
> the event values are different (hence requiring its own header).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mailbox/mediatek,gce-mailbox.yaml         |   4 +
>  include/dt-bindings/gce/mediatek,mt6893-gce.h | 312 ++++++++++++++++++
>  2 files changed, 316 insertions(+)
>  create mode 100644 include/dt-bindings/gce/mediatek,mt6893-gce.h
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> index 73d6db34d64a..277d290d852b 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - mediatek,mt6779-gce
> +          - mediatek,mt6893-gce
>            - mediatek,mt8173-gce
>            - mediatek,mt8183-gce
>            - mediatek,mt8186-gce
> @@ -29,6 +30,9 @@ properties:
>        - items:
>            - const: mediatek,mt6795-gce
>            - const: mediatek,mt8173-gce
> +      - items:
> +          - const: mediatek,mt6893-gce
> +          - const: mediatek,mt8195-gce

You shouldn't have with and without a fallback.

>  
>    "#mbox-cells":
>      const: 2

