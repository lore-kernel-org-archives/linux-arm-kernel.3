Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2360CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1yabslHl/p/KjKfx04DLZQqkTOuROdPrnClY9mLUWY=; b=MbaeXYnwJDR5O9vtYBQ4OdjfsC
	71jGdu/DY4Ltu3O8eFO159nWcjk+8fvcax9qQc4/bgjELliPdgyc4nKMC83T6pNvz1qVigloRTBpj
	lY03Y7vTOmE9RUKFQHQFf1/EglgrO90GOFZ78uUOeL1rvDqfInYpzTcHQgNmsG0mZhpLoh/ayPoS6
	fmlDD8ta+zPDUg+urRvhQ1GofcXx7qKtCuUycnG4lxmkc5+bP0kasJnadf/nhB74xva5FTuapLYGd
	5irB8lxnAws/eh4WcErkokGh9P+WGuURCcC46qpiS3yoLYRSgkoHNHYdbrGqm4xMFfYWc/rtXdgcn
	mrwqqDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqC8x-0000000BC8U-2Rhc;
	Thu, 06 Mar 2025 14:24:11 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqC5F-0000000BBmY-1eOB;
	Thu, 06 Mar 2025 14:20:23 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d2dccefb;
	Thu, 6 Mar 2025 22:20:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: krzk@kernel.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Thu,  6 Mar 2025 22:20:08 +0800
Message-Id: <20250306142008.389243-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <10115c0f-4a7f-460a-a0bd-0c86d1e7d3b6@kernel.org>
References: <10115c0f-4a7f-460a-a0bd-0c86d1e7d3b6@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTx0dVk5IHhpJGBhDHUoYQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1
	kG
X-HM-Tid: 0a956bd40f2703a2kunmd2dccefb
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mk06NQw4CDJNEDMqDwkDIg0w
	CBcwCQxVSlVKTE9KSUxLQ0pOSExOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUlDTTcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_062021_626008_EAFA2D9D 
X-CRM114-Status: UNSURE (   5.95  )
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

>> Any suggestions would be greatly appreciated.
> Where is the SRAM located? Inside the SoC or is it carved out external
> ROM/RAM?

It is located in the SoC.
"Embedded Memory" Area:
BootROM | PMU_SRAM (8KB) | SYSTEM_SRAM (64KB) | OTP

Thanks,
Chukun

-- 
2.25.1


