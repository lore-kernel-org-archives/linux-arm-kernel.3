Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9898C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 06:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRm/Fdbz7pUYBW94F8pp9/aSXKWPzOkYgLTec1f/CJE=; b=IDux5RJEzpZOPECxFiIKnOgDXr
	H8l+0J90mev43SNA3CivvmpE+ghzT1ZcSTlVKK90qdUOrlvjoRlBGgQysxDFJ25pIKGQrfN8AD0zn
	kQmzxxoqfZ/nFO5Zh51DkV/v5tfKdWzyPsLFmumvawA83E1B5KeFDIVE135sczFKDIPff6CUgNpDH
	tNBQGmEQdPAOj95LaLx5zAL8i0nHvTbXHwcTFzSUDdA90SqEqmGb2IUKpvNg6D2yWGkOnee2bm5F+
	qovMatu6s+4J1URHsmI1pfHFVAG2aUK5jZFkB9dzWwO2LPlCPzFiJ0Q1pv6ZIJ9pukCNFRn3TfZbk
	g/R97HTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhSc-00000005wyY-42Dz;
	Mon, 20 Jul 2026 06:26:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhSb-00000005wxz-1WAK;
	Mon, 20 Jul 2026 06:26:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21C8440B9E;
	Mon, 20 Jul 2026 06:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBD81F000E9;
	Mon, 20 Jul 2026 06:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784528801;
	bh=JRm/Fdbz7pUYBW94F8pp9/aSXKWPzOkYgLTec1f/CJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OL/fzfBeZH8DI7O2+evGoTGr7GgE47bREZZLc/c70ELp9q+CQ9+yUm0py6108vYxY
	 pMEZq0KjZ6EcXdqS88UzzvMQsVXTxX2XabCFXlFeGwvisk7SVCND6rRnH+bCU1BRPF
	 6FcV8VVnmEDaeA/f7of9WhP0L7iqwT2fgOze1NJiUIzScYclnSgLwtBnIXTP+iHJLH
	 6HBCUJcLY7jGpx2ntkSDnz+EgC3sekN0wKxj2qLPXBLm+OkX+uqxunZxsGm7JSTEqf
	 N4GxnRpWeGVgPsB846F0hSsFPYMV2ZANui63pfuqwtKeFj/4nMCdywuPILzgw9HuWq
	 vymynse4PvBFw==
Date: Mon, 20 Jul 2026 08:26:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dt-bindings: watchdog: Add compatible for
 MediaTek mt8167
Message-ID: <20260720-fast-daft-coua-dbd8ab@quoll>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
 <20260717163959.714561-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717163959.714561-4-l.scorcia@gmail.com>
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

On Fri, Jul 17, 2026 at 06:39:14PM +0200, Luca Leonardo Scorcia wrote:
> Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
> which in turn falls back on mt6589-wdt. However according to the data
> sheet mt8167 has 15 sw resets instead of 12, and their order is different

Does 15 over 12 make it incompatible?

And how does the order matter? Order where? Binding does not have even a
single reset.

> from mt6589. Update the wdt binding to add a dedicated compatible for
> mt8167.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 953629cb9558..f514be8a5851 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt6795-wdt
>            - mediatek,mt7986-wdt
>            - mediatek,mt7988-wdt
> +          - mediatek,mt8167-wdt
>            - mediatek,mt8183-wdt
>            - mediatek,mt8186-wdt
>            - mediatek,mt8188-wdt
> -- 
> 2.43.0
> 

