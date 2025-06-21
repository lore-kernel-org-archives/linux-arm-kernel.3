Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFC3C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 09:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+g17Q45t46lMWDa0EnwtjDbw7hWUa/8GbftrsRnbmU=; b=Z3I1xX+oHr7swUtORueP9rVm3S
	gWXcmXz7kdlPwoqd5gN1ONH7YufZpP2Wks5U/dDBE/j1bkL2aBMloeSc0rHLLN8oSUVcRvBE71hZD
	JXaQFewh/qPc34lRvZ8+bilJL0vd9GYmxrb7q9dtzdvjyfMnc1iHmpcnMydXu54ZcmL7DtZou4sNH
	nL7ZjsdbjSCQX1Y89yZrOevTkThQfZCTJEIngM1jg8jV3q/297g9irTHAQtEIsOdMUCAF6srEHB0j
	pAGkzfZczWE3KEGpz2DSdz2aWt8twLp3sHZFPWqRhlVN7X5cnWXBm7qyWh79OnAi140yHYTgqo1Kr
	lw3EBG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSu7x-0000000HHRp-3qbg;
	Sat, 21 Jun 2025 09:03:09 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSu5d-0000000HHLZ-26bt;
	Sat, 21 Jun 2025 09:00:47 +0000
Received: from localhost.localdomain (unknown [116.25.95.207])
	by smtp.qiye.163.com (Hmail) with ESMTP id 19728b98b;
	Sat, 21 Jun 2025 17:00:35 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	ziyao@disroot.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] rockchip: Add GPU support for RK3528
Date: Sat, 21 Jun 2025 17:00:26 +0800
Message-Id: <20250621090026.23293-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <175045054807.1572438.8910024255365917623.b4-ty@sntech.de>
References: <175045054807.1572438.8910024255365917623.b4-ty@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSElOVkNKTxpJQkpCGEMfTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSUtMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUhKVUpLS1VLWQ
	Y+
X-HM-Tid: 0a9791b7dc5703a2kunmb42a6c8b19ec90
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6GCo*HTExMCgBMBU*FysX
	FU0KCQpVSlVKTE5LT0JNT0hNS01IVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCTlVJS0xZV1kIAVlBSkpLQjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_020045_709788_1547748E 
X-CRM114-Status: UNSURE (   5.16  )
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

> Applied, thanks!
>
> [2/3] arm64: dts: rockchip: Add GPU node for RK3528
>       commit: 6b88b8a640fa5d2169e0ce47b88dc30727fc1105
> [3/3] arm64: dts: rockchip: Enable GPU on Radxa E20C
>       commit: 669080eb7f7c4720aa4e640a49f7490cd928cfcc

https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=6b88b8a640fa5d2169e0ce47b88dc30727fc1105

Should the gpu_opp_table node be above the pinctrl node?

Thanks,
Chukun

--
2.25.1


