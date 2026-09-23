Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D961C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTXWPj2tTNlvmyzFEZ6QUo/13C0yEt/EoQ4Cv5fOH4M=; b=Ln3S5coqNbTu+5nt9sLYoYpTTQ
	1iiDxhw8np6WFf8zz4TY20wKU0XbFbanhZoPrEzK+15lF31BrFSsCVs7jU586QlFKrvNchWmaMTi8
	lAKFmMCuRJe+MU5iXHFFE3rFqR3mybn2WUfyJiHepuQYbnlp/9nR+ihy8CveWUHyH+sj7PgUam+GH
	IQq1OsTnEwHKfubQ1YYg7zMRfauafdS5CO0/QSOJzA7XC1DUfNsqwUjxBrQZ42SCgEZY8ujhmsvyp
	+VfNSq5u458RrgHOncCgUPSbXplg1re3gIbbJVtny3wLRrG+fIE8P7dh3BlqaTcuU8wXHB+dcGLop
	eqzeNsqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H9Y-00000007Mf4-02he;
	Wed, 23 Sep 2026 07:12:28 +0000
Received: from mail-m10175.netease.com ([154.81.10.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9H9K-00000007MUF-3do1;
	Wed, 23 Sep 2026 07:12:16 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ed74ab8f;
	Wed, 23 Sep 2026 15:12:11 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 4/4] ARM: dts: rockchip: Remove cap-mmc-highspeed from Omega4 sdmmc0
Date: Wed, 23 Sep 2026 15:11:38 +0800
Message-Id: <1790147498-47766-5-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
References: <1790147498-47766-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0aa0cd1b90fd03a4kunm59cf9035478cd9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ05JT1ZOHUtIQkIZHk
	5LGUpWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hpeNKs7TGJPaPtGqToScAPQ3wORIwZyV5KEnHexCI0DvaV4h++kYiqEbSmVBZiYcsVbg1Ku0TeI9hi+cAGk7AVSr55LAhn5PDclnR292nHQ0NB5sBP0syLIYUNtZ60HanRZ4JP404n09KU68SF8TNXogwP9cTJxPyXPUcj+2lm8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=dTXWPj2tTNlvmyzFEZ6QUo/13C0yEt/EoQ4Cv5fOH4M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_001215_122631_F9588D6A 
X-CRM114-Status: UNSURE (   9.37  )
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

cap-mmc-highspeed declares MMC high-speed support, which contradicts
the no-mmc property on this SD-only slot. Drop it.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
index 6a8e8e0..16664cd 100644
--- a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
@@ -93,7 +93,6 @@
 
 &sdmmc0 {
 	bus-width = <4>;
-	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
 	no-sdio;
-- 
2.7.4


