Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42359C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHqpWAShTGw0CBIGY4OTCZoZs2U3Gv9S6HeoH1CtmfE=; b=m9xD6/CeYYMkjnUxVFMKKkns4e
	FVnM/PM+gL1UNtkntd8f5IK/jE4n66b5m5prD7/OFjzqcR/bx1oTO+vSW68XbpVbfyB6Q1QWGsWY0
	7ZnZWWQjVsPK072BjVs+gsw7TtXFD3YKYEX063+9CM5FUn0BLlrGmFjhcEiEwseXlAdL4vDXxWubU
	9RndUr44rGVd9xewP3rvQrdWAoauLIC/qbJ7luTtsnHq3Dswq4sfPIQd8GvmLkd9wXQTU35HVOMXO
	sfPQWp0R3VlA/Tj/9suF7aULOC7dmm8VWsh9IUqQ45BJ8MC4z9C2d9vdvBa1PBSG/PtmCbtXEwvMy
	IRjSM76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJOf-00000004oqc-3i4N;
	Thu, 02 Jul 2026 15:32:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJOf-00000004opw-0XsC;
	Thu, 02 Jul 2026 15:32:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F448601EC;
	Thu,  2 Jul 2026 15:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8741F00A3E;
	Thu,  2 Jul 2026 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006332;
	bh=lHqpWAShTGw0CBIGY4OTCZoZs2U3Gv9S6HeoH1CtmfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h6+YRcEkDn01G0p4rOMjNZFGHjcAINtexYDwZ0siYrekxWvmW38iZUpWCVyYUvwAD
	 Hi4W+jLzpb/jxSMqP9faj1i1wuaDFIKNvMa5+1Yx3I5vzkGGWBb28o74N9r6Dn9Z/i
	 cgQKCV0UrqdJ8HVu35GdfZYcSY5ahlBs1+FlZ/Yf2xiJrMssyV42scsjajrtPFz0Rf
	 KUdhwtQZZhPzTvoyyhZQ/2u9A/upgPtcF5PV2bw9iJ8ugjaS5pXwaIYHdtj9B30jGM
	 +CaBtLeFtnz+vvtaJlxtNeyZK3sbFnVY1oQTEFA/sUv9Gm3nzIOAOR1/ZC1b/HQBoO
	 5MZ4CN/mXFrkw==
From: Vinod Koul <vkoul@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
References: <20260701-mt8189-dt-bindings-uart-dma-v1-1-c7106216a40d@collabora.com>
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add support for
 MT8189 SoC
Message-Id: <178300632766.735405.17747916047775158971.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:02:07 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 01 Jul 2026 17:47:20 +0200, Louis-Alexis Eyraud wrote:
> Add the compatible string for the APDMA IP found in MT8189 SoC,
> that supports 35-bits addressing as MT6985 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: mediatek,uart-dma: add support for MT8189 SoC
      commit: 0d2b094b1c10be619a63f53a610587bcabbee06b

Best regards,
-- 
~Vinod



