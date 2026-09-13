Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E371C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxVsQHt0PD/AoS3HnL1w++8paOmcsm0rJPQZ5P/iM5w=; b=pAOgpbzeRLTdg0OslR4WB4dVHw
	Yr4OVjyJGYakwQ1dvzouPduoKhEG8uGPA8t/JW+ese+hskIoW+wP8Ig13kONdDQ09f+AHkbuo7M29
	50DUcoMLQ3dIjnLoZ+GOUIIXvjn6OsUS0oGSmWwzbq6+8LoKNUIoswZ1TzfK5VZkbYkNgl3LWglXJ
	NDQ1M60+IWeMYUQTHkr/d3+zOchnvwTZyNVvB72AtEy66yCe7X/K4uTIti2KhtZlpRmrb3ubmOcnb
	Kq+qW8lsCzn1mkPFNnwSYu6S1fTZ6qTd1bRdVc7mhrGf2z/sM9V9QWEjtOjltBxs+AKBCBIZ/KW6g
	1jM+b8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5fgq-00000001WV6-24Bm;
	Sun, 13 Sep 2026 08:35:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5fgn-00000001WUn-1Ng1;
	Sun, 13 Sep 2026 08:35:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78BF26022C;
	Sun, 13 Sep 2026 08:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0221F000FF;
	Sun, 13 Sep 2026 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789288551;
	bh=MxVsQHt0PD/AoS3HnL1w++8paOmcsm0rJPQZ5P/iM5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ckfEgG1xnIugOq10gUjrGBEhKdAjNkT74xq0yXlikBeybfgW4fsyVnnbUUgrDOZIH
	 blAn+WgZtLEv1Z8wRd3aryKg/VBkGPqcFkQODhWZ7OcjlbT2Iprm964nzN6z4qEe1S
	 +oHALBd4HSAR+x1MakMiJy34qOrpHuHKItmssvhEIOxyDx2BgSZVI09bNjkGEgfwz8
	 x4Ckk29IeEAi1kPjEtpQE1t+NsPG7+uYBo5BX9YASSeEIPSsRqKdj4c+St5lPWD1Mb
	 mgN8ZClfWKWgAfoOuY0WV/Ghugdj4hy+fYE9d2feHNoHVBhddaBNuJ5rq8vEr23zqo
	 mRR5y9Wq8b3LQ==
Date: Sun, 13 Sep 2026 10:35:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/8] dt-bindings: watchdog: Add compatible for
 MediaTek mt8167
Message-ID: <20260913-octopus-of-incredible-gallantry-4ba15d@quoll>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-4-l.scorcia@gmail.com>
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

On Tue, Sep 08, 2026 at 07:38:30PM +0200, Luca Leonardo Scorcia wrote:
> Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
> which in turn falls back on mt6589-wdt. However according to the data
> sheet mt8167 toprgu is not actually compatible with mt6589 (it has 14 sw
> resets instead of 12, and its reset bit map table is different from
> mt6589).
> 
> Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
> add the IDs that can be used in device trees to identify subsystem resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
>  .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 +++++++++++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


