Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AC6CFD62A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybZzrBFEg2MshHiemxOnuaZSjBO/uei+ZdjkQT+qLRs=; b=hyVME9nmeI4Qh//AH0tuanCuKF
	goXbFGYxHLV412EbU/MV9SXdkmK80Hr0LHT5d532sF3S5WFYcR99QVtN9IIOrSirUEBkviXeP9fnN
	sqbb3xCtlVutzVshrTZumxqOwjaL8CTPhHNSjZZAs1NveFou7anzc9FnC7e45IHrffqAt1LHUJ9d5
	qxhPJFEKCuwKRDBjadq/XAxOJinUhfJtqSW8j4diBCRSrTbyDRfnz9i0J9HmbBQL7bWxThojaRz3Z
	GqbvQ6e2r9xhRfIFHvZDi4JY+NkkW5IERcfZ88xvErW2x8bO3a4mUkDBSovGRh/fLGOiofd175q8g
	wWK1GWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTSm-0000000Ezfp-0s7h;
	Wed, 07 Jan 2026 13:20:36 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTSj-0000000Ezf6-1PiQ;
	Wed, 07 Jan 2026 13:20:35 +0000
Received: from localhost.localdomain (unknown [116.25.95.147])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fd482091;
	Wed, 7 Jan 2026 21:20:18 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: Enable PCIe for ArmSoM Sige1
Date: Wed,  7 Jan 2026 21:20:09 +0800
Message-Id: <20260107132009.123287-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1c5005b7-ceb9-4915-ad58-a9aa86cce394@kwiboo.se>
References: <1c5005b7-ceb9-4915-ad58-a9aa86cce394@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b989d848603a2kunmc5e16d964410
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDShpIVhlMGR5PHUIaS0tIHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSk9MWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_052033_621896_EAB42BD3 
X-CRM114-Status: UNSURE (   5.32  )
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

> This matches what I currently have in my pending to do final test and
> then sent out branch at [1], so this is:

> [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20251219-rk3528/

Thanks for sharing. Do you have time to submit the USB support
patches for RK3528?

Thanks,
Chukun

