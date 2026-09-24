Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56F0C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 21:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL7Nsv04kDdnpWUYu7d8rzd7D0xGzhZqRoffIzHh1Fk=; b=u9/2KpETkaH8GEYrgs60aynF+I
	0p724vyVNDVyi3e1IwPEsdZLRc8vFjfhMNNEGuHGfwmW0YrfqjEG9vBApHXz2kU61/qKqUd+raC2S
	yhpjaSJOmwMlCO0OPNhom4jU5+7YnknaqI7Ql5cmva3OeqIMZPAfAtYnCp0D68/kf5FlkvdAenCNG
	TNkMyXMSAjhifcMPOliiZRU3b5LiSSV/HXjJ7hb+7e6nAWP15BtTTePScKHxc/zo6ib7jjjcBvkBP
	A+idxLojpDFxu7hNcP0lifjpFF8WLZCvoIwDg+o52ptTzinWZCwjjO805KGbieoX0lz4TiUK1znsL
	ttAgr4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rJg-0000000CFDg-1rpX;
	Thu, 24 Sep 2026 21:49:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rJf-0000000CFDU-07Az;
	Thu, 24 Sep 2026 21:49:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7067642AEB;
	Thu, 24 Sep 2026 21:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0646C1F000FF;
	Thu, 24 Sep 2026 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790286558;
	bh=DL7Nsv04kDdnpWUYu7d8rzd7D0xGzhZqRoffIzHh1Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iz3PUv1nz8/kq3IXn8UG6VWi81dJRXt0JEB/5XeWDE6v/n4NtUOEoFQhBBWF6Qpgf
	 osoKuOVg+1WmuUh9vncVqrDmUffoX0/tl6ow7lAVAN4dU9Er73ZDrRZl8NkbA72Mym
	 pMsLfZClmz8unc1E78R+R8lSrDCYmmIUIzhM7XeOytuRV314H/nFmMnx3dDM+cW6zQ
	 O9qFYzEKiSuJYur2KIIsjNS9qw41b879WFYmiFMuNgvvlLY5MopDYxJBmmr/RdUIk3
	 Zib64xvPhl8ZtGO10lJB9aH4DkNcLVQRf7vqaxdWm4y9iDWdhWTQ5GbXAKtTyi+PVg
	 iCVsOOudSyOmQ==
Date: Thu, 24 Sep 2026 16:49:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
Message-ID: <179028655599.1874918.3532753045457471424.robh@kernel.org>
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
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


On Tue, 15 Sep 2026 22:47:50 -0500, Ryan Brue wrote:
> MT8173's keypad controller is the same block this driver already handles.
> Its register map agrees offset for offset with the MT6779 one -- STA 0x00,
> MEM1..MEM5 0x04..0x14, DEBOUNCE 0x18, SEL 0x20, EN 0x24 -- and
> mt6779-keypad drives it with no code change, so the node only needs the
> fallback compatible in second position. Add the mt8173 string to the
> existing enum, which is what mt6873, mt8183, mt8365 and mt8516 already do.
> 
> Verified on an MT8173 board (Amazon Fire HD 10 2017): the volume rocker
> reports through mt6779-keypad with no driver modification.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> This is the binding half only. The board device tree that uses it, an Amazon
> Fire HD 10 (2017), is not upstream yet and comes with the rest of that
> board's nodes later; adding the compatible first keeps that submission from
> carrying a forward reference.
> 
> No driver change goes with it. mt6779-keypad matches on the fallback, which
> is how mt8183, mt8365 and mt8516 bind today -- only mt6779 and mt6873 are in
> the driver's own match table.
> ---
>  Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


