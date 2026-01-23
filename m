Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9415D7237D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS3boldlDBGIc8QYsfZE5HOqjztG1rbfsuMsJHuInYU=; b=W1ZrWYCYW2i1pVP/AI2sBkPI6j
	ZSfCROL4fbn+8i/le0PfHaLZ0QJaypE+KeluSgDkFSJ+5F+QFPBCtX0kyJCoZ7qpuoYTtkCcWoWIP
	n75T69XpFiiSA6b1vaiyIySFUdw/YaVRS0yOuNVfNDnLycYpljiOjELUbvBSDzMIJ1/AiDKVsjPl4
	DKHFP5IKYYDOeVrudB0imdAK8an+P62RTvVh+79v/eSq4O0r3CkDHpRC8GZyqEhbPOOWsj3oyguwj
	bfnYpFkj++qr+VIdGhSgUqX724QhP48/Nba9ANZht/qIkefKKNg42DrUQKxTsaad+/vaaD3y9Y9LZ
	lKIvt7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGDI-00000008twP-0B9A;
	Fri, 23 Jan 2026 12:24:33 +0000
Received: from mail-m32105.qiye.163.com ([220.197.32.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGDE-00000008tuc-3uAS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:24:30 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31c0b4b04;
	Fri, 23 Jan 2026 20:24:23 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 1/3] arm64: dts: hisilicon: hikey960/970: Convert to use standard mmc alias
Date: Fri, 23 Jan 2026 20:24:07 +0800
Message-Id: <1769171049-74327-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1769171049-74327-1-git-send-email-shawn.lin@rock-chips.com>
References: <1769171049-74327-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9bead0145b09cckunm9fc1f74e1df6d6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGksfSFZDSUlCShoaQkJOHR1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=i4KnQ4KsZOYlsv0Sahhfx88QTbKdFHGn6waCF1wwldp3TEAcvfp1dBOCygxOn7jF5WL3igCEaPfRzJFAvqikpKFX/tXKj/GSuhOTk9XjevRlUhY7BLsWzGBgQmh53TPpl9sy05umbeGTG3A3EoBCQxswH9AMakOiPxnmR4DkWxc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=LS3boldlDBGIc8QYsfZE5HOqjztG1rbfsuMsJHuInYU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_042429_624095_70BA23C4 
X-CRM114-Status: GOOD (  10.28  )
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

Changes in v2: None

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


