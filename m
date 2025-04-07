Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B781C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrhZLC/gWu44yM/JXNBUfkny0yyqCUz+uaOnp1SH628=; b=AMa+abKVbBLylCoYd7jQjc3qb2
	nzIgVg2KPmXEUVRLpLAKq6Up5WOTHUZw6GyFpoMDZbWq0ZQ7N5/daTgTh33v9hEHxHYE6qMBmVAnM
	xlAYVGSFUik7KYozPZvCPySkFOD2hKyO/mZj8x81dd3tRvviNd+N0vsufEbqK9OjAubtIjrZx1AtV
	KsCbCugNeiudoR891JbPfXLcB2m9eEd9HhlJRoZ5rn2kvkP8FDMZ7ZxiSp0nBDMiG69PdHw7GUKO1
	m8tBL67Y/LjeTVW5WRbYqfNTrYbyUQz2OOA/bMg3Y/KRw3dFFItES8ItdC2YDl4P/z4OewnyK4HYz
	r6uReDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gyV-0000000Gn6o-1iA6;
	Mon, 07 Apr 2025 07:32:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gk5-0000000GiSX-10xr;
	Mon, 07 Apr 2025 07:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XrhZLC/gWu44yM/JXNBUfkny0yyqCUz+uaOnp1SH628=; b=CCWFB7TyuHv14vo2yVNtr3NiM3
	l98FtBjdbLBhuyZw1d3gP1gS8Zj7wCAjJrtvIIkjbT+007HCeyhN0EOkX/syQwlDcNqRODgJDlupN
	HiNWcySXh0JgaNhIMyUVMaITuZ7IWDcd1HYI7M9qunRlr2P+uZ/Y+HUL9kGx4gsgL/SA4RqJLyc91
	K5GpqnBDBqXPyvVrKJDnzG3uIUNZTw9t4Kwg64Doj3w7bZ4etbeQAgnpONfh3938Ef2PaVdzSCB33
	r0+UB7bStGsG5EY+ZIpiYfA4c/klYaP3lPHfZiHJR3L8LL9x+1X47PYGjv5al8YEPi45tI9vmLhAf
	KDXi6FkA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gju-0000tP-Jw; Mon, 07 Apr 2025 09:17:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dsimic@manjaro.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	krzk+dt@kernel.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: aliase sdhci as mmc0 for rk3566 box demo
Date: Mon,  7 Apr 2025 09:17:38 +0200
Message-ID: <174401024398.372530.4282077768159194558.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241221104920.4193034-1-andyshrk@163.com>
References: <20241221104920.4193034-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001801_274480_F6284BA1 
X-CRM114-Status: UNSURE (   8.98  )
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


On Sat, 21 Dec 2024 18:49:07 +0800, Andy Yan wrote:
> Follow most others rk356x based boards, and u-boot only use mmc0/1
> as mmc boot targets, so aliase sdhci as mmc0.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: aliase sdhci as mmc0 for rk3566 box demo
      commit: b6490faab67c4436abeddb5c9e1fb0e8791d58ad

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

