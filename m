Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA30C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fPHYSPWlpVGJCK9eX/ujdFr83qCBTf/PIroRGp2Nmo=; b=GruDDoUUUAJB0xkWmygsymm0mg
	cf/nBhZruFMhbL6ne7U4529K/9kTDSC/Hsbc/pq0T7op1ZMbB9hoZk6F+1p0KS2t8JFEXE9/mKvgT
	RhxMGUCc4U9yhFA3XNQ5Yfdql9IpZ4jJzRf3wm2mehhj+jYivGSOhq7Iomgbi5cRdT+0EpvEPaDCy
	Myv7zCy0Xsqb77+TqL4KVmaSkfpos1K9zBemGOi3YmMb+WtUzfrzqvjAEURytAvCgtjw8X1YG7ZY6
	HjLk1klVaZXyahhUrUP2dRWUxp+g/Os4EMf0DnZ7YxHX2ziuUGb3lqR6cRE1FQTtwzAKHgjSGr+e3
	cIhvorDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrxx-0000000H30g-3Bkq;
	Mon, 03 Aug 2026 12:40:25 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrxt-0000000H2xv-07u8;
	Mon, 03 Aug 2026 12:40:24 +0000
Received: from Vostro-3710.. (unknown [14.220.232.116])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4895a4bee;
	Mon, 3 Aug 2026 20:40:09 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: zyheihei_123@163.com
Cc: amadeus@jmu.edu.cn,
	andrew@lunn.ch,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [RFC PATCH] arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing
Date: Mon,  3 Aug 2026 20:40:00 +0800
Message-Id: <20260803124000.840861-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803104646.26836-1-zyheihei_123@163.com>
References: <20260803104646.26836-1-zyheihei_123@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fc7a3819d03a2kunm7af09f8f2859a5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTE1CVkhLHkxLQkJOGklIH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpKTVlXWRYaDxIVHRRZQVlPS0hVSktIS0
	pMS1VKS0tVS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_054021_254252_997C4EDA 
X-CRM114-Status: UNSURE (   5.79  )
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

> Release the reset from the MAC node via snps,reset-gpios so it is
> deasserted before MDIO scanning, and drop the PHY-node reset-gpios (a
> second consumer on the same GPIO is rejected with -EBUSY).

This is incorrect. Has your uboot's DT been synchronized with the kernel?
Normally, U-Boot will reset this GPIO. Another way to solve your problem
is to hardcode the PHY ID here. However, considering that manufacturers
might use either RTL8211F or YT8531, it's best to let U-Boot handle it.

For reference: https://github.com/openwrt/openwrt/commit/384127320e0b

By the way, you sent this patch twice within two hours...

