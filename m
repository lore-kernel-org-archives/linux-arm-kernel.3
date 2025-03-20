Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055E9C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 03:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ9+sDzOClWAF1ynnj0RCGQtQpyAf9tu87OUxPGxERk=; b=27m3f4bNn1jb6qxM5azVQaCO2g
	ipJ+C4BQCCVso1vpHs/HqSZnpHQxPyaoEDPhhWs4LEfIucernsBh4ZdZCYh2PJae1RtxZxIhBk4wk
	yDLn9PcRnktR4pOy5RuAVMdga3IkIRwVo4sPPBV4gSLhDZBkkaJnOZKUpU0w4jX2ZzAx6bcZ2XnYc
	hhygahkPFTA34TUOers8b0YKIMxbzYdRl40BR07ygqCvU9ftAcN5Qtw5TuRjAlfvpogJt6L/Lepgg
	YAj/gNoIbynh2MLjBZv5x96E2YeBnTgQJ8fFjXRUS1nbuPpdlcmzASrJyrxa6WgQM+H2pAK6ospw5
	YOKvTn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6Fc-0000000AxXa-0klc;
	Thu, 20 Mar 2025 03:07:20 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6Dt-0000000AxNi-2xlZ;
	Thu, 20 Mar 2025 03:05:35 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:27b0:f94a:f4f2:2533:fddf])
	by smtp.qiye.163.com (Hmail) with ESMTP id ee2bc7b4;
	Thu, 20 Mar 2025 11:00:19 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	ziyao@disroot.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Thu, 20 Mar 2025 11:00:15 +0800
Message-Id: <20250320030015.177232-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0d638134-0c0d-4918-af47-e23d2ead3bf3@kwiboo.se>
References: <0d638134-0c0d-4918-af47-e23d2ead3bf3@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUxPVk5KS0sZH01CGBgfH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUlMGUtBHUJPGkEdTx1JQUlOSEhBHR8fHVlXWRYaDx
	IVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1kG
X-HM-Tid: 0a95b17e9c9503a2kunmee2bc7b4
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M006EQw6EzJKKkwQMgpOTwge
	CTAaCwxVSlVKTE9JT0hCTUlLTU1CVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSUwZS0EdQk8aQR1PHUlBSU5ISEEdHx8dWVdZCAFZQUpITEk3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_200533_908001_33582E44 
X-CRM114-Status: UNSURE (   6.11  )
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

> The device tree should describe the hardware, not what the driver
> support, so interrupts should probably be included.

Before I submitted, I noticed these two commits:

1. ARM: dts: rockchip: Drop interrupts property from pwm-rockchip nodes
https://github.com/torvalds/linux/commit/f98643d8daf3443e3b414a82d0cb3d745f8c8bbc

2. arm64: dts: rockchip: Drop interrupts property from rk3328 pwm-rockchip node
https://github.com/torvalds/linux/commit/1bbd894e2ae67faf52632bc9290ff926d9b741ea

So I removed the interrupts to avoid dtbs_check warnings.

Thanks,
Chukun

--
2.25.1


