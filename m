Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACB6C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aMOEOID1nVJmQTMWEWGhWEo81U6EqpDWO10QcFFop8=; b=X3+j+AOEZtmKMyFUmFDeTxn7pl
	s9qIeoZ2czolQcLt7hl65NbLrDN+DxpwvqRcDhCnOc1CeSg+WL3y331+Q6ae69WI52JukiRBT2hQe
	p99Gp/7zrhtAtq4FwqlSYSfJ5729+D6occvcpUyr1U6kQkoVMfsBhob5YfKJyu7QYndDPFF9WYgO9
	QIp/5/YNcYbMj9g8pfV4W2Ctg2AgrWeKvgLsZVCLLSFc9e3UAOtQzlotEcmw904vVC2miRu+51l5N
	KBSOIGbGfmSbqfGWaU5ORD4O6wRb34ypz5annGVPvG2AaUHNC1fBJwVThxwDVrvxesysuEKcdgPkK
	RXlE9Gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma2Z-0000000CNWS-0jDV;
	Wed, 22 Jul 2026 16:43:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma2Y-0000000CNWH-10iL;
	Wed, 22 Jul 2026 16:43:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 76FF243663;
	Wed, 22 Jul 2026 16:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121911F00AC4;
	Wed, 22 Jul 2026 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738604;
	bh=8aMOEOID1nVJmQTMWEWGhWEo81U6EqpDWO10QcFFop8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fvdCMcy5Ax9f9FsCqLCyZ+iwhGRK+YlNOOGucF3bY7sIcPYqI8OV9KuWOu7NfRSHj
	 MlHs80/qtveei07DRKu3WLrck3tzQtFIegj/rQskYu6JzL6o5y5EH3HsaDwZ/wwWXa
	 xTyQtbP8yVE77AuFwvo+6t1yxynw/bHj6yjQ5ujjhugghYWk77Y8tHvcVhU18W4ybU
	 UgP36+7l3BWh1dpjPvmDSfT4qz8kFCtv+HvpYEDDrmyYlo3nT/2xMZoWI7bVKEJ6A5
	 0AqvO9DpDKHx313ywyK2BxbUs58RkPFsby77DGwgXM9mhpIP/bCnTINENaqVRzcE9S
	 dfpW+48VNKZ+w==
Date: Wed, 22 Jul 2026 11:43:22 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH v2 32/46] dt-bindings: display: mediatek: Introduce
 MT8196 extended DMA Engine
Message-ID: <20260722164322.GA1078187-robh@kernel.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-33-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714114414.184512-33-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 14, 2026 at 01:44:00PM +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the extended DMA Engine (exDMA) IP found in
> the newer generation SoCs like MT8196, MT8894, MT6991, and their
> variants.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8196-exdma.yaml       | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-exdma.yaml

Same comments in this one.

