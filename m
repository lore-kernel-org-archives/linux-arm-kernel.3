Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8B4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTfykZRYKWCz+kFmLxAvrNmXZrVdxMYz1MqpTxsWk48=; b=IcmgZZoBlEQTcx/fGBjIjWcSFq
	wUrZTgAXSepFxgjLrPdifBuKCsll06oBYQ+/l++fLWik5qJx0UbN3K8NTMPzCU+sQ/acXaa0Yd+fy
	7lP1LtREi8/0OK+22UzkFtbJzew8fNe9FqHqnVeU4JnwX+PO4A0LbfA5DOH8gBs7MgkV2X5Tit9Or
	STesRPU9FVmzLB4aoipBgOk4TZsUAU6PFwOSsnG7yvxbf666WZqP+hP5BfBbiGmkLHI2GlRuMQpd3
	hZt9bmo/yuFly1N2E9juM/1uZW5Sh4DXWu2bZL4JuF6+3BwhlpPNebDmIXL2pQ6NhuyPvmQmfvwAa
	AKGe6iYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDhX-0000000BPiQ-0bLH;
	Thu, 06 Mar 2025 16:03:59 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCYR-0000000BFPK-16Ag;
	Thu, 06 Mar 2025 14:50:33 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d2dcd0ed;
	Thu, 6 Mar 2025 22:50:27 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Thu,  6 Mar 2025 22:50:20 +0800
Message-Id: <20250306145020.485848-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <24848438.6Emhk5qWAg@diego>
References: <24848438.6Emhk5qWAg@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHxpIVk0aT0MfT0oZT0JIGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1
	kG
X-HM-Tid: 0a956befb78e03a2kunmd2dcd0ed
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OAg6Pzo5HjIDLjNOTAlJITAW
	TBlPCj1VSlVKTE9KSUxJTUlMQ0lDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQU1CQjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_065031_470279_E82EE7F8 
X-CRM114-Status: UNSURE (   6.06  )
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

> are you really sure about that?
>
> Looking at Jonas' recent rk3528 u-boot series [0]
> 0x0 _to_ 0xfc000000 is the SDRAM memory area
> so 0x10f000 is a carveout of the main sdram.

Sorry, I was misled by the dtsi of rk3568.
Put it in reserved-memory works on rk3528:

~# dmesg | grep scmi
[    0.061452] scmi_core: SCMI protocol bus registered
[    0.125903] scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
[    0.126763] arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
[    0.127368] arm-scmi firmware:scmi: SCMI Protocol v2.0 'rockchip:' Firmware version 0x0

Should we change this for rk3568 as well?

Thanks,
Chukun

-- 
2.25.1


