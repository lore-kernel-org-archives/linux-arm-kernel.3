Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40421C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fXvxDJEFvzdQBEa8XWmhivEV0NeD3sQpCzWoKwKVvw=; b=DZPQnqDTn+Jg8vovfJ3B8vrs4A
	VurJHD30BkeQN+U4RR09Ei1hkkFhkfoGXYlZ7SK66ELvKxEf6MHxFBCrPHl1FFx/O+hMhDxOb1sUa
	Pem98I5DVG9Y19FW0a33r+ko4YP1/f3M9RwVKrnSZPm9m0ir1kLLeyKyoc+NnvFCONjsJTZrR7tsg
	KQ6ovQ8MtBSuIuMspq+oGdduc//gBxawKHuuoaacQYYv7xohsckfxOdSYMo1hHpuPOK3RHSYJjOBq
	DZ9YTAtmkxReRLGURPjgt0RLLPsKwULp9lvpocImMvrZT7RNKT9wg9E+rVGRxBiF0m0CBwpnCUByI
	KUmzrKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Rfs-0000000DbP3-3SF9;
	Thu, 17 Apr 2025 16:01:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5R12-0000000DTdU-2mvU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 15:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99430A4B487;
	Thu, 17 Apr 2025 15:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C879C4CEED;
	Thu, 17 Apr 2025 15:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744903139;
	bh=EDgRhn4uq3BXCb/NPNsZh7wuapV4L3ZwX8ojwWpuUh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CU3zRACL4lCZJBMj3+cSxxFkoKz71ExLVlHPocIHlYJ8LjaywWRloGw2GvF9PQsmW
	 LXBM4i11AHkMAx9MK8MnR+YYv8H+vZgeu0b/LKWi4xvEYhPxN1JFP/oAe7MkWnRVSo
	 xjcWZ9R5k2cCRO4++3CPs6dloe4SsqSQvxKSEuywErao23E3XVOtXfOEXbXw6HADsA
	 4byJ/G9xSvUCc/uKR9QxKtmo8OcAks68iWJiRKR8c1pfifzxvcxyl++yVSDOb3FDcZ
	 YcSkFSFLgmmohHUMHEtucF/Qr1WQRmykWB+bOdqSIEjTQ/U3x6znqQo7LxrIy+K+/L
	 0CfmQ9ocFa7Ig==
From: Vinod Koul <vkoul@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <cover.1741780808.git.robin.murphy@arm.com>
References: <cover.1741780808.git.robin.murphy@arm.com>
Subject: Re: [PATCH v2 0/2] dmaengine: Add Arm DMA-350 driver
Message-Id: <174490313819.238725.2166558038975296351.b4-ty@kernel.org>
Date: Thu, 17 Apr 2025 20:48:58 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_081900_770232_ABA64C75 
X-CRM114-Status: UNSURE (   6.65  )
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


On Wed, 12 Mar 2025 12:05:08 +0000, Robin Murphy wrote:
> v1: https://lore.kernel.org/dmaengine/cover.1740762136.git.robin.murphy@arm.com/
> 
> Just a few minor tweaks for the issues flagged on v1.
> 
> Robin Murphy (2):
>   dt-bindings: dma: Add Arm DMA-350
>   dmaengine: Add Arm DMA-350 driver
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: dma: Add Arm DMA-350
      commit: c4771efa841666f5a202d1d651e2f0fcb315ee7e
[2/2] dmaengine: Add Arm DMA-350 driver
      commit: 5d099706449d54b4693a1c6bb7c2251072234508

Best regards,
-- 
~Vinod



