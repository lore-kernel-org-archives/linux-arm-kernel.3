Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338FBC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fCfbdoy6ZEGciVDF77RYa+y6seojbUyfsqcGl5evE2o=; b=r/6mEBOjTnjaDcEc2xJUWVZkUm
	/STx9SLy/S1YE/IzeL5WUjr/DkxeJw7uRo+qV3+x6skzj1sRLeOqSJCJCVZMdUf2b8w4KnSxOCyCF
	/MZQ5GJXYXfVYy059Y2bylAuFMuqmHDdCvXaHBs4Y6Wt6ZRbDEuvfY6UiXdfJADpetTnTfeUtZAko
	/+V+SK6f/eiTWBA1Sge6bHaY/wGAFgUoEx4LsT69J+gPhRvbiR3dGE+hSJ5/FmdDfMrEc3LD5JcjZ
	I9fZMVyL7A3Upzg+sZpUjevGYubSqdLruTbiPz01kalBsSanIVu+KS1zKkViInobxTkDcLFZEJPXH
	1katXdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tLa-0000000AvbQ-0P5c;
	Thu, 10 Apr 2025 14:57:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4o-0000000AsSY-1yTB;
	Thu, 10 Apr 2025 14:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=fCfbdoy6ZEGciVDF77RYa+y6seojbUyfsqcGl5evE2o=; b=ShOP8Kq1hu2pDIVJUu6NUBjwPa
	jDgzzmMWJwKGXz96lTwvZYgzcPXivmCaxZZiVQoQdWr+fqpvI4vrNGi03fh2NrJg2Sxxxc+10n2uI
	C7ZJM3tbsMm3s8d+zG7q8PsyulvuGGYurm9w17adYng+VLq15yRjHyR2tTW4rFgZZXj2KW4DgtJRe
	Oph9GAy6wlZLbqMbqOv6Wt/QoPt6yxdhkY3DmfeqSQtJZkpXTwizZBCheEuWC7texDgMsKUlf3tN3
	3WvpALqRqxgeb88wCdqslb4zZ86hV4oRubu2BvvPNk4H7TiAAyGAO5+tAyEa3wxP7rN8H2WveHign
	+iKvN12Q==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2t4l-00000008pjF-1QTX;
	Thu, 10 Apr 2025 14:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296012;
	bh=e/RiWFSF94CfhWL3q7b+4O5d2VF8knoYHBRsDZw8pvI=;
	h=From:To:Cc:Subject:Date:From;
	b=njlhpmzNIw2EoQPOS8vpczUtQ4bdploAis8fS6uEURR0yCStRHkBBaS/3H14Ksm+C
	 d6KZW8JY4CoBI0lvXmHGhlG3XOEoEreY7fynavN9dASQlJHqDhth1GaDIVc35irO3b
	 ZDkGAaynOV/dvOh0/j29Q2Ku+1MDNzDlJOHuY4YNk2f4gJDp6WmGgj3zEveWQZJznv
	 KXqIQeH50tEk/ShTUH7t7oJ38KGocIA+GZVRzGxDr6KQAd3lmpjIK+mw+ZpzpXsa5k
	 Q+xFWisMtFw9ilu+IobQ28T3shh80krXnoid4X4sXWwcluGrmtT3jl1OKr1on2l9DT
	 euyEvEq6PrHaQ==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 47C2317E0CA7;
	Thu, 10 Apr 2025 16:40:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add IOMMU support
Date: Thu, 10 Apr 2025 16:40:06 +0200
Message-ID: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_154019_549728_F62B580D 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for the IOMMU found in
the MediaTek Dimensity 1200 (MT6893) SoC.

AngeloGioacchino Del Regno (2):
  dt-bindings: iommu: mediatek: Add binding for MT6893 MM IOMMU
  iommu/mediatek: Add support for Dimensity 1200 MT6893 MM IOMMU

 .../bindings/iommu/mediatek,iommu.yaml        |   4 +
 drivers/iommu/mtk_iommu.c                     |  37 ++-
 .../memory/mediatek,mt6893-memory-port.h      | 288 ++++++++++++++++++
 3 files changed, 318 insertions(+), 11 deletions(-)
 create mode 100644 include/dt-bindings/memory/mediatek,mt6893-memory-port.h

-- 
2.49.0


