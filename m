Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C2EC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ybtWCN4bHcp3ymugBJZcuXxcdz/uGlu+039Ng/EQtU=; b=QBHhgeBIFJPeCzaKq5+SuKodgT
	1Yqa0RZSKrB20+RqhZ4jUP+vBrIBQcBHC5RVWcGvDVndG6wtFaK7JDKLdNrj24A0CtFjoNDY4pN6B
	rICeVCe9+F92KBHa6ojGoq54Q95/6nicwYASf1Ip0af8IgPYohzvHDP1ClRsXwdG+fe1+vE+TB6KR
	HxMv+dISDMxsjc1pRWsVWukwRY3j/+MGRr0G5KnU3PtkMgwW4rpVyXlUOJM/zPFcws3h6qa11qQsQ
	KdM1cNZTvrF/NvLY2X1Ibzz2mRCyXAtGUyE7Beo9sbI2MPxc6Wm98kQED91FRL6JPAn1EzlJ3tpb1
	4tsYQD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq4f0-0000000E1b0-2TPA;
	Sat, 01 Aug 2026 08:01:34 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq4eu-0000000E1YY-1XnN;
	Sat, 01 Aug 2026 08:01:32 +0000
Received: from Vostro-3710.. (unknown [14.220.232.116])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4866afe8d;
	Sat, 1 Aug 2026 16:01:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add MangoPi M28K
Date: Sat,  1 Aug 2026 16:00:16 +0800
Message-Id: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fbc575e8f03a2kunmbde8614f2070e1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkxJVhoZSEkYHxoYTR5PHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpKTVlXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_010128_590686_C263140E 
X-CRM114-Status: UNSURE (   7.40  )
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

Information about the MangoPi M28K is here: https://widora.cn/m28k

MangoPi also has a version called "M28K Pro", which replaces the
RTL8111H with the RTL8125B.

Changes in v2:
- Add USB 2.0 support
- Remove merged patch

Chukun Pan (2):
  dt-bindings: arm: rockchip: Add MangoPi M28K
  arm64: dts: rockchip: Add MangoPi M28K

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3528-mangopi-m28k.dts | 412 ++++++++++++++++++
 3 files changed, 418 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dts

-- 
2.34.1


