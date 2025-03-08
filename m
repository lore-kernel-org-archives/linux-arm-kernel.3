Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A8CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 10:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EX9Mtx9+vv7teVwW8zrs3gnHmO8OzrBMs7Vav5t1a7Y=; b=NYIz6Bse2wJOw0ZI2xdYZm2npG
	Ph3LM2vf50qsf35n7dxzXIM0MvcXYYtI+K3/wss5hF1g40hDDpUl8fCKk9+VZrpfoHQwvo2u9nMsZ
	OjfEpnsLd6Y7CaUzxNKBf9ND6EpLHePqfdiXmk9mQQpvcP6gUf81CvjuhLx/zuI7nHHbPZlIrNbwC
	4CRMlcm7ZPwz7nFwCGSXfl28VlA+8JXInP7oRLyqLM28A9sHAU9TkgTn4nHri9jsD/JYojoQ/CjId
	q5rga8ygI1HpEpKZdQF4vU2y0xwDVttKBLhcvJy59leWkZ+q1jWCxs7r0atKr/k7UqW/k+R7utiDD
	glL15hWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqr0C-0000000GTCs-1SK0;
	Sat, 08 Mar 2025 10:01:52 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqyW-0000000GSzi-2kkA;
	Sat, 08 Mar 2025 10:00:10 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:3300:217:f42e:f419:35e])
	by smtp.qiye.163.com (Hmail) with ESMTP id d8ad0330;
	Sat, 8 Mar 2025 18:00:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 0/1] arm64: dts: rockchip: rk356x: Move SHMEM memory to reserved memory
Date: Sat,  8 Mar 2025 18:00:00 +0800
Message-Id: <20250308100001.572657-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTU9OVkpNT0lNGUweSENKQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUhIS0tBSUpMQR1PSR5BHU9KQkFITh5ZV1kWGg8SFR
	0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0tZBg++
X-HM-Tid: 0a9575329a9c03a2kunmd8ad0330
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pk06ESo4HzJNMik5FjVCDyIB
	TE0wCThVSlVKTE9KT0lDS0tNSENIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSEhLS0FJSkxBHU9JHkEdT0pCQUhOHllXWQgBWUFNQkM3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_020008_859234_497A5BA8 
X-CRM114-Status: UNSURE (   3.87  )
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

Inspired by recent rk3528 thread:
https://lore.kernel.org/lkml/20250306131016.281290-1-amadeus@jmu.edu.cn/

Nothing seems wrong:
/# dmesg | grep scmi
[    0.086456] scmi_core: SCMI protocol bus registered
[    1.519045] scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
[    1.520074] arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
[    1.520772] arm-scmi firmware:scmi: SCMI Protocol v2.0 'rockchip:' Firmware version 0x0

Chukun Pan (1):
  arm64: dts: rockchip: rk356x: Move SHMEM memory to reserved memory

 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

-- 
2.25.1


