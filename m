Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0463DD6CFB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5lFISpxQM5gBS3PHpmmitP2PZhVuWO2MnJkkarX19I=; b=TUESZWGYFM36yuuLOlKAacfFpS
	IMbEY+hXiIFd4pG+gXEwvEdFLcBII20PDcC+y4dNXjU7SnQfvey9rNbsjD4FW1BPq5yUWv9sUlMqa
	80aAECzjjDrk8OPG7qPhT4sGj+Zosljn215hP4dLcOxkhRobnSWANvNuhTsE2L/CdExDBTShhO3aX
	G0uLIphTivEDifFnYDVlAxq/gA7sIX2hJvo5iMxMZekZHdNUCOt/IwIDgYTPVo+Uhv224UL9LQax6
	z/FwLGZYQE1GP1b5z+CywBYLZUl1QwBfxWnVNTFkPPmMngDxmh3/I128d0lAJ9Cedlqno+Cm+d39m
	Sheh5YKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6BN-00000007ymo-09wC;
	Fri, 23 Jan 2026 01:41:53 +0000
Received: from mail-m1973190.qiye.163.com ([220.197.31.90])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6BJ-00000007ykp-1fTy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 01:41:50 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31a9def13;
	Fri, 23 Jan 2026 09:41:45 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 3/3] arm64: dts: hisilicon: hikey960/970: Convert to use standard mmc alias
Date: Fri, 23 Jan 2026 09:41:22 +0800
Message-Id: <1769132482-177365-4-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1769132482-177365-1-git-send-email-shawn.lin@rock-chips.com>
References: <1769132482-177365-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9be883baa009cckunmb02720d3138818
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxgeHVZIGUofHk5CHUwdSUxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=VPM1Wwq4tE8D+ZSKDMXrXDtBj0Y6ZIPfUzLU0qfzjv+zxkGVNxr+HbZymW/qSC4s5tLDfdl/ClWV/PZK73/xA9OXN0GUPWG+j6qaJ0oBjnVouI0rY1L41alXUbV0T4k/Re/v581PTMY5wJ+cBrvqilDoLuYEo/KUewU2LavIJa0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=u5lFISpxQM5gBS3PHpmmitP2PZhVuWO2MnJkkarX19I=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_174149_588791_8993BEFC 
X-CRM114-Status: GOOD (  10.51  )
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

Convert the long-deprecated mshc alias to standard mmc alias.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index ed84ab9..c6056a8 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -20,8 +20,8 @@
 	compatible = "hisilicon,hi3660-hikey960", "hisilicon,hi3660";
 
 	aliases {
-		mshc1 = &dwmmc1;
-		mshc2 = &dwmmc2;
+		mmc1 = &dwmmc1;
+		mmc2 = &dwmmc2;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
index 7c32f5f..65764b3 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
@@ -19,8 +19,8 @@
 	compatible = "hisilicon,hi3670-hikey970", "hisilicon,hi3670";
 
 	aliases {
-		mshc1 = &dwmmc1;
-		mshc2 = &dwmmc2;
+		mmc1 = &dwmmc1;
+		mmc2 = &dwmmc2;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
-- 
2.7.4


