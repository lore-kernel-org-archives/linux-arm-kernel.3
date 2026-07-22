Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8599C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nrjiIeKKD8Gx6LukkoYpq5DLz0jKwg7ibNVwWPKONQ=; b=xx1QA+reIBbhiDvs0eoCK6ArW1
	5zbUG9O6/TARacxJf5ib+Q3PlZR90+jaBissacp9OLWswyDuO7JgNCqpRkx5dDjNmpF9hH6tRUyYx
	QXl8Y2p+HQ/t4/j11Gg3aswnFzt+k9dp/WHnUXnQozY5kHGxhOl5T1Slf6udwko2hwhqKo3iIntT5
	6rBWJ5wz605KQ71wo1Fa7F5dVoTPBT98VXhKGTo47kq6IqWSVC1bBdQB6IB1ztXysR2rsEs72RQOd
	/dSYYAkN2t+gLyrkSTM9UFafc2iWMkGG6vGiebC09yHH3m2zKmhg1XN2iCOQMIjnX3uYamj6AVNsv
	uSj5gPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ9t-0000000CEs1-3HZp;
	Wed, 22 Jul 2026 15:46:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZ9i-0000000CEm1-32qA;
	Wed, 22 Jul 2026 15:46:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E8774600E1;
	Wed, 22 Jul 2026 15:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6441F000E9;
	Wed, 22 Jul 2026 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735205;
	bh=9nrjiIeKKD8Gx6LukkoYpq5DLz0jKwg7ibNVwWPKONQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MMd3LIqcR9eZc08C538x3+vfewjPoQD2Qh9Ks9jWUsdIvoSkXiEcgeMbCrm/mLL6g
	 /y3tFXjyeKsvNh2+/M3r3v/npHcsMw9iPfoz+dCINnf7WMY+/vX8DvSybuwgsAMMdW
	 MiDTAb4BjGFMEhzWFt1Kcp5JIKiX6tK3fliwydFMNWnbIQzdbzf+e6gDyZNFa+FA1A
	 f/f3rbl+kC7LPbxlP4IYTL5jjZR0nVrY6C/W/lwkUSsQFL+3OsQ57+zh1Yvgypwn+Y
	 dbDsxYRO+GW7+iDKSbGMuB9OqEreq1tVARDyVOVhFrPO5H1FrIv+1cSES4tguFhBAk
	 DAiebRoRyc+Sg==
Date: Wed, 22 Jul 2026 10:46:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, simona@ffwll.ch, jason-jh.lin@mediatek.com,
	linux-arm-kernel@lists.infradead.org, airlied@gmail.com,
	kernel@collabora.com, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, mripard@kernel.org,
	dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	justin.yeh@mediatek.com, tzimmermann@suse.de,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 12/46] dt-bindings: soc: mediatek: mutex: Allow
 #trigger-source-cells
Message-ID: <178473520265.995028.6530833938909188983.robh@kernel.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>
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


On Tue, 14 Jul 2026 13:43:40 +0200, AngeloGioacchino Del Regno wrote:
> This hardware controls trigger sources, and there's even a generic
> binding just for that: allow #trigger-source-cells in MuteX, so
> that this is allowed to provide triggers to external HW.
> 
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


