Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5B3C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fMm2rGK/+C5xP8C/FNC0iZ9tGfXJP8wiOQAxrzaZ3I=; b=s6rI1BKQgNfYilC9EzIeK1HOFA
	N4BmYv46nl+k0kNwCmgpBPpafE+S8L7PV24vQ8PjFf0P5chxy4TCpBtSYrIOZjRPiPh/aY17mjjTy
	I+e0Zs0qyLwiJqs/bs2IOhrtLIVaUoIPu1z5EP0mD+9Z9EGlu1IHrvReje8VkRDcBCKbplNuUZh0J
	FsCHi5o2SACp15eVot9MNGO18ivoMGbLRgvv1BX9BccNU1KOIvhAaZQ4CdmvaCAxIFv+2OqXu9S1Q
	ewFEI+v3BnWaqsDeZ9W+q3Q1T1Gw7MIqyg55dZfHVQoREn+musf3OqqMbFFcWIMsGCNooRNlVveiG
	HMOpqIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cv7-0000000ECP4-0Xto;
	Thu, 10 Sep 2026 11:26:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cv5-0000000ECOU-1W4h;
	Thu, 10 Sep 2026 11:26:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0735600C8;
	Thu, 10 Sep 2026 11:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2633C1F000FF;
	Thu, 10 Sep 2026 11:26:14 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-tegra@vger.kernel.org
In-Reply-To: <20260810124315.433448-1-vladimir.oltean@nxp.com>
References: <20260810124315.433448-1-vladimir.oltean@nxp.com>
Subject: Re: [PATCH v9 0/3] PCI prerequisites for PHY consumer/provider
 split
Message-Id: <178903957471.12380.4841684625788511364.b4-ty@b4>
Date: Thu, 10 Sep 2026 13:26:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Mon, 10 Aug 2026 15:43:12 +0300, Vladimir Oltean wrote:
> "[PATCH v8 phy-next 00/31] Split Generic PHY consumer and provider API"
> https://lore.kernel.org/linux-phy/20260505100523.1922388-1-vladimir.oltean@nxp.com/
> became unmanageably large for a single patch series and needs to be
> split per subsystem.
> 
> Here are the patches pertaining to PCI extracted out of the larger
> series.
> 
> [...]

Applied, thanks!

[1/3] PCI: cadence: Preserve all error codes in cdns_plat_pcie_probe()
      commit: da0cec0d8f08bf419aa76bce49a69c10c31ac4a9
[2/3] PCI: Add missing headers transitively included by <linux/phy/phy.h>
      commit: 81ace3d75c2fca477e95035c99d826efafb2ad9f
[3/3] PCI: Remove device links to PHY
      commit: 9a9d18547ddc97a73d5d90cff4d5aef90bd8c15d

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



