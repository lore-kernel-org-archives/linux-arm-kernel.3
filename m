Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB93D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnX7suPMOHZ4sA2weyZU5deC0NdJjWeH3iIjEczM+F8=; b=wmAeuthV9F8JuAKfq6bSfXmwYy
	sLGmV5PQgMOxSZhivm1pSnvwVq2a7vHvlb816ZAnTPN4MM2lcsh/gBKqpDX2y1HX6RytqNr7aEiuv
	2dxuAdErc30kWQKfEITBdDoA7l/pmyYsHWdyUNPnKqC24hM9MuBCKkHTunkaSZUi5zWKJzl+zDASZ
	D4bNRKVnAU/PqBbZkeQ+9qUwW+H+GU5QDTLhERuzoXw/SK63QpRUuqBcp2+b6bRZjv8O3ISNLfSIB
	yI6I/zTzuWFHBx3NgmQKFDEFaKCT2cv8kQTPpiSK6btlto+3UvLVrioSAR2EXH3O4ySFKwemxUAQy
	M6q1nEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ40l-00000003ygV-3mBd;
	Mon, 01 Dec 2025 13:32:15 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Wt-00000003cDy-0KjE;
	Mon, 01 Dec 2025 13:01:26 +0000
Received: from localhost.localdomain (unknown [119.122.215.79])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b8a20103;
	Mon, 1 Dec 2025 21:01:13 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: krzk@kernel.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: rockchip: Add HINLINK H28K
Date: Mon,  1 Dec 2025 21:01:06 +0800
Message-Id: <20251201130106.236903-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f27dc5ef-1c60-4724-8e18-33bbc4230d3e@kernel.org>
References: <f27dc5ef-1c60-4724-8e18-33bbc4230d3e@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ada00be9203a2kunm2a36c62d3110
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCT00YVk1DTksZQkhKTU5PGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVMQllXWRYaDxIVHRRZQVlPS0hVSktJQk1LSlVKS0tVS1
	kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_050123_284425_3366330B 
X-CRM114-Status: UNSURE (   4.35  )
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

Hi,

> Just squash these two binding patches. Way too much churn.

However, they are different SBCs manufactured by different companies:

HINLINK H28K - Shenzhen HINLINK manufactures
MangoPi M28K - Beijing Widora manufactures

So should I squash them into a patch?

> Anyway, looks like duplicate - two devices with same model name.

These two SBCs are indeed very similar, both in name and configuration.
So I put them in one series. Perhaps splitting them into two series to
avoid confusion would have been better?

> You have entire commit msg to explain that.

Thanks,
Chukun

