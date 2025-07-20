Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65FFC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 13:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUJEWJ/GkcAhiXFrKxdO6cC0Ne9YDbsSUFM5BaDI8lw=; b=4+OjnllSqatU24Sg+B9r9kcA+t
	dn0+ICuOjfFrIQVpvnuBWrjFn8p9YbekTjwxIYOB0sU+c0V8CXms9bfBz3zuUIa/Gg0k99T6kw5YQ
	33qO+M7+n9ZYJzfoXLdWP7bVWHxXuxyVXzU8jGV0WnSQXH2ShRa07UN9IJk5qyuUltdWow8PVgmng
	1OeypF+e6/RyV74SNprpYzCeTvimkoB2giMQcPNVSzAHs6jUC/7NEULie/8+Y/wFO2wbcwhPYrbLR
	xxik37wJPrXYk3rHgJnIBLfobBhqlXT/vpPkAjtBq+T/AuLRo2WcHXpvyL6Q/APws/P5NYAyxdiAA
	kcDbFLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udUJT-0000000FKKM-3x2J;
	Sun, 20 Jul 2025 13:42:47 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udUH0-0000000FK9a-1kjK;
	Sun, 20 Jul 2025 13:40:16 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.214.181])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1c9e8d011;
	Sun, 20 Jul 2025 21:40:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: knaerzche@gmail.com
Cc: amadeus@jmu.edu.cn,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ziyao@disroot.org
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and NanoPi Zero2
Date: Sun, 20 Jul 2025 21:40:05 +0800
Message-Id: <20250720134005.215346-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <86814bf6-5d1b-47f3-ad1d-962cae4a543f@gmail.com>
References: <86814bf6-5d1b-47f3-ad1d-962cae4a543f@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98281039f603a2kunm228903c7f858a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkgaVkpNGU1KQ0pCTBlJTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VKQ0pZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSEJVSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_064014_647296_4B3922A2 
X-CRM114-Status: UNSURE (   6.10  )
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

> Just for the record: There actually is a non-A version of the
> RK3528, which I actually own (but forgot about - perhaps my subconscious
> made me reply to this thread). It's on the Mango Pi M28K board [0][1][2] -
> which, to my knowledge, is one of the first RK3528-based SBCs.

Thanks for sharing this. M28S is an engineering test board, and the official
version was later renamed M28K. The MangoPi M28K board uses the RK3528A SoC.
As for the M28S board, the silkscreen of SoC is indeed RK3528. [1]
But then the interesting thing comes, uboot reports it is RK3528A:

U-Boot 2025.07-rc1-OpenWrt-r30114-9b777547be (Jun 18 2025 - 18:35:23 +0000)

Model: Generic RK3528
SoC:   RK3528A
DRAM:  2 GiB
Core:  130 devices, 20 uclasses, devicetree: separate
MMC:   mmc@ffbf0000: 0, mmc@ffc30000: 1
Loading Environment from nowhere... OK
In:    serial@ff9f0000
Out:   serial@ff9f0000
Err:   serial@ff9f0000
Hit any key to stop autoboot:  0

[1] https://imgur.com/a/ddLsnmt

Thanks,
Chukun

--
2.25.1


