Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A913C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 07:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i85AmHmB6Aj/vkeWUd+2nOH9uaob63d0YwFApO+uWhk=; b=L7cPZ8vkWaXW3H36OEU+pQ4wMz
	yUCxGRdOBv8lb/3N/mnHNGiLLrXtq+cD9vcDTQZUPojagQ4GVkKiFo/ftoMguwJqKMVtKEMrsso4h
	gG6jw7MR89mQrpOJpGKO+Dt1vnLqLD+XY6+jyV2cvUJEkITA2zbOGhJj3x4IylVcHtKEClpoP7uAf
	oJ8JqEvYxk9iQftEpCZqLxd7LtGMAat5LH2TTwmSDc/CxuHc1c40L7qvo9eLp7w02NMkFD46p6Mj9
	9mzub5ID8hNjVyQphwj1uPC0RwRPIgqXKC5vnHdxxKXoEeITAf6qhMUe+LA0QQCYUsUCRv6Hhe/r0
	pIsfgjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsd2b-0000000ANzc-3pR0;
	Thu, 13 Mar 2025 07:31:41 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsciK-0000000AJul-0tlR;
	Thu, 13 Mar 2025 07:10:46 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id e22876d9;
	Thu, 13 Mar 2025 15:10:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Thu, 13 Mar 2025 15:10:31 +0800
Message-Id: <20250313071031.1840032-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7779050.EvYhyI6sBW@phil>
References: <7779050.EvYhyI6sBW@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHk4dVk1ISUhOTx9PSx0fH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a958e573b6203a2kunme22876d9
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBw6Cio*IjJDOhABOiIPMxw3
	QhFPCgFVSlVKTE9KQ09CQ0hMSUNJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQU9KTzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_001044_439872_8B018856 
X-CRM114-Status: UNSURE (   6.61  )
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

> so yes of course the pinctrl needs to be default - simply because
> that's the only pinctrl state mainline supports.

> But judging by the fact that you're discussing working vs. non-working
> below, can you please check if we should drop the patch for 6.15 till
> that is solved?

I suggest dropping this patch first, I will send v2
when this issue is solved.

Thanks,
Chukun

--
2.25.1


