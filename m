Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE8CC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8nNEXNt89gTfRfKYpv67NUTrCFA7IFg1npBizlqgCo=; b=2TXx1D19uEljhO7vH8jbwdSQPR
	Gugs/aOsIPrxoDCzhCSbo58BNk9LDS9VmTcAbWIbLlo4RAH7syZBqDDqCNhbTNFRGTupY0EfWzp5l
	6KctfXTv2dGK/xMTi/8oxN9M0cBz7BGylvAjVV0h8PsNt0EWDzyvx9aQEMf3UQGN5435zqUdO5Ckn
	pZXI26nzzRrHO9tItZG0DmaJGEJwT1YD357KL39CtKejdTNZuhsU4qhuiWQXZxGgsGbgjW6kcbz7M
	iibDfiwsPAlJrpaBW5pdsjWJzRVkeK6X++YKB0Z9rWQB7sPO1Jy2CPZcS/1hYxyCBtG8UKwjUhLEn
	+g3PmsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Jc-0000000Ad6z-3ORd;
	Thu, 06 Mar 2025 10:18:56 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq77Q-0000000AQR1-3rMG;
	Thu, 06 Mar 2025 09:02:18 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d2603c59;
	Thu, 6 Mar 2025 17:02:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 0/3] rockchip: Add support for onboard eMMC on Radxa E20C
Date: Thu,  6 Mar 2025 17:00:01 +0800
Message-Id: <20250306090001.113127-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305214108.1327208-1-jonas@kwiboo.se>
References: <20250305214108.1327208-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHR5PVkJOQktIQ0gdTE1MGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a956ab0e16203a2kunmd2603c59
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDo6Dww5SjJKIjwxDjgIPkIR
	AS8wFENVSlVKTE9KSU5KTEhJQkxOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUhISTcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_010217_145922_83180BCF 
X-CRM114-Status: UNSURE (   4.94  )
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

> Driver changes to use different delay and tap num is needed to be able
> to support HS400 modes, something for a future series. With this HS200
> mode should work:

I have tried HS200 mode on other rk3528 boards and it works fine,
so can we enable HS200 mode for Radxa E20C first?

Thanks,
Chukun

-- 
2.25.1


