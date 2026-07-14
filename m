Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF50C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k61jezHC3k/RbNT9F3tzR3+tjmPaHQC3k1irVJlQASY=; b=w0x521INM15T1R2EQUwOzlcTib
	h94K/0pPIqd3J3hWSkctu1W7KKdYwbKltn3d2J1EIxUx4rhn7TaBND9v2GR6do9Iik8p7BHBAPKlO
	+j+ZR/WaRYbxl90mzsyC85evgjWImSepa90sd4r38z0HZhrNNAenwgDMVOX3AuGXRXMhDmqTLHd+n
	bskUPLLP6UNLTIBeoC9kHZtxo9qVmnsiNLccYI+AUpDTgvMoqIzKE61x5i9rnk7PR3AJtR4tLhaij
	RLFE2db80RfoMjJ+uQE98u0gm+70FiVuwH92rCuK4GJEJGRGdy22FwNoLodIh7okrskZVSzxJBmTc
	mFkLoMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgCv-0000000Cfoc-2LVb;
	Tue, 14 Jul 2026 16:42:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgCu-0000000CfoL-1tbs;
	Tue, 14 Jul 2026 16:42:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA34B405FF;
	Tue, 14 Jul 2026 16:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1ED61F000E9;
	Tue, 14 Jul 2026 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784047327;
	bh=k61jezHC3k/RbNT9F3tzR3+tjmPaHQC3k1irVJlQASY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jz+9CzekUY1eftq3OxsUOGnOISpZqtktT0tAgq7mvu+rrHDWAkEdGbOVs0K8Gg3QC
	 b5aaXIH/ZMAaxTXSgPmRJqRvDW2TKxz1OXFgI66JwZPhI7E4nr+T0JEfJjGiT5P27W
	 nJImc7zIO3QScevDh3Bkkz17U2GppED6C15BmEe325W5AnfsRjWNhz8FlZoH8eFoH8
	 03LENgZV+8yKzGCIQtxrpu+0sH4uPslR8zAbEOOUAW1aDopUrBInyka1ERI8Z621Wk
	 Pi91ocPthGdpsrOaWaL12/IlkoTc6fJOtnfw8o0xojHG/3Jmuv8bCKbkudvZPuJf3U
	 DwGKZI6sr/25Q==
Date: Tue, 14 Jul 2026 22:12:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, neil.armstrong@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	justin.yeh@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 2/2] phy: mediatek: Add support for MT8196 MIPI DSI PHY
Message-ID: <alZm25Ro_WdKigPd@vaman>
References: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
 <20260713103805.23030-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713103805.23030-3-angelogioacchino.delregno@collabora.com>
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

On 13-07-26, 12:38, AngeloGioacchino Del Regno wrote:
> Add support for the MIPI DSI PHY found in the MediaTek MT8196 SoC
> and its variants.
> This PHY has a different register layout and provides support for
> more hardware features compared to the previous generation.
> 
> This initial driver only adds support for basic functionality that
> is necessary to drive MIPI DSI displays as a D-PHY.
> 
> Feature additions like lane-swap, DPHY/CPHY switching, dual-port,
> and others, may be done in the future.

This seems to fail to build

https://patchwork.kernel.org/project/linux-phy/patch/20260713103805.23030-2-angelogioacchino.delregno@collabora.com/

-- 
~Vinod

