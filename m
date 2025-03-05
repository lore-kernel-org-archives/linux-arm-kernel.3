Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09584C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 05:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u2ogqZ0lfSN6X1Sse13LF/MfP2p1gI+049qV6tM0m2Y=; b=4hoyMtqsbnsGqhrD1Dcuntyqb0
	Ceo5eyUvG0AiZoq25DwquuvcOIQE76KkRNwqD8KzKRDJkJQhPHDyRQuO7slLKn9wpbbhI94STs11H
	seGvMDE9ayCKiw8B7IM2S3flSpZJUKQz3ukW8NWP+MjRupZxAC9846TuBu6f+uYLOFcer3vtAGwlK
	lk5JEv98beAWnf4WoigMdu30aKtgL6QBKARGf5t7YJi4br2RMifyLOPMGyTveVbrWCiTvOxvl1QCN
	VX0eIaxpw/QLefczZsgpdAwqN7OleeC1eJiE7rrmgctDk2AyqbVx2tvFjLcauPJxCy8Y4p3dD19gN
	uLHWQwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tph5n-000000070pz-2rSY;
	Wed, 05 Mar 2025 05:14:52 +0000
Received: from mail-m49230.qiye.163.com ([45.254.49.230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpg6B-00000006wGC-0FSZ;
	Wed, 05 Mar 2025 04:11:12 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id cf9cc4cb;
	Wed, 5 Mar 2025 12:11:03 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] arm64: defconfig: Enable Rockchip UFS host driver
Date: Wed,  5 Mar 2025 12:10:58 +0800
Message-Id: <1741147858-136859-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ01PSFZIShhJHR4ZSk5MSxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95647ff89409cckunmcf9cc4cb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzI6Dxw6HjJKIjk1EkxRNjk*
	DCIwCR9VSlVKTE9KSk9MQ01PS05IVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUxOTzcG
DKIM-Signature: a=rsa-sha256;
	b=fJgaxj3RQpThjTlaB5N8gJODAZQulkr5ajMETM3NJZSNXaNHVzJIskcunQWdh6FqtA0zX9ximV8lT/Qu19RZt1wwg3BmOsQeG3JBQRwzegPMvF4Dt/lTlxK4ziqp4xWImHk9A9rIeUSWZ2IOcyM9xLhsjMgdsbsH+OKNGeVqFts=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=u2ogqZ0lfSN6X1Sse13LF/MfP2p1gI+049qV6tM0m2Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_201111_680698_1F0DE909 
X-CRM114-Status: UNSURE (   8.46  )
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

Enable Rockchip UFS host driver.

This driver is first introduced on RK3576 SoC, and will be
used for more SoCs in near future, so add it to defconfig
will make these platforms work better.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3a3706d..907e92d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1191,6 +1191,7 @@ CONFIG_SCSI_UFS_HISI=y
 CONFIG_SCSI_UFS_RENESAS=m
 CONFIG_SCSI_UFS_TI_J721E=m
 CONFIG_SCSI_UFS_EXYNOS=y
+CONFIG_SCSI_UFS_ROCKCHIP=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_CLASS_MULTICOLOR=m
-- 
2.7.4


