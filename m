Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2298C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAufu5QOgmBO/dP2kOAwa0OcdPABX2SzegtWlwnW2CQ=; b=iPd/aX86eeFlDJEgp0RRjsWvgp
	AmpOQNfzJAh5QgKwfXtmIsMRahOnmiTC7Ra23uspmnxF/vluH/MFKL+h8UgIotEfQmUfX/7lGqXpS
	5+ZJmVNrzz/JAAAINuIjPnKXZniDDc5KL7zbqQVlX5xwKgglEg+aQ9jERZkodbSd5LNysE1vU8+K9
	DlE2V5/MiJ+LeUbhuXPh2xRQeZnQcnMsQxE23ONMIxpiQe7q8MdWY/SJM35jTm05j1iss/F3hdbJx
	t/Q7PFUG9rWHjw/ad4N2Bwh6ers/lYjYWNhO9ztmcKA0tlzjoOvkZbYjCp68MFS4Eez7wRE+RgfKp
	7+Q95uNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNKK-00000006lGI-4Axg;
	Mon, 11 Aug 2025 07:52:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNG3-00000006kRb-023X;
	Mon, 11 Aug 2025 07:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2DBE44B8E;
	Mon, 11 Aug 2025 07:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36169C4CEF1;
	Mon, 11 Aug 2025 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754898470;
	bh=RTJN9RqRJ4UnrPrUYqFKFXdjiVHAvBNzSUV0agHEpCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMEvTVq9mH5UQ+CteJtO3qeUITYpyPArJqZdO8zN+Ojtqz/5TLMo5qIb5+VuTvd5O
	 9WhOMwLS9cQVb34kMY1uVFjDuKhA67JMVk/gPPhqW5MjCFI/pAhU0DFrshJ9BHdMcG
	 1nSJWesI8hsBoIPvjjMOfOr/hgX4Pvvoh3ZZvYh0TGwBQPmjyBZTgC736gKFDdppLD
	 M2V6oIe/2WOeeuom3JxeUuwvSFZPIfMnEXvQLL0evzi50Jc5N96kj2fZ8mEla5HZow
	 7eom7wiHjK9I03tlz1HRvrA5RuGO7PIX+E9BrGsLNxZ2rHn3nGZ4WZ847hGK8LcT+X
	 IfSz4ABQV9Nhg==
Date: Mon, 11 Aug 2025 09:47:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: mediatek: gamma: Add
 support for MT8196
Message-ID: <20250811-chubby-infrared-spider-df0d8c@kuoka>
References: <20250808125512.9788-1-jay.liu@mediatek.com>
 <20250808125512.9788-2-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250808125512.9788-2-jay.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_004751_062864_96ED736D 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, Aug 08, 2025 at 08:53:56PM +0800, Jay Liu wrote:
> Add a compatible string for the GAMMA IP found in the MT8196 SoC.
> Each GAMMA IP of this SoC is fully compatible with the ones found
> in MT8195.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml     | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


