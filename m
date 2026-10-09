Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AA5CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ua8mDAXrfscE/EjL/F0MkVnSYZJ713l5EfJlskg5QAA=; b=3Oby8cLA42TTSSsyxOTAfxsyMM
	vhVZi5VKk9HFxiqTyw+UTuoZCo5OYFBbUInbyeCJV/ePzNpYdFNTU2rIIBnzTOeGA464DWJDyT+Th
	/45WhmmCVRBClwFdvBRgOwGdx2bV2Qy4WdEIboBLQ7ILKKH7BCACDdq7Ed5Dtdjsk+2EGiYmqwgUd
	WnmpQL3ZI1zNfQtMt2yLIMwYUQVAkrj6ZDGDNBS6Cw2JI0kTAuGA/J/ATeWuAi8nvaUA9Ex8xLLr5
	yhzhL6LdADDtXdYOYm6OrqT80IQymcFwUku3yOJU8DgBGUtl7qD9hhPE/YC8Rf1tl7GV5tVgBzyQi
	aSQxEq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6bb-00000005srx-3onQ;
	Fri, 09 Oct 2026 09:09:31 +0000
Received: from mail-m205210164247.xmail.ntesmail.com ([205.210.164.247])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6bW-00000005srT-3RAD;
	Fri, 09 Oct 2026 09:09:29 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 506fb5534;
	Fri, 9 Oct 2026 17:09:18 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] arm64: dts: rockchip: fix M.2 E-key reset pinctrl on rk3588 rock-5-itx
Date: Fri,  9 Oct 2026 17:09:11 +0800
Message-Id: <1791536951-182440-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0aa11fec8c3003a4kunma31e350ce1869e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGhhKTFYfGRhIH01JHx
	4fHx5WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Xj4T/9qcRZGRI4nUBVaSgggXYZ1Y5+Gk0O6V5mvQd4MbUaeX53izbHO7GxLvZ90BxARHV9VmKZpXqabzwoJbRJWJS9Dz4fi95BIUz91qysb7Br/sRzKZ7zTvdINN3ZdBbtb3gRA670PwatP9+aDzHGsUgo1DNIR6QVm4ZoTNDkM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Ua8mDAXrfscE/EjL/F0MkVnSYZJ713l5EfJlskg5QAA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_020927_512791_9097D3D9 
X-CRM114-Status: GOOD (  10.85  )
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

The pcie2x1l0 (M.2 E-key) reset pinctrl group pcie30x1_0_perstn_m1_l
configured gpio4 RK_PA4, which is the pcie30x1_0_waken_m1 pin, while
the PERST# signal driven by reset-gpios is gpio4 RK_PA5
(pcie30x1_0_perstn_m1). As a result the actual reset pin was never muxed
to GPIO. Use PA5 so the pinctrl group matches reset-gpios.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 33c175b..9d3d26d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -732,7 +732,7 @@
 		};
 
 		pcie30x1_0_perstn_m1_l: pcie30x1-0-perstn-m1-l {
-			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
 		pcie30x1_1_perstn: pcie30x1-1-perstn {
-- 
2.7.4


