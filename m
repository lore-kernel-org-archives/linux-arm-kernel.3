Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC12CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2bjnjkfAYn9RGZpcWaVsSZdftTR1zHRUBhxYKKVJts=; b=Snz0OAKHcU4nAuN5i4hNYWN2iM
	ONt7MW8hur3L9NEwv4Ln7TfCgZ8nCiB+jl1CReZEzjqUpKk/UO838+JrERu6Bh8v9oAsTcfYR19sA
	MkKhMAVYTWZiWyv9Q2kRicbuXL9xKdH/rzfVk5/4FPcy3f9AOubcq5kalo04SWt2/RCKfrl+VVkp+
	wkQScqg+mvMkFY0aSrjiu6pbCVMoAe3UuztRAN41GFoW46lL+p5VvFfETYulzCT5FWJIyB1CCH78L
	7iu7vZq8/Y+tZ4CKNyyAbdFfbYp5g/6xl/tjobFq3N9sxamBjLYmBPTmeukRVUikAcXcYb+xBRicK
	9tDoDFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTTz-00000002q9l-1HlR;
	Tue, 29 Sep 2026 08:46:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTTx-00000002q9D-3CF0;
	Tue, 29 Sep 2026 08:46:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32A1060210;
	Tue, 29 Sep 2026 08:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8FC1F00899;
	Tue, 29 Sep 2026 08:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671596;
	bh=X2bjnjkfAYn9RGZpcWaVsSZdftTR1zHRUBhxYKKVJts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bQno3+SULrhkcdpaywbcogY3sw2IWoviVqeWjhZujw5vJL2hriSaN+jCc4r/oyM4o
	 YWtKD/lKoaGUMqRFEWHGWI9sYi+96XjjMHCXUCkQwFnFiJ2EzS0RnCJv0BUTyxh9/b
	 YCFe8i3LfGV0euQkNSuCSHFs5PvKCpGoFe6ndmmaD+d9z7uyqvYXTN6h2s32BL98/x
	 yK5GwUvFJ6h4ZzkhW0GWeyJL5+mOBUPvg64cPgilh3WI29gbOIofA1zQiQ4P4yDDem
	 HP6zTyCFR5uN6KjjbehUUOLQT0oPq3jZe5/kxbgRKlAsA9KWfCP7z4k/RiPnPIxaQQ
	 bVIPuWr/pCtxQ==
Date: Tue, 29 Sep 2026 10:46:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Heiko Stuebner <heiko@sntech.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 01/17] dt-bindings: media: add apple,avd
Message-ID: <20260929-poised-sympathetic-hound-c0ddf1@quoll>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
 <20260926-avd-v2-1-ecebe6a3648e@icloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926-avd-v2-1-ecebe6a3648e@icloud.com>
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

On Sat, Sep 26, 2026 at 03:14:40PM +0200, Sofus Forstreuter wrote:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t6030-avd
> +              - apple,t6031-avd
> +          - const: apple,t8122-avd
> +      - enum:
> +          - apple,t8103-avd
> +          - apple,t8112-avd
> +          - apple,t8122-avd
> +          - apple,t6000-avd
> +          - apple,t6020-avd

These are misordered. Order is alphabetical.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


